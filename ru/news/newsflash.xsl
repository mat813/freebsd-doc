<?xml version="1.0" encoding="KOI8-R" ?>

<!--
     The FreeBSD Russian Documentation Project

     $FreeBSD: www/ru/news/newsflash.xsl,v 1.7 2004/04/09 11:57:33 phantom Exp $
     $FreeBSDru: frdp/www/ru/news/newsflash.xsl,v 1.12 2004/04/09 11:18:50 phantom Exp $

     Original revision: 1.11
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:cvs="http://www.FreeBSD.org/XML/CVS">

  <xsl:import href="../includes.xsl"/>
  <xsl:import href="includes.xsl"/>

  <xsl:variable name="base" select="'..'"/>
  <xsl:variable name="title" select="'��������� ������� FreeBSD'"/>
  <xsl:variable name="date">
    <xsl:value-of select="//cvs:keyword[@name='freebsd']"/>
  </xsl:variable>
  
  <xsl:output type="html" encoding="koi8-r"/>

  <xsl:template match="news">
    <html>
      
      <xsl:copy-of select="$header1"/>

      <body xsl:use-attribute-sets="att.body">

	<xsl:copy-of select="$header2"/>

	<!-- Notice how entity references in SGML become variable references
	     in the stylesheet, and that the syntax for referring to variables
	     inside an attribute is "{$variable}".

	     This is just dis-similar enough to Perl and the shell that you
	     end up writing ${variable} all the time, and then scratch your 
	     head wondering why the stylesheet isn't working.-->

	<!-- Also notice that because this is now XML and not SGML, empty
             elements, like IMG, must have a trailing "/" just inside the 
   	     closing angle bracket, like this " ... />" -->
	<img src="{$base}/../gifs/news.jpg" align="right" border="0" width="193"
	     height="144" alt="FreeBSD News"/>

	<p>FreeBSD �������� ������ ������������� ������������ ��������. ����
	  � ����� ���� ��������� ���������� ������ ������ ����������! �����
	  ������� ���, ������������ ����������� � ���� ���������. ����� ����, ��
	  ����� �������� ����������� �� <a
	  href="../../doc/ru_RU.KOI8-R/books/handbook/eresources.html#ERESOURCES-MAIL">
          ������ �������� freebsd-announce</a> ��� ������������
          <a href="news.rdf">RSS</a>.</p>

        <p>��������� ������� ����� ����������� �������� ��������, � �������
          ����� ���������� � ������� ���������� � ��������, ������������ �
          ��������������� ��������.</p>

        <ul>
          <li><a href="../../java/newsflash.html"><xsl:value-of
            select="$java"/> �� FreeBSD</a></li>

          <li><a href="http://freebsd.kde.org/">KDE �� FreeBSD</a></li>

          <li><a href="../../gnome/newsflash.html">GNOME �� FreeBSD</a></li>
        </ul>

	<p>��������� �������� �������, ��������� � ������� ������� ��������� ��
	  �������� <strong><a href="{$base}/releases/index.html">����������
	  � �������</a></strong>.</p>

	<p>��������� �� ������������ FreeBSD ��������� �� �������� <a
	  href="{$base}/security/#adv">���������� � ������������</a>.</p>

	<xsl:call-template name="html-news-list-newsflash">
          <xsl:with-param name="news.project.xml-master" select="$news.project.xml-master" />
          <xsl:with-param name="news.project.xml" select="$news.project.xml" />
	</xsl:call-template>

	<xsl:call-template name="html-news-make-olditems-list" />

	<xsl:copy-of select="$newshome"/>
	<xsl:copy-of select="$footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="html-news-make-olditems-list">
    <p>������ ������� ���:
      <a href="2002/index.html">2002</a>,
      <a href="2001/index.html">2001</a>,
      <a href="2000/index.html">2000</a>,
      <a href="1999/index.html">1999</a>,
      <a href="1998/index.html">1998</a>,
      <a href="1997/index.html">1997</a>,
      <a href="1996/index.html">1996</a></p>
  </xsl:template>

  <!-- When the href attribute contains a '$base', expand it to the current
       value of the $base variable. -->

  <!-- All your $base are belong to us.  Ho ho ho -->
  <xsl:template match="a">
    <a><xsl:attribute name="href">
	<xsl:choose>
	  <xsl:when test="contains(@href, '$base')">
	    <xsl:value-of select="concat(substring-before(@href, '$base'), $base, substring-after(@href, '$base'))"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:value-of select="@href"/>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:attribute>
      <xsl:apply-templates/>
    </a>
  </xsl:template>
</xsl:stylesheet>
