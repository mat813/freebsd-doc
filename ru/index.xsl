<?xml version="1.0" encoding="KOI8-R" ?>

<!--
     The FreeBSD Russian Documentation Project

     $FreeBSD$
     $FreeBSDru: frdp/www/ru/index.xsl,v 1.27 2004/01/03 13:37:06 andy Exp $

     Original revision: 1.91
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
		  <!--  Only list TRUE mirrors here! Native language pages 
		        which are not mirrored should be listed in
		        support.sgml.  -->

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
		<a href="http://www.freebsd-fr.org/index-trad.html" title="�����������">[fr]</a>
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
			  <p>
			    <a href="platforms/index.html">
			      <font size="+1" color="#990000"><b>���������</b></font>
			    </a><small><br/>
			      &#183; <a href="{$base}/smp/index.html">i386</a><br/>
			      &#183; <a href="platforms/alpha.html">Alpha</a><br/>
			      &#183; <a href="platforms/ia64/index.html">IA-64</a><br/>
			      &#183; <a href="platforms/amd64.html">AMD64</a><br/>
			      &#183; <a href="platforms/sparc.html">Sparc64</a><br/>
			      &#183; <a href="platforms/index.html">�ݣ?</a><br/>
			    </small></p>

			  <p><font size="+1" color="#990000"><b>���������</b></font>
			    <small><br/>
			      &#183; <a href="{$base}/doc/en_US.ISO8859-1/books/handbook/mirrors.html">��������� FreeBSD</a><br/>
			      &#183; <a href="releases/index.html">� �������</a><br/>
			      &#183; <a href="ports/index.html">����������</a><br/>
			    </small></p>

			  <p>
			    <a href="docs.html">
			      <font size="+1" color="#990000"><b>������������</b></font>
			    </a><small><br/>
                              &#183; <a href="{$base}/doc/ru_RU.KOI8-R/books/faq/index.html">FAQ</a><br/>
                              &#183; <a href="{$base}/doc/en_US.ISO8859-1/books/handbook/index.html">�����������</a><br/>
                              &#183; <a href="http://www.FreeBSD.org/cgi/man.cgi">�������� ���������� �������</a><br/>
			      &#183; <a href="docproj/index.html">������ ����������������</a><br/>
			      &#183; <a href="projects/newbies.html">��� ��������</a><br/>
			    </small></p>

			  <p>
			    <a href="support.html">
			      <font size="+1" color="#990000"><b>���������</b></font>
			    </a><small><br/>
			      &#183; <a href="support.html#mailing-list">������ ��������</a><br/>
			      &#183; <a href="support.html#newsgroups">���������������</a><br/>
			      &#183; <a href="support.html#user">������ �������������</a><br/>
			      &#183; <a href="support.html#web">Web-�������</a><br/>
			      &#183; <a href="security/index.html">������������</a><br/>
			    </small></p>

			  <p>
			    <a href="support.html#gnats">
			      <font size="+1" color="#990000"><b>��������� �� �������</b></font>
			    </a><small><br/>
			      &#183; <a href="http://www.FreeBSD.org/cgi/query-pr-summary.cgi?query">�����</a><br/>
			      &#183; <a href="http://www.FreeBSD.org/cgi/query-pr.cgi">�������� ������</a><br/>
			      &#183; <a href="http://www.FreeBSD.org/cgi/query-pr-summary.cgi">�������� ����</a><br/>
                              &#183; <a href="send-pr.html">�������� ���������</a><br/>
			      &#183; <a href="{$base}/doc/en_US.ISO8859-1/articles/problem-reports/article.html">����������� ��������� �� ������</a><br/>
                            </small></p>

			  <p>
			    <a href="projects/index.html">
			      <font size="+1" color="#990000"><b>����������</b></font>
			    </a><small><br/>
			      &#183; <a href="{$base}/doc/en_US.ISO8859-1/books/developers-handbook">����������� ������������</a><br/>
			      &#183; <a href="{$base}/doc/ru_RU.KOI8-R/books/porters-handbook">����������� �� �������� ������</a><br/>
			      &#183; <a href="support.html#cvs">������ CVS</a><br/>
			      &#183; <a href="releng/index.html">������ �������</a><br/>
			      &#183; <a href="{$base}/doc/en_US.ISO8859-1/articles/contributing/index.html">������ FreeBSD</a><br/>
			    </small></p>

			  <p><font size="+1" color="#990000"><b>����������</b></font>

			    <small><br/>
			      &#183; <a href="{$base}/commercial/software_bycat.html">���������</a><br/>
			      &#183; <a href="{$base}/commercial/hardware.html">������������</a><br/>
			      &#183; <a href="{$base}/commercial/consulting_bycat.html">����������</a><br/>
			      &#183; <a href="{$base}/commercial/misc.html">������</a><br/>
                            </small></p>

                          <p><font size="+1" color="#990000"><b>�������������</b></font>
                            <small><br/>
                              &#183; <a href="donations/index.html">���������� ����������</a><br/>
                              &#183; <a href="donations/donors.html">��������� �������������</a><br/>
                              &#183; <a href="donations/wantlist.html">������ ����������</a><br/>
			    </small></p>
 
			  <p>
			    <a href="search/index-site.html">
			      <font size="+1" color="#990000"><b>����</b></font>
			    </a><small><br/>
			      &#183; <a href="search/search.html#web">����� �� �����</a><br/>
			      &#183; <a href="search/search.html#mailinglists">����� � ���������</a><br/>
			      &#183; <a href="search/search.html">�����</a><br/>
			    </small></p>

			  <p>
			    <a href="mailto.html">
			      <font size="+1" color="#990000"><b>���������� ����������</b></font>
			    </a>
			  </p>

			  <p>
			    <a href="copyright/index.html">
			      <font size="+1" color="#990000"><b>��������� ����� BSD</b></font>
			    </a>
			  </p>

			  <form action="http://www.FreeBSD.org/cgi/search.cgi" method="get">
			    <small>�����:<br/>
			      <input type="text" name="words" size="10"/>
			      <input type="hidden" name="max" value="25"/>
			      <input type="hidden" name="source" value="www"/>
			      <input type="submit" value="������"/></small>
			  </form></td>
		      </tr>
		    </table>
		  </td>
		</tr>
	      </table>
	    </td>

	    <td></td>

	    <!-- Main body column -->

	    <td align="left" valign="top" rowspan="2">
	      <h2><font color="#990000">��� ����� FreeBSD?</font></h2>

	      <p>FreeBSD - ��� ������ ������������ ������� ��� �����������
                ����������, ����������� � x86, AMD64, DEC Alpha,
                IA-64, PC-98 � UltraSPARC&#174;.  ��� �������� �� BSD, ������
                <xsl:value-of select="$unix"/>, ������������� � ������������
                ����������, ������.  ��� ��������������� � �������������� <a
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
		�����.  �������� ����
		<a href="gallery/gallery.html">�������</a>, ����� �������
		������� ������������� FreeBSD.</p>
	    
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
                ����, ���� � ��� ���� ����������� � ����, ����� ����������
		ţ <i>���������������</i> ����� FTP ��� NFS.  �ӣ, ��� ���
                ����� ����� ��� ����� - ��� ���� ������ ������ ��ߣ��� 1.44��
                � <a href="{$base}/doc/en_US.ISO8859-1/books/handbook/install.html">
                ��� ��������</a>.</p>

	      <h2><font color="#990000">FreeBSD ����������������
		<i>��������</i></font></h2>
	    
	      <a href="copyright/daemon.html"><img
                                                   src="{$base}/gifs/dae_up3.gif" 
						   alt=""
						   height="81" width="72" 
						   align="right" 
						   border="0"/></a>

	      <p>���� �� ������ ������������, ��� ������������ ������� � ������
		������������� ��������� �� ������� ����, FreeBSD
		���������������� <a
		href="copyright/index.html">���������</a> �
		������������ �� ����� ��������� ��������. ���� ��� ���������
		ţ �����������, ���������� � <a
		href="{$base}/doc/en_US.ISO8859-1/books/handbook/mirrors.html">
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
		FreeBSD � ��������. The FreeBSD Foundation - ��� ������������
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
			      <a href="{$u.rel.early}">
			      <font size="+1" color="#990000"><b>����� ��������������� �����:
			    <xsl:value-of select="$rel.current"/></b></font></a><br/>

			    <small>&#183; <a href="{$u.rel.announce}">�����</a><br/>
			      &#183; <a href="{$base}/doc/en_US.ISO8859-1/books/handbook/install.html">����������� �� ���������</a><br/>
			      &#183; <a href="{$u.rel.notes}">���������� � ������</a><br/>
			      &#183; <a href="{$u.rel.hardware}">�������������� ������������</a><br/>
                              &#183; <a href="{$u.rel.errata}">������������ ��������</a><br/>
                              &#183; <a href="{$u.rel.early}">����������� ��� ��������</a></small></p>

			<p>
			      <a href="{$u.rel2.announce}">
			      <font size="+1" color="#990000"><b>������������ �����:
			    <xsl:value-of select="$rel2.current"/></b></font></a><br/>

                            <small>&#183; <a href="{$u.rel2.announce}">�����</a><br/>
                              &#183; <a href="{$base}/doc/en_US.ISO8859-1/books/handbook/install.html">����������� �� ���������</a><br/>
                              &#183; <a href="{$u.rel2.notes}">���������� � ������</a><br/>
                              &#183; <a href="{$u.rel2.hardware}">���������� �� ������������</a><br/>
                              &#183; <a href="{$u.rel2.errata}">��������� ��������</a></small></p>

			  <p><font size="+1" color="#990000"><b>������� �������</b></font><br/>
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

			      <a href="news/press.html">�����...</a>
                            </font>
                          </p>

                         <p><font size="+1" color="#990000"><b>��������� ������������</b></font><br/>

                           <font size="-1">
                             ��������� ����������:
			      <xsl:call-template name="html-index-advisories-items-lastmodified">
				<xsl:with-param name="advisories.xml" select="$advisories.xml" />
			      </xsl:call-template>

			      <br/>

			      <xsl:call-template name="html-index-advisories-items">
				<xsl:with-param name="advisories.xml" select="$advisories.xml" />
			      </xsl:call-template>

                             <a href="security/">�������������...</a>
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
	  
	    <td><a href="copyright/daemon.html"><img
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
