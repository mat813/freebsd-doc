#!/usr/local/bin/perl -T
#
# Copyright (c) Oct 1997 Wolfram Schneider <wosch@FreeBSD.org>. Berlin.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.
#
# url.cgi - make plain text URLs clickable
#
# $Id: url.cgi,v 1.7 1998-08-02 18:15:32 wosch Exp $


require LWP::UserAgent;

$hsty_base = '';
$hsty_email = 'ports@freebsd.org';

require "./cgi-lib.pl";
require "./cgi-style.pl";

$ua = new LWP::UserAgent;
$ua -> max_size(20*1024);

$file = $ENV{'QUERY_STRING'};
$uri = "$file";

if ($file !~ m%^(http|ftp)://[a-z_\-0-9]+\.freebsd\.(com|org)%i) {
    &CgiError(("Wrong url: $file", "Only http://*.freebsd.* is allowed.\n"));
    exit(0);
}

if (1) {
	my($cvsroot) = '/home/ncvs';
	$file =~ s%(http|ftp)://ftp.freebsd.org/pub/FreeBSD/FreeBSD-current/%%;
	print &short_html_header($file);
	if ($file =~ m%^ports/\w+/\w+/pkg/DESCR% && 
		-f "$cvsroot/$file,v") {
		 open(CO, "-|") || exec ('/usr/bin/co', '-p', '-q', "$cvsroot/$file,v");
	} else {
		print "bla\n";
		}
	#print "$cvsroot/$file,v";
	
	print "\n<HR>\n<pre>\n";
	
	my($content);
	$content .= $_ while(<CO>);
	$content =~ s/</&lt;/g;
	$content =~ 
	    s%((http|ftp)://[^\s"\)\>,;]+)%<A HREF="$1">$1</A>%gi;
	print $content;
	print "</pre>\n";

	# Add 'source' link for freebsd ports
	if ($file =~ 
	    m%pub/FreeBSD/FreeBSD-current/(ports/[^/]+/[^/]+)/pkg/DESCR$%) {
	    print qq{<HR><a href=\"pds.cgi?$1">Sources</a>\n};
	    print qq{| <a href="../ports/">Help</a>\n};
	    print qq{<BR>\n};
        }
	print &html_footer; 
	exit;
}
$request = new HTTP::Request('GET', "$uri");
$response = $ua->request($request);

if ($response -> is_success) {
    if ($response -> content_type eq "text/plain") {
	print &short_html_header("bla");
	print "\n<HR>\n<pre>\n";
	
	my($content) = $response -> content;
	$content =~ s/</&lt;/g;
	$content =~ 
	    s%((http|ftp)://[^\s"\)\>,;]+)%<A HREF="$1">$1</A>%gi;
	print $content;
	print "</pre>\n";

	# Add 'source' link for freebsd ports
	if ($file =~ 
	    m%pub/FreeBSD/FreeBSD-current/(ports/[^/]+/[^/]+)/pkg/DESCR$%) {
	    print qq{<HR><a href=\"pds.cgi?$1">Sources</a>\n};
	    print qq{| <a href="../ports/">Help</a>\n};
	    print qq{<BR>\n};
        }
	print &html_footer; 
	exit;
    } else {
	# no plain text, do a redirect
	print "Location: $uri\n";
	print "Content-type: text/plain\n\n";
    }
} else {
    # quick and dirty hack for non existings urls
    print "Location: $uri\n";
    print "Content-type: text/plain\n\n";
}
