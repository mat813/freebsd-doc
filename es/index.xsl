<?xml version="1.0" encoding="ISO-8859-1" ?>

<!-- $FreeBSD: www/es/index.xsl,v 1.5 2004/09/20 18:10:24 jesusr Exp $ -->
<!-- $FreeBSDes: www/es/index.xsl,v 1.4 2004/09/07 21:46:11 jcamou Exp $ -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:import href="includes.xsl"/>
  <xsl:import href="../en/news/includes.xsl"/>

  <xsl:variable name="base" select="'.'"/>
  <xsl:variable name="enbase" select="'..'"/>
  <xsl:variable name="date" select="'$FreeBSD: www/es/index.xsl,v 1.5 2004/09/20 18:10:24 jesusr Exp $'"/>
  <xsl:variable name="title" select="'El Proyecto FreeBSD'"/>

  <!-- these params should be externally bound. The values
       here are not used actually -->
  <xsl:param name="advisories.xml" select="'none'"/>
  <xsl:param name="notices.xml" select="'none'"/>
  <xsl:param name="mirrors.xml" select="'none'"/>
  <xsl:param name="news.press.xml" select="'none'"/>
  <xsl:param name="news.project.xml-master" select="'none'"/>
  <xsl:param name="news.project.xml" select="'none'"/>

  <xsl:output type="html" encoding="iso-8859-1"
              doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>

  <xsl:template match="/">
    <html>
      <head>
	<title><xsl:value-of select="$title"/></title>

	<meta name="description" content="El Proyecto FreeBSD"/>

	<meta name="keywords" content="FreeBSD, BSD, UNIX, Support, Gallery,
	      Release, Application, Software, Handbook, FAQ, Tutorials, Bugs,
	      CVS, CVSup, News, Commercial Vendors, homepage, CTM, Unix"/>
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
	<link rel="icon" href="/favicon.ico" type="image/x-icon"/>
      </head>

      <body bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#840084"
	    alink="#0000FF">

	<table border="0" cellspacing="0" cellpadding="0" width="100%">
	  <tr>
	    <td><a href="http://www.FreeBSD.org/es/index.html">
		<img src="{$enbase}/gifs/freebsd_1.gif" height="94" width="306"
		     alt="FreeBSD: The Power to Serve" border="0"/></a></td>

	    <td align="right" valign="bottom">
	      <form action="http://www.FreeBSD.org/cgi/mirror.cgi"
		    method="get">

		<br/>

		<font color="#990000"><b>Selecciona el servidor m&#225;s 
		  cercano:</b></font>

		<br/>

		<select name="goto">
		  <xsl:call-template name="html-index-mirrors-options-list">
		    <xsl:with-param name="mirrors.xml" select="$mirrors.xml" />
		  </xsl:call-template>
		</select>

		<input type="submit" value=" Ir "/>

		<br/>

		<font color="#990000"><b>Idioma: </b></font>
		<a href="{$enbase}/de/index.html" title="Tedesco">[de]</a>
		<xsl:text>&#160;</xsl:text>
		<a href="{$enbase}/index.html" title="Ingl&#233;s">[en]</a>
		<xsl:text>&#160;</xsl:text>
		<span title="Espa&#241;ol">[es]</span>
		<xsl:text>&#160;</xsl:text>
		<a href="{$enbase}/fr/index.html" title="Franc&#233;s">[fr]</a>
		<xsl:text>&#160;</xsl:text>
		<a href="{$enbase}/index.html" title="Italiano">[it]</a>
		<xsl:text>&#160;</xsl:text>
		<a href="{$enbase}/ja/index.html" title="Japon&#233;s">[ja]</a>
		<xsl:text>&#160;</xsl:text>
		<a href="{$enbase}/ru/index.html" title="Ruso">[ru]</a>
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
			    <small>Buscar:<br/>
			      <input type="text" name="words" size="10"/>
			      <input type="hidden" name="max" value="25"/>
			      <input type="hidden" name="source" value="www"/>
			      <input type="submit" value="Buscar"/></small>
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
	      <h2><font color="#990000">&#191;Qu&#233; es FreeBSD?</font></h2>

	      <p>FreeBSD es un avanzado sistema operativo para arquitecturas
                x86 compatibles (incluyendo Pentium&#174; y Athlon&#8482;),
                amd64 compatibles (incluyendo Opteron&#8482;, Athlon 64 y EM64T),
                Alpha/AXP, IA-64, PC-98 y UltraSPARC&#174;. 
                FreeBSD es un derivado de BSD, la versi&#243;n de
                <xsl:value-of select="$unix"/> desarrollada en la Universidad
                de California, Berkeley.  FreeBSD es desarrollado y mantenido 
                por un
                <a href="{$enbase}/doc/en_US.ISO8859-1/articles/contributors/index.html">
                numeroso equipo de personas</a>.  El soporte para otras
                <a href="{$enbase}/platforms/index.html">arquitecturas</a>
                est&#225; en diferentes fases de desarrollo.</p>

	      <h2><font color="#990000">Caracter&#237;sticas principales
	        </font></h2>

	      <p>FreeBSD ofrece altas 
	        <a href="{$base}/features.html">prestaciones</a>
	        en comunicaciones de red, rendimiento, seguridad y 
		compatibilidad, todav&#237;a inexistentes en otros sistemas 
		operativos, incluyendo los comerciales de mayor renombre.</p>

	      <h2><font color="#990000">Potentes Soluciones Internet</font>
	        </h2>

	      <p>FreeBSD es el servidor ideal para servicios de
		<a href="{$base}/internet.html">Internet o Intranet</a>.
		Proporciona unos servicios de red robustos, incluso en 
		situaciones de alta carga, haciendo un uso eficaz de la 
		memoria para mantener buenos tiempos de repuesta con cientos 
		o miles de procesos simult&#225;neos de usuarios.</p>  

	      <h2><font color="#990000">Ejecuta una gran variedad de 
	        aplicaciones</font></h2>

	      <p>La calidad de FreeBSD conbinada con el hoy en d&#237;a bajo
	        coste del hardware de alta velocidad para PC's hace de este
	        sistema una alternativa muy econ&#243;mica sobre las 
		estaciones de trabajo <xsl:value-of select="$unix"/> 
		comerciales. Existe gran cantidad de 
		<a href="{$base}/applications.html">aplicaciones</a> 
	        tanto a nivel servidor como usuario.</p>

	      <h2><font color="#990000">F&#225;cil de instalar</font></h2>

	      <p>Se puede instalar FreeBSD desde una gran variedad de 
	        soportes, incluyendo CD-ROM, DVD-ROM, disquetes, cintas 
		magn&#233;ticas, una partici&#243;n MS-DOS&#174;, o si se 
		dispone de conexi&#243;n de red, se puede instalar 
		<i>directamente</i> mediante FTP an&#243;nimo o NFS.  Todo lo
		necesario son dos discos de 1.44MB de arranque y 
	        <a href="{$enbase}/doc/es_ES.ISO8859-1/books/handbook/install.html">estas instrucciones</a>.</p>

	      <h2><font color="#990000">FreeBSD es <i>libre y gratuito</i>
	        </font></h2>

	      <a href="copyright/daemon.html"><img src="{$enbase}/gifs/dae_up3.gif"
						   alt=""
						   height="81" width="72"
						   align="right"
						   border="0"/></a>

	      <p>Si esperabas que un sistema operativo con estas 
	        caracter&#237;sticas tuviese un alto coste, FreeBSD 
		est&#225; disponible disponibile 
		<a href="{$base}/copyright/index.html">completamente gratis</a> 
		incluyendo el c&#243;digo fuente.  Si quieres probarlo,
		<a  href="{$enbase}/doc/es_ES.ISO8859-1/books/handbook/mirrors.html">
		aqu&#237; tienes m&#225;s informaci&#243;n</a>.</p>

	      <h2><font color="#990000">Contribuyendo a FreeBSD</font></h2>

	      <p>Es muy f&#225;cil contribuir  a FreeBSD.  Todo lo que tienes 
		que hacer es encontrar una parte de FreeBSD que creas puede 
		mejorarse y hacer los cambios (cuidadosa y limpiamente) y 
		enviarlas al proyecto mediante un "send-pr" o un committer, si
		conoces a alguno. M&#225;s informaci&#243;n en la 
		<a href="{$enbase}/doc/en_US.ISO8859-1/articles/contributing/index.html">
		secci&#243;n de contribuciones del manual</a>.</p>
		

	      <p>A&#250;n no siendo programador, existen otros m&#233;todos 
	        de colaborar y contribuir a FreeBSD. La Fundaci&#243;n 
		FreeBSD es una organizaci&#243;n no lucrativa para la que 
		todas las contribuciones directas directas son deducibles de 
		impuestos en su totalidad.  Por favor, contactar con 
		<a href="mailto:bod@FreeBSDFoundation.org">
		bod@FreeBSDFoundation.org</a> para obtener m&#225;s 
		informaci&#243;n o escribir a The FreeBSD Foundation, 7321 
		Brockway Dr. Boulder, CO 80303. USA.</p>

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
			      <font size="+1" color="#990000"><b>Nueva 
			        Tecnolog&#237;a:
			    <xsl:value-of select="$rel.current"/></b></font></a><br/>
			      <small>&#183; <a href="{$enbase}/doc/es_ES.ISO8859-1/books/handbook/install.html">Gu&#237;a de Instalaci&#243;n</a><br/>
			      &#183; <a href="{$u.rel.notes}">Notas de Release</a><br/>
			      &#183; <a href="{$u.rel.hardware}">Notas de Hardware</a><br/>
			      &#183; <a href="{$u.rel.installation}">Notas de Instalaci&#243;n</a><br/>
			      &#183; <a href="{$u.rel.errata}">Errata</a><br/>
			      &#183; <a href="{$u.rel.early}">Early Adopter's Guide</a></small></p>

			<p>
			      <a href="{$u.rel2.announce}">
			      <font size="+1" color="#990000"><b>Release en 
			        Producci&#243;n:
			    <xsl:value-of select="$rel2.current"/></b></font></a><br/>
			      <small>&#183; <a href="{$enbase}/doc/es_ES.ISO8859-1/books/handbook/install.html">Gu&#237;a de Instalaci&#243;n</a><br/>
			      &#183; <a href="{$u.rel2.notes}">Notas de Release</a><br/>
			      &#183; <a href="{$u.rel2.hardware}">Notas de Hardware</a><br/>
			      &#183; <a href="{$u.rel2.installation}">Notas de Instalaci&#243;n</a><br/> 
			      &#183; <a href="{$u.rel2.errata}">Errata</a></small></p>

			  <p><font size="+1" color="#990000"><b>Noticias del 
                            Proyecto</b></font><font color="990000">(<a href="{$enbase}/news/news.rdf">RSS</a>)</font><br/>
			    <font size="-1">
			      Ultima actualizaci&#243;n:
			      <xsl:call-template name="html-index-news-project-items-lastmodified">
				<xsl:with-param name="news.project.xml" select="$news.project.xml" />
			      </xsl:call-template>
			      <br/>
			      <xsl:call-template name="html-index-news-project-items">
				<xsl:with-param name="news.project.xml" select="$news.project.xml" />
			      </xsl:call-template>
			      <a href="{$enbase}/news/newsflash.html">M&#225;s...</a>
			    </font></p>

			  <p><font size="+1" color="#990000"><b>FreeBSD en la
			    Prensa</b></font><br/>

			    <font size="-1">
			      Ultima actualizaci&#243;n:
			      <xsl:call-template name="html-index-news-press-items-lastmodified">
				<xsl:with-param name="news.press.xml" select="$news.press.xml" />
			      </xsl:call-template>
			      <br/>
			      <xsl:call-template name="html-index-news-press-items">
				<xsl:with-param name="news.press.xml" select="$news.press.xml" />
			      </xsl:call-template>
			      <a href="{$enbase}/news/press.html">M&#225;s...</a>
			    </font>
			  </p>

			  <p><font size="+1" color="#990000"><b>Avisos de 
			    Seguridad</b></font>
			    <xsl:text> </xsl:text>
			    <font color="#990000">(<a href="{$enbase}/security/advisories.rdf">RSS</a>)</font><br/>

			    <font size="-1">
			      Ultima actualizaci&#243;n:
			      <xsl:call-template name="html-index-advisories-items-lastmodified">
				<xsl:with-param name="advisories.xml" select="$advisories.xml" />
			      </xsl:call-template>
			      <br/>
			      <xsl:call-template name="html-index-advisories-items">
				<xsl:with-param name="advisories.xml" select="$advisories.xml" />
			      </xsl:call-template>
			      <a href="{$base}/security/index.html">M&#225;s...</a>
			    </font>
			  </p>

			  <p><font size="+1" color="#990000"><b>Noticias Errata</b></font>
			    <xsl:text> </xsl:text>
			    <br/>
			    <font size="-1">
			      Ultima actualizaci&#243;n:
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
			<td>Para aprender m&#225;s sobre FreeBSD, visita 
			  nuestra galer&#237;a de 
			  <a href="{$base}/publish.html">publicaciones</a>
			  relacionadas con FreeBSD o 
			  <a href="{$base}/news/press.html">FreeBSD en la prensa</a>,
			  y navega a trav&#233;s de este web!</td>
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
	    <td><a href="http://www.freebsdmall.com/"><img src="{$enbase}/gifs/mall_title_medium.gif" alt="[FreeBSD Mall]"
							   height="65" width="165" border="0"/></a></td>

	    <td><a href="http://www.ugu.com/"><img src="{$enbase}/gifs/ugu_icon.gif"
						   alt="[Sponsor del Unix Guru Universe]"
						   height="64" width="76"
						   border="0"/></a></td>

	    <td><a href="http://www.daemonnews.org/"><img src="{$enbase}/gifs/darbylogo.gif"
		alt="[Daemon News]" height="45" width="130"
		border="0"/></a></td>

	    <td><a href="{$base}/copyright/daemon.html"><img
							     src="{$enbase}/gifs/powerlogo.gif"
							     alt="[Powered by FreeBSD]"
							     height="64"
							     width="160"
							     border="0"/></a></td>
	  </tr>
	</table>

	<table width="100%" cellpadding="0" border="0" cellspacing="0">
	  <tr>
	    <td align="left"
		valign="top"><small><a href="{$base}/mailto.html">Contactar con nosotros</a><br/>
		<xsl:value-of select="$date"/></small></td>

	    <td align="right"
		valign="top"><small><a href="{$base}/copyright/index.html">Copyright</a> &#169; 1995-2005
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
