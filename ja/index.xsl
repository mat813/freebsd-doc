<?xml version="1.0" encoding="EUC-JP" ?>

<!-- $FreeBSD: www/ja/index.xsl,v 1.2 2001/08/08 03:55:55 kuriyama Exp $ -->
<!-- Original revision: 1.3 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:import href="includes.xsl"/>
  <xsl:import href="news/includes.xsl"/>

  <xsl:variable name="base" select="'.'"/>
  <xsl:variable name="date" select="'$FreeBSD: www/ja/index.xsl,v 1.2 2001/08/08 03:55:55 kuriyama Exp $'"/>
  <xsl:variable name="title" select="'The FreeBSD Project'"/>

  <xsl:output type="html" encoding="EUC-JP"/>

  <xsl:template match="/">
    <html>
      <head>
	<title><xsl:value-of select="$title"/></title>
    
	<meta name="description" content="The FreeBSD Project"/>
    
	<meta name="keywords" content="FreeBSD, BSD, UNIX, Support, Gallery,
	      Release, Application, Software, Handbook, FAQ, Tutorials, Bugs, 
	      CVS, CVSup, News, Commercial Vendors, homepage, CTM, Unix"/>
      </head>
  
      <body bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#840084"
	    alink="#0000FF">
    
	<table border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td><a href="http://www.FreeBSD.org/index.html">
		<img src="../gifs/freebsd_1.gif" height="94" width="306"
		     alt="FreeBSD: ���Υѥ�򤢤ʤ��Τ����" border="0"/></a></td>
	    
	    <td align="right" valign="bottom" width="300">
	      <form action="http://www.FreeBSD.org/cgi/mirror.cgi" 
		    method="GET">
		
		<br/>
		
		<font color="#990000"><b>���᤯�Υ����Ф����Ӥ�������:</b></font>
		
		<br/>
	      
		<select name="goto">
		  <!--  Only list TRUE mirrrors here! Native language pages 
		        which are not mirrored should be listed in
		        support.sgml.  -->

		  <option value="http://www.jp.FreeBSD.org/www.FreeBSD.org/">6Bone(IPv6)</option>
		  <option value="http://www.au.FreeBSD.org/">�������ȥ�ꥢ/1</option>
		  <option value="http://www.br.FreeBSD.org/www.freebsd.org/">�֥饸��/1</option>
		  <option value="http://www2.br.FreeBSD.org/www.freebsd.org/">�֥饸��/2</option>
		  <option value="http://www3.br.FreeBSD.org/">�֥饸��/3</option>
		  <option value="http://www.bg.FreeBSD.org/">�֥륬�ꥢ</option>
		  <option value="http://www.ca.FreeBSD.org/">���ʥ�/1</option>
		  <option value="http://www.cn.FreeBSD.org/">���</option>
		  <option value="http://www.cz.FreeBSD.org/">������</option>
		  <option value="http://www.dk.FreeBSD.org/">�ǥ�ޡ���</option>
		  <option value="http://www.ee.FreeBSD.org/">�����ȥ˥�</option>
		  <option value="http://www.fi.FreeBSD.org/">�ե������</option>
		  <option value="http://www.fr.FreeBSD.org/">�ե��</option>
		  <option value="http://www.de.FreeBSD.org/">�ɥ���/1</option>
		  <option value="http://www1.de.FreeBSD.org/">�ɥ���/2</option>
		  <option value="http://www2.de.FreeBSD.org/">�ɥ���/3</option>
		  <option value="http://www.gr.FreeBSD.org/">���ꥷ��</option>
		  <option value="http://www.hu.FreeBSD.org/">�ϥ󥬥꡼</option>
		  <option value="http://www.ie.FreeBSD.org/">���������</option>
		  <option value="http://www.it.FreeBSD.org/">�����ꥢ/1</option>
		  <option value="http://www.gufi.org/mirrors/www.freebsd.org/data/">�����ꥢ/2</option>
		  <option value="http://www.jp.FreeBSD.org/www.FreeBSD.org/">����</option>
		  <option value="http://www.kr.FreeBSD.org/">�ڹ�</option>
		  <option value="http://www2.kr.FreeBSD.org/">�ڹ�/2</option>
		  <option value="http://www.lv.FreeBSD.org/">��ȥӥ�</option>
		  <option value="http://www.nl.FreeBSD.org/">������</option>
		  <option value="http://www2.nl.FreeBSD.org/">������/2</option>
		  <option value="http://www.nz.FreeBSD.org/">�˥塼��������</option>
		  <option value="http://www.no.FreeBSD.org/">�Υ륦����</option>
		  <option value="http://www.pl.FreeBSD.org/">�ݡ�����/1</option>
		  <option value="http://www2.pl.FreeBSD.org/">�ݡ�����/2</option>
		  <option value="http://www.pt.FreeBSD.org/">�ݥ�ȥ���/1</option>
		  <option value="http://www2.pt.FreeBSD.org/">�ݥ�ȥ���/2</option>
		  <option value="http://www.ro.FreeBSD.org/">�롼�ޥ˥�</option>
		  <option value="http://www.ru.FreeBSD.org/">����/1</option>
		  <option value="http://www2.ru.FreeBSD.org/">����/2</option>
		  <option value="http://www3.ru.FreeBSD.org/">����/3</option>
		  <option value="http://www4.ru.FreeBSD.org/">����/4</option>
		  <option value="http://www.sg.FreeBSD.org/">���󥬥ݡ���</option>
		  <option value="http://www.sk.FreeBSD.org/">����Х���</option>
		  <option value="http://www.si.FreeBSD.org/">����٥˥�</option>
		  <option value="http://www.es.FreeBSD.org/">���ڥ���</option>
		  <option value="http://www.za.FreeBSD.org/">��եꥫ/1</option>
		  <option value="http://www2.za.FreeBSD.org/">��եꥫ/2</option>
		  <option value="http://www.se.FreeBSD.org/">���������ǥ�</option>
		  <option value="http://www.ch.FreeBSD.org/">������</option>
		  <option value="http://www.tw.FreeBSD.org/www.freebsd.org/data/">����</option>
		  <option value="http://www.tr.FreeBSD.org/">�ȥ륳</option>
		  <option value="http://www.enderunix.org/freebsd/">�ȥ륳/2</option>
		  <option value="http://www.ua.FreeBSD.org/">�����饤��/1</option>
		  <option value="http://www2.ua.FreeBSD.org/">�����饤��/2</option> 
		  <option value="http://www4.ua.FreeBSD.org/">�����饤��/����ߥ�</option> 
		  <option value="http://www.uk.FreeBSD.org/">�����ꥹ/1</option>
		  <option value="http://www2.uk.FreeBSD.org/">�����ꥹ/2</option>
		  <option value="http://www3.uk.FreeBSD.org/">�����ꥹ/3</option>
		  <option value="http://www.FreeBSD.org/">����ꥫ/����ե���˥�</option>
		</select>
		
		<input type="submit" value=" Go "/>
		
		<br/>
		
		<font color="#990000"><b>����: </b></font> 
		<a href="../">�Ѹ�</a>, 
		<a href="../es/index.html">���ڥ����</a>, 
		<a href="../ru/index.html">������</a>, 
		<a href="support.html#web">����¾</a>
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
			  <p><font size="+1" color="#990000"><b>�˥塼��</b></font>

	      
			    <small><br/>
			      ��<a href="news/newsflash.html">���ʥ���</a><br/>
			      ��<a href="news/press.html">��ƻ</a><br/>
			      ��<a href="news/index.html">����� ...</a>
			    </small></p>
	    
			  <p><font size="+1" color="#990000"><b>���եȥ�����</b></font>
			    <small><br/>
			      ��<a href="{$base}/handbook/mirrors.html">FreeBSD ���������</a><br/>
			      ��<a href="releases/index.html">��꡼������</a><br/>
			      ��<a href="{$base}/ports/index.html">Ports Collection</a><br/>
			    </small></p>
	    
			  <p><font size="+1" color="#990000"><b>�ɥ������</b></font>
		
			    <small><br/>
			      ��<a href="projects/newbies.html">�鿴�ԤΤ����</a><br/>
			      ��<a href="{$base}/handbook/index.html">�ϥ�ɥ֥å�</a><br/>
			      ��<a href="{$base}/FAQ/index.html">FAQ</a><br/>
			      ��<a href="{$base}/docproj/index.html">Doc. Project</a><br/>
			      ��<a href="docs.html">�����...</a><br/>
			    </small></p>
			  
			  <p><font size="+1" color="#990000"><b>���ݡ���</b></font>
	      
			    <small><br/>
			      ��<a href="{$base}/support.html#mailing-list">�᡼��󥰥ꥹ��</a><br/>
			      ��<a href="{$base}/support.html#newsgroups">�˥塼�����롼��</a><br/>
			      ��<a href="{$base}/support.html#user">�桼�����롼��</a><br/>
			      ��<a href="{$base}/support.html#web">Web ��λ���</a><br/>
			      ��<a href="security/index.html">�������ƥ�</a><br/>
			      ��<a href="{$base}/support.html">�����...</a>
			    </small></p>
	      
			  <p><font size="+1" color="#990000"><b>��ȯ</b></font>
		
			    <small><br/>
			      ��<a href="projects/index.html">�ץ�������</a><br/>
			      ��<a href="{$base}/support.html#gnats">�Х���ݡ���</a><br/>
			      ��<a href="{$base}/support.html#cvs">CVS ��ݥ��ȥ�</a><br/>
			    </small></p>
	      
			  <p><font size="+1" color="#990000"><b>�٥��</b></font>
			    
			    <small><br/>
			      ��<a href="{$base}/commercial/software_bycat.html">���եȥ�����</a><br/>
			      ��<a href="{$base}/commercial/hardware.html">�ϡ��ɥ�����</a><br/>
			      ��<a href="{$base}/commercial/consulting_bycat.html">���󥵥�ƥ���</a><br/>
			      ��<a href="{$base}/commercial/misc.html">����¾</a><br/>
			    </small></p>
	      
			  <p><font size="+1" color="#990000"><b>���Υ����ȤˤĤ���</b></font>
		
			    <small><br/>
			      ��<a href="{$base}/search/index-site.html">�����ȥޥå�</a><br/>
			      ��<a href="{$base}/search/search.html">����</a><br/>
			      ��<a href="internal/index.html">�����...</a><br/>
			    </small></p>
	      
			  <form action="http://www.FreeBSD.org/cgi/search.cgi" method="get">
			    <small>����:<br/>
			      <input type="text" name="words" size="10"/>
			      <input type="hidden" name="max" value="25"/>
			      <input type="hidden" name="source" value="www"/>
			      <input type="submit" value="�¹�"/></small>
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
	      <!-- Security alert -->
	      <table border="0" cellspacing="1" cellpadding="4"
		     bgcolor="#990000" width="100%">
		<tr>
		  <td>
		    <table bgcolor="#FFFFFF" width="100%"
			   cellpadding="4" cellspacing="0" border="0">
		      <tr>
			<td>
			  <h2 align="center">����</h2>
			  
			  <p>
			    2001 ǯ 7 �� 23 �������� FreeBSD �ˤ�,
			    ��⡼�Ȥ���αƶ�������륻�����ƥ���������
			    �ޤ� telnet �ǡ���󤬴ޤޤ�Ƥ��ޤ�.
			    �ܺ٤�
			    <a href="ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-01:49.telnetd.v1.1.asc">�������ƥ�����</a>
			    ����������.</p>
			</td>
		      </tr>
		    </table>
		  </td>
		</tr>
	      </table>
	      
	      <h2><font color="#990000">FreeBSD �Ȥ�?</font></h2>
	
	      <p>FreeBSD �� Intel �ߴ��� (x86), DEC Alpha, PC-98
		�������ƥ������Ѥ����Ū�� BSD UNIX
		���ڥ졼�ƥ��󥰥����ƥ�Ǥ���,
		<a href="{$base}/handbook/staff.html">¿���οͤ���</a> �ˤ�ä�
		�ˤ�ä��ݼ顦��ȯ����Ƥ��ޤ�.
		����¾��<a href="{$base}/platforms/index.html">�ץ�åȥե�����
		</a> �ϸ��߳�ȯ��Ǥ�.</p>
	      
	      <h2><font color="#990000">����ü�ε�ǽ</font></h2>

	      <p>FreeBSD �� (���Τκ��ɤΤ�Τ�ޤ��) ¾�Υ��ڥ졼�ƥ���
		�����ƥ��̤���˷礱�Ƥ������ü�Υͥåȥ��, �ѥե����ޥ�,
		�������ƥ�, �ߴ����Ȥ��ä� <a href="{$base}/features.html">
		  ��ǽ</a> ��, �󶡤��Ƥ��ޤ�.</p>
	      
	      <h2><font color="#990000">���Ϥʥ��󥿡��ͥåȥ��ݡ���</font></h2>

	      <p>FreeBSD ������Ū�� <a href="{$base}/internet.html">
		  ���󥿡��ͥåȤ䥤��ȥ�ͥå�</a> �����Фˤʤ�ޤ�. ��٤�
		�ˤ�ƹ⤯�ʤä����֤Ǥ������Ǥʥͥåȥ�������ӥ����󶡤�,
		�桼���ץ�����Ʊ���˲�ɴ, ����ˤʤäƤ��ɹ���ȿ�����֤�
		�ݻ�����褦�˥�����ΨŪ�����Ѥ��ޤ�.
		FreeBSD �����Ѥ������ץꥱ�������䥵���ӥ������
		�ܤ��Ƥ��ޤ��Τ�, ���Ҳ桹��
		<a href="gallery/gallery.html">�����꡼</a>
		��ˬ��ƤߤƤ�������.</p>
	    
	      <h2><font color="#990000">���Ѳ�ǽ��, ���ޤ��ޤʥ��ץꥱ�������
		</font></h2>

	      <p>FreeBSD ���ʼ��Ⱥ���������ʤǹ�®�� PC �ϡ��ɥ�������
		��ӤĤ����Ȥˤ�ä�, FreeBSD �ϻ��Τ� UNIX ������ơ�������
		��Ӥ��ƤȤƤ�к�Ū�������Ȥʤ�ޤ�.
		���˿�¿���Υǥ����ȥå��Ѥ䥵�����Ѥ�
		<a href="{$base}/applications.html">���ץꥱ�������</a>
		�����äƤ��ޤ�.</p>
	    
	      <h2><font color="#990000">��ñ���󥹥ȡ���</font></h2>

	      <p>FreeBSD �� CD-ROM ��ե�åԡ��ǥ�����, �����ơ���, MS-DOS
		�ѡ��ƥ������ʤɤΤ��ޤ��ޤʥ�ǥ������饤�󥹥ȡ��뤹�뤳�Ȥ�
		�Ǥ��ޤ�. �ͥåȥ������³���Ƥ���ʤ�, anonymous FTP �� NFS
		���Ѥ��� <i>ľ��</i> ���󥹥ȡ��뤹�뤳�Ȥ�Ǥ��ޤ�.
		ɬ�פʤΤ� 1.44MB �ε�ư�ե�åԡ� 2 ���,
		<a href="{$base}/handbook/install.html">��������ˡ</a>
		�����Ǥ�.</p>

	      <h2><font color="#990000">FreeBSD ��<i>̵��</i>�Ǥ�</font></h2>
	    
	      <a href="copyright/daemon.html"><img src="../gifs/dae_up3.gif" 
						   alt=""
						   height="81" width="72" 
						   align="right" 
						   border="0"/></a>

	      <p>���Τ褦���ÿ�����ä����ڥ졼�ƥ��󥰥����ƥ�Ϲ⤤���ʤ�
		���䤵��Ƥ���Ȼפ��뤫�⤷��ޤ���, FreeBSD
		�� <a href="{$base}/copyright/index.html">̵��</a> ������Ǥ�,
		���٤ƤΥ����������ɤ���°���Ƥ��ޤ�.
		��Ƥߤ褦����, �Ȥ�������
		<a href="{$base}/handbook/mirrors.html">
		  ���ܤ�������</a> ��
		������������.</p>

	      <h2><font color="#990000">FreeBSD �ؤι׸�</font></h2>

	      <p>FreeBSD �˹׸�����Τϴ�ñ�Ǥ�.
		���ʤ��� FreeBSD ����ǲ����Ǥ���������ʬ��õ��,
		������ʬ���ѹ��� (��տ���, �狼��䤹��) �ä���
		FreeBSD �ץ������Ȥ��Ϥ�������Ǥ�.
		���κݤˤ� send-pr ��Ȥ���,
		�⤷�ΤäƤ���ʤ�, ���ߥå�����ľ��Ϣ���Ƥ� OK �Ǥ�.
		�ѹ���, FreeBSD ��ʸ����Ф����ΤǤ�, FreeBSD
		�����������ɤ��Ф����ΤǤ⹽���ޤ���.
		�ܤ�����, FreeBSD �ϥ�ɥ֥å���
		<a href="http://www.FreeBSD.org/ja/handbook/contrib.html">
		  FreeBSD �ؤι׸�</a>
		(<a href="http://www.FreeBSD.org/handbook/contrib.html">��ʸ</a>)
		�Ȥ�����������������������.</p>
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
			<td valign="top"><p><font size="+1" color="#990000"><b>�ǿ���꡼��:
			    <xsl:value-of select="$rel.current"/></b></font><br/>
			
			    <small>��<a href="{$u.rel.announce}">���ʥ���</a><br/>
			      ��<a href="{$base}/handbook/install.html">���󥹥ȡ��륬����</a><br/>
			      ��<a href="{$u.rel.notes}">��꡼���Ρ���</a><br/>
			      ��<a href="{$u.rel.errata}">Errata</a></small></p>

			  <p><font size="+1" color="#990000"><b>�ǿ��˥塼��</b></font><br/>
			  <font size="-1">
			    <!-- Code to pull in the most recent four news
			         items -->
			    <xsl:for-each select="descendant::event[position() &lt;= 20]">
			      �� <a>
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
			  </font></p>
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
			<td>FreeBSD �ˤĤ��Ƥ�äȤ褯�Τꤿ���ʤä���,
			  FreeBSD �˴�Ϣ����
			  <a href="{$base}/publish.html">����ʪ</a> ��
			  <a href="news/press.html">FreeBSD �ط�����ƻ</a> ��
			  �����꡼��ˬ�ͤ���, ���Υ����֥����Ȥ�
			  ���ƤߤƤ�������!</td>
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
						   alt="[Sponsor of Unix Guru Universe]" 
						   height="64" width="76"
						   border="0"/></a></td>
	  
	    <td><a href="http://www.daemonnews.org/"><img src="../gifs/darbylogo.gif"
		alt="[Daemon News]" height="45" width="130"
		border="0"/></a></td>
	  
	    <td><a href="{$base}/copyright/daemon.html"><img
							     src="../gifs/powerlogo.gif" 
							     alt="[Powered by FreeBSD]"
							     height="64" 
							     width="160" 
							     border="0"/></a></td>
	  </tr>
	</table>

	<p><small>���Υ����֥����Ȥ����� 8:00 UTC �� 20:00 UTC �˹������Ƥ��ޤ�.
	  </small></p>
    
	<table width="100%" cellpadding="0" border="0" cellspacing="0">
	  <tr>
	    <td align="left" 
		valign="top"><small><a href="{$base}/mailto.html">���䤤��碌��</a> : <a href="jabout.html">���ܸ첽�ˤĤ���</a><br/>
		<xsl:value-of select="$date"/></small></td>

	    <td align="right" 
		valign="top"><small><a href="copyright/index.html">Copyright</a> (c) 1995-2001
		The FreeBSD Project.<br/>
		All rights reserved.</small></td>
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
