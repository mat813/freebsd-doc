<?xml version="1.0" encoding="KOI8-R" ?>

<!-- $FreeBSD: www/ru/includes.xsl,v 1.3 2002/02/17 13:57:28 phantom Exp $ -->
<!-- The FreeBSD Russian Documentation Project -->
<!-- $FreeBSDru: frdp/www/ru/includes.xsl,v 1.4 2002/02/17 12:39:59 phantom Exp $ -->
<!-- Original revision: 1.6 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:variable name="i.daemon">
    <img src="{$base}/../gifs/daemon.gif" alt="" align="left" width="80" height="76"/>
  </xsl:variable>

  <xsl:variable name="i.new">
    <img src="{$base}/../gifs/new.gif" alt="[New!]" width="28" height="11"/>
  </xsl:variable>

  <xsl:variable name="copyright" select="'Copyright (c) 1995-2002 the FreeBSD Project.  All rights reserved.'"/>

  <xsl:variable name="email" select="'freebsd-questions'"/>
  <xsl:variable name="author">
    <a>
      <xsl:attribute name="href">
	<xsl:value-of select="concat($base, '/mailto.html')"/>
      </xsl:attribute>
      <xsl:value-of select="$email"/>@FreeBSD.org</a><br/><xsl:value-of select="$copyright"/>
  </xsl:variable>

  <xsl:variable name="home">
    <a href="{$base}/index.html"><img src="{$base}/../gifs/home.gif" alt="FreeBSD Home Page" border="0" align="right" width="101" height="33"/></a>
  </xsl:variable>

  <xsl:variable name="header1">
    <head>
      <title><xsl:value-of select="$title"/></title>

      <meta http-equiv="Content-Type" content="text/html; charset=koi8-r"/>
      <meta name="MSSmartTagsPreventParsing" content="TRUE"/>
    </head>
  </xsl:variable>

  <xsl:attribute-set name="att.body">
    <xsl:attribute name="text">#000000</xsl:attribute>
    <xsl:attribute name="bgcolor">#FFFFFF</xsl:attribute>
    <xsl:attribute name="alink">#FFCC33</xsl:attribute>
  </xsl:attribute-set>

  <xsl:variable name="header2">
    <img src="{$base}/../gifs/bar.gif" alt="Navigation Bar" width="565" 
	 height="33" border="0" usemap="#bar"/>
      
    <h1 align="left"><font color="#660000"><xsl:value-of select="$title"/></font></h1>

    <br clear="all"/>

    <map name="bar">
      <area shape="rect" coords="1,1,111,31" 
	    href="{$base}/index.html" alt="Top"/>
      <area shape="rect" coords="112,11,196,31" 
	    href="{$base}/ports/index.html" alt="Applications"/>
      <area shape="rect" coords="196,12,257,33" 
	      href="{$base}/support.html" alt="Support"/>
      <area shape="rect" coords="256,12,365,33" 
	    href="{$base}/docs.html" alt="Documentation"/> 
      <area shape="rect" coords="366,13,424,32" 
	    href="{$base}/commercial/commercial.html" alt="Vendors"/>
      <area shape="rect" coords="425,16,475,32" 
	      href="{$base}/search/search.html" alt="Search"/>
      <area shape="rect" coords="477,16,516,33" 
	    href="{$base}/search/index-site.html" alt="Index"/>
      <area shape="rect" coords="516,15,562,33" 
	    href="{$base}/index.html" alt="Top"/>
	<area shape="rect" coords="0,0,564,32" 
	      href="{$base}/index.html" alt="Top"/>
    </map>
  </xsl:variable>

  <xsl:variable name="footer">
    <hr noshade="noshade"/>
    <address><xsl:copy-of select="$author"/><br/>
      <xsl:copy-of select="$date"/></address>
  </xsl:variable>
  
  <xsl:variable name="rel.current" select='"4.6.2"'/>
  <xsl:variable name="u.rel.notes">
    <xsl:value-of select="$base"/>/../releases/<xsl:value-of select="$rel.current"/>R/relnotes.html</xsl:variable>

  <xsl:variable name="u.rel.announce">
    <xsl:value-of select="$base"/>/../releases/<xsl:value-of select="$rel.current"/>R/announce.html</xsl:variable>
  <xsl:variable name="u.rel.errata">
    <xsl:value-of select="$base"/>/../releases/<xsl:value-of select="$rel.current"/>R/errata.html</xsl:variable>
  <xsl:variable name="u.rel.hardware">
    <xsl:value-of select="$base"/>/../releases/<xsl:value-of select="$rel.current"/>R/hardware.html</xsl:variable>
  
</xsl:stylesheet>
