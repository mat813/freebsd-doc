<?xml version="1.0" encoding="KOI8-R" ?>

<!--
     The FreeBSD Russian Documentation Project

     $FreeBSD: www/ru/news/press.xsl,v 1.6 2004/04/09 11:56:13 phantom Exp $
     $FreeBSDru: frdp/www/ru/news/press.xsl,v 1.6 2004/04/09 10:59:01 phantom Exp $

     Original revision: 1.8
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:cvs="http://www.FreeBSD.org/XML/CVS">

  <xsl:import href="../includes.xsl"/>
  <xsl:import href="includes.xsl"/>

  <xsl:variable name="base" select="'..'"/>
  <xsl:variable name="title" select="'FreeBSD � ������'"/>
  <xsl:variable name="date">
    <xsl:value-of select="//cvs:keyword[@name='freebsd']"/>
  </xsl:variable>

  <xsl:param name="news.press.xml-master" select="'none'" />
  <xsl:param name="news.press.xml" select="'none'" />

  <xsl:output type="html" encoding="koi8-r"/>

  <xsl:template match="press">
    <html>
      
      <xsl:copy-of select="$header1"/>

      <body xsl:use-attribute-sets="att.body">

	<xsl:copy-of select="$header2"/>

	<p>���� �� �� ����� ����� ������̣���� ����������, ����������,
	  ��������� ţ URL �� ����� <a
	  href="mailto:www@FreeBSD.org">www@FreeBSD.org</a></p>

	<p>����� ����, ������� ������ � ������� FreeBSD Java �� ������ �����,
          ������� ��������� <a
          href="{$base}/java/press.html">FreeBSD/Java � ������</a>.</p>

	<xsl:call-template name="html-news-list-press">
	  <xsl:with-param name="news.press.xml-master" select="$news.press.xml-master" />
	  <xsl:with-param name="news.press.xml" select="$news.press.xml" />
	</xsl:call-template>

	<xsl:call-template name="html-news-make-olditems-list" />

	<xsl:copy-of select="$newshome"/>
	<xsl:copy-of select="$footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="html-news-make-olditems-list">
    <p>���������� ������� ���:
      <a href="2002/press.html">2002</a>,
      <a href="2001/press.html">2001</a>,
      <a href="2000/press.html">2000</a>,
      <a href="1999/press.html">1999</a>,
      <a href="1998/press.html">1998-1996</a></p>
  </xsl:template>
</xsl:stylesheet>
