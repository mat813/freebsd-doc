<?xml version="1.0" encoding="EUC-JP" ?>

<!-- $FreeBSD: www/ja/news/newsflash.xsl,v 1.2 2001/08/08 03:55:55 kuriyama Exp $ -->
<!-- Original revision: 1.2 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:import href="../includes.xsl"/>
  <xsl:import href="includes.xsl"/>


  <xsl:variable name="base" select="'..'"/>
  <xsl:variable name="title" select="'FreeBSD News Flash'"/>
  <xsl:variable name="date" select="'$FreeBSD: www/ja/news/newsflash.xsl,v 1.2 2001/08/08 03:55:55 kuriyama Exp $'"/>
  
  <xsl:output type="html" encoding="EUC-JP"/>

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

	<p>FreeBSD �ϵ�®��ȯŸ��³���륪�ڥ졼�ƥ��󥰥����ƥ�ʤΤ�,
	  �ǿ��ο���ˤĤ��ƹԤ��Τ����ݤˤʤ��������ޤ����.
	  �����̤ˤʤ뤿���, ���Υڡ��������Ū�˥����å�����褦�ˤ��ޤ��礦.
	  <a href="{$base}/handbook/eresources.html#ERESOURCES-MAIL">
	    freebsd-announce �᡼��󥰥ꥹ��</a>����ɤ�����
	  �Ȥ������⤤�뤫�⤷��ޤ����.</p>

	<p>FreeBSD Java Project �κǿ�����ˤĤ��Ƥ�
	  <a href="{$base}/java/newsflash.html">
	    FreeBSD/Java �˥塼���ե�å���</a>�Υڡ���������������.</p>
	  
	<p>���, ����, �����ƾ���Υ�꡼���ξܺ٤ˤĤ��Ƥ�,
	  <strong><a href="{$base}/releases/index.html">��꡼������</a>
	  </strong>
	  �Υڡ���������������.</p>
	
	<p>FreeBSD �������ƥ�����ˤĤ��Ƥ�, <a href="{$base}/security/#adv">
	  �������ƥ�����</a> �Υڡ���������������.</p>
	
	<xsl:apply-templates select="descendant::month"/>
	
	<p>Older announcements:
	  <a href="2000/index.html">2000</a>,
	  <a href="1999/index.html">1999</a>,
	  <a href="1998/index.html">1998</a>,
	  <a href="1997/index.html">1997</a>,
	  <a href="1996/index.html">1996</a></p>
	
	<xsl:copy-of select="$newshome"/>
	<xsl:copy-of select="$footer"/>
      </body>
    </html>
  </xsl:template>

  <!-- Everything that follows are templates for the rest of the content -->
  
  <xsl:template match="month">
    <h1><xsl:value-of select="ancestor::year/name"/>
      <xsl:text>ǯ </xsl:text>
      <xsl:value-of select="name"/> ��</h1>

    <ul>
      <xsl:apply-templates select="descendant::day"/>
    </ul>
  </xsl:template>

  <xsl:template match="day">
    <xsl:apply-templates select="event"/>
  </xsl:template>

  <xsl:template match="event">
    <li><p><a>
	  <xsl:attribute name="name">
	    <xsl:call-template name="generate-event-anchor"/>
	  </xsl:attribute>
	</a>

	<b><xsl:value-of select="ancestor::day/name"/>
	  <xsl:value-of select="ancestor::month/name"/> /
	  <xsl:value-of select="ancestor::day/name"/> : </b><xsl:text> </xsl:text>
	<xsl:apply-templates select="p"/>
	</p>

    </li>
  </xsl:template>

  <xsl:template match="date"/>    <!-- Deliberately left blank -->

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
