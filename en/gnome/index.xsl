<!-- $FreeBSD: www/en/gnome/index.xsl,v 1.32 2002/11/24 08:48:32 marcus Exp $ -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		xmlns:rdf1="http://my.netscape.com/rdf/simple/0.9/"
		version="1.0">
  
  <xsl:import href="../includes.xsl"/>
  <xsl:import href="includes.xsl"/>

  <xsl:variable name="base" select="'..'"/>
  <xsl:variable name="date" select="'$FreeBSD: www/en/gnome/index.xsl,v 1.32 2002/11/24 08:48:32 marcus Exp $'"/>
  <xsl:variable name="title" select="'FreeBSD GNOME Project'"/>

  <xsl:output type="html" encoding="iso-8859-1"
              doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>

  <xsl:template match="/">
    <html>
      <xsl:copy-of select="$header1"/>

      <body bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#840084"
            alink="#0000FF">

        <xsl:copy-of select="$header2"/>

        <table border="0" cellspacing="0" cellpadding="2">
          <tr>
            <td valign="top"> <!-- width="10%" -->
              <table border="0" cellspacing="0" cellpadding="1"
                     bgcolor="#000000" width="100%">
                <tr>
                  <td>
                    <table cellpadding="4" cellspacing="0" border="0"
                           bgcolor="#ffcc66" width="100%">
                      <tr>
                        <td>

                          <p><font size="+1" color="#990000"><b>GNOME on FreeBSD</b></font>
                            <small><br/>
                              &#183; <a href="http://www.FreeBSD.org/gnome/">GNOME on FreeBSD Home</a><br/>
                              &#183; <a href="docs/faq.html#q1">Installation Instructions for GNOME 1.4</a><br/>
                              &#183; <a href="docs/faq2.html#q1">Installation Instructions for GNOME 2.0</a><br/>
                              &#183; <a href="../ports/gnome.html">Available Applications</a><br/>
                              &#183; <a href="docs/volunteer.html">How to Help</a><br/>
                              &#183; <a href="docs/bugging.html">Reporting a Bug</a><br/>
                              &#183; <a href="screenshots.html">Screenshots</a><br/>
                              &#183; <a href="contact.html">Contact Us</a><br/>
                            </small></p>

                          <p><font size="+1" color="#990000"><b>Documentation</b></font>
                            <small><br/>
                              &#183; <a href="docs/faq.html">GNOME 1.4 FAQ</a><br/>
                              &#183; <a href="docs/faq2.html">GNOME 2.0 FAQ</a><br/>
                              &#183; <a href="docs/porting.html">Creating Ports</a><br/>
                            </small></p>

                          <p><font size="+1" color="#990000"><b>Resources</b></font>
                            <small><br/>
                              &#183; <a href="http://www.gnome.org/">GNOME Project</a><br/>
                              &#183; <a href="http://www.gnome.org/gnome-office/">GNOME Office</a><br/>
                              &#183; <a href="http://gnu-darwin.sourceforge.net/GNOME/">GNOME on GNU/Darwin</a><br/>
                            </small></p>

                          <p><font size="+1" color="#990000"><b>Related Projects</b></font>
                            <small><br/>
                              &#183; <a href="http://www.kde.org/">KDE Project</a><br/>
                              &#183; <a href="http://freebsd.kde.org/">KDE on FreeBSD</a><br/>
                              &#183; <a href="http://www.opengroup.org/desktop/">CDE (commercial)</a><br/>
                            </small></p>

                          <form action="http://www.FreeBSD.org/cgi/search.cgi" method="get">
                            <small>Search the freebsd-gnome mailing list archives:<br/>
                              <input type="text" name="words" size="10"/>
                              <input type="hidden" name="max" value="25"/>
                              <input type="hidden" name="source" value="freebsd-gnome"/>
                              <input type="submit" value="Go"/>
                            </small>
                          </form>

                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>

            <td></td>

            <!-- Main body column -->

            <td align="left" valign="top" rowspan="2">
              <h2><font color="#990000">What is GNOME?</font></h2>
              <img src="{$base}/gnome/images/gnome.png" align="right"
                   border="0" width="66" height="83" alt="GNOME Logo"/>

              <p>The GNOME project was born as an effort to create an entirely free
                desktop environment for free systems.  From the start, the main
                objective of GNOME has been to provide a user-friendly suite of
                applications and an easy-to-use desktop.  The FreeBSD GNOME Project
                strives to bring GNOME to the FreeBSD user.</p>

              <p>As with most GNU programs, GNOME has been designed to run on all
                modern Unix-like operating systems.  Through the efforts of the
                FreeBSD GNOME Project and countless volunteers, those operating
                systems include FreeBSD.</p>

              <p>The GNOME project has expanded its objectives over the past few
                months to include addressing a number of problems in the existing
                Unix infrastructure.</p>

              <p>The GNOME project acts as an umbrella.  The major components of
                GNOME are:</p>
              <ul>
                <li>The <a href="http://www.gnome.org">GNOME desktop</a>:  An easy
                  to use window-based environment for users.</li>
                <li>The <a href="http://developer.gnome.org">GNOME development
                  platform</a>:  A rich collection of tools, libraries,
                  and components to develop powerful applications on Unix.</li>
                <li>The <a href="http://www.gnome.org/gnome-office">GNOME
                  Office</a>:  A set of office productivity applications.</li>
              </ul>

              <h2><font color="#990000">State of the port</font></h2>

              <p>We currently support 4.x and 5-CURRENT FreeBSD systems
                for GNOME 1.4 and 2.0.  Anything prior to FreeBSD 4.5 is 
		not supported.  Most of GNOME has been ported to FreeBSD;
                however, there is <a href="docs/volunteer.html">plenty left to 
		do</a>!</p>

            </td>
            
            <td></td>

            <!-- Right-most column -->
            <td valign="top"> <!-- width="20%" -->
              <!-- News table -->
              <table border="0" cellspacing="0" cellpadding="1"
                     bgcolor="#000000" width="100%">
                <tr>
                  <td>
                    <table cellpadding="4" cellspacing="0" border="0"
                           bgcolor="#ffcc66" width="100%">
                      <tr>
                        <td valign="top">
                        
                        <p><font size="+1" color="#990000"><b>FreeBSD GNOME News</b></font><br/>
                          <font size="-1">
                            Latest update: 
                            <xsl:value-of
                              select="descendant::month[position() = 1]/name"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of
                              select="descendant::day[position() = 1]/name"/>,
                            <xsl:text> </xsl:text>
                            <xsl:value-of
                              select="descendant::year[position() = 1]/name"/>
                            <br/>
                            <!-- Pull in the 10 most recent news items -->
                            <xsl:for-each select="descendant::event[position() &lt;= 10]">
                              &#183;  <a>
                                <xsl:attribute name="href">
                                  newsflash.html#<xsl:call-template name="generate-event-anchor"/>
                                </xsl:attribute>
                                <xsl:choose>
                                  <xsl:when test="count(child::title)">
                                    <xsl:value-of select="title"/><br/>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="p"/><br/>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </a>
                            </xsl:for-each>
                            <a href="newsflash.html">More...</a>
                          </font></p>
                          
                          <p><font size="+1" color="#990000"><b>GNOME Project News</b></font><br/>
                            <font size="-1">
                              <xsl:for-each select="document('http://gnomedesktop.org/backend.php')/rss/channel/*[name() = 'item'][position() &lt; 10]">
                                &#183; <a>
                                  <xsl:attribute name="href">
                                    <xsl:value-of select="link"/>
                                  </xsl:attribute>
                                  <xsl:value-of select="title"/><br/>
                                </a>
                              </xsl:for-each>
                            <a>
                              <xsl:for-each select="document('http://gnomedesktop.org/backend.php')/rss/*[name() = 'channel'][position() = 1]">
                                <xsl:attribute name="href">
                                  <xsl:value-of select="link"/>
                                </xsl:attribute>More...
                              </xsl:for-each>
                            </a>
                          </font></p>

                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
            
          </tr>
        </table>
        <xsl:copy-of select="$footer"/>
      </body>
    </html>
  </xsl:template>    
</xsl:stylesheet>
