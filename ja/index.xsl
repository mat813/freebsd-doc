<?xml version="1.0" encoding="EUC-JP" ?>

<!-- $FreeBSD: www/ja/index.xsl,v 1.24 2003/03/22 23:35:31 hrs Exp $ -->
<!-- Original revision: 1.56 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:import href="includes.xsl"/>
  <xsl:import href="news/includes.xsl"/>

  <xsl:variable name="base" select="'.'"/>
  <xsl:variable name="enbase" select="'..'"/>
  <xsl:variable name="date" select="'$FreeBSD: www/ja/index.xsl,v 1.24 2003/03/22 23:35:31 hrs Exp $'"/>
  <xsl:variable name="title" select="'The FreeBSD Project'"/>

  <xsl:output type="html" encoding="EUC-JP"
              doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>

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
    
	<table border="0" cellspacing="0" cellpadding="0" width="100%">
	  <tr>
	    <td><a href="http://www.FreeBSD.org/index.html">
		<img src="../gifs/freebsd_1.gif" height="94" width="306"
		     alt="FreeBSD: ���Υѥ�򤢤ʤ��Τ����" border="0"/></a></td>
	    
	    <td align="right" valign="bottom">
	      <form action="http://www.FreeBSD.org/cgi/mirror.cgi" 
		    method="get">
		
		<br/>
		
		<font color="#990000"><b>���᤯�Υ����Ф����Ӥ�������:</b></font>
		
		<br/>
	      
		<select name="goto">
		  <!--  Only list TRUE mirrrors here! Native language pages 
		        which are not mirrored should be listed in
		        support.sgml.  -->

		  <option value="http://www2.at.FreeBSD.org/">IPv6 �������ȥꥢ</option>
		  <option value="http://www.dk.FreeBSD.org/">IPv6 �ǥ�ޡ���</option>
		  <option value="http://www2.de.FreeBSD.org">IPv6 �ɥ���</option>
		  <option value="http://www.jp.FreeBSD.org/www.FreeBSD.org/">IPv6 (6Bone) ����</option>
 		  <option value="http://www2.no.FreeBSD.org/">IPv6 �Υ륦����</option>
		  <option value="http://www.ar.FreeBSD.org/">���를�����</option>
		  <option value="http://www.au.FreeBSD.org/">�������ȥ�ꥢ/1</option>
		  <option value="http://www2.au.FreeBSD.org/">�������ȥ�ꥢ/2</option>
		  <option value="http://www3.au.FreeBSD.org/">�������ȥ�ꥢ/3</option>
		  <option value="http://www4.au.FreeBSD.org/">�������ȥ�ꥢ/4</option>
		  <option value="http://www5.au.FreeBSD.org/">�������ȥ�ꥢ/5</option>
		  <option value="http://www6.au.FreeBSD.org/">�������ȥ�ꥢ/6</option>
		  <option value="http://freebsd.itworks.com.au/">�������ȥ�ꥢ/8</option>
		  <option value="http://www.at.FreeBSD.org/">�������ȥꥢ/1</option>
		  <option value="http://www2.at.FreeBSD.org/">�������ȥꥢ/2</option>
		  <option value="http://freebsd.unixtech.be/">�٥륮��</option>
		  <option value="http://www.br.FreeBSD.org/www.freebsd.org/">�֥饸��/1</option>
		  <option value="http://www2.br.FreeBSD.org/www.freebsd.org/">�֥饸��/2</option>
		  <option value="http://www3.br.FreeBSD.org/">�֥饸��/3</option>
		  <option value="http://www.bg.FreeBSD.org/">�֥륬�ꥢ</option>
		  <option value="http://www.ca.FreeBSD.org/">���ʥ�</option>
		  <!--
		  <option value="http://www2.ca.FreeBSD.org/">���ʥ�/2</option>
		  <option value="http://www3.ca.FreeBSD.org/">���ʥ�/3</option>
		  -->
		  <option value="http://www.cn.FreeBSD.org/">���</option>
		  <option value="http://www.cz.FreeBSD.org/">������</option>
		  <option value="http://www.dk.FreeBSD.org/">�ǥ�ޡ���</option>
		  <!--
		  <option value="http://www2.cz.FreeBSD.org/">������/2</option>
		  -->
		  <option value="http://www.dk.FreeBSD.org/">�ǥ�ޡ���/1</option>
		  <option value="http://www3.dk.FreeBSD.org/">�ǥ�ޡ���/3</option>
		  <option value="http://www.ee.FreeBSD.org/">�����ȥ˥�</option>
		  <option value="http://www.fi.FreeBSD.org/">�ե������</option>
		  <option value="http://www2.fi.FreeBSD.org/">�ե������/2</option>
		  <option value="http://www.fr.FreeBSD.org/">�ե��</option>
		  <option value="http://www.de.FreeBSD.org/">�ɥ���/1</option>
		  <option value="http://www1.de.FreeBSD.org/">�ɥ���/2</option>
		  <option value="http://www2.de.FreeBSD.org/">�ɥ���/3</option>
		  <option value="http://www.gr.FreeBSD.org/">���ꥷ��</option>
		  <option value="http://www.hk.FreeBSD.org/">���</option>
		  <option value="http://www.hu.FreeBSD.org/">�ϥ󥬥꡼/1</option>
		  <option value="http://www2.hu.FreeBSD.org/">�ϥ󥬥꡼/2</option>
		  <option value="http://www.is.FreeBSD.org/">����������</option>
		  <option value="http://www.ie.FreeBSD.org/">���������/1</option>
		  <option value="http://www2.ie.FreeBSD.org/">���������/2</option>
		  <option value="http://www.it.FreeBSD.org/">�����ꥢ/1</option>
		  <option value="http://www.gufi.org/mirrors/www.freebsd.org/data/">�����ꥢ/2</option>
		  <option value="http://www.jp.FreeBSD.org/www.FreeBSD.org/">����</option>
		  <option value="http://www.kr.FreeBSD.org/">�ڹ�</option>
		  <option value="http://www2.kr.FreeBSD.org/">�ڹ�/2</option>
		  <option value="http://www3.kr.FreeBSD.org/">�ڹ�/3</option>
		  <option value="http://www.lv.FreeBSD.org/">��ȥӥ�</option>
		  <option value="http://www.lt.FreeBSD.org/">��ȥ��˥�</option>
		  <option value="http://www.nl.FreeBSD.org/">������/1</option>
		  <option value="http://www2.nl.FreeBSD.org/">������/2</option>
		  <option value="http://www.nz.FreeBSD.org/">�˥塼��������</option>
		  <option value="http://www.no.FreeBSD.org/">�Υ륦����/1</option>
		  <option value="http://www2.no.FreeBSD.org/">�Υ륦����/2</option>
		  <option value="http://www.FreeBSD.org.ph/">�ե���ԥ�</option>
		  <option value="http://www2.no.FreeBSD.org/">�Υ륦����</option>
		  <option value="http://www.pl.FreeBSD.org/">�ݡ�����/1</option>
		  <option value="http://www2.pl.FreeBSD.org/">�ݡ�����/2</option>
		  <!--
		  <option value="http://www.pt.FreeBSD.org/">�ݥ�ȥ���/1</option>
		  -->
		  <option value="http://www2.pt.FreeBSD.org/">�ݥ�ȥ���/2</option>
		  <option value="http://www4.pt.FreeBSD.org/">�ݥ�ȥ���/4</option>
		  <option value="http://www.ro.FreeBSD.org/">�롼�ޥ˥�</option>
		  <option value="http://www2.ro.FreeBSD.org/">�롼�ޥ˥�/2</option>
		  <option value="http://www3.ro.FreeBSD.org/">�롼�ޥ˥�/3</option>
		  <option value="http://www4.ro.FreeBSD.org/">�롼�ޥ˥�/4</option>
		  <option value="http://www.ru.FreeBSD.org/">����/1</option>
		  <option value="http://www2.ru.FreeBSD.org/">����/2</option>
		  <option value="http://www3.ru.FreeBSD.org/">����/3</option>
		  <option value="http://www4.ru.FreeBSD.org/">����/4</option>
		  <option value="http://www.sm.FreeBSD.org/">����ޥ��</option>
		  <option value="http://www2.sg.FreeBSD.org/">���󥬥ݡ���</option>
		  <option value="http://www.sk.FreeBSD.org/">����Х���/1</option>
		  <option value="http://www2.sk.FreeBSD.org/">����Х���/2</option>
		  <option value="http://www.si.FreeBSD.org/">����٥˥�/1</option>
		  <option value="http://www2.si.FreeBSD.org/">����٥˥�/2</option>
		  <option value="http://www.es.FreeBSD.org/">���ڥ���/1</option>
		  <option value="http://www2.es.FreeBSD.org/">���ڥ���/2</option>
		  <option value="http://www3.es.FreeBSD.org/">���ڥ���/3</option>
		  <option value="http://www.za.FreeBSD.org/">��եꥫ/1</option>
		  <option value="http://www2.za.FreeBSD.org/">��եꥫ/2</option>
		  <option value="http://www.se.FreeBSD.org/">���������ǥ�/1</option>
		  <option value="http://www2.se.FreeBSD.org/">���������ǥ�/2</option>
		  <option value="http://www.ch.FreeBSD.org/">������/1</option>
		  <option value="http://www2.ch.FreeBSD.org/">������/2</option>
		  <option value="http://www.tw.FreeBSD.org/">����/1</option>
		  <option value="http://www2.tw.FreeBSD.org/">����/2</option>
		  <option value="http://www3.tw.FreeBSD.org/">����/3</option>
		  <option value="http://www4.tw.FreeBSD.org/">����/4</option>
		  <option value="http://www.tr.FreeBSD.org/">�ȥ륳/1</option>
		  <option value="http://www2.tr.FreeBSD.org/">�ȥ륳/2</option>
		  <option value="http://www.enderunix.org/freebsd/">�ȥ륳/3</option>
		  <option value="http://www.ua.FreeBSD.org/">�����饤��/1</option>
		  <option value="http://www2.ua.FreeBSD.org/">�����饤��/2</option> 
		  <option value="http://www4.ua.FreeBSD.org/">�����饤��/����ߥ�</option> 
		  <option value="http://www5.ua.FreeBSD.org/">�����饤��/5</option> 
		  <option value="http://www.uk.FreeBSD.org/">�����ꥹ/1</option>
		  <option value="http://www2.uk.FreeBSD.org/">�����ꥹ/2</option>
		  <option value="http://www3.uk.FreeBSD.org/">�����ꥹ/3</option>
		  <option value="http://www4.uk.FreeBSD.org/">�����ꥹ/4</option>
		  <option value="http://www.FreeBSD.org/">����ꥫ/����ե���˥�</option>
		  <option value="http://www3.FreeBSD.org/">����ꥫ/3</option>
		  <option value="http://www7.FreeBSD.org/">����ꥫ/7</option>
		</select>
		
		<input type="submit" value=" Go "/>
		
		<br/>
		
		<font color="#990000"><b>����: </b></font> 
		<a href="../">�Ѹ�</a>��
		<a href="../it/index.html">�����ꥢ��</a>��
		<a href="../ru/index.html">������</a>��
		<a href="../es/index.html">���ڥ����</a>��
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
			      ��<a href="{$enbase}/doc/ja_JP.eucJP/books/handbook/mirrors.html">FreeBSD ���������</a><br/>
			      ��<a href="releases/index.html">��꡼������</a><br/>
			      ��<a href="{$base}/ports/index.html">Ports Collection</a><br/>
			    </small></p>
	    
			  <p><font size="+1" color="#990000"><b>�ɥ������</b></font>
		
			    <small><br/>
			      ��<a href="projects/newbies.html">�鿴�ԤΤ����</a><br/>
			      ��<a href="{$enbase}/doc/ja_JP.eucJP/books/handbook/index.html">�ϥ�ɥ֥å�</a><br/>
			      ��<a href="{$enbase}/doc/ja_JP.eucJP/books/faq/index.html">FAQ</a><br/>
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

			  <p><font size="+1" color="#990000"><b>�㳲���</b></font>
			    <small><br/>
			      ��<a href="send-pr.html">�㳲��������</a><br/>
			      ��<a href="http://www.FreeBSD.org/cgi/query-pr-summary.cgi">̤�������α���</a><br/>
			      ��<a href="http://www.FreeBSD.org/cgi/query-pr.cgi">�㳲 ID �Ǹ�������</a><br/>
			      ��<a href="{$base}/support.html#gnats">�����...</a><br/>
			    </small></p>

	      
			  <p><font size="+1" color="#990000"><b>��ȯ</b></font>
		
			    <small><br/>
			      ��<a href="projects/index.html">�ץ�������</a><br/>
			      ��<a href="../releng/index.html">Release Engineering</a><br/>
			      ��<a href="{$base}/support.html#cvs">CVS ��ݥ��ȥ�</a><br/>
			    </small></p>
	      
			  <p><font size="+1" color="#990000"><b>�٥��</b></font>
			    
			    <small><br/>
			      ��<a href="{$base}/../commercial/software_bycat.html">���եȥ�����</a><br/>
			      ��<a href="{$base}/../commercial/hardware.html">�ϡ��ɥ�����</a><br/>
			      ��<a href="{$base}/../commercial/consulting_bycat.html">���󥵥�ƥ���</a><br/>
			      ��<a href="{$base}/../commercial/misc.html">����¾</a><br/>
			    </small></p>

			  <p><font size="+1" color="#990000"><b>���ա���£</b></font>
			    <small><br/>
			      ��<a href="{$enbase}/donations/index.html">���ա���£�ʤμ���</a><br/>
			      ��<a href="{$enbase}/donations/donors.html">���ߤδ�£��</a><br/>
			      ��<a href="{$enbase}/donations/wantlist.html">�����罸�ꥹ��</a><br/>
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
	      
	      <h2><font color="#990000">FreeBSD �Ȥ�?</font></h2>
	
	      <p>FreeBSD �� x86 �ߴ�����DEC Alpha��IA-64��PC-98
		�������ƥ������Ѥ����Ū�ʥ��ڥ졼�ƥ��󥰥����ƥ�Ǥ���
		����ե���˥���إС����쥤���ǳ�ȯ���줿 UNIX
		�Ǥ��� BSD UNIX ��ͳ�褷��
		<a href="{$enbase}/doc/ja_JP.eucJP/articles/contributors/index.html">¿���οͤ���</a>
		�ˤ�ä��ݼ顦��ȯ����Ƥ��ޤ���
		����¾��<a href="{$base}/platforms/index.html">�ץ�åȥե�����
		</a> �ϸ��߳�ȯ��Ǥ���</p>
	      
	      <h2><font color="#990000">����ü�ε�ǽ</font></h2>

	      <p>FreeBSD �� (���Τκ��ɤΤ�Τ�ޤ��) ¾�Υ��ڥ졼�ƥ���
		�����ƥ��̤���˷礱�Ƥ������ü�Υͥåȥ�����ѥե����ޥ󥹡�
		�������ƥ����ߴ����Ȥ��ä� <a href="{$base}/features.html">
		  ��ǽ</a> �򺣡��󶡤��Ƥ��ޤ���</p>
	      
	      <h2><font color="#990000">���Ϥʥ��󥿡��ͥåȥ��ݡ���</font></h2>

	      <p>FreeBSD ������Ū�� <a href="{$base}/internet.html">
		  ���󥿡��ͥåȤ䥤��ȥ�ͥå�</a> �����Фˤʤ�ޤ�����٤�
		�ˤ�ƹ⤯�ʤä����֤Ǥ������Ǥʥͥåȥ�������ӥ����󶡤���
		�桼���ץ�����Ʊ���˲���ˤʤäƤ��ɹ���ȿ�����֤�
		�ݻ�����褦�˥�����ΨŪ�����Ѥ��ޤ���
		FreeBSD �����Ѥ������ץꥱ�������䥵���ӥ������
		�ܤ��Ƥ��ޤ��Τǡ����Ҥ錄��������
		<a href="gallery/gallery.html">�����꡼</a>
		�����ˤʤäƤߤƤ���������</p>
	    
	      <h2><font color="#990000">��¿�����б����ץꥱ�������</font></h2>

	      <p>�⤤�ʼ������ FreeBSD �ȡ�����������ʤǹ�®��
                PC �ϡ��ɥ��������Ȥ߹�碌�ϡ�
                ���Τ� UNIX ������ơ�������ɤŨ���롢
                ���˷к�Ū�������ˤʤ�Ǥ��礦��
                �ǥ����ȥå��ѡ��������Ѥ�ξ���ˤĤ��ơ�����ʿ���
		<a href="{$base}/applications.html">���ץꥱ�������</a>
		���Ѱդ���Ƥ��ޤ���</p>
	    
	      <h2><font color="#990000">��ñ���󥹥ȡ���</font></h2>

	      <p>FreeBSD �� CD-ROM �� DVD-ROM���ե�åԡ��ǥ������������ơ��ס�MS-DOS
		�ѡ��ƥ������ʤɤΤ��ޤ��ޤʥ�ǥ������饤�󥹥ȡ��뤹�뤳�Ȥ�
		�Ǥ��ޤ����ͥåȥ������³���Ƥ���ʤ顢anonymous FTP �� NFS
		���Ѥ��� <i>ľ��</i> ���󥹥ȡ��뤹�뤳�Ȥ�Ǥ��ޤ���
		ɬ�פʤΤ� 1.44MB �ε�ư�ե�åԡ� 2 ��ȡ�
		<a href="{$enbase}/doc/ja_JP.eucJP/books/handbook/install.html">��������ˡ</a>
		�����Ǥ���</p>

	      <h2><font color="#990000"><i>̵��</i>�ǻȤ��� FreeBSD</font></h2>
	    
	      <a href="copyright/daemon.html"><img src="../gifs/dae_up3.gif" 
						   alt=""
						   height="81" width="72" 
						   align="right" 
						   border="0"/></a>

	      <p>���Τ褦���ÿ�����ä����ڥ졼�ƥ��󥰥����ƥ�Ϲ⤤���ʤ�
		���䤵��Ƥ���Ȼפ��뤫�⤷��ޤ��󤬡�FreeBSD
		�� <a href="{$base}/copyright/index.html">̵��</a> ������Ǥ���
		���٤ƤΥ����������ɤ���°���Ƥ��ޤ���
		��Ƥߤ褦���ʡ��Ȥ�������
		<a href="{$enbase}/doc/ja_JP.eucJP/books/handbook/mirrors.html">
		  ���ܤ�������</a> ��
		��������������</p>

	      <h2><font color="#990000">FreeBSD �ؤι׸�</font></h2>

	      <p>FreeBSD �˹׸�����Τϴ�ñ�Ǥ���
		���ʤ��� FreeBSD ����ǲ����Ǥ���������ʬ��õ����
		������ʬ���ѹ��� (��տ������狼��䤹��) �ä���
		FreeBSD �ץ������Ȥ��Ϥ�������Ǥ���
		���κݤˤ� send-pr ��Ȥ�����
		�⤷�ΤäƤ���ʤ顢���ߥå�����ľ��Ϣ���Ƥ� OK �Ǥ���
		�ѹ��ϡ�FreeBSD ��ʸ����Ф����ΤǤ⡢FreeBSD
		�����������ɤ��Ф����ΤǤ⹽���ޤ���
		�ܤ����ϡ�FreeBSD �ϥ�ɥ֥å���
		<a href="{$enbase}/doc/ja_JP.eucJP/articles/contributing/index.html">
		  FreeBSD �ؤι׸�</a>
		(<a href="{$enbase}/doc/en_US.ISO8859-1/articles/contributing/index.html">��ʸ</a>)
		�Ȥ�������������������������</p>

	      <p>�⤷���ʤ����ץ���ޤǤʤ��Ȥ��Ƥ⡢�����Ĥ�� FreeBSD
		�˹׸�������ˡ������ޤ���FreeBSD Foundation �����������
		�Ǥ��ꡢľ�ܤδ��դ��Ƕ�ι����оݤȤʤ�ޤ���
		�ܺ٤˴ؤ��Ƥ� <a href="mailto:bod@FreeBSDFoundation.org">
		  bod@FreeBSDFoundation.org</a> �˥᡼������뤫��
		The FreeBSD Foundation��
		7321 Brockway Dr. Boulder, CO 80303.  USA
		�ޤǼ���񤤤Ƥ���������</p>

	      <p>Silicon Breeze �Ҥ� BSD �ǡ�����Ƽ���������
		���������夲�� 15% �� FreeBSD Foundation �˴Ը����Ƥ��ޤ���
		���� BSD �ǡ����ξܺ٤���ʸ��ˡ�ˤĤ��Ƥ�
		<a href="http://www.linuxjewellery.com/beastie/">���Υڡ���</a>
		�򸫤Ƥ���������</p>
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
			<td valign="top"><p><font size="+1" color="#990000"><b>�ƥ��Υ���꡼��:
			    <xsl:value-of select="$rel.current"/></b></font><br/>
			
			    <small>��<a href="{$u.rel.announce}">���ʥ���</a><br/>
			      ��<a href="{$enbase}/doc/ja_JP.eucJP/books/handbook/install.html">���󥹥ȡ��륬����</a><br/>
			      ��<a href="{$u.rel.notes}">��꡼���Ρ���</a><br/>
			      ��<a href="{$u.rel.hardware}">�ϡ��ɥ������Ρ���</a><br/>
			      ��<a href="{$u.rel.errata}">Errata</a><br/>
			      ��<a href="{$u.rel.early}">������ѼԤΤ���μ����</a></small></p>

			<p><font size="+1" color="#990000"><b>�ץ����������꡼��:
			    <xsl:value-of select="$rel2.current"/></b></font><br/>
			
			    <small>��<a href="{$u.rel2.announce}">���ʥ���</a><br/>
			      ��<a href="{$enbase}/doc/ja_JP.eucJP/books/handbook/install.html">���󥹥ȡ��륬����</a><br/>
			      ��<a href="{$u.rel2.notes}">��꡼���Ρ���</a><br/>
			      ��<a href="{$u.rel2.hardware}">�ϡ��ɥ������ꥹ�� (�Ѹ�)</a><br/>
			      ��<a href="{$u.rel2.errata}">Errata</a></small></p>

			  <p><font size="+1" color="#990000"><b>Project News</b></font><br/>
			    <font size="-1">
			      �ǽ�����: 
			      <xsl:value-of
				select="format-number(number(descendant::year[position() = 1]/name),'0000')"/>
			      <xsl:text>/</xsl:text>
			      <xsl:value-of
				select="format-number(number(descendant::month[position() = 1]/name),'00')"/>
			      <xsl:text>/</xsl:text>
			      <xsl:value-of
				select="format-number(number(descendant::day[position() = 1]/name),'00')"/>:
			      <br/>
			      <!-- Pull in the 10 most recent news items -->
			      <xsl:for-each select="descendant::event[position() &lt;= 10]">
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
			      <a href="news/newsflash.html">More...</a>
			    </font></p>
			  
			  <p><font size="+1" color="#990000"><b>FreeBSD Press</b></font><br/>

			    <font size="-1">
			      �ǽ�����: 
			      <xsl:value-of
				select="format-number(number(document('news/press.xml')/descendant::year[position() = 1]/name),'0000')"/>
			      <xsl:text>/</xsl:text>
			      <xsl:value-of
				select="format-number(number(document('news/press.xml')/descendant::month[position() = 1]/name),'00')"/>:
			      <br/>
			      <!-- Pull in the 10 most recent press items -->
			      <xsl:for-each select="document('news/press.xml')/descendant::story[position() &lt; 10]">
				�� <a>
				  <xsl:attribute name="href">
				    news/press.html#<xsl:call-template name="generate-story-anchor"/>
				  </xsl:attribute>
				  <xsl:value-of select="name"/>
				</a><br/>
			      </xsl:for-each>
			      <a href="news/press.html">More...</a>
			    </font>
                          </p>

                          <p><font size="+1" color="#990000"><b>�������ƥ�����</b></font><br/>

			    <font size="-1">
			      �ǽ�����:
			      <xsl:value-of
				select="document('../en/security/advisories.xml')/descendant::month[position() = 1]/name"/>
			      <xsl:text> </xsl:text>
			      <xsl:value-of
				select="document('../en/security/advisories.xml')/descendant::day[position() = 1]/name"/>
			      <xsl:text>, </xsl:text>
			      <xsl:value-of
				select="document('../en/security/advisories.xml')/descendant::year[position() = 1]/name"/>
			      <br/>
			      <!-- Pull in the 10 most recent security advisories -->
			      <xsl:for-each select="document('../en/security/advisories.xml')/descendant::advisory[position() &lt; 10]">
				�� <a>
				  <xsl:attribute name="href">ftp://ftp.freebsd.org/pub/FreeBSD/CERT/advisories/<xsl:value-of select="name"/>.asc</xsl:attribute>
				  <xsl:value-of select="name"/>
				</a><br/>
			      </xsl:for-each>
			      <a href="security/">More...</a>
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
			<td>FreeBSD �ˤĤ��Ƥ�äȤ褯�Τꤿ���ʤä��顢
			  FreeBSD �˴�Ϣ����
			  <a href="{$base}/publish.html">����ʪ</a> ��
			  <a href="news/press.html">FreeBSD �ط�����ƻ</a> ��
			  �����꡼��ˬ�ͤ��ꡢ���Υ����֥����Ȥ�
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

	<p><small>���Υ����֥����Ȥ����� 8:00 UTC �� 20:00 UTC �˹������Ƥ��ޤ���
	  </small></p>
    
	<table width="100%" cellpadding="0" border="0" cellspacing="0">
	  <tr>
	    <td align="left" 
		valign="top"><small><a href="{$base}/mailto.html">���䤤��碌��</a> : <a href="jabout.html">���ܸ첽�ˤĤ���</a><br/>
		<xsl:value-of select="$date"/></small></td>

	    <td align="right" 
		valign="top"><small><a href="copyright/index.html">Copyright</a> (c) 1995-2003
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
