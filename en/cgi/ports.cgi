#!/usr/bin/perl -T
#
# Copyright (c) 1996-2005 Wolfram Schneider <wosch@FreeBSD.ORG>
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
# $FreeBSD: www/en/cgi/ports.cgi,v 1.81 2004/11/28 11:46:01 simon Exp $
#
# ports.cgi - search engine for FreeBSD ports
#             	o search for a port by name or description
#               o search for new or updated ports
#
#
# If you want use this script on your own host this line must
# work for you: $ cvs rdiff -D'last week' ports/INDEX

use POSIX qw(strftime);
use Time::Local;

sub init_variables {
    $cvsroot = '/usr/local/www/cvsroot/FreeBSD';	# $CVSROOT
    $localPrefix = '/usr/ports';	# ports prefix

    # Directory of the up-to-date INDEX/INDEX-5, or "CVS" if the HEAD
    # version from the CVS repository should be used
    $portsDatabaseHeadDir = "/usr/local/www/ports";

    # Ports database file to use
    $ports_database = 'INDEX';
    # unset $ENV{'CVSROOT'};

    @cvscmd = ('cvs', '-Q', '-R', '-d', $cvsroot);

    # URL of ports tree for browsing
    $remotePrefixFtp = 'ports';
	# 'ftp://ftp.FreeBSD.org/pub/FreeBSD/branches/-current/ports';

    # URL of ports tree for download
    $remotePrefixFtpDownload =
	'http://cvsweb.FreeBSD.org/ports';
    $remoteSuffixFtpDownload = '%s.tar.gz?tarball=1';

    # where to get -current packages
    local($p) = 'ftp://ftp.FreeBSD.org/pub/FreeBSD/ports/i386';
    local($palpha) = 'ftp://ftp.FreeBSD.org/pub/FreeBSD/ports/alpha';
    local($pamd64) = 'ftp://ftp.FreeBSD.org/pub/FreeBSD/ports/amd64';
    local($pia64) = 'ftp://ftp.FreeBSD.org/pub/FreeBSD/ports/ia64';
    local($psparc64) = 'ftp://ftp.FreeBSD.org/pub/FreeBSD/ports/sparc64';

    $remotePrefixFtpPackagesDefault = '5-STABLE/i386';
    %remotePrefixFtpPackages =
	(
	 '6-CURRENT/i386', "$p/packages-6-current/All",
	 '5-STABLE/i386', " $p/packages-5-stable/All",
	 '4-STABLE/i386', " $p/packages-4-stable/All",

	 '5.3-RELEASE/i386', "$p/packages-5.3-release/All",
	 '5.2.1-RELEASE/i386', "$p/packages-5.2.1-release/All",
	 '4.10-RELEASE/i386',"$p/packages-4.10-release/All",
	 '4.11-RELEASE/i386',"$p/packages-4.11-release/All",

	 '6-CURRENT/alpha', "$palpha/packages-6-current/All",
	 '5-STABLE/alpha', "$palpha/packages-5-stable/All",
	 '4-STABLE/alpha', "$palpha/packages-4-stable/All",

	 '5.3-RELEASE/alpha', "$palpha/packages-5.3-release/All",
 	 '5.2.1-RELEASE/alpha', "$palpha/packages-5.2.1-release/All",
	 '4.10-RELEASE/alpha',"$palpha/packages-4.10-release/All",
	 '4.11-RELEASE/alpha',"$palpha/packages-4.11-release/All",

	 '6-CURRENT/amd64', "$pamd64/packages-6-current/All",
	 '5-STABLE/amd64', "$pamd64/packages-5-stable/All",

 	 '5.3-RELEASE/amd64', "$pamd64/packages-5.3-release/All",
 	 '5.2.1-RELEASE/amd64', "$pamd64/packages-5.2.1-release/All",

	 '6-CURRENT/ia64', "$pia64/packages-6-current/All",
	 '5-STABLE/ia64', "$pia64/packages-5-stable/All",

	 '5.3-RELEASE/ia64', "$pia64/packages-5.3-release/All",
	 '5.2.1-RELEASE/ia64', "$pia64/packages-5.2.1-release/All",

	 '6-CURRENT/sparc64', "$psparc64/packages-6-current/All",
	 '5-STABLE/sparc64', "$psparc64/packages-5-stable/All",

	 '5.3-RELEASE/sparc64', "$psparc64/packages-5.3-release/All",
	 '5.2.1-RELEASE/sparc64', "$psparc64/packages-5.2.1-release/All",
	);

    $remotePrefixHtml =
	'../ports';

    # CVS Web interface
    $remotePrefixCvs =
	'http://cvsweb.FreeBSD.org/ports';

    # Ports documentation
    $portsDesc = '../ports/';

    # location of the tiny BSD daemon
    $daemonGif = '<IMG SRC="/gifs/littlelogo.gif" ALT="Really small BSD Daemon">';

    # visible E-Mail address, plain text
    $mailto = 'www@FreeBSD.org';

    # Mailinglist for FreeBSD Ports
    $mailtoList = 'ports@FreeBSD.org';

    # use mailto:email?subject
    $mailtoAdvanced = 'yes';

    # the URL if you click at the E-Mail address (see below)
    $mailtoURL = "mailto:$mailto" if !$mailtoURL;

    # security
    $ENV{'PATH'} = '/bin:/usr/bin';

    # ports download sources script
    $pds = 'pds.cgi';

    # make plain text URLs clickable cgi script
    $url = 'url.cgi';

    # extension type for packages
    $packageExt = 'tgz';

    local($packageDB) = '../ports/packages.exists';
    &packages_exist($packageDB, *packages) if -f $packageDB;

}

# Parse selected version string and set version dependend settings
sub parse_release {
    if($release =~ /^(\d+)-(CURRENT|STABLE)\/(i386|alpha|ia64|sparc64|amd64)$/) {
	$release_major = $1;
	$release_type = $2;
	$release_arch = $3;
    } elsif($release =~ /^(\d+)\.(\d+)(\.(\d+))?-(CURRENT|STABLE|RELEASE)\/(i386|alpha|ia64|sparc64|amd64)$/) {
	$release_major = $1;
	$release_minor = $2;
	$release_patch = $4;
	if($release_patch eq "") {
	    $release_patch = "0";
	}
	$release_type = $5;
	$release_arch = $6;
	if($release_type eq "RELEASE") {
	    $release_tag = "RELEASE_" . $release_major . "_" . $release_minor .
		"_" . $release_patch;
	}
    } else {
	&header;
	print "Internal error: Could not parse release string ('$release')<br><br>\n";
	&footer; &footer2; &exit(0);
    }

    if($release_major > 4) {
	$packageExt = 'tbz';
	$ports_database = 'INDEX-5';
    }
}


sub packages_exist {
    local($file, *p) = @_;

    open(P, $file) || do {
        warn "open $file: $!\n";
        warn "Cannot create packages links\n";
        return 1;
    };

    while(<P>) {
        chop;
        $p{$_} = 1;
    }
    close P;
    return 0;
}


# return the date of the last ports database update
sub last_update_cvs {
    local($file) = "$cvsroot/ports/$ports_database,v";
    local($date) = 'unknown';
    local($filebasename) = $ports_database;

    open(DB, $file) || do {
	&warn("$file: $!\n"); &exit;
    };
    local($head);
    while(<DB>) {
	$head = $1 if (/^head\s+([0-9.]+);?\s*$/);
	if (/^date/ && /^date\s+([0-9]+)\.([0-9]+)\.([0-9]+)\.([0-9]+)\.([0-9]+)\.([0-9]+);\s+/) {
	    $date = ($1 < 100 ? $1 + 1900 : $1) . qq{-$2-$3 $4:$5:$6 UTC};
	    last;
	}
    }
    close DB;
    return $date . " (" . $filebasename . " revision " . $head . ")";
}

sub last_update_file {
    local($file) = "$portsDatabaseHeadDir/$ports_database";
    local($modtime, $modtimestr);

    $modtime = (stat($file))[9];
    if (defined($modtime) && $modtime > 0) {
	$modtimestr = strftime("%G-%m-%d %H:%M:%S UTC", gmtime($modtime));
    } else {
	$modtimestr = "Unknown";
    }

    return $modtimestr;
}

sub last_update {
    if ($portsDatabaseHeadDir eq "CVS") {
	return &last_update_cvs;
    } else {
	return &last_update_file;
    }
}

sub last_update_message {
    return "<p>Last database update: " . &last_update . "<br>\n";
}

sub dec {
    local($_) = @_;

    s/\+/ /g;                       # '+'   -> space
    s/%(..)/pack("c",hex($1))/ge;   # '%ab' -> char ab

    return($_);
}

sub header {
    print "Content-type: text/html\n";
    print "\n";
}


# $indent is a bit of optional data processing I put in for
# formatting the data nicely when you are emailing it.
# This is derived from code by Denis Howe <dbh@doc.ic.ac.uk>
# and Thomas A Fine <fine@cis.ohio-state.edu>
sub decode_form {
    local($form, *data, $indent, $key, $_) = @_;
    foreach $_ (split(/&/, $form)) {
	($key, $_) = split(/=/, $_, 2);
	$_   =~ s/\+/ /g;				# + -> space
	$key =~ s/\+/ /g;				# + -> space
	$_   =~ s/%([\da-f]{1,2})/pack(C,hex($1))/eig;	# undo % escapes
	$key =~ s/%([\da-f]{1,2})/pack(C,hex($1))/eig;	# undo % escapes
	$_   =~ s/[\r\n]+/\n\t/g if defined($indent);	# indent data after \n
	$data{$key} = $_;
    }
}


# encode unknown data for use in a URL <A HREF="...">
sub encode_url {
    local($_) = @_;
    s/([\000-\032\;\/\?\:\@\&\=\%\'\"\`\<\>\177-\377 ])/sprintf('%%%02x',ord($1))/eg;
    # s/%20/+/g;
    $_;
}

sub warn { print "$_[0]" }
sub env { defined($ENV{$_[0]}) ? $ENV{$_[0]} : undef; }
sub exit { exit 0 };

sub readindex {
    local($date, *var, *msec) = @_;
    local(@co) = ('co', '-p');
    local($use_cvs) = 1;
    local($localportsdb) = "$portsDatabaseHeadDir/$ports_database";

    if ($date =~ /^rev([1-9]+\.[0-9]+)$/ ||
	$date =~ /^(RELEASE_\d+_\d+_\d+)$/) {
	# diff by revision
	push(@co, ('-r', $1));
    } elsif ($date eq "") {
	# Get HEAD, no date or revision
	if ($portsDatabaseHeadDir ne "CVS") {
	    $use_cvs = 0;
	}
    } else {
	# diff by date
	push(@co, ('-D', $date));
    }

    push(@co, "ports/$ports_database");


    local(@tmp, @s);

    if (!$use_cvs && -r $localportsdb) {
	open(C, $localportsdb) || do {
	    warn "Cannot open ports database $localportsdb: $!\n"; &exit;
	};
    } else {
	open(C, "-|") || exec (@cvscmd, @co);
    }

    while(<C>) {
	next if $query && !/$query/oi;
	chop;

	@tmp = split(/\|/);
	$var{"$tmp[4]"} = $_;
	@s = split(/\s+/, $tmp[6]);
	foreach (@s) {
	    $msec{"$tmp[4],$_"} = 1;
	}
    }
    close C;
}

# extract sub collections
sub readcoll {
    local(@co) = ('co', '-p', 'ports/INDEX');

    local(@a, @b, %key);
    local($file) = '../ports/categories';
    local($localportsdb) = "$portsDatabaseHeadDir/$ports_database";

    if (-r $file && open(C, $file)) {
	while(<C>) {
	    chop;

	    if (/^\s*\"([^\"]+)\"\s*,/) { #"
		@b = split(/\s+/, $1);
		foreach (@b) {
		    if (!defined($key{$_})) {
			$key{$_} = 1;
		    }
		}
	    }
	}
    } else {
	if (-r $localportsdb) {
	    open(C, $localportsdb) || do {
		warn "Cannot open ports database $localportsdb: $!\n"; &exit;
	    }
	} else {
	    open(C, "-|") || exec (@cvscmd, @co);
	}

	while(<C>) {
	    chop;

	    @a = split('\|');
	    @b = split(/\s+/, $a[6]);

	    foreach (@b) {
		if (!defined($key{$_})) {
		    $key{$_} = 1;
		}
	    }
	}
    }
    close C;

    @a = ();
    foreach (sort keys %key) {
	push(@a, $_);
    }

    return @a;
}

# basic function for HTML output
sub out {
    local($line, $old) = @_;
    local($version, $path, $local, $comment, $descfile, $email,
	  $sections, $bdepends, $rdepends, @rest) =  split(/\|/, $line);

    if ($path =~ m%^$localPrefix/([^/]+)%o) {
	if (!$out_sec || $1 ne $out_sec) {
	    print "</DL>\n" if $counter > 0;
	    print qq{\n<H3>} .
		qq{<a href="$remotePrefixHtml/$1.html">Category $1</a>} .
                "</H3>\n<DL>\n";
	    $out_sec = $1;
	}
    }

    $counter++;
    $pathDownload = $path;
    $pathB= $path;
    $pathB =~ s/^$localPrefix/ports/o;

    $path =~ s/^$localPrefix/$remotePrefixFtp/o;
    $pathDownload =~ s/^$localPrefix/$remotePrefixFtpDownload/o;
    if ($remoteSuffixFtpDownload) {
       if (substr($remoteSuffixFtpDownload, 0, 2) eq '%s') {
	   $pathDownload =~ m,([^/]+)$,;
	   $pathDownload .= "/$1" . substr($remoteSuffixFtpDownload, 2);
       } else {
	   $pathDownload .= $remoteSuffixFtpDownload;
       }
    }
    $descfile =~ s/^$localPrefix/$remotePrefixFtp/o;
    $comment =~ s/</\&lt;/g;
    $comment =~ s/>/\&gt;/g;

    print qq{<DT><B><A NAME="$version">$version</A></B>\n};
    print qq{<DD>$comment<BR>\n};

    if ($old) {
	local($l) = $descfile;
	$l =~ s%^$remotePrefixFtp%$remotePrefixCvs%o;
	$l =~ s%/([^/]+)$%/Attic/$1%;

	print  qq{<I>Was Maintained by:</I> <A HREF="mailto:$email} .
           ($mailtoAdvanced ?
              qq{?cc=$mailtoList&subject=FreeBSD%20Port:%20} .
              &encode_url($version) : '') .  qq{">$email</A><BR>} .
	   qq{<A HREF="$l">Removed why</A></DD>};

    } else {
	local($l) = $path;
	$l =~ s%^$remotePrefixFtp%$remotePrefixCvs%o;
	#$l .= '/Makefile';

	print  qq{<I>Maintained by:</I> <A HREF="mailto:$email} .
           ($mailtoAdvanced ?
              qq{?cc=$mailtoList&subject=FreeBSD%20Port:%20} .
              &encode_url($version) : '') . qq{">$email</A><BR>};

	local(@s) = split(/\s+/, $sections);
	if ($#s > 0) {
	    print qq{<I>Also listed in:</I> };
	    foreach (@s) {
		print qq{<A HREF="$remotePrefixHtml/$_.html">$_</A> }
		    if $_ ne $out_sec;
	    }
	    print "<BR>\n";
	}

	if ($bdepends || $rdepends) {
	    local($flag) = 0;
	    local($last) = '';
	    print qq{<I>Requires:</I> };
	    foreach (sort split(/\s+/, "$bdepends $rdepends")) {
		# delete double entries
		next if $_ eq $last;
		$last = $_;

		print ", " if $flag;
		$flag++;
		print qq{<A HREF="$script_name?query=^$_&stype=name">$_</A>};
	    }
	    print "<BR>\n";
	}

	print qq[<A HREF="$url?$descfile">Description</A> <B>:</B>
<A HREF="$pds?$pathB">Sources</A> <B>:</B>\n];

	if (($release eq $remotePrefixFtpPackagesDefault &&
	    $packages{"$version.tgz"}) ||
	    $release ne $remotePrefixFtpPackagesDefault
	    ) {
	    print qq[<A HREF="$remotePrefixFtpPackages{$release}/$version.$packageExt">Package</A> <B>:</B>\n];
	}
print qq[<A HREF="$l">Changes</A> <B>:</B>
<A HREF="$pathDownload">Download</A>
<p>
];

};


};

# new/updated/removed ports output
sub out_ports {

    if ($type eq "new") {
	foreach $key (sort keys %today) {
	    if (!$past{$key}) {
		if ($section eq "all" || $msec{"$key,$section"}) {
		    &out($today{$key}, 0);
		}
	    }
	}
    } elsif ($type eq "removed") {
	foreach $key (sort keys %past) {
	    if (!$today{$key}) {
		if ($section eq "all" || $msec{"$key,$section"}) {
		    &out($past{$key}, 1);
		}
	    }
	}
    } else { # changed
	foreach $key (sort keys %today) {
	    if ($past{$key} && $past{$key} ne $today{$key}) {
		@a = split(/\|/, $today{$key});
		@b = split(/\|/, $past{$key});
		next if $a[0] eq $b[0];
		if ($section eq "all" || $msec{"$key,$section"}) {
		    &out($today{$key}, 0);
		}
	    }
	}
    }
}

# search and output
sub search_ports {
    local(@a) = ();
    local($key, $name, $text);

    foreach $key (sort keys %today) {
	next if $today{$key} !~ /$query/oi;

	@a = split(/\|/, $today{$key});
	$name = $a[0]; #$name =~ s/(\W)/\\$1/g;
	$text = $a[3]; #$text =~ s/(\W)/\\$1/g;

	#warn "$stype:$query: $name $text\n";
	if ($stype eq "name" && $name =~ /$query/o) {
	    &out($today{$key}, 0);
	} elsif ($stype eq "text" && $text =~ /$query/oi) {
	    &out($today{$key}, 0);
	} elsif ($stype eq "all" &&
		 ($text =~ /$query/oi || $name =~ /$query/io)) {
	    &out($today{$key}, 0);
	} elsif ($stype eq 'maintainer' && $a[5] =~ /$query/io) {
	    &out($today{$key}, 0);
	} elsif ($stype eq 'requires' &&
		 ($a[7] =~ /$query/io || $a[8] =~ /$query/io)) {
	    &out($today{$key}, 0);
	}

    }
}


sub forms {
    print qq{<HTML>
<HEAD>
<TITLE>FreeBSD Ports Changes</TITLE>
<meta name="robots" content="nofollow">
</HEAD>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000">
<H1><a href="../">FreeBSD Ports Changes</A> $daemonGif</H1>

<P>
FreeBSD Ports [short description <a href="$portsDesc">followed</a> ...]
<a href="$script_name/faq.html">FAQ</a>
<p>
};

    print qq{
"Package Name" searches for the name of a port or distribution.
"Description" searches case-insensitive in a short comment about the port.
"All" searches case-insensitive for the package name and in the
description about the port.
<p>

<FORM METHOD="GET" ACTION="$script_name">
Search for:
<INPUT NAME="query" VALUE="$query">
<SELECT NAME="stype">
};

    local(%d);
    %d = ('name', 'Package Name',
	  'all', 'All',
	  'maintainer', 'Maintainer',
	  'text', 'Description',
	  'pkgdescr', 'Long Description',
	  'requires', 'Requires',
	  );

    foreach ('all', 'name', 'text', 'pkgdescr', 'maintainer', 'requires') {
	print "<OPTION" . (($_ eq $stype) ? ' SELECTED ' : ' ') .
	    qq{VALUE="$_">} . ($d{$_} ? $d{$_} : $_) . qq{</OPTION>\n};
    }


    print qq{</SELECT><SELECT NAME="release">\n};
    foreach (sort keys %remotePrefixFtpPackages) {
	print qq{<OPTION} .
	    (($_ eq $release) ? ' SELECTED ' : ' ') .
		qq{VALUE=$_>$_</OPTION>\n};
    }
    print qq{</SELECT>
<INPUT TYPE="submit" VALUE="Submit">
</FORM>
};

    # Since we don't have frequent CVS versions of INDEX anymore it's
    # not possible to make usable "new ports" listings based on INDEX.
    print("<HR noshade>\n");
    return;

    print qq{<hr noshade>
<p>
"New" lists ports which are new in the ports collection or moved from
another ports section. "Changed" lists updated ports.
"Removed" lists ports which have been deleted from ports collections
or moved to another ports section.

<FORM METHOD="GET" ACTION="$script_name">
<SELECT NAME="type">
};

    foreach ('new', 'changed', 'removed') {
	print "<OPTION" . (($_ eq $type) ? ' SELECTED ' : ' ') .
	    qq{VALUE="$_">$_</OPTION>\n};
    }

    print qq{</SELECT>\n\n<SELECT NAME="time">\n};
    foreach ("1 week ago", "2 week ago", "3 week ago", "4 week ago",
	     "6 week ago", "8 week ago", "3 month ago", "4 month ago",
	     "6 month ago", "9 month ago", "12 month ago", "24 month ago")
    {
	print "<OPTION" .
	    (($_ eq $time) ? ' SELECTED ' : ' ') .
		qq{VALUE="$_">$_</OPTION>\n};
    }

	print q{</SELECT>

<SELECT NAME="sektion">
<OPTION VALUE="all">All Sections</OPTION>
};

    foreach (@sec) {
	print "<OPTION" .
	    (($_ eq $section) ? ' SELECTED ' : ' ') .
		qq{VALUE="$_">$_</OPTION>\n};
    }

    print q{</SELECT>
<INPUT TYPE="submit" VALUE="Submit">
</FORM>
<HR noshade>
};

}

sub footer {

    print qq{
<img ALIGN="RIGHT" src="/gifs/powerlogo.gif" alt="Powered by FreeBSD">
&copy; 1996-2005 by Wolfram Schneider. All rights reserved.<br>
};
    #print q{$FreeBSD: www/en/cgi/ports.cgi,v 1.81 2004/11/28 11:46:01 simon Exp $} . "<br>\n";
    print qq{Please direct questions about this service to
<I><A HREF="$mailtoURL">$mailto</A></I><br>\n};
    print qq{General questions about FreeBSD ports should be sent to } .
	qq{<a href="mailto:$mailtoList">} .
	    qq{<i>$mailtoList</i></a><br>\n};
    print &last_update_message;
    print "<hr noshade>\n<P>\n";
}

sub footer2 {
    print "\n</BODY>\n</HTML>\n";
}


sub check_input {
    if ($query) {
	$stype = "all" if !$stype;
	if (!($stype eq "name" ||
	      $stype eq "text" ||
	      $stype eq "maintainer" ||
	      $stype eq "requires" ||
	      $stype eq "all")) {
	    &warn("unknown search type ``$type'', use `all', `text', `name', 'requires', or `maintainer'\n");
	    &exit(0);
	} else {
	    return;
	}
    }

    if (!($type eq "new" || $type eq "changed" || $type eq "removed")) {
	&warn("unknown type `$type', use `new', `changed', or `removed'\n");
	&exit(0);
    }

    if ($time !~ /^[1-9][0-9]*\s+(month|week)\s+ago$/ &&
	# support diff by revision too
	$time !~ /^rev[1-9]+\.[0-9]+$/
	)
    {
	&warn("unknown date: `$time'\n");
	&exit(0);
    }
}

sub faq {
    print qq{<HEAD>\n<TITLE>FAQ</TITLE>\n</HEAD>
<BODY <BODY BGCOLOR="#FFFFFF" TEXT="#000000">
<H1>FreeBSD Ports Changed FAQ</h1>

<h2>Keywords</h2>
<dl>
<dt><b>Description</b><dd>A more detailed description.
<dt><b>Download</b><dd>Download the ports directory.
<dt><b>Package</b><dd>Download the pre-compiled software package.
<dt><b>Changes</b><dd>Read the latest changes.
<dt><b>Sources</b><dd>Links to all source files.
</dl>

<h2>Misc</h2>
All links point to the FreeBSD-stable
version and <b>not</b> to the latest releases.<p>

The script ports.cgi use the file
<a href="$remotePrefixCvs/INDEX">
FreeBSD-CVS/ports/INDEX,v</a>
as database for most operations. INDEX,v will be updated by hand
by the portsmeister.  An updated INDEX file is used if available.<p>

You may also search the
<a href="http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+Ports">ports manual pages</a>.<p>

Get the <a href ="source">Source</a> of this script.<p>

<a href="$script_name">Back to the search engine</a><p>
<HR noshade>
};
}

#
# Main
#

&init_variables;
$query_string = &env('QUERY_STRING');
$path_info = &env('PATH_INFO');
&decode_form($query_string, *form);

$type = $form{'type'};
$time = $form{'time'};
$section = $form{'sektion'};
$query = $form{'query'};
$stype = $form{'stype'};
$release = $form{'release'};
$release = $remotePrefixFtpPackagesDefault
    if !$release  || !defined($remotePrefixFtpPackages{$release});
$script_name = &env('SCRIPT_NAME');

&parse_release;

# Fallback to CVS if an updated INDEX isn't found
if (!-r "$portsDatabaseHeadDir/$ports_database") {
    $portsDatabaseHeadDir = "CVS";
}

if ($path_info eq "/source") {
    print "Content-type: text/plain\n\n";
    open(R, $0) || do { print "ick!\n"; &exit; };
    while(<R>) { print }
    close R;
    &exit;
}

# Full text search in ports/<category>/port>/pkg-descr
if ($stype eq 'pkgdescr') {
    local($url) =
      'http://www.FreeBSD.org/cgi/search.cgi?source=pkgdescr&max=25';
    $query =~ s/\s+/+/g;
    print "Location:  $url&words=$query\n";
    print "Content-type: text/plain\n\n";
    &exit;
}

&header;
if ($path_info eq "/faq.html") {
    &faq;
    &footer; &footer2; &exit(0);
}

# allow `/ports.cgi?netscape' where 'netscape' is the query port to search
# this make links to this script shorter
if (!$query && !$type && $query_string =~ /^([^=&]+)$/) {
    $query = $1;
}

# automatically read collections, need only 0.2 sec on a pentium
@sec = &readcoll;
&forms;

$query =~ s/^\s+//;
$query =~ s/\s+$//;

if ($query_string eq "" || (!$query && !$type)) {
    &footer; &footer2; &exit(0);
}

#warn "type: $type time: $time section: $section stype: $stype query: $query";
&check_input;
$counter = 0;

# search
if ($query) {
    &readindex($release_tag, *today, *msec);
    $query =~ s/([^\w\^])/\\$1/g;
    &search_ports;
}

# ports changes
else {
    &readindex('today', *today, *msec);
    &readindex($time, *past, *msec);
    &out_ports;
}

if (!$counter) {
    print "Sorry, nothing found.\n";
    print qq{You may look for other } .
	qq{<a href="/search/search.html">FreeBSD Search Services</a>.\n};
} else {
    print "</dl>\n";
}

print "<hr noshade>\n";
&footer;
&footer2;
