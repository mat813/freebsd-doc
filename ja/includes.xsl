<?xml version="1.0" encoding="EUC-JP" ?>

<!-- $FreeBSD: www/ja/includes.xsl,v 1.22 2004/12/09 20:11:38 rushani Exp $ -->
<!-- Original revision: 1.20 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:import href="../share/sgml/includes.xsl" />

  <xsl:variable name="url.doc.langcode" select="'ja_JP.eucJP'" />

  <xsl:variable name="header2">
    <img src="{$base}/../gifs/bar.gif" alt="��˥塼" width="565" 
	 height="33" border="0" usemap="#bar"/>
      
    <h1 align="left"><font color="#660000"><xsl:value-of select="$title"/></font></h1>

    <br clear="all"/>

    <map name="bar">
      <area shape="rect" coords="1,1,111,31" 
	    href="{$base}/index.html" alt="�ȥåץڡ���"/>
      <area shape="rect" coords="112,11,196,31" 
	    href="{$base}/ports/index.html" alt="���ץꥱ�������"/>
      <area shape="rect" coords="196,12,257,33" 
	      href="{$base}/support.html" alt="���ݡ���"/>
      <area shape="rect" coords="256,12,365,33" 
	    href="{$base}/docs.html" alt="�ɥ������"/> 
      <area shape="rect" coords="366,13,424,32" 
	    href="{$base}/commercial/commercial.html" alt="�٥��"/>
      <area shape="rect" coords="425,16,475,32" 
	      href="{$base}/search/search.html" alt="����"/>
      <area shape="rect" coords="477,16,516,33" 
	    href="{$base}/search/index-site.html" alt="����"/>
      <area shape="rect" coords="516,15,562,33" 
	    href="{$base}/index.html" alt="�ȥåץڡ���"/>
	<area shape="rect" coords="0,0,564,32" 
	      href="{$base}/index.html" alt="�ȥåץڡ���"/>
    </map>
  </xsl:variable>

  <xsl:variable name="footer">
    <hr noshade="noshade"/>
    <address><xsl:copy-of select="$author"/><br/>
      <xsl:copy-of select="$date"/><br/>
      (���ܸ����˴ؤ��뤪�䤤��碌��
      <a href="http://www.jp.FreeBSD.org/ml.html#doc-jp">doc-jp@jp.FreeBSD.org</a>
      �ޤǤ��ꤤ���ޤ�)
    </address>
  </xsl:variable>

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

<!--
  <xsl:variable name="u.rel2.notes">
    <xsl:value-of select="$base"/>/releases/<xsl:value-of select="$rel2.current"/>R/relnotes.html</xsl:variable>
-->

<!--
  <xsl:variable name="u.rel2.announce">
    <xsl:value-of select="$base"/>/releases/<xsl:value-of select="$rel2.current"/>R/announce.html</xsl:variable>
-->

  <xsl:variable name="u.rel2.errata">
    <xsl:value-of select="$enbase"/>/releases/<xsl:value-of select="$rel2.current"/>R/errata.html</xsl:variable>

  <xsl:variable name="u.rel2.hardware">
    <xsl:value-of select="$enbase"/>/releases/<xsl:value-of select="$rel2.current"/>R/hardware.html</xsl:variable>


  <!-- template: "html-index-advisories-items-lastmodified" -->

  <xsl:template name="html-index-advisories-items-lastmodified">
    <xsl:param name="advisories.xml" select="''" />

    <xsl:value-of select="document($advisories.xml)/descendant::year[position() = 1]/name"/>
    <xsl:text> ǯ </xsl:text>
    <xsl:call-template name="transtable-lookup">
      <xsl:with-param name="word-group" select="'number-month'" />
      <xsl:with-param name="word">
	<xsl:value-of select="document($advisories.xml)/descendant::month[position() = 1]/name"/>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:text> </xsl:text>
    <xsl:value-of select="document($advisories.xml)/descendant::day[position() = 1]/name"/>
    <xsl:text> ��</xsl:text>
  </xsl:template>

  <!-- template: "html-index-news-project-items-lastmodified" -->

  <xsl:template name="html-index-news-project-items-lastmodified">
    <xsl:param name="news.project.xml-master" select="''" />

    <xsl:value-of select="document($news.project.xml-master)/descendant::year[position() = 1]/name"/>
    <xsl:text> ǯ </xsl:text>
    <xsl:call-template name="transtable-lookup">
      <xsl:with-param name="word-group" select="'number-month'" />
      <xsl:with-param name="word">
	<xsl:value-of select="document($news.project.xml-master)/descendant::month[position() = 1]/name"/>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:text> </xsl:text>
    <xsl:value-of select="document($news.project.xml-master)/descendant::day[position() = 1]/name"/>
    <xsl:text> �� </xsl:text>
  </xsl:template>

  <!-- template: "html-index-news-press-items-lastmodified" -->

  <xsl:template name="html-index-news-press-items-lastmodified">
    <xsl:param name="news.press.xml-master" select="''" />

    <xsl:value-of select="document($news.press.xml-master)/descendant::year[position() = 1]/name"/>
    <xsl:text> ǯ </xsl:text>
    <xsl:call-template name="transtable-lookup">
      <xsl:with-param name="word-group" select="'number-month'" />
      <xsl:with-param name="word">
	<xsl:value-of select="document($news.press.xml-master)/descendant::month[position() = 1]/name"/>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:text> </xsl:text>
  </xsl:template>

</xsl:stylesheet>
