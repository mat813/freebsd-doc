<?xml version="1.0" encoding="ISO-8859-1" ?>

<!-- $FreeBSD$
     $FreeBSDde: de-www/news/press.xsl,v 1.3 2003/11/18 00:48:50 mheinen Exp $
     basiert auf: 1.5
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:cvs="http://www.FreeBSD.org/XML/CVS">

  <xsl:import href="../includes.xsl"/>
  <xsl:import href="includes.xsl"/>


  <xsl:variable name="base" select="'..'"/>
  <xsl:variable name="enbase" select="'../..'"/>
  <xsl:variable name="title" select="'Aus der Presse'"/>
  <xsl:variable name="date">
    <xsl:value-of select="//cvs:keyword[@name='freebsd']"/>
  </xsl:variable>

  <xsl:output type="html" encoding="iso-8859-1"/>

  <xsl:template match="press">
    <html>

      <xsl:copy-of select="$header1"/>

      <body xsl:use-attribute-sets="att.body">

	<xsl:copy-of select="$header2"/>

	<p>Kennen Sie einen hier nicht aufgef&#252;hrten Artikel?
	  Senden Sie bitte die Einzelheiten an
	  <a href="mailto:www@freebsd.org">www@FreeBSD.org</a> und
	  wir nehmen den Artikel auf.</p>

	<p>Besuchen Sie auch die Seite
	  <a href="{$enbase}/java/press.html">FreeBSD/Java Press</a>,
	  die Artikel &#252;ber das FreeBSD Java Project enth&#228;lt.</p>

	<xsl:apply-templates select="//month"/>

	<xsl:copy-of select="$newshome"/>
	<xsl:copy-of select="$footer"/>
      </body>
    </html>
  </xsl:template>

  <!-- Everything that follows are templates for the rest of the content -->

  <xsl:template match="month">
    <h1><xsl:value-of select="name"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="ancestor::year/name"/></h1>

    <ul>
      <xsl:apply-templates select="descendant::story"/>
    </ul>
  </xsl:template>

  <xsl:template match="story">
    <xsl:variable name="url"><xsl:value-of select="url"/></xsl:variable>
    <xsl:variable name="site-url"><xsl:value-of
    select="site-url"/></xsl:variable>

    <li>
      <a>
	<xsl:attribute name="name">
	  <xsl:call-template name="generate-story-anchor"/>
	</xsl:attribute>
      </a>

      <p><a href="{$url}"><b><xsl:value-of
        select="name"/></b></a><br/>

	<a href="{$site-url}"><xsl:value-of
	select="site-name"/></a>, <xsl:value-of select="author"/><br/>
	<xsl:copy-of select="p/child::node()"/>
      </p>
    </li>
  </xsl:template>
</xsl:stylesheet>
