<?xml version="1.0" encoding="KOI8-R" ?>

<!--
     The FreeBSD Russian Documentation Project

     $FreeBSD: www/ru/includes.xsl,v 1.13 2005/10/05 20:39:12 simon Exp $
     $FreeBSDru: frdp/www/ru/includes.xsl,v 1.13 2004/10/22 12:33:49 den Exp $

     Original revision: 1.20
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:import href="../share/sgml/includes.xsl" />

  <xsl:variable name="url.doc.langcode" select="'ru_RU.KOI8-R'" />

  <!-- Language-specific definitions should be put below this line -->

  <xsl:variable name="i.daemon">
    <img src="{$base}/../gifs/daemon.gif" alt="" align="left" width="80" height="76"/>
  </xsl:variable>

  <xsl:variable name="i.new">
    <img src="{$base}/../gifs/new.gif" alt="[New!]" width="28" height="11"/>
  </xsl:variable>

  <xsl:variable name="copyright">
  <a href="{$base}/copyright/">Legal Notices</a> | Copyright &#169; 1995-2005 The FreeBSD Project.  ��� ����� ��������
  </xsl:variable>

  <xsl:variable name="home">
    <a href="{$base}/index.html"><img src="{$base}/../gifs/home.gif" alt="FreeBSD Home Page" border="0" align="right" width="101" height="33"/></a>
  </xsl:variable>

  <xsl:variable name="section" select="''"/>

  <xsl:variable name="header1">
    <head><title><xsl:value-of select="$title"/></title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="MSSmartTagsPreventParsing" content="TRUE" />
    <link rel="shortcut icon" href="{$enbase}/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="{$enbase}/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" media="screen" href="{$enbase}/layout/css/fixed.css" type="text/css" title="Normal Text" />
    <link rel="alternate stylesheet" media="screen" href="{$enbase}/layout/css/fixed_large.css" type="text/css" title="Large Text" />
    <script type="text/javascript" src="{$enbase}/layout/js/styleswitcher.js"></script>
    </head>    
  </xsl:variable>
  
  <xsl:variable name="header2">
	    <span class="txtoffscreen"><a href="#content" title="Skip site navigation" accesskey="1">����������� ��������� �� �����</a> (1)</span>
	    <span class="txtoffscreen"><a href="#contentwrap" title="Skip section navigation" accesskey="2">����������� ��������� �� �������</a> (2)</span>
            <div id="headercontainer">
      
              <div id="header">
	        <h2 class="blockhide">��������� � �������</h2>
                <div id="headerlogoleft">
                  <a href="{$base}" title="FreeBSD"><img src="{$enbase}/layout/images/logo.png" width="360" height="40" alt="FreeBSD" /></a>
                </div> <!-- headerlogoleft -->
                <div id="headerlogoright">
			<h2 class="blockhide">�������������� ������</h2>
      			  <div id="searchnav">
      				<ul id="searchnavlist">
      				  <li>
      					Text Size: <a href="#" onkeypress="return false;" onclick="setActiveStyleSheet('Normal Text'); return false;" title="Normal Text Size">Normal</a> / <a href="#" onkeypress="return false;" onclick="setActiveStyleSheet('Large Text'); return false;" title="Large Text Size">Large</a>
      				  </li>
      				  <li>
      					<a href="{$base}/donations/" title="�������������">�������������</a>
      				  </li>
      				  <li class="last-child">
      					<a href="{$base}/mailto.html" title="���������� ����������">���������� ����������</a>
      				  </li>
      				</ul>
      			  </div> <!-- searchnav -->
      			<div id="search">
      			  <form action="{$enbase}/cgi/search.cgi" method="get">
      				<div>
      			      <h2 class="blockhide"><label for="words">�����</label></h2>
      				  <input type="hidden" name="max" value="25" /> <input type="hidden" name="source" value="www" /><input id="words" name="words" type="text" size="20" maxlength="255" onfocus="if( this.value==this.defaultValue ) this.value='';" value="�����" />&#160;<input id="submit" name="submit" type="submit" value="�����" />
      				</div>
      			  </form>
      			</div> <!-- search -->
                </div> <!-- headerlogoright -->
      
              </div> <!-- header -->
      
	      <h2 class="blockhide">��������� �� �����</h2>
              <div id="topnav">
                <ul id="topnavlist">
		  <li>
	       	        <a href="{$base}/" title="�� �������">�� �������</a>
		  </li>
		  <li>
	 	        <a href="{$base}/about.html" title="� FreeBSD">� FreeBSD</a>
		  </li>
		  <li>
			<a href="{$base}/where.html" title="��������� FreeBSD">��������� FreeBSD</a>
		  </li>
		  <li>
			<a href="{$base}/docs.html" title="������������">������������</a>
		  </li>
		  <li>
	 	        <a href="{$enbase}/community.html" title="����������">����������</a>
		  </li>
		  <li>
			<a href="{$base}/projects/index.html" title="����������">����������</a>
		  </li>
		  <li>
			<a href="{$base}/support.html" title="���������">���������</a>
		  </li>		  
		</ul>
              </div> <!-- topnav -->
            </div> <!-- headercontainer -->
  </xsl:variable>
  
  <xsl:variable name="header3">
  	<h1><xsl:value-of select="$title"/></h1>
  </xsl:variable>
  
  <xsl:variable name="sidenav">
	<div id="sidewrap">
	
	<div id="sidenav">
 	<h2 class="blockhide">��������� �� �������</h2>
	
	<xsl:if test="$section = 'about'" >
		<ul>
		<li><a href="{$base}/about.html">� FreeBSD</a></li>
		<li><a href="{$base}/features.html">�����������</a></li>
		<li><a href="{$base}/applications.html">����������</a></li>
		<li><a href="{$base}/internet.html">������ � �����</a></li>
		<li><a href="{$enbase}/advocacy/">����������</a></li>
		<li><a href="{$enbase}/marketing/">���������</a></li>
		<li><a href="{$base}/news/newsflash.html">�������</a></li>
		<li><a href="{$base}/events/events.html">�������</a></li>
		<li><a href="{$base}/news/press.html">������</a></li>
		<li><a href="{$base}/art.html">�����������</a></li>
		<li><a href="{$base}/donations/">�������������</a></li>
		<li><a href="{$base}/copyright/">����������� ���������</a></li>
		</ul>
	</xsl:if>

	<xsl:if test="$section = 'community'" >
		<ul>
		<li><a href="{$enbase}/community.html">����������</a></li>
		<!--li><a href="{$base}/community/mailinglists.html">Mailing Lists</a></li>
		<li><a href="{$base}/community/irc.html">IRC</a></li>
		<li><a href="{$base}/community/newsgroups.html">Newsgroups</a></li>
		<li><a href="{$base}/usergroups.html">User Groups</a></li>
		<li><a href="{$base}/community/webresources.html">Web Resources</a></li-->
		</ul>
	</xsl:if>

	<xsl:if test="$section = 'developers'" >
		<ul>
		<li><a href="{$base}/projects/index.html">������������</a></li>
		<li><a href="{$enbase}/doc/en_US.ISO8859-1/books/developers-handbook">����������� ������������</a></li>
		<li><a href="{$enbase}/doc/{$url.doc.langcode}/books/porters-handbook">����������� �� �������� ������</a></li>
		<li><a href="{$base}/support.html#cvs">CVS �����������</a></li>
		<li><a href="{$base}/releng/index.html">���������� �������</a></li>
		<li><a href="{$base}/platforms/">���������</a>
			<ul>
				<li><a href="{$base}/platforms/alpha.html">alpha</a></li>
				<li><a href="{$base}/platforms/amd64.html">amd64</a></li>
				<li><a href="{$base}/platforms/i386.html">i386</a></li>
				<li><a href="{$base}/platforms/ia64.html">ia64</a></li>
				<li><a href="{$base}/platforms/pc98.html">pc98</a></li>
				<li><a href="{$base}/platforms/sparc.html">sparc64</a></li>
			</ul>
		</li>
		<li><a href="{$base}/doc/en_US.ISO8859-1/articles/contributing/index.html">���������� �������</a></li>
		</ul>
	</xsl:if>

	<xsl:if test="$section = 'docs'" >
		<ul>
		<li><a href="{$base}/docs.html">������������</a></li>
		<li><a href="{$enbase}/doc/{$url.doc.langcode}/books/faq/">FAQ</a></li>
		<li><a href="{$enbase}/doc/{$url.doc.langcode}/books/handbook/">�����������</a></li>
		<li><a href="{$base}/docs.html#man">�������� �����������</a>
			<ul>
				<li><a href="{$enbase}/cgi/man.cgi">�������� ����������� � ����</a></li>
			</ul>
		</li>
		<li><a href="{$base}/docs.html#books">����� � ������</a></li>
		<li><a href="{$base}/publish.html">����������</a></li>
		<li><a href="{$base}/docs.html#links">Web �������</a></li>
		<li><a href="{$base}/projects/newbies.html">��� ��������</a></li>
		<li><a href="{$base}/docproj/">������ ����������������</a></li>
		</ul>
	</xsl:if>

	<xsl:if test="$section = 'download'" >
		<ul>
		<li><a href="{$base}/where.html">�������� FreeBSD</a></li>
		<li><a href="{$base}/releases/">Release Information</a>
			<ul>
				<li><a href="{$u.rel.announce}">������������ �����: {$rel.current}</a></li>
				<li><a href="{$u.rel2.announce}">(������) ������������ �����: {$rel2.current}</a></li>
				<li><a href="{$base}/snapshots/">�������-������</a></li>
			</ul>
		</li>
		<li><a href="{$base}/ports/">������������� ����������</a></li>
		</ul>
	</xsl:if>

	<xsl:if test="$section = 'support'" >
		<ul>
		<li><a href="{$base}/support.html">���������</a></li>
		<li><a href="{$base}/commercial/">����������</a>
			<ul>
				<li><a href="{$enbase}/commercial/software_bycat.html">����������� �����������</a></li>
				<li><a href="{$enbase}/commercial/hardware.html">���������� �����������</a></li>
				<li><a href="{$enbase}/commercial/consult_bycat.html">�������������� ������</a></li>
				<li><a href="{$enbase}/commercial/isp.html">�������� ����������</a></li>
				<li><a href="{$enbase}/commercial/misc.html">������</a></li>
			</ul>
		</li>
		<li><a href="{$base}/security/">���������� � ������������</a></li>
		<li><a href="{$base}/support.html#gnats">��������� �� �������</a>
			<ul>
				<li><a href="{$base}/send-pr.html">������� ��������� � ��������</a></li>
			</ul>
		</li>
		<li><a href="{$enbase}/support/webresources.html">Web �������</a></li>
		</ul>
	</xsl:if>
	
	</div> <!-- sidenav -->
	
	</div> <!-- sidewrap -->
  </xsl:variable>
  
  <xsl:variable name="footer">
	<div id="footer">
	<xsl:copy-of select="$copyright"/><br />
	<xsl:copy-of select="$date"/>
	</div> <!-- footer -->
  </xsl:variable>

  <xsl:variable name="u.rel.notes">
    <xsl:value-of select="$base"/>/ru/releases/<xsl:value-of select="$rel.current"/>R/relnotes.html</xsl:variable>

  <xsl:variable name="u.rel.announce">
    <xsl:value-of select="$base"/>/ru/releases/<xsl:value-of select="$rel.current"/>R/announce.html</xsl:variable>
  <xsl:variable name="u.rel.errata">
    <xsl:value-of select="$base"/>/ru/releases/<xsl:value-of select="$rel.current"/>R/errata.html</xsl:variable>
  <xsl:variable name="u.rel.hardware">
    <xsl:value-of select="$base"/>/ru/releases/<xsl:value-of select="$rel.current"/>R/hardware.html</xsl:variable>
  <xsl:variable name="u.rel.installation">
    <xsl:value-of select="$base"/>/ru/releases/<xsl:value-of select="$rel.current"/>R/installation.html</xsl:variable>
  <xsl:variable name="u.rel.readme">
    <xsl:value-of select="$base"/>/ru/releases/<xsl:value-of select="$rel.current"/>R/readme.html</xsl:variable>
  <xsl:variable name="u.rel.early">
    <xsl:value-of select="$base"/>/ru/releases/<xsl:value-of select="$rel.current"/>R/migration-guide.html</xsl:variable>
  <xsl:variable name="u.rel.migration">
    <xsl:value-of select="$base"/>/ru/releases/<xsl:value-of select="$rel.current"/>R/migration-guide.html</xsl:variable>

  <xsl:variable name="u.rel2.notes">
    <xsl:value-of select="$base"/>/releases/<xsl:value-of select="$rel2.current"/>R/relnotes.html</xsl:variable>
  <xsl:variable name="u.rel2.announce">
    <xsl:value-of select="$base"/>/releases/<xsl:value-of select="$rel2.current"/>R/announce.html</xsl:variable>
  <xsl:variable name="u.rel2.errata">
    <xsl:value-of select="$base"/>/releases/<xsl:value-of select="$rel2.current"/>R/errata.html</xsl:variable>
  <xsl:variable name="u.rel2.hardware">
    <xsl:value-of select="$base"/>/releases/<xsl:value-of select="$rel2.current"/>R/hardware.html</xsl:variable>
  <xsl:variable name="u.rel2.installation">
    <xsl:value-of select="$base"/>/releases/<xsl:value-of select="$rel2.current"/>R/installation.html</xsl:variable>
  <xsl:variable name="u.rel2.readme">
    <xsl:value-of select="$base"/>/releases/<xsl:value-of select="$rel2.current"/>R/readme.html</xsl:variable>

</xsl:stylesheet>
