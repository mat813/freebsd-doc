<?xml version="1.0" encoding="KOI8-R"?>

<!-- $FreeBSD$ -->
<!-- The FreeBSD Russian Documentation Project -->
<!-- $FreeBSDru: frdp/www/ru/news/news-rdf.xsl,v 1.2 2001/12/12 12:21:33 phantom Exp $ -->
<!-- Original revision: 1.4 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:import href="includes.xsl"/>

  <xsl:output method="xml" indent="yes"/>

  <xsl:variable name="base" select="'..'"/>

  <!-- Generate the main body of the RDF file -->
  <xsl:template match="news">
    <rdf:rdf xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	     xmlns="http://my.netscape.com/rdf/simple/0.9">

      <channel>
	<title>������� FreeBSD</title>
	<link>http://www.FreeBSD.org/news/</link>
	<description>��������� ������� ������� FreeBSD</description>
      </channel>

      <!-- Only include the last 10 events -->
      <xsl:apply-templates select="descendant::event[position() &lt;= 10]"/>

      </rdf:rdf>
  </xsl:template>

  <!-- Generate the <item> elements and their content -->
  <xsl:template match="event">
    <item>
      <xsl:choose>
	<xsl:when test="count(child::title)">
	  <title><xsl:value-of select="normalize-space(title)"/></title>
	</xsl:when>
	<xsl:otherwise>
	  <title><xsl:value-of select="normalize-space(p)"/></title>
	</xsl:otherwise>
      </xsl:choose>
      <link>http://www.FreeBSD.org/news/newsflash.html#<xsl:call-template name="generate-event-anchor"/></link>
    </item>
  </xsl:template>
  
  <xsl:template match="name | date"/>
</xsl:stylesheet>
