# $FreeBSD: www/en/cgi/cgi-style.pl,v 1.20 2005/07/14 11:08:54 ceri Exp $
#
# Perl routines to encapsulate various elements of HTML page style.

# For future reference, when is now?
($se,$mn,$hr,$md,$mo,$yr,$wd,$yd,$dst) = localtime(time);
$yr += 1900;
$mo += 1;
$timestamp = "$mo-$md-$yr";

if (!defined($hsty_base)) { 
    $hsty_base = '..';
}
if (!defined($hsty_email)) {
    $hsty_email = 'www@FreeBSD.org';
}
if (!defined($hsty_author)) {
    $hsty_author = "<a href='$hsty_base/mailto.html'>$hsty_email</a>";
}

if (!defined($hsty_date)) {
    $hsty_date = '';
}

# This can be set to either a string containing an inline CSS stylesheet
# or to a <link> element that references an external CSS stylesheet, to
# make local modifications to the style of a CGI script's output.
$t_style = "<link rel='stylesheet' type='text/css' href='$hsty_base/freebsd.css'>";

$i_topbar = "<img src='$hsty_base/gifs/bar.gif' alt='Navigation Bar' width='565' height='33' border='0' usemap='#bar'>
<map name='bar'>
<area shape='rect' coords='1,1,111,31' href='$hsty_base/index.html' alt='Site Root'>
<area shape='rect' coords='112,11,196,31' href='$hsty_base/ports/index.html' alt='Applications'>
<area shape='rect' coords='196,12,257,33' href='$hsty_base/support.html' alt='Support'>
<area shape='rect' coords='256,12,365,33' href='$hsty_base/docs.html' alt='Documentation'> 
<area shape='rect' coords='366,13,424,32' href='$hsty_base/commercial/commercial.html' alt='Vendors'>
<area shape='rect' coords='425,16,475,32' href='$hsty_base/search/search.html' alt='Search'>
<area shape='rect' coords='477,16,516,33' href='$hsty_base/search/index-site.html' alt='Site Index'>
<area shape='rect' coords='516,15,562,33' href='$hsty_base/index.html' alt='Site Root'>
<area shape='rect' href='$hsty_base/index.html' coords='0,0,564,32' alt='Site Root'>
</map>";

if (!defined($hsty_home)) {
    $hsty_home = "<a href='$hsty_base/'><img src='$hsty_base/gifs/home.gif'
  alt='FreeBSD Home Page' border='0' align='right'></a>";
}

sub html_header {
    local ($title) = @_;

    return "Content-type: text/html\n\n" . 
	'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">' .
	"\n<html>\n<head><title>$title</title>\n" .
	    "<meta name='charset' content='iso-8859-1' />" .
	    "<meta name='robots' content='nofollow'>\n$t_style\n</head>\n<body>\n" .
	"$i_topbar <h1>$title</h1>\n";
}

sub short_html_header {
    local ($title) = @_;

    return "Content-type: text/html\n\n" .
	'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">' .
	"\n<html>\n<head><title>$title</title>\n" . 
	    "<meta name='charset' content='iso-8859-1' />" .
	    "<meta name='robots' content='nofollow'>\n</head>\n<body>\n" .
        "$i_topbar";
}

sub html_footer {
    return "<hr><address>$hsty_author<br>$hsty_date</address>\n</body>\n</html>";
}

sub get_the_source {
    return if $ENV{'PATH_INFO'} ne '/get_the_source';

    open(R, $0) || do { 
	print "Oops! open $0: $!\n";  # should not reached
	exit;
    };

    print "Content-type: text/plain\n\n";
    while(<R>) { print }
    close R;
    exit;
}

1;
