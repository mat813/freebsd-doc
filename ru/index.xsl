<?xml version="1.0" encoding="KOI8-R" ?>

<!--
     The FreeBSD Russian Documentation Project

     $FreeBSD: www/ru/index.xsl,v 1.22 2004/11/02 08:53:08 den Exp $
     $FreeBSDru: frdp/www/ru/index.xsl,v 1.38 2004/10/22 12:33:49 den Exp $

     Original revision: 1.116
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:import href="includes.xsl"/>
  <xsl:import href="news/includes.xsl"/>

  <xsl:variable name="base" select="'..'"/>
  <xsl:variable name="date" select="'$FreeBSD$'"/>
  <xsl:variable name="title" select="'������ FreeBSD'"/>

  <!-- these params should be externally bound. The values
       here are not used actually -->
  <xsl:param name="advisories.xml" select="'none'"/>
  <xsl:param name="notices.xml" select="'none'"/>
  <xsl:param name="mirrors.xml" select="'none'"/>
  <xsl:param name="news.press.xml" select="'none'"/>
  <xsl:param name="news.project.xml" select="'none'"/>

  <xsl:output type="html" encoding="koi8-r"
              doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>

  <xsl:template match="/">
    <html>
      <head>
	<title><xsl:value-of select="$title"/></title>
  
	<meta name="description" content="������ FreeBSD"/>

	<meta name="keywords" content="FreeBSD, BSD, UNIX, Support, Gallery,
          Release, Application, Software, Handbook, FAQ, Tutorials, Bugs, 
	  CVS, CVSup, News, Commercial Vendors, homepage, CTM, Unix,
	  ���������, �������, �����, ����������, ���������, �����������,
	  ��������, ������, �������, ������������ ����������,
	  �������� ��������"/>

        <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>

	<link rel="icon" href="/favicon.ico" type="image/x-icon"/>

	<link rel="alternate" type="application/rss+xml"
	  title="FreeBSD Project News" href="{$base}/ru/news/news.rdf" />
	<link rel="alternate" type="application/rss+xml"
	  title="FreeBSD Security Advisories" href="{$base}/security/advisories.rdf" />
	<link rel="alternate" type="application/rss+xml"
	  title="FreeBSD GNOME Project News" href="{$base}/gnome/news.rdf" />

	<!-- Formatted to be easy to spam harvest, please do not reformat. -->
	<xsl:comment>
	������� ��� ��������, �� ������ �� ������:
        &lt;a href="mailto:bruscar@freebsd.org"&gt;bruscar@freebsd.org&lt;/a&gt;
	</xsl:comment>
      </head>

      <body bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#840084"
	alink="#0000FF">

	<table border="0" cellspacing="0" cellpadding="0" width="100%">
	  <tr>
	    <td><a href="http://www.FreeBSD.org/ru/index.html">
              <img src="../gifs/freebsd_1.gif" height="94" width="306"
              alt="FreeBSD: The Power to Serve" border="0"/></a></td>

	    <td align="right" valign="bottom">
	      <form action="http://www.FreeBSD.org/cgi/mirror.cgi"
                method="get">

	        <br/>

		<font color="#990000"><b>�������� ��������� � ��� ������:</b></font>

		<br/>

		<select name="goto">

		  <xsl:call-template name="html-index-mirrors-options-list">
		    <xsl:with-param name="mirrors.xml" select="$mirrors.xml" />
		  </xsl:call-template>
		</select>
		
		<input type="submit" value=" ������� "/>
		
		<br/>
		
		<font color="#990000"><b>����: </b></font> 
		<a href="{$base}/de/index.html" title="��������">[de]</a>
		<xsl:text>&#160;</xsl:text>
		<a href="{$base}/index.html" title="����������">[en]</a>
		<xsl:text>&#160;</xsl:text>
		<a href="{$base}/es/index.html" title="���������">[es]</a>
		<xsl:text>&#160;</xsl:text>
		<a href="{$base}/fr/index.html" title="�����������">[fr]</a>
		<xsl:text>&#160;</xsl:text>
		<a href="{$base}/it/index.html" title="�����������">[it]</a>
		<xsl:text>&#160;</xsl:text>
		<a href="{$base}/ja/index.html" title="��������">[ja]</a>
		<xsl:text>&#160;</xsl:text>
		<span title="�������">[ru]</span>
	      </form>
	    </td>
	  </tr>
	</table>

	<br/>

	<hr size="1" noshade="noshade"/>

	<!-- Main layout table -->
	<table border="0" cellspacing="0" cellpadding="2">
	  <tr>
	    <td valign="top">
	      <table border="0" cellspacing="0" cellpadding="1"
		     bgcolor="#000000" width="100%">
		<tr>
		  <td>
		    <table cellpadding="4" cellspacing="0" border="0"
			   bgcolor="#ffcc66" width="100%">
		      <tr>
			<td>
			  <xsl:call-template name="html-index-navigation-link-list">
			    <xsl:with-param name="navigation.xml" select="$navigation.xml"/>
			  </xsl:call-template>

			  <form action="http://www.FreeBSD.org/cgi/search.cgi" method="get">
			    <small>�����:<br/>
			      <input type="text" name="words" size="10"/>
			      <input type="hidden" name="max" value="25"/>
			      <input type="hidden" name="source" value="www"/>
			      <input type="submit" value="������"/>
			    </small>
			  </form>
			</td>
		      </tr>
		    </table>
		  </td>
		</tr>
	      </table>
	    </td>

	    <td></td>

	    <!-- ������� ��������� ������ -->

	    <td align="left" valign="top" rowspan="2">
	      <h2><font color="#990000">��� ����� FreeBSD?</font></h2>

	      <p>FreeBSD - ��� ������ ������������ ������� ��� �����������
                ����������, ����������� � x86, AMD64, Alpha, IA-64, PC-98 �
                UltraSPARC&#174;.  ��� �������� �� BSD, ������
                <xsl:value-of select="$unix"/>, ��������� � ��������������
                ������������ � ������.  ��� ��������������� � �������������� <a
		href="{$base}/doc/en_US.ISO8859-1/articles/contributors/index.html">
                ������� �������� �������������</a>.  ��������� <a
		href="platforms/index.html">������ ��������</a>
		��������� �� ������ ������� ����������.</p>

	      <h2><font color="#990000">���������� �����������</font></h2>

	      <p>�������������� ����� ������� ������������, �������
		������������������, �������� ����������� ������������ �
		������������� � ������� �� - ��� �� ����������� <a
		href="features.html">�����������</a> FreeBSD, �������
		�������� �ӣ �ݣ ����������� � ������, ���� ������ ������������,
		������������ ��������.</p>

	      <h2><font color="#990000">������ ������� ��� Internet</font></h2>
	      
	      <p>FreeBSD �������� ��������� ���������� ��� ����������
		<a href="internet.html">Internet ��� Intranet</a>.
		��� ������� ������������� ��ģ���� ���� ��� ����� �����������
		�������� ������� ������, � ����������� ���������� �������,
		��� ��������� ������������ ���������� ����� ������� ���
		����� � ���� ����� ������������ ���������� ����������������
		�����.</p>
	    
	      <h2><font color="#990000">�������� ����������
                ����������</font></h2>

	      <p>�������� FreeBSD ����� � ����������� ��ۣ��� �
                ���������������� ���������� ������������ �� ������ ��� �������
                ����� ����������� ������������� ������������ ������� ��������
                <xsl:value-of select="$unix"/>.  ��� ��������� �������� ���
                �������� ���������� <a
		href="applications.html">����������</a> ��� � ��������
		�������, ��� � ������� �������.</p>
	    
	      <h2><font color="#990000">�������� ���������</font></h2>

	      <p>FreeBSD ����� ���� ����������� � ��������� ���������, �������
                CD-ROM, DVD-ROM, �������, ��������� �����, ������ MS-DOS&#174;,
                ����, ���� � ��� ���� ����������� � ����, ����� ���������� ţ
                <i>���������������</i> ����� FTP ��� NFS.  �ӣ, ��� ��� �����
                ��� ����� - ��������� ������ ������ �������� 1.44 ����� � <a
                href="{$base}/doc/ru_RU.KOI8-R/books/handbook/install.html">
                ��� ��������</a>.</p>

	      <h2><font color="#990000">FreeBSD ����������������
		<i>��������</i></font></h2>
	    
	      <a href="copyright/daemon.html"><img
                src="{$base}/gifs/dae_up3.gif" alt="BSD ������" height="81"
		width="72" align="right" border="0"/></a>

	      <p>���� �� ������ ��������, ��� ������������ ������� � ������
		������������� ��������� �� ������� ����, FreeBSD
		���������������� <a href="copyright/index.html">���������</a>
                � ������������ �� ����� ��������� ��������. ���� ��� ���������
		������ ��� ��������� ţ �����, ���������� � <a
		href="{$base}/doc/ru_RU.KOI8-R/books/handbook/mirrors.html">
		��������� ����������</a>.</p>

	      <h2><font color="#990000">��� ������� �������</font></h2>

	      <p>������� ������� � ������� ����� ������. �ӣ, ��� ��� �����
		������� - ��� ����� ����� FreeBSD, �������, �� ������ ������,
		����� �����������������, ������� (����������� � ���������)
		��������������� ��������� � ��������� �� � ����� ������� ���� �
		������� ������� send-pr, ���� ��������������� ����������, ����
		�� ��� ������. ��� ������ ����� ������������ ����� ��� ������,
		�� ������������ �� �������� �������. ��������� �� ���� �����
		��������� <a
		href="{$base}/doc/en_US.ISO8859-1/articles/contributing/index.html">
                �����.</a></p>

	      <p>���� ���� �� �� �����������, ���� ������ ������� ������
		FreeBSD � ��������. The <a
		href="http://www.FreeBSDFoundation.org">FreeBSD Foundation</a>
		- ��� ������������
		�����������, ��� ������� ��� ������������� � �������� ������
		�� ���������� ��������.  ��� ����� ��������� ����������
		������ <a href="mailto:bod@FreeBSDFoundation.org">
                bod@FreeBSDFoundation.org</a> ���: The FreeBSD Foundation,
		7321 Brockway Dr.  Boulder, CO 80303.  USA</p>

              <p>�������� Silicon Breeze ���������� � ��������������
                ������������� ������� ������� BSD, � �������� 15% �������
                � ������ FreeBSD Foundation.  ������ ���������� �� ���� � �
                ���, ��� �������� ������� BSD, ����� �������� �� <a
                href="http://www.linuxjewellery.com/beastie/">����
                ���������.</a></p>
	    </td>

	    <td></td>

	    <!-- Right-most column -->
	    <td valign="top">
	      <!-- News / release info table -->
	      <table border="0" cellspacing="0" cellpadding="1"
		     bgcolor="#000000" width="100%">
		<tr>
		  <td>
		    <table cellpadding="4" cellspacing="0" border="0"
			   bgcolor="#ffcc66" width="100%">
		      <tr>
			<td valign="top"><p>
			      <a href="{$u.rel.announce}">
			      <font size="+1" color="#990000"><b>������������ �����:
			    <xsl:value-of select="$rel.current"/></b></font></a><br/>

			    <small>&#183; <a href="{$base}/doc/ru_RU.KOI8-R/books/handbook/install.html">����������� �� ���������</a><br/>
			      &#183; <a href="{$u.rel.notes}">���������� � ������</a><br/>
			      &#183; <a href="{$u.rel.hardware}">���������� � ������������</a><br/>
			      &#183; <a href="{$u.rel.installation}">������� �� ���������</a><br/>
                              &#183; <a href="{$u.rel.errata}">������������ ��������</a><br/>
                              &#183; <a href="{$u.rel.migration}">����������� �� ��������</a></small></p>

			<p>
			      <a href="{$u.rel2.announce}">
			      <font size="+1" color="#990000"><b>������������ �����:
			    <xsl:value-of select="$rel2.current"/></b></font></a><br/>

                            <small>&#183; <a href="{$base}/doc/ru_RU.KOI8-R/books/handbook/install.html">����������� �� ���������</a><br/>
                              &#183; <a href="{$u.rel2.notes}">���������� � ������</a><br/>
                              &#183; <a href="{$u.rel2.hardware}">���������� � ������������</a><br/>
			      &#183; <a href="{$u.rel2.installation}">������� �� ���������</a><br/>
                              &#183; <a href="{$u.rel2.errata}">��������� ��������</a></small></p>

			  <p><font size="+1" color="#990000"><b>������� �������</b></font>
			    <xsl:text> </xsl:text>
			    <font color="#990000">(<a href="news/news.rdf">RSS</a>)</font><br/>
			    <font size="-1">
			      ��������� ���������: 
			      <xsl:call-template name="html-index-news-project-items-lastmodified">
				<xsl:with-param name="news.project.xml" select="$news.project.xml" />
			      </xsl:call-template>
			      <br/>

			      <xsl:call-template name="html-index-news-project-items">
				<xsl:with-param name="news.project.xml" select="$news.project.xml" />
			      </xsl:call-template>

			      <a href="news/newsflash.html">�����...</a>
			    </font></p>
			  
			  <p><font size="+1" color="#990000"><b>FreeBSD � ������</b></font><br/>

			    <font size="-1">
			      ��������� ���������: 
			      <xsl:call-template name="html-index-news-press-items-lastmodified">
				<xsl:with-param name="news.press.xml" select="$news.press.xml" />
			      </xsl:call-template>

			      <br/>

			      <xsl:call-template name="html-index-news-press-items">
				<xsl:with-param name="news.press.xml" select="$news.press.xml" />
			      </xsl:call-template>

			      <a href="{$base}/news/press.html">�����...</a>
                            </font>
                          </p>

                         <p><font size="+1" color="#990000"><b>��������� ������������</b></font>
			    <xsl:text> </xsl:text>
			    <font color="#990000">(<a href="{$base}/security/advisories.rdf">RSS</a>)</font><br/>

                           <font size="-1">
                             ��������� ����������:
			      <xsl:call-template name="html-index-advisories-items-lastmodified">
				<xsl:with-param name="advisories.xml" select="$advisories.xml" />
				<xsl:with-param name="type" select="'advisory'" />
			      </xsl:call-template>

			      <br/>

			      <xsl:call-template name="html-index-advisories-items">
				<xsl:with-param name="advisories.xml" select="$advisories.xml" />
				<xsl:with-param name="type" select="'advisory'" />
			      </xsl:call-template>

                             <a href="security/">�������������...</a>
			    </font>
			  </p>

			  <p><font size="+1" color="#990000"><b>��������� � ���������</b></font>
			    <xsl:text> </xsl:text>
			    <br/>
			    <font size="-1">
			      ��������� ����������: 
			      <xsl:call-template name="html-index-advisories-items-lastmodified">
				<xsl:with-param name="advisories.xml" select="$notices.xml" />
				<xsl:with-param name="type" select="'notice'" />
			      </xsl:call-template>

			      <br/>

			      <xsl:call-template name="html-index-advisories-items">
				<xsl:with-param name="advisories.xml" select="$notices.xml" />
				<xsl:with-param name="type" select="'notice'" />
			      </xsl:call-template>
			    </font>
			  </p>
			</td>
		      </tr>
		    </table>
		  </td>
		</tr>
	      </table>

	      <p>&#xa0;</p>

	      <table border="0" cellspacing="0" cellpadding="1"
		     bgcolor="#000000" width="100%">
		<tr>
		  <td>
		    <table cellpadding="4" cellspacing="0" border="0"
			   bgcolor="#FFFFFF" width="100%"><tr>
			<td>����� ������ ������ � FreeBSD �������� ����
			  ������� <a href="publish.html">����������</a>,
			  �����ݣ���� FreeBSD ��� <a
			  href="news/press.html">FreeBSD � ������</a>, � �����
			  ��������� �� ����� �����!</td>
		      </tr>
		    </table>
		  </td>
		</tr>
	      </table>
	    </td>
	  </tr>
	</table>

	<hr noshade="noshade" size="1" />

	<table width="100%" border="0" cellspacing="0" cellpadding="3">
	  <tr>
	    <td><a href="http://www.freebsdmall.com/"><img
			   src="../gifs/mall_title_medium.gif" alt="[FreeBSD Mall]"
			   height="65" width="165" border="0"/></a></td>
	    
	    <td><a href="http://www.ugu.com/"><img src="../gifs/ugu_icon.gif"
			   alt="[�� ���������� Unix Guru Universe]" 
			   height="64" width="76"
			   border="0"/></a></td>
	  
	    <td><a href="http://www.daemonnews.org/"><img src="../gifs/darbylogo.gif"
		alt="[Daemon News]" height="45" width="130"
		border="0"/></a></td>
	  
	    <td><a href="art.html"><img
			     src="{$base}/gifs/powerlogo.gif" 
			     alt="[Powered by FreeBSD]"
			     height="64" 
			     width="160" 
			     border="0"/></a></td>
	  </tr>
	</table>

	<table width="100%" cellpadding="0" border="0" cellspacing="0">
	  <tr>
	    <td align="left" 
		valign="top"><small><a href="mailto.html">������ 
		  ���</a><br/>
		<xsl:value-of select="$date"/></small></td>

	    <td align="right" 
		valign="top"><small><a href="copyright/index.html">Legal</a> &#169; 1995-2004
		The FreeBSD Project.<br/>
		��� ����� ��������.</small></td>
	  </tr>
	</table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

<!-- 
     Local Variables:
     mode: xml
     sgml-indent-data: t
     sgml-omittag: nil
     sgml-always-quote-attributes: t
     End:
-->
