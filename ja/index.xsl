<?xml version="1.0" encoding="EUC-JP" ?>

<!-- $FreeBSD: www/ja/index.xsl,v 1.38 2004/12/09 19:48:57 rushani Exp $ -->
<!-- Original revision: 1.100 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:import href="includes.xsl"/>
  <xsl:import href="news/includes.xsl"/>

  <xsl:variable name="base" select="'.'"/>
  <xsl:variable name="enbase" select="'..'"/>
  <xsl:variable name="date" select="'$FreeBSD: www/ja/index.xsl,v 1.38 2004/12/09 19:48:57 rushani Exp $'"/>
  <xsl:variable name="title" select="'The FreeBSD Project'"/>

  <!-- these params should be externally bound. The values
       here are not used actually -->
  <xsl:param name="advisories.xml" select="'none'"/>
  <xsl:param name="notices.xml" select="'none'"/>
  <xsl:param name="mirrors.xml" select="'none'"/>
  <xsl:param name="news.press.xml-master" select="'none'"/>
  <xsl:param name="news.press.xml" select="'none'"/>
  <xsl:param name="news.project.xml-master" select="'none'"/>
  <xsl:param name="news.project.xml" select="'none'"/>

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
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
	<link rel="icon" href="/favicon.ico" type="image/x-icon"/>
	<!-- Formatted to be easy to spam harvest, please do not reformat. -->
	<xsl:comment>
	  Spamtrap, do not email:
	  &lt;a href="mailto:bruscar@freebsd.org"&gt;bruscar@freebsd.org&lt;/a&gt;
	</xsl:comment>
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
		  <!--  Only list TRUE mirrors here! Native language pages
		        which are not mirrored should be listed in
		        support.sgml.  -->

		  <xsl:call-template name="html-index-mirrors-options-list">
		    <xsl:with-param name="mirrors.xml" select="$mirrors.xml" />
		  </xsl:call-template>
		</select>

		<input type="submit" value=" Go "/>

		<br/>

		<font color="#990000"><b>����: </b></font>
		<a href="{$enbase}/de/index.html" title="�ɥ��ĸ�">[de]</a>
		<xsl:text>&#160;</xsl:text>
		<a href="{$enbase}/index.html" title="�Ѹ�">[en]</a>
		<xsl:text>&#160;</xsl:text>
		<a href="{$enbase}/es/index.html" title="���ڥ����">[es]</a>
		<xsl:text>&#160;</xsl:text>
		<a href="{$enbase}/fr/index.html" title="�ե�󥹸�">[fr]</a>
		<xsl:text>&#160;</xsl:text>
		<a href="{$enbase}/it/index.html" title="�����ꥢ��">[it]</a>
		<xsl:text>&#160;</xsl:text>
		<span title="���ܸ�">[ja]</span>
		<xsl:text>&#160;</xsl:text>
		<a href="{$enbase}/ru/index.html" title="������">[ru]</a>
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
			    <small>����:<br/>
			      <input type="text" name="words" size="10"/>
			      <input type="hidden" name="max" value="25"/>
			      <input type="hidden" name="source" value="www"/>
			      <input type="submit" value="�¹�"/></small>
			  </form>
			</td>
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

	      <p>FreeBSD �� x86 �ߴ�����x86-64 �ߴ�����Alpha/AXP,
		IA-64, PC-98, UltraSPARC&#174;
		�������ƥ������Ѥ����Ū�ʥ��ڥ졼�ƥ��󥰥����ƥ�Ǥ���
		����ե���˥���إС����쥤���ǳ�ȯ���줿 <xsl:value-of select="$unix"/>
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
		�ݻ�����褦�˥�����ΨŪ�����Ѥ��ޤ���</p>

	      <h2><font color="#990000">��¿�����б����ץꥱ�������</font></h2>

	      <p>�⤤�ʼ������ FreeBSD �ȡ�����������ʤǹ�®��
                PC �ϡ��ɥ��������Ȥ߹�碌�ϡ�
                ���Τ� <xsl:value-of select="$unix"/> ������ơ�������ɤŨ���롢
                ���˷к�Ū�������ˤʤ�Ǥ��礦��
                �ǥ����ȥå��ѡ��������Ѥ�ξ���ˤĤ��ơ�����ʿ���
		<a href="{$base}/applications.html">���ץꥱ�������</a>
		���Ѱդ���Ƥ��ޤ���</p>

	      <h2><font color="#990000">��ñ���󥹥ȡ���</font></h2>

	      <p>FreeBSD �� CD-ROM �� DVD-ROM���ե�åԡ��ǥ������������ơ��ס�MS-DOS&#174;
		�ѡ��ƥ������ʤɤΤ��ޤ��ޤʥ�ǥ������饤�󥹥ȡ��뤹�뤳�Ȥ�
		�Ǥ��ޤ����ͥåȥ������³���Ƥ���ʤ顢anonymous FTP �� NFS
		���Ѥ��� <i>ľ��</i> ���󥹥ȡ��뤹�뤳�Ȥ�Ǥ��ޤ���
		ɬ�פʤΤ� 1.44MB �ε�ư�ե�åԡ� 2 ��ȡ�
		<a href="{$enbase}/doc/ja_JP.eucJP/books/handbook/install.html">��������ˡ</a>
		�����Ǥ���</p>

	      <h2><font color="#990000"><i>̵��</i>�ǻȤ��� FreeBSD</font></h2>

	      <a href="copyright/daemon.html"><img src="../gifs/dae_up3.gif"
						   alt="The BSD Daemon"
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
		�˹׸�������ˡ������ޤ���<a href="http://www.FreeBSDFoundation.org">FreeBSD Foundation</a> �����������
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
			<td valign="top"><p>
			      <a href="{$u.rel.announce}">
			      <font size="+1" color="#990000"><b>�ץ����������꡼��:
			    <xsl:value-of select="$rel.current"/></b></font></a><br/>
			    <small>��<a href="{$enbase}/doc/ja_JP.eucJP/books/handbook/install.html">���󥹥ȡ��륬����</a><br/>
			      ��<a href="{$u.rel.notes}">��꡼���Ρ���</a><br/>
			      ��<a href="{$u.rel.hardware}">�ϡ��ɥ������Ρ���</a><br/>
			      ��<a href="{$u.rel.installation}">���󥹥ȡ���Ρ���</a><br/>
			      ��<a href="{$u.rel.errata}">Errata</a><br/>
			      ��<a href="{$u.rel.early}">Migration Guide</a></small></p>

			<p>
			      <a href="{$u.rel2.announce}">
			      <font size="+1" color="#990000"><b>�ץ����������꡼�� (Legacy):
			    <xsl:value-of select="$rel2.current"/></b></font></a><br/>

			    <small>��<a href="{$enbase}/doc/ja_JP.eucJP/books/handbook/install.html">���󥹥ȡ��륬����</a><br/>
			      ��<a href="{$u.rel2.notes}">��꡼���Ρ���</a><br/>
			      ��<a href="{$u.rel2.hardware}">�ϡ��ɥ������ꥹ�� (�Ѹ�)</a><br/>
			      ��<a href="{$u.rel2.installation}">���󥹥ȡ���Ρ���</a><br/>
			      ��<a href="{$u.rel2.errata}">Errata (�Ѹ�)</a></small></p>

			  <p><font size="+1" color="#990000"><b>Project News</b></font>
			    <xsl:text> </xsl:text>
			    <font color="#990000">(<a href="{$enbase}/news/news.rdf">RSS</a>)</font><br/>
			    <font size="-1">
			      �ǽ�����:
			      <xsl:call-template name="html-index-news-project-items-lastmodified">
				<xsl:with-param name="news.project.xml-master" select="$news.project.xml-master" />
			      </xsl:call-template>

			      <br/>

			      <xsl:call-template name="html-index-news-project-items">
				<xsl:with-param name="news.project.xml-master" select="$news.project.xml-master" />
				<xsl:with-param name="news.project.xml" select="$news.project.xml" />
			      </xsl:call-template>

			      <a href="news/newsflash.html">�����...</a>
			    </font></p>

			  <p><font size="+1" color="#990000"><b>FreeBSD Press</b></font><br/>

			    <font size="-1">
			      �ǽ�����:
			      <xsl:call-template name="html-index-news-press-items-lastmodified">
				<xsl:with-param name="news.press.xml-master" select="$news.press.xml-master" />
			      </xsl:call-template>

			      <br/>

			      <xsl:call-template name="html-index-news-press-items">
				<xsl:with-param name="news.press.xml-master" select="$news.press.xml-master" />
				<xsl:with-param name="news.press.xml" select="$news.press.xml" />
			      </xsl:call-template>

			      <a href="news/press.html">�����...</a>
			    </font>
			  </p>

			  <p><font size="+1" color="#990000"><b>�������ƥ�����</b></font>
			    <xsl:text> </xsl:text>
			    <font color="#990000">(<a href="{$enbase}/security/advisories.rdf">RSS</a>)</font><br/>

			    <font size="-1">
			      �ǽ�����:
			      <xsl:call-template name="html-index-advisories-items-lastmodified">
				<xsl:with-param name="advisories.xml" select="$advisories.xml" />
				<xsl:with-param name="type" select="'advisory'" />
			      </xsl:call-template>

			      <br/>

			      <xsl:call-template name="html-index-advisories-items">
				<xsl:with-param name="advisories.xml" select="$advisories.xml" />
				<xsl:with-param name="type" select="'advisory'" />
			      </xsl:call-template>

			      <a href="security/">�����...</a>
			    </font>
			  </p>

			  <p><font size="+1" color="#990000"><b>Errata Notices</b></font>
			    <xsl:text> </xsl:text>
			    <br/>
			    <font size="-1">
			      �ǽ�����:
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

	    <td><a href="{$enbase}/art.html"><img
							     src="../gifs/powerlogo.gif"
							     alt="[Powered by FreeBSD]"
							     height="64"
							     width="160"
							     border="0"/></a></td>
	  </tr>
	</table>

	<table width="100%" cellpadding="0" border="0" cellspacing="0">
	  <tr>
	    <td align="left"
		valign="top"><small><a href="{$base}/mailto.html">���䤤��碌��</a> : <a href="jabout.html">���ܸ첽�ˤĤ���</a><br/>
		<xsl:value-of select="$date"/></small></td>

	    <td align="right"
		valign="top"><small><a href="copyright/index.html">��Ū�⻺���ˤĤ���</a><br/> &#169; 1995-2004
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
