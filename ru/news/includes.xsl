<?xml version="1.0" encoding="KOI8-R" ?>

<!-- $FreeBSD$ -->
<!-- The FreeBSD Russian Documentation Project -->
<!-- $FreeBSDru: frdp/www/ru/news/includes.xsl,v 1.2 2003/09/29 12:03:20 den Exp $ -->
<!-- Original revision: 1.5 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:variable name="newshome">
    <a href="{$base}/news/news.html">News Home</a>
  </xsl:variable>

  <!-- Generate a unique anchor for this event -->
  <xsl:template name="generate-event-anchor">
    <xsl:text>event</xsl:text>
    <xsl:value-of select="ancestor::year/name"/>
    <xsl:value-of select="ancestor::month/name"/>
    <xsl:value-of select="ancestor::day/name"/>:<xsl:value-of select="count(preceding-sibling::event)"/>
  </xsl:template>

  <!-- Generate a unique anchor for this story -->
  <xsl:template name="generate-story-anchor">
    <xsl:text>story</xsl:text>
    <xsl:value-of select="ancestor::year/name"/>
    <xsl:value-of select="ancestor::month/name"/>:<xsl:text/>
    <xsl:value-of select="count(following-sibling::story)"/>
  </xsl:template>
</xsl:stylesheet>
