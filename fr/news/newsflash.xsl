<?xml version="1.0" encoding="ISO-8859-1" ?>

<!-- $FreeBSD: www/fr/news/newsflash.xsl,v 1.7 2004/12/30 17:53:44 hrs Exp $ -->

<!-- 
   The FreeBSD French Documentation Project
   Original revision: 1.11
   
   Version francaise : Stephane Legrand <stephane@freebsd-fr.org>
   Version francaise (mise a jour) : Mathieu Arnold <mat@FreeBSD.org>
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:cvs="http://www.FreeBSD.org/XML/CVS">

  <xsl:import href="../includes.xsl"/>
  <xsl:import href="includes.xsl"/>
  <xsl:variable name="section" select="'about'"/>

  <xsl:variable name="base" select="'..'"/>
  <xsl:variable name="enbase" select="'../..'"/>
  <xsl:variable name="title" select="'Nouvelles FreeBSD'"/>
  <xsl:variable name="date">
    <xsl:value-of select="//cvs:keyword[@name='freebsd']"/>
  </xsl:variable>

  <xsl:param name="news.project.xml-master" select="'none'" />
  <xsl:param name="news.project.xml" select="'none'" />

  <xsl:output type="html" encoding="iso-8859-1"/>

  <xsl:template match="news">
    <html>

      <xsl:copy-of select="$header1"/>
      
            <body xsl:use-attribute-sets="att.body">
      
        <div id="containerwrap">
          <div id="container">
      
      	<xsl:copy-of select="$header2"/>
      
      	<div id="content">
      
      	      <xsl:copy-of select="$sidenav"/>
      
      	      <div id="contentwrap">
      	      
	      <xsl:copy-of select="$header3"/>

	<!-- Notice how entity references in SGML become variable references
	     in the stylesheet, and that the syntax for referring to variables
	     inside an attribute is "{$variable}".

	     This is just dis-similar enough to Perl and the shell that you
	     end up writing ${variable} all the time, and then scratch your 
	     head wondering why the stylesheet isn't working.-->

	<!-- Also notice that because this is now XML and not SGML, empty
             elements, like IMG, must have a trailing "/" just inside the 
   	     closing angle bracket, like this " ... />" -->
	<img src="{$enbase}/gifs/news.jpg" align="right" border="0" width="193"
	     height="144" alt="Nouvelles FreeBSD"/>

	<p>FreeBSD est un syst&#232;me d'exploitation en constante &#233;volution. Se tenir inform&#233;
	  des derniers d&#233;veloppements peut devenir une corv&#233;e ! Pour rester &#224; jour,
	  consultez cette page r&#233;guli&#232;rement. Vous pouvez &#233;galement
	  vous inscrire &#224; la liste de diffusion
	  <a href="{$enbase}/doc/{$url.doc.langcode}/books/handbook/eresources.html#ERESOURCES-MAIL">freebsd-announce</a>
	  ou au <a href="news.rdf">flux RDF</a>.</p>

	     <p>Les projets suivants ont leurs propres pages de nouvelles, vous pouvez les consulter
          pour les mises &#224; jour sp&#233;cifiques &#224; ces projets.</p>

        <ul>
          <li><a href="{$base}/java/newsflash.html"><xsl:value-of select="$java"/> sur FreeBSD</a></li>
          <li><a href="http://freebsd.kde.org/">KDE sur FreeBSD</a></li>
          <li><a href="{$base}/gnome/newsflash.html">GNOME sur FreeBSD</a></li>
        </ul>

	<p>Pour une description d&#233;taill&#233;e des versions pass&#233;es, pr&#233;sentes et futures,
	  consultez la page <strong><a href="{$base}/releases/index.html">d'information
	      sur les versions</a></strong>.</p>

	<p>Pour les avis de s&#233;curit&#233; concernant FreeBSD, veuillez consulter la page
	  <a href="{$base}/security/#adv">d'information sur la s&#233;curit&#233;</a>.</p>

	<xsl:call-template name="html-news-list-newsflash">
          <xsl:with-param name="news.project.xml-master" select="$news.project.xml-master" />
          <xsl:with-param name="news.project.xml" select="$news.project.xml" />
	</xsl:call-template>

	<xsl:copy-of select="$newshome"/>

	  	</div> <!-- contentwrap -->
		<br class="clearboth" />
	
	</div> <!-- content -->
	
	<xsl:copy-of select="$footer"/>
	
        </div> <!-- container -->
   </div> <!-- containerwrap -->

      </body>
    </html>
  </xsl:template>

  <xsl:template name="html-news-make-olditems-list">
    <p>Anciennes annonces :
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
