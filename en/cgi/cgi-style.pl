# $Id: cgi-style.pl,v 1.3 1996-09-29 01:40:53 jfieber Exp $
#
# Perl routines to encapsulate various elements of HTML page style.

# For future reference, when is now?
($se,$mn,$hr,$md,$mo,$yr,$wd,$yd,$dst) = localtime(time);
$yr += 1900;
$timestamp = "$mo-$md-$yr";

# Colors for the body
$t_body = "<body text=\"#000000\" bgcolor=\"#ffffff\">";

if ($hsty_base eq "") { 
    $hsty_base = "..";
}
if ($hsty_author eq "") {
    $hsty_author = "<a href=\"$hsty_base/mailto.html\">www\@freebsd.org</a>";
}

$i_daemon = "<img src=\"$hsty_base/gifs/daemon.gif\" alt=\"\" align=left>";

if ($hsty_home eq "") {
    $hsty_home = "<a href=\"$hsty_base/\"><img src=\"$hsty_base/gifs/home.gif\"
  alt=\"FreeBSD Home Page\" border=\"0\" align=\"right\"></a>";
}

sub html_header {
    local ($title) = @_;

    return "Content-type: text/html\n\n" . 
	"<html>\n<title>$title</title>\n</head>\n$t_body\n" .
	"<img src=\"$hsty_base/gifs/topbar.gif\" alt=\"\">" .
	"$i_daemon <h1 align=right>$title</h1><br clear=all><hr noshade>\n";
}

sub html_footer {
    return "<hr noshade>$hsty_home<address>$hsty_author<br>$hsty_date</address>\n";
}
