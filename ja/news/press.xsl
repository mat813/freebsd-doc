<?xml version="1.0" encoding="EUC-JP" ?>

<!--
    $FreeBSD: www/ja/news/press.xsl,v 1.4 2003/11/03 11:41:05 rushani Exp $
    Original revision: 1.5
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:import href="../includes.xsl"/>
  <xsl:import href="includes.xsl"/>


  <xsl:variable name="base" select="'..'"/>
  <xsl:variable name="title" select="'FreeBSD In The Press'"/>
  <xsl:variable name="date" select="'$FreeBSD: www/ja/news/press.xsl,v 1.4 2003/11/03 11:41:05 rushani Exp $'"/>

  <xsl:param name="news.press.xml-master" select="'none'" />
  <xsl:param name="news.press.xml" select="'none'" />
  
  <xsl:output type="html" encoding="EUC-JP"/>

  <!-- for l10n -->
  <xsl:template name="html-news-month-headings">
    <xsl:param name="year" />
    <xsl:param name="month" />

    <xsl:value-of select="concat($year, ' ǯ ', $month)" />
  </xsl:template>

  <xsl:template match="press">
    <html>
      
      <xsl:copy-of select="$header1"/>

      <body xsl:use-attribute-sets="att.body">

	<xsl:copy-of select="$header2"/>

	<p>�����˺ܤäƤ��ʤ� FreeBSD �˴�Ϣ�����˥塼��������¸���ʤ顢
	  �桹�������˺ܤ�����褦�˾ܺ٤�
	  <a href="mailto:www@freebsd.org">www@FreeBSD.org</a> �ޤ�
	  (�Ѹ��) ���äƤ���������</p>

	<p>�ޤ���FreeBSD Java �ץ������Ȥ���ƻ�����˴ؤ������ϡ�
	  <a href="{$base}/java/press.html">FreeBSD/Java Press</a>
	  ������������</p>
	
	<xsl:call-template name="html-news-list-press">
	  <xsl:with-param name="news.press.xml-master" select="$news.press.xml-master" />
	  <xsl:with-param name="news.press.xml" select="$news.press.xml" />
	</xsl:call-template>

	<xsl:copy-of select="$newshome"/>
	<xsl:copy-of select="$footer"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
