#!/usr/bin/perl
#
#  Send-pr perl script to send a pr.
#
# Copyright (c) 1996 Free Range Media
#
#  Copying and distribution permitted under the conditions of the
#  GNU General Public License Version 2.  
#     (http://www.gnu.ai.mit.edu/copyleft/gpl.html)
#
# $FreeBSD: www/en/cgi/dosendpr.cgi,v 1.24 2005/11/16 23:35:57 fenner Exp $

require "html.pl";

use Socket;
use DB_File;
use Fcntl qw(:DEFAULT :flock);
require "./Gnats.pm"; import Gnats;

my $blackhole = "dnsbl.njabl.org";
my $openproxyip = "127.0.0.9";
my $blackhole_err = 0;
my $openproxy;

my $expiretime = 2700;
$dbpath = "/usr/local/www/var/confirm-code/sendpr-code.db";

# Environment variables to stuff in the PR header.
my @ENV_captures = qw/	REMOTE_HOST
			REMOTE_ADDR
			REMOTE_PORT
			HTTP_REFERER
			HTTP_CLIENT_IP
			HTTP_FORWARDED
			HTTP_VIA
			HTTP_X_FORWARDED_FOR	/;

# env2hdr (@ENV_captures)
# Returns X-header style headers for inclusion in the header of a PR
sub env2hdr (@) {
	my $headers = "";
	for my $var (shift @_) {
		next unless $ENV{$var};
		$headers .= "X-$var: $ENV{$var}\n";
	}
	return $headers;
}
		
# isopenproxy ($ip, $blackhole_zone, $positive_ip)
# Returns undef on error, 0 if DNS lookup fails, $positive_ip if verified
# proxy. A DNS lookup failing can either means that there was a network
# problem, or that the IP is not listed in the blackhole zone.
sub isopenproxy ($$$) {
	# If $? is already set, then a successful gethostbyname() leaves it set
	local $?;
	my ($ip, $zone, $proxyip) = @_;
	my ($reversed_ip, $packed);
	if (!defined $proxyip) { return undef };

	$reversed_ip = join('.', reverse split(/\./, $ip));
	$packed = gethostbyname("${reversed_ip}.${blackhole}");
	return undef if $?;

	if ($packed && (inet_ntoa($packed) eq $proxyip)) {
		return $proxyip;
	} else {
		return 0;
	}
}

sub prerror {
    &html_title ("Problem Report Error");
    &html_body();
    print "<p>There is an error in the configuration of the problem\n",
          "report form generator.  Please back up one page and report\n",
          "the problem to the owner of that page.<br />",
	  "Report <span class=\"prerror\">$_[0]</span>.</p>";
    &html_end();
    exit (1);
}

&www_content ("text","html");
&cgi_form_in();

&prerror("request method problem") if $ENV{'REQUEST_METHOD'} eq 'GET';

if (!$submission_program) { &prerror("submit program problem"); }

&html_title ("Thank you for the problem report");
&html_body ();

# Verify the data ...

$db_obj = tie(%db_hash, 'DB_File', $dbpath, O_CREAT|O_RDWR, 0644)
                    or die "dbcreate $dbpath $!";
$fd = $db_obj->fd;
open(DB_FH, "+<&=$fd") or die "fdopen $!";

unless (flock (DB_FH, LOCK_EX | LOCK_NB)) {
    unless (flock (DB_FH, LOCK_EX)) { die "flock: $!" }
}

$codeentered = $cgi_data{'code-confirm'};
$codeentered =~ s/.*/\U$&/;	# Turn input uppercase
$currenttime = time();
if (defined($codeentered) && $codeentered && $db_hash{$codeentered} && 
  (($currenttime - $expiretime) <= $db_hash{$codeentered})) {
    if (!$cgi_data{'email'} || !$cgi_data{'originator'} ||
        !$cgi_data{'synopsis'}) {
	  print "<h1>Bad Data</h1><p>You need to specify at least your ",
              "electronic mail address, your name and a synopsis ",
              "of the problem.<br />  Please return to the form and add the ",
              "missing information.  Thank you.</p>";
          &html_end();

          exit(1);
    }
} else {
	print "<h1>Incorrect safety code</h1><p>You need to enter the correct ",
          "code from the image displayed.  Please return to the form and enter the ",
          "code exactly as shown. Thank you.</p>";

        &html_end();

        exit(1);
}

# This code has now been used, so remove it.
delete $db_hash{"$codeentered"};

# Sweep for and remove expired codes.
foreach $randomcode (keys %db_hash) {
	if ( ($currenttime - $expiretime) >= $db_hash{$randomcode}) {
		delete $db_hash{"$randomcode"};
	}
}
$db_obj->sync();                   # to flush
flock(DB_FH, LOCK_UN);
undef $db_obj;                     # removing the last reference to the DB
                                   # closes it. Closing DB_FH is implicit.
untie %db_hash;


$openproxy = isopenproxy($ENV{'REMOTE_ADDR'}, $blackhole, $openproxyip);
if (defined $openproxy) {
	if ($openproxy) {
		&prerror("$ENV{'REMOTE_ADDR'} is an open proxy server");
	}
} else {
	$blackhole_err++;
}

# Build the PR.
$pr = "To: $submission_address\n" .
      "From: $cgi_data{'originator'} <$cgi_data{'email'}>\n" . 
      "Subject: $cgi_data{'synopsis'}\n" .
      env2hdr(@ENV_captures);
if ($blackhole_err) {
      $pr .= "X-REMOTE_ADDR-Is-Open-Proxy: Maybe\n";
}
$pr .= "X-Send-Pr-Version: www-2.3\n\n" .
      ">Submitter-Id:\t$cgi_data{'submitterid'}\n" .
      ">Originator:\t$cgi_data{'originator'}\n" .
      ">Organization:\t$cgi_data{'organization'}\n" .
      ">Confidential:\t$cgi_data{'confidential'}\n" .
      ">Synopsis:\t$cgi_data{'synopsis'}\n" .
      ">Severity:\t$cgi_data{'severity'}\n" .
      ">Priority:\t$cgi_data{'priority'}\n" .
      ">Category:\t$cgi_data{'category'}\n" .
      ">Class:\t\t$cgi_data{'class'}\n" .
      ">Release:\t$cgi_data{'release'}\n" .
      ">Environment:\t$cgi_data{'environment'}\n" .
      ">Description:\n$cgi_data{'description'}\n" .
      ">How-To-Repeat:\n$cgi_data{'howtorepeat'}\n" .
      ">Fix:\n$cgi_data{'fix'}\n";

# remove any carrage returns that appear in the report.
$pr =~ s/\r//g;

if (open (SUBMIT, "|$submission_program")){

    print SUBMIT $pr;
    close (SUBMIT);
    print "<h1>Thank You</h1>",
	  "<p>Thank you for the problem report.  You should receive confirmation",
	  " of your report by electronic mail within a day.</p>";
} else {
    print "<h1>Error</h1><p>An error occured processing your problem report.</p>";
}
&html_end();
