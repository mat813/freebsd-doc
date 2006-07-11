<?xml version="1.0" encoding="GB2312" ?>

<!-- $FreeBSD: www/zh_CN/news/press.xsl,v 1.1.1002.4 2006/01/28 18:26:24 delphij Exp $ -->

<!-- The FreeBSD Simplified Chinese Documentation Project -->
<!-- Original Revision 1.13 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:cvs="http://www.FreeBSD.org/XML/CVS">

  <xsl:import href="../includes.xsl"/>
  <xsl:import href="includes.xsl"/>
  <xsl:variable name="section" select="'about'"/>

  <xsl:variable name="base" select="'..'"/>
  <xsl:variable name="title" select="'���ű����е� FreeBSD'"/>
  <xsl:variable name="date">
    <xsl:value-of select="//cvs:keyword[@name='freebsd']"/>
  </xsl:variable>

  <xsl:param name="news.press.xml-master" select="'none'" />
  <xsl:param name="news.press.xml" select="'none'" />
  
  <xsl:output type="html" encoding="gb2312"/>

  <!-- for l10n -->
  <xsl:template name="html-news-month-headings">
    <xsl:param name="year" />
    <xsl:param name="month" />

    <xsl:value-of select="concat($year, ' �� ', $month)" />
  </xsl:template>

  <xsl:template match="press">
    <html>
      
      <xsl:copy-of select="$header1"/>

      <body>

  <div id="CONTAINERWRAP">
    <div id="CONTAINER">

	<xsl:copy-of select="$header2"/>

	<div id="CONTENT">

	      <xsl:copy-of select="$sidenav"/>

	      <div id="CONTENTWRAP">
	      
	      <xsl:copy-of select="$header3"/>

	<p>�����֪������û���������г��Ĺ��� FreeBSD ����Ϣ�� ������
	  <a href="mailto:www@FreeBSD.org">www@FreeBSD.org</a> �Ա����ǰ�����ӽ�ȥ��</p>

	<xsl:call-template name="html-news-list-press">
          <xsl:with-param name="news.press.xml-master" select="$news.press.xml-master" />
          <xsl:with-param name="news.press.xml" select="$news.press.xml" />
	</xsl:call-template>

	<xsl:copy-of select="$newshome"/>

	  	</div> <!-- CONTENTWRAP -->
		<br class="clearboth" />
	
	</div> <!-- CONTENT -->
	
	<xsl:copy-of select="$footer"/>
	
        </div> <!-- CONTAINER -->
   </div> <!-- CONTAINERWRAP -->

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
