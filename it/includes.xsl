<?xml version="1.0" encoding="ISO-8859-1" ?>

<!-- $FreeBSD$ -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:variable name="i.daemon">
    <img src="{$enbase}/gifs/daemon.gif" alt="" align="left" width="80" height="76"/>
  </xsl:variable>

  <xsl:variable name="i.new">
    <img src="{$enbase}/gifs/new.gif" alt="[New!]" width="28" height="11"/>
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
    <a href="{$base}/index.html"><img src="{$enbase}/gifs/home.gif" alt="FreeBSD Home Page" border="0" align="right" width="101" height="33"/></a>
  </xsl:variable>

  <xsl:variable name="header1">
    <head>
      <title><xsl:value-of select="$title"/></title>

      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
      <meta name="MSSmartTagsPreventParsing" content="TRUE"/>
    </head>
  </xsl:variable>

  <xsl:attribute-set name="att.body">
    <xsl:attribute name="text">#000000</xsl:attribute>
    <xsl:attribute name="bgcolor">#FFFFFF</xsl:attribute>
    <xsl:attribute name="alink">#FFCC33</xsl:attribute>
  </xsl:attribute-set>

  <xsl:variable name="header2">
    <img src="{$enbase}/gifs/bar.gif" alt="Navigation Bar" width="565" 
	 height="33" border="0" usemap="#bar"/>
      
    <h1 align="left"><font color="#660000"><xsl:value-of select="$title"/></font></h1>

    <br clear="all"/>

    <map name="bar">
      <area shape="rect" coords="1,1,111,31" 
	    href="{$base}/index.html" alt="Home"/>
      <area shape="rect" coords="112,11,196,31" 
	    href="{$enbase}/ports/index.html" alt="Applicazioni"/>
      <area shape="rect" coords="196,12,257,33" 
	    href="{$enbase}/support.html" alt="Supporto"/>
      <area shape="rect" coords="256,12,365,33" 
	    href="{$base}/docs.html" alt="Documentazione"/> 
      <area shape="rect" coords="366,13,424,32" 
	    href="{$enbase}/commercial/commercial.html" alt="Fornitori"/>
      <area shape="rect" coords="425,16,475,32" 
	    href="{$enbase}/search/search.html" alt="Cerca"/>
      <area shape="rect" coords="477,16,516,33" 
	    href="{$enbase}/search/index-site.html" alt="Indice"/>
      <area shape="rect" coords="516,15,562,33" 
	    href="{$base}/index.html" alt="Home"/>
      <area shape="rect" coords="0,0,564,32" 
	    href="{$base}/index.html" alt="Home"/>
    </map>
  </xsl:variable>

  <xsl:variable name="footer">
    <hr noshade="noshade"/>
    <address><xsl:copy-of select="$author"/><br/>
      <xsl:copy-of select="$date"/></address>
  </xsl:variable>
  
  <xsl:variable name="rel.current" select='"5.0"'/>
  <xsl:variable name="u.rel.notes">
    <xsl:value-of select="$enbase"/>/releases/<xsl:value-of select="$rel.current"/>R/relnotes.html</xsl:variable>

  <xsl:variable name="u.rel.announce">
    <xsl:value-of select="$enbase"/>/releases/<xsl:value-of select="$rel.current"/>R/announce.html</xsl:variable>
  <xsl:variable name="u.rel.errata">
    <xsl:value-of select="$enbase"/>/releases/<xsl:value-of select="$rel.current"/>R/errata.html</xsl:variable>
  <xsl:variable name="u.rel.hardware">
    <xsl:value-of select="$enbase"/>/releases/<xsl:value-of select="$rel.current"/>R/hardware.html</xsl:variable>
  <xsl:variable name="u.rel.early">
    <xsl:value-of select="$enbase"/>/releases/<xsl:value-of select="$rel.current"/>R/early-adopter.html</xsl:variable>
  
  <xsl:variable name="rel2.current" select='"4.7"'/>
  <xsl:variable name="u.rel2.notes">
    <xsl:value-of select="$enbase"/>/releases/<xsl:value-of select="$rel2.current"/>R/relnotes.html</xsl:variable>

  <xsl:variable name="u.rel2.announce">
    <xsl:value-of select="$enbase"/>/releases/<xsl:value-of select="$rel2.current"/>R/announce.html</xsl:variable>
  <xsl:variable name="u.rel2.errata">
    <xsl:value-of select="$enbase"/>/releases/<xsl:value-of select="$rel2.current"/>R/errata.html</xsl:variable>
  <xsl:variable name="u.rel2.hardware">
    <xsl:value-of select="$enbase"/>/releases/<xsl:value-of select="$rel2.current"/>R/hardware.html</xsl:variable>

  <!-- Translate month name -->
  <xsl:template name="translate-month">
    <xsl:param name="month"/>
    <xsl:choose>
      <xsl:when test="$month = 'January'">Gennaio</xsl:when>
      <xsl:when test="$month = 'February'">Febbraio</xsl:when>
      <xsl:when test="$month = 'March'">Marzo</xsl:when>
      <xsl:when test="$month = 'April'">Aprile</xsl:when>
      <xsl:when test="$month = 'May'">Maggio</xsl:when>
      <xsl:when test="$month = 'June'">Giugno</xsl:when>
      <xsl:when test="$month = 'July'">Luglio</xsl:when>
      <xsl:when test="$month = 'August'">Agosto</xsl:when>
      <xsl:when test="$month = 'September'">Settembre</xsl:when>
      <xsl:when test="$month = 'October'">Ottobre</xsl:when>
      <xsl:when test="$month = 'November'">Novembre</xsl:when>
      <xsl:when test="$month = 'December'">Dicembre</xsl:when>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
