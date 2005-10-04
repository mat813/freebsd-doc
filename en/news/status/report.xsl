<?xml version="1.0" encoding="ISO-8859-1" ?>

<!-- $FreeBSD: www/en/news/status/report.xsl,v 1.7 2005/01/05 23:43:20 mlaier Exp $ -->

<!-- Standard header material -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:cvs="http://www.FreeBSD.org/XML/CVS">

  <xsl:import href="../../includes.xsl"/>
  <xsl:import href="../includes.xsl"/>
  <xsl:import href="includes.xsl"/>

  <xsl:variable name="section" select="'about'"/>

  <xsl:variable name="base" select="'../..'"/>

  <xsl:variable name="title">
    <xsl:value-of select="report/date/month"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="report/date/year"/> Status Report
  </xsl:variable>

  <xsl:variable name="date">
    <xsl:value-of select="//cvs:keyword[@name='freebsd']"/>
  </xsl:variable>

  <xsl:variable name="ucletters"
    select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
  <xsl:variable name="lcletters"
    select="'abcdefghijklmnopqrstuvwxyz'"/>
  
  <xsl:output type="html" encoding="iso-8859-1"/>

  <xsl:template match="report">
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

	<!-- Process all the <sections>, in order -->
	<xsl:apply-templates select="section"/>

	<hr/>

	<!-- Generate a table of contents, sorted -->
	<xsl:for-each select="category">
	  <h3><xsl:value-of select="description"/></h3>
	  <xsl:variable name="cat-short" select="name"/>
	  <ul>
	    <xsl:for-each select="//project[@cat=$cat-short]">
  	      <xsl:sort select="translate(title, $lcletters, $ucletters)"/>
	      <li><a><xsl:attribute name="href">#<xsl:value-of
	      select="translate(title, ' ',
	      '-')"/></xsl:attribute><xsl:value-of select="title"/></a>
	      </li>
	    </xsl:for-each>
	  </ul>
	</xsl:for-each>
	<ul>
	  <xsl:for-each select="//project[not(@cat)]">
  	    <xsl:sort select="translate(title, $lcletters, $ucletters)"/>
	    <li><a><xsl:attribute name="href">#<xsl:value-of
	    select="translate(title, ' ',
	    '-')"/></xsl:attribute><xsl:value-of select="title"/></a>
	    </li>
	  </xsl:for-each>
	</ul>

	<hr/>

	<!-- Process each project, sorted -->
	<xsl:apply-templates select="project">
	  <xsl:sort select="translate(title, $lcletters, $ucletters)"/>
	</xsl:apply-templates>

	<!-- Standard footer -->
	<xsl:copy-of select="$newshome"/> |
	<xsl:copy-of select="$statushome"/>
	      </div> <!-- contentwrap -->

	      <br class="clearboth" />
	    </div> <!-- content -->
	<xsl:copy-of select="$footer"/>
	  </div> <!-- container -->
	</div> <!-- containerwrap -->
      </body>
    </html>
  </xsl:template>

  <!-- Everything that follows are templates for the rest of the content -->
  
  <!-- A section creates a header, and copies in all the <p> elements from
       itself -->
  <xsl:template match="section">
    <h1><xsl:value-of select="title"/></h1>

    <xsl:copy-of select="p"/>
  </xsl:template>

  <!-- A project creates a header, and then process the three components of
       a project report (links, contact details, project body) in turn -->
  <xsl:template match="project">
    <h2><a>
	<xsl:attribute name="name"><xsl:value-of
	  select="translate(title, ' ', '-')"/></xsl:attribute><xsl:value-of
	  select="title"/></a></h2>

    <xsl:apply-templates select="links"/>

    <xsl:apply-templates select="contact"/>

    <xsl:apply-templates select="body"/>

    <xsl:apply-templates select="help"/>

    <hr/>
  </xsl:template>

  <!-- Create a paragraph to hold the contact information.  Iterate over
       each <person> element, copying their data in.  All but the last
       person has a terminating <br> in the output. -->
  <xsl:template match="contact">
    <p>
      <xsl:for-each select="person">
	Contact: <xsl:value-of select="name"/> &lt;<a>
	  <xsl:attribute name="href">mailto:<xsl:value-of select="email"/></xsl:attribute><xsl:value-of select="email"/></a>&gt;
	<xsl:if test="position() != last()"><br/></xsl:if>
      </xsl:for-each>
    </p>
  </xsl:template>

  <!-- Create a paragraph to hold the link information.  Iterate over each
       <url> element, copying their data in.  All but the last link has a
       terminating <br> in the output. -->
  <xsl:template match="links">
    <p>
      <xsl:for-each select="url">
	URL:
	  <a href="{@href}" title="{.}">     <!-- Copy in the href attribute -->
	    <xsl:value-of select="@href"/>
	  </a>
	<xsl:if test="position() != last()"><br/></xsl:if>
      </xsl:for-each>
    </p>
  </xsl:template>

  <!-- Body is a doddle.  Since it contains HTML we just copy in all the
       child elements. -->
  <xsl:template match="body">
    <xsl:copy-of select="child::node()"/>
  </xsl:template>

  <xsl:template match="help">
    <h3>Open tasks:</h3>
    <ol>
      <xsl:for-each select="task">
	<li><xsl:copy-of select="child::node()"/></li>
      </xsl:for-each>
    </ol>    
  </xsl:template>
</xsl:stylesheet>
