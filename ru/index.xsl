<?xml version="1.0" encoding="KOI8-R" ?>

<!--
     The FreeBSD Russian Documentation Project

     $FreeBSD$
     $FreeBSDru: frdp/www/ru/index.xsl,v 1.5 2002/02/11 13:46:22 andy Exp $

     Original revision: 1.19
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:import href="includes.xsl"/>
  <xsl:import href="news/includes.xsl"/>

  <xsl:variable name="base" select="'.'"/>
  <xsl:variable name="date" select="'$FreeBSD$'"/>
  <xsl:variable name="title" select="'������ FreeBSD'"/>

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
      </head>
  
      <body bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#840084"
	    alink="#0000FF">
    
	<table border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td><a href="http://www.FreeBSD.org/index.html">
		<img src="gifs/freebsd_1.gif" height="94" width="306"
		     alt="FreeBSD: The Power to Serve" border="0"/></a></td>
	    
	    <td align="right" valign="bottom" width="300">
	      <form action="http://www.FreeBSD.org/cgi/mirror.cgi" 
		    method="GET">
		
		<br/>
		
		<font color="#990000"><b>�������� ��������� � ��� ������:</b></font>
		
		<br/>
	      
		<select name="goto">
		  <!--  Only list TRUE mirrrors here! Native language pages 
		        which are not mirrored should be listed in
		        support.sgml.  -->

		  <option value="http://www.jp.FreeBSD.org/www.FreeBSD.org/">6Bone(IPv6)</option>
		  <option value="http://www.au.FreeBSD.org/">���������/1</option>
		  <option value="http://freebsd.unixtech.be/">�������</option>
		  <option value="http://www.br.FreeBSD.org/www.freebsd.org/">��������/1</option>
		  <option value="http://www2.br.FreeBSD.org/www.freebsd.org/">��������/2</option>
		  <option value="http://www3.br.FreeBSD.org/">��������/3</option>
		  <option value="http://www.bg.FreeBSD.org/">��������</option>
		  <option value="http://www.ca.FreeBSD.org/">������/1</option>
		  <option value="http://www.cn.FreeBSD.org/">�����</option>
		  <option value="http://www.cz.FreeBSD.org/">������� ����������</option>
		  <option value="http://www.dk.FreeBSD.org/">�����</option>
		  <option value="http://www.ee.FreeBSD.org/">�������</option>
		  <option value="http://www.fi.FreeBSD.org/">���������</option>
		  <option value="http://www.fr.FreeBSD.org/">�������</option>
		  <option value="http://www.de.FreeBSD.org/">��������/1</option>
		  <option value="http://www1.de.FreeBSD.org/">��������/2</option>
		  <option value="http://www2.de.FreeBSD.org/">��������/3</option>
		  <option value="http://www.gr.FreeBSD.org/">������</option>
		  <option value="http://www.hu.FreeBSD.org/">�������</option>
		  <option value="http://www.ie.FreeBSD.org/">��������</option>
		  <option value="http://www.is.FreeBSD.org/">��������</option>
		  <option value="http://www.it.FreeBSD.org/">������/1</option>
		  <option value="http://www.gufi.org/mirrors/www.freebsd.org/data/">������/2</option>
		  <option value="http://www.jp.FreeBSD.org/www.FreeBSD.org/">������</option>
		  <option value="http://www.kr.FreeBSD.org/">�����</option>
		  <option value="http://www2.kr.FreeBSD.org/">�����/2</option>
		  <option value="http://www.lv.FreeBSD.org/">������</option>
                  <option value="http://www.lt.FreeBSD.org/">�����</option>
		  <option value="http://www.nl.FreeBSD.org/">����������</option>
		  <option value="http://www2.nl.FreeBSD.org/">����������/2</option>
		  <option value="http://www.nz.FreeBSD.org/">����� ��������</option>
		  <option value="http://www.no.FreeBSD.org/">��������</option>
		  <option value="http://www.pl.FreeBSD.org/">������/1</option>
		  <option value="http://www2.pl.FreeBSD.org/">������/2</option>
		  <option value="http://www.pt.FreeBSD.org/">����������/1</option>
		  <option value="http://www2.pt.FreeBSD.org/">����������/2</option>
		  <option value="http://www.ro.FreeBSD.org/">�������</option>
		  <option value="http://www.ru.FreeBSD.org/">������/1</option>
		  <option value="http://www2.ru.FreeBSD.org/">������/2</option>
		  <option value="http://www3.ru.FreeBSD.org/">������/3</option>
		  <option value="http://www4.ru.FreeBSD.org/">������/4</option>
		  <option value="http://www.sg.FreeBSD.org/">��������</option>
		  <option value="http://www.sk.FreeBSD.org/">��������</option>
		  <option value="http://www.si.FreeBSD.org/">��������</option>
		  <option value="http://www.es.FreeBSD.org/">�������</option>
		  <option value="http://www.za.FreeBSD.org/">����� ������/1</option>
		  <option value="http://www2.za.FreeBSD.org/">����� ������/2</option>
		  <option value="http://www.se.FreeBSD.org/">������</option>
		  <option value="http://www.ch.FreeBSD.org/">���������</option>
		  <option value="http://www.tw.FreeBSD.org/www.freebsd.org/data/">�������</option>
		  <option value="http://www.tr.FreeBSD.org/">������</option>
		  <option value="http://www.enderunix.org/freebsd/">������/2</option>
		  <option value="http://www.ua.FreeBSD.org/">�������/1</option>
		  <option value="http://www2.ua.FreeBSD.org/">�������/2</option> 
		  <option value="http://www4.ua.FreeBSD.org/">�������/����</option> 
		  <option value="http://www.uk.FreeBSD.org/">��������������/1</option>
		  <option value="http://www2.uk.FreeBSD.org/">��������������/2</option>
		  <option value="http://www3.uk.FreeBSD.org/">��������������/3</option>
		  <option value="http://www.FreeBSD.org/">���/����������</option>
		</select>
		
		<input type="submit" value=" ������� "/>
		
		<br/>
		
		<font color="#990000"><b>����: </b></font> 
		<a href="../">����������</a>, 
		<a href="../es/index.html">���������</a>, 
		<a href="../ja/index.html">��������</a>, 
		<a href="support.html#web">������</a>
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
			  <p><font size="+1" color="#990000"><b>�������</b></font>


			    <small><br/>
			      &#183; <a href="news/newsflash.html">������</a><br/>
			      &#183; <a href="news/press.html">������</a><br/>
			      &#183; <a href="news/index.html">������������� ...</a>
			    </small></p>
	    
			  <p><font size="+1" color="#990000"><b>���������</b></font>
			    <small><br/>
			      &#183; <a href="{$base}/doc/en_US.ISO8859-1/books/handbook/mirrors.html">��� ����� �������</a><br/>
			      &#183; <a href="releases/index.html">������</a><br/>
			      &#183; <a href="{$base}/ports/index.html">����������</a><br/>
			    </small></p>
	    
			  <p><font size="+1" color="#990000"><b>������������</b></font>
		
			    <small><br/>
			      &#183; <a href="projects/newbies.html">��� ��������</a><br/>
			      &#183; <a href="{$base}/handbook/index.html">�����������</a><br/>
			      &#183; <a href="{$base}/FAQ/index.html">FAQ</a><br/>
			      &#183; <a href="{$base}/docproj/index.html">������ ������������</a><br/>
			      &#183; <a href="docs.html">������������� ...</a><br/>
			    </small></p>
			  
			  <p><font size="+1" color="#990000"><b>���������</b></font>
	      
			    <small><br/>
			      &#183; <a href="{$base}/support.html#mailing-list">������ ��������</a><br/>
			      &#183; <a href="{$base}/support.html#newsgroups">���������������</a><br/>
			      &#183; <a href="{$base}/support.html#user">������ �������������</a><br/>
			      &#183; <a href="{$base}/support.html#web">������� Internet</a><br/>
			      &#183; <a href="security/index.html">������������</a><br/>
			      &#183; <a href="{$base}/support.html">������������� ...</a>
			    </small></p>
	      
			  <p><font size="+1" color="#990000"><b>����������</b></font>
		
			    <small><br/>
			      &#183; <a href="projects/index.html">�������</a><br/>
			      &#183; <a href="{$base}/support.html#gnats">��������� �� �������</a><br/>
			      &#183; <a href="{$base}/support.html#cvs">������ CVS</a><br/>
			    </small></p>
	      
			  <p><font size="+1" color="#990000"><b>�������������</b></font>
			    
			    <small><br/>
			      &#183; <a href="{$base}/commercial/software_bycat.html">���������</a><br/>
			      &#183; <a href="{$base}/commercial/hardware.html">����������</a><br/>
			      &#183; <a href="{$base}/commercial/consulting_bycat.html">����������</a><br/>
			      &#183; <a href="{$base}/commercial/misc.html">������</a><br/>
			    </small></p>
	      
			  <p><font size="+1" color="#990000"><b>���� ������</b></font>
		
			    <small><br/>
			      &#183; <a href="{$base}/search/index-site.html">����� �������</a><br/>
			      &#183; <a href="{$base}/search/search.html">�����</a><br/>
			      &#183; <a href="internal/index.html">������������� ...</a><br/>
			    </small></p>
	      
			  <form action="http://www.FreeBSD.org/cgi/search.cgi" method="get">
			    <small>�����:<br/>
			      <input type="text" name="words" size="10"/>
			      <input type="hidden" name="max" value="25"/>
			      <input type="hidden" name="source" value="www"/>
			      <input type="submit" value="Go"/></small>
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

	      <p>FreeBSD - ��� ������ ������������ ������� ��������� BSD UNIX
		��� ����������� ����������, ����������� � Intel ia32, DEC
		Alpha � PC-98. ����� �� ���� �� BSD UNIX, ������ UNIX
		������������� � ������������ ����������, ������.
		��� ��������������� � �������������� <a
		href="{$base}/doc/en_US.ISO8859-1/articles/contributors/index.html">�������
		�������� �������������</a>. ��������� <a
		href="{$base}/platforms/index.html">������ ��������</a>
		��������� �� ������ ������� ����������.</p>
	
	      <h2><font color="#990000">���������� �����������</font></h2>

	      <p>�������������� ����� ������� ������������, �������
		������������������, �������� ����������� ������������ �
		������������� � ������� �� - ��� �� ����������� <a
		href="{$base}/features.html">�����������</a> FreeBSD, �������
		�������� �ӣ �ݣ ����������� � ������, ���� ������ ������������,
		������������ ��������.</p>

	      <h2><font color="#990000">������ ������� ��� Internet</font></h2>
	      
	      <p>FreeBSD �������� ��������� ���������� ��� ����������
		<a href="{$base}/internet.html">Internet ��� Intranet</a>.
		��� ������� ������������� ��ģ���� ���� ��� ����� �����������
		�������� ������� ������, � ����������� ���������� �������,
		��� ��������� ������������ ���������� ����� ������� ���
		����� � ���� ����� ������������ ���������� ����������������
		�����. �������� ����
		<a href="gallery/gallery.html">�������</a>, ����� �������
		������� ������������� FreeBSD.</p>
	    
	      <h2><font color="#990000">�������� ����� �������������
		����������</font></h2>

	      <p>�������� FreeBSD ����� � ����������� ��ۣ��� � ����������������
		���������� ������������ �� ������ ��� ������� ����� �����������
		������������� ������������ ������� �������� UNIX. ��� ���������
		�������� ��� �������� ���������� <a
		href="{$base}/applications.html">����������</a> ��� � ��������
		�������, ��� � ������� �������.</p>
	    
	      <h2><font color="#990000">�������� ���������</font></h2>

	      <p>FreeBSD ����� ���� ����������� � ��������� ���������,
		������� CD-ROM, �������, ��������� �����, ������ MS-DOS, ���
		���� � ��� ���� ����������� � ����, �� �� ������ ����������
		ţ <i>���������������</i> ����� FTP ��� NFS. �ӣ, ��� ��� �����
		����� ��� ����� - ��� ���� ������ ������ ��ߣ��� 1.44�� � <a
		href="{$base}/handbook/install.html">��� ��������</a>.</p>

	      <h2><font color="#990000">FreeBSD ����������������
		<i>��������</i></font></h2>
	    
	      <a href="copyright/daemon.html"><img src="gifs/dae_up3.gif" 
						   alt=""
						   height="81" width="72" 
						   align="right" 
						   border="0"/></a>

	      <p>���� �� ������ ������������, ��� ������������ ������� � ������
		������������� ��������� �� ������� ����, FreeBSD
		���������������� <a
		href="{$base}/copyright/index.html">���������</a> �
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
		�������� <a
		href="{$base}/doc/en_US.ISO8859-1/articles/contributing/index.html">�����.</a></p>

		<p>���� ���� �� �� �����������, ���� ������ ������� ������
		FreeBSD � ��������. The FreeBSD Foundation - ��� ������������
		����������� ��� ������� ��� ������������� � �������� ������
		�� ���������� ��������. ��� ����� ��������� ����������
		������ <a href="mailto:bod@FreeBSDFoundation.org">bod@FreeBSDFoundation.org</a>
		���: The FreeBSD Foundation,
		7321 Brockway Dr.  Boulder, CO.  80303.  USA</p>

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
			<td valign="top"><p><font size="+1" color="#990000"><b>��������� �����:
			    <xsl:value-of select="$rel.current"/></b></font><br/>
			
			    <small>&#183; <a href="{$u.rel.announce}">�����</a><br/>
			      &#183; <a href="{$base}/doc/en_US.ISO8859-1/books/handbook/install.html">����������� �� �����������</a><br/>
			      &#183; <a href="{$u.rel.notes}">���������� � ������</a><br/>
			      &#183; <a href="{$u.rel.hardware}">�������������� ������������</a><br/>
			      &#183; <a href="{$u.rel.errata}">������������ ��������</a></small></p>

			  <p><font size="+1" color="#990000"><b>������� �������</b></font><br/>
			    <font size="-1">
			      ��������� ���������: 
			      <xsl:value-of
				select="descendant::month[position() = 1]/name"/>
			      <xsl:text> </xsl:text>
			      <xsl:value-of
				select="descendant::day[position() = 1]/name"/>,
			      <xsl:text> </xsl:text>
			      <xsl:value-of
				select="descendant::year[position() = 1]/name"/>
			      <br/>
			      <!-- Pull in the 10 most recent news items -->
			      <xsl:for-each select="descendant::event[position() &lt;= 10]">
				&#183;  <a>
				  <xsl:attribute name="href">
				    news/newsflash.html#<xsl:call-template name="generate-event-anchor"/>
				  </xsl:attribute>
				  <xsl:choose>
				    <xsl:when test="count(child::title)">
				      <xsl:value-of select="title"/><br/>
				    </xsl:when>
				    <xsl:otherwise>
				      <xsl:value-of select="p"/><br/>
				    </xsl:otherwise>
				  </xsl:choose>
				</a>
			      </xsl:for-each>
			      <a href="news/newsflash.html">�����...</a>
			    </font></p>
			  
			  <p><font size="+1" color="#990000"><b>FreeBSD � ������</b></font><br/>

			    <font size="-1">
			      ��������� ���������: 
			      <xsl:value-of
				select="document('news/press.xml')/descendant::month[position() = 1]/name"/>
			      <xsl:text> </xsl:text>
			      <xsl:value-of
				select="document('news/press.xml')/descendant::year[position() = 1]/name"/>
			      <br/>
			      <!-- Pull in the 10 most recent press items -->
			      <xsl:for-each select="document('news/press.xml')/descendant::story[position() &lt; 10]">
				&#183; <a>
				  <xsl:attribute name="href">
				    news/press.html#<xsl:call-template name="generate-story-anchor"/>
				  </xsl:attribute>
				  <xsl:value-of select="name"/>
				</a><br/>
			      </xsl:for-each>
			      <a href="news/press.html">�����...</a>
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
			  ������� <a href="{$base}/publish.html">����������</a>
			  ����������� FreeBSD ��� <a
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
			   src="gifs/mall_title_medium.gif" alt="[FreeBSD Mall]"
			   height="65" width="165" border="0"/></a></td>
	    
	    <td><a href="http://www.ugu.com/"><img src="gifs/ugu_icon.gif"
			   alt="[�� ���������� Unix Guru Universe]" 
			   height="64" width="76"
			   border="0"/></a></td>
	  
	    <td><a href="http://www.daemonnews.org/"><img src="gifs/darbylogo.gif"
		alt="[Daemon News]" height="45" width="130"
		border="0"/></a></td>
	  
	    <td><a href="{$base}/copyright/daemon.html"><img
			     src="gifs/powerlogo.gif" 
			     alt="[Powered by FreeBSD]"
			     height="64" 
			     width="160" 
			     border="0"/></a></td>
	  </tr>
	</table>

	<p><small>���������� �� ���-������� ���������� ���������
	  � 08:00 � 20:00 UTC.</small></p>
    
	<table width="100%" cellpadding="0" border="0" cellspacing="0">
	  <tr>
	    <td align="left" 
		valign="top"><small><a href="{$base}/mailto.html">������ 
		  ���</a><br/>
		<xsl:value-of select="$date"/></small></td>

	    <td align="right" 
		valign="top"><small><a href="copyright/index.html">Copyright</a> (c) 1995-2002
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
