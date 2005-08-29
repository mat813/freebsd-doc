<?xml version="1.0" encoding="ISO-8859-1" ?>

<!--
     The FreeBSD Italian Documentation Project

     $FreeBSD$
     Original revision: 1.127
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:import href="includes.xsl"/>
  <xsl:import href="../en/news/includes.xsl"/>

  <xsl:variable name="date" select="'$FreeBSD$'"/>
  <xsl:variable name="title" select="'The FreeBSD Project'"/>

  <xsl:output type="html" encoding="iso-8859-1"
              doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>

  <xsl:template match="/">
    <html>
      <head>
	<title><xsl:value-of select="$title"/></title>

	<meta name="description" content="The FreeBSD Project"/>

	<meta name="keywords" content="FreeBSD, BSD, UNIX, Support, Gallery,
	      Release, Application, Software, Handbook, FAQ, Tutorials, Bugs,
	      CVS, CVSup, News, Commercial Vendors, homepage, CTM, Unix"/>
        <link rel="shortcut icon" href="{$enbase}/favicon.ico"
          type="image/x-icon"/>
        <link rel="stylesheet" type="text/css" href="{$enbase}/index.css" />
        <link rel="icon" href="{$enbase}/favicon.ico" type="image/x-icon"/>
        <link rel="alternate" type="application/rss+xml"
	  title="FreeBSD Project News" href="{$enbase}/news/news.rdf" />
        <link rel="alternate" type="application/rss+xml"
	  title="FreeBSD Security Advisories"
	  href="{$enbase}/security/advisories.rdf" />
        <link rel="alternate" type="application/rss+xml"
	  title="FreeBSD GNOME Project News" href="{$enbase}/gnome/news.rdf" />
      </head>

      <body>
	<table border="0" cellspacing="0" cellpadding="0" width="100%">
	  <tr>
	    <td><a href="http://www.FreeBSD.org/it/index.html">
		<img src="{$enbase}/gifs/freebsd_1.gif" height="94" width="306"
		     alt="FreeBSD: The Power to Serve" border="0"/></a></td>

	    <td align="right" valign="bottom">
	      <form action="http://www.FreeBSD.org/cgi/mirror.cgi"
		method="get">

		<br/>

		<font color="#990000"><b>Seleziona un server vicino a
		    te:</b></font>

		<br/>

		<select name="goto">
		  <xsl:call-template name="html-index-mirrors-options-list">
		    <xsl:with-param name="mirrors.xml" select="$mirrors.xml" />
		  </xsl:call-template>
		</select>

		<input type="submit" value=" Vai "/>

		<br/>

		<font color="#990000"><b>Lingua: </b></font>
		<a href="{$enbase}/de/index.html" title="Tedesco">[de]</a>
		<xsl:text>&#160;</xsl:text>
		<a href="{$enbase}/index.html" title="Inglese">[en]</a>
		<xsl:text>&#160;</xsl:text>
		<a href="{$enbase}/es/index.html" title="Spagnolo">[es]</a>
		<xsl:text>&#160;</xsl:text>
		<a href="{$enbase}/fr/index.html" title="Francese">[fr]</a>
		<xsl:text>&#160;</xsl:text>
		<span title="Italiano">[it]</span>
		<xsl:text>&#160;</xsl:text>
		<a href="{$enbase}/ja/index.html" title="Giapponese">[ja]</a>
		<xsl:text>&#160;</xsl:text>
		<a href="{$enbase}/ru/index.html" title="Russo">[ru]</a>
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
              <table class="panel" cellpadding="4" cellspacing="0">
		<tr>
		  <td>
		    <xsl:call-template name="html-index-navigation-link-list">
		    <xsl:with-param name="navigation.xml"
		      select="$navigation.xml"/>
		    </xsl:call-template>

		    <form action="http://www.FreeBSD.org/cgi/search.cgi"
		      method="get">
		      <small>Cerca:<br/>
		      <input type="text" name="words" size="10"/>
		      <input type="hidden" name="max" value="25"/>
		      <input type="hidden" name="source" value="www"/>
		      <input type="submit" value="Vai"/>
		      </small>
		    </form>
		  </td>
		</tr>
              </table>
	    </td>

	    <td></td>

	    <!-- Main body column -->

	    <td align="left" valign="top" rowspan="2">
	      <h2>Cos'� FreeBSD?</h2>

	      <p>FreeBSD � un sistema operativo avanzato per architetture
		compatibili x86 (inclusi Pentium&#174; eAthlon&#8482;), amd64 (inclusi
		Opteron&#8482;, Athlon 64, e EM64T), Alpha/AXP, IA-64, PC-98 e
		UltraSPARC&#174;.
		� derivato da BSD, la versione di
		<xsl:value-of select="$unix"/> sviluppata
		all'Universit� della California, Berkeley.
		� sviluppato e mantenuto da <a
		  href="{$enbase}/doc/en_US.ISO8859-1/articles/contributors/index.html">un
		grande gruppo di individui</a>.
		<a href="{$enbase}/platforms/index.html">Piattaforme</a>
		aggiuntive sono in varie fasi di sviluppo.</p>

	      <h2>Funzionalit� avanzate</h2>

	      <p>FreeBSD offre <a
		href="{$enbase}/features.html">funzionalit�</a>
		di networking avanzato, prestazioni, sicurezza e compatibilit�
		che ad oggi mancano ancora in altri sistemi operativi, anche in
		alcuni di quelli commerciali.</p>

	      <h2>Soluzioni Internet potenti</h2>

	      <p>FreeBSD � ideale per un server
		<a href="{$enbase}/internet.html">Internet o Intranet</a>.
		Fornisce servizi di rete robusti sotto i carichi pi� pesanti e
		usa la memoria in maniera efficiente per mantenere buoni tempi
		di risposta per migliaia di processi utente simultanei.</p>

	      <h2>Esegue un numero enorme di applicazioni</h2>

	      <p>La qualit� di FreeBSD combinata con l'attuale hardware per PC a
		basso prezzo e ad alta velocit� rende FreeBSD un'alternativa
		molto economica alle workstation <xsl:value-of select="$unix"/>
		commerciali.  Si adatta molto bene a un gran numero di <a
		href="{$enbase}/applications.html">applicazioni</a> sia
		desktop che server.</p>

	      <h2>Facile da installare</h2>

	      <p>FreeBSD pu� essere installato da una variet� di supporti,
		inclusi CD-ROM, DVD-ROM, floppy disk, nastri magnetici,
		partizioni MS-DOS&#174;, o, se hai una connessione di rete, puoi
		installarlo <i>direttamente</i> tramite FTP anonimo o NFS.
		Tutto quello di cui hai bisogno � qualche dischetto vuoto da
		1.44MB e <a
		  href="{$enbase}/doc/it_IT.ISO8859-15/books/handbook/install.html">queste
		  istruzioni</a>.</p>

	      <h2>FreeBSD � <i>libero</i></h2>

	      <a href="{$enbase}/copyright/daemon.html"><img
		  src="{$enbase}/gifs/dae_up3.gif" alt="Il Demone BSD"
		  height="81" width="72" align="right"
		  border="0"/></a>

	      <p>Sebbene tu possa aspettarti che un sistema operativo con queste
		caratteristiche venga venduto ad un prezzo molto alto, FreeBSD �
		disponibile <a
		href="{$enbase}/copyright/index.html">gratuitamente</a> e
		viene fornito con il codice sorgente completo.  Se vuoi
		comprarlo o scaricare una copia da provare, qui <a
		  href="{$enbase}/doc/it_IT.ISO8859-15/books/handbook/mirrors.html">sono
		  disponibili maggiori informazioni</a>.</p>

	      <h2>Contribuire a FreeBSD</h2>

	      <p>� facile contribuire a FreeBSD.  Tutto quello che devi fare �
		trovare una parte di FreeBSD che pensi possa essere migliorata,
		fare le modifiche (in modo attento e pulito) e reinviarle al
		Progetto, tramite send-pr o a un committer, se ne conosci uno.
		Pu� essere qualsiasi cosa, dalla documentazione alla grafica al
		codice sorgente.  Guarda l'articolo <a
		  href="{$enbase}/doc/en_US.ISO8859-1/articles/contributing/index.html">Contributing
		to FreeBSD</a> per maggiori informazioni.</p>

	      <p>Anche se non sei un programmatore, ci sono altri modi per
		contribuire a FreeBSD.  La <a
		  href="http://www.FreeBSDFoundation.org">FreeBSD Foundation</a>
		� un'organizzazione no-profit, per cui i contributi diretti sono
		completamente deducibili dalle tasse.  Contatta	<a
		  href="mailto:bod@FreeBSDFoundation.org">bod@FreeBSDFoundation.org</a>
		per maggiori informazioni o scrivi a: The FreeBSD Foundation,
		7321 Brockway Dr., Boulder, CO 80303, USA.</p>
	    </td>

	    <td></td>

	    <!-- Right-most column -->
	    <td valign="top">
	      <!-- News / release info table -->
                    <table class="panel" cellpadding="4" cellspacing="0">
		      <tr>
			<td valign="top">
			  <p><a href="{$u.rel.announce}">
			      <font size="+1" color="#990000"><b>Release di Produzione:
				  <xsl:value-of select="$rel.current"/></b></font></a><br/>
			    <small>&#183; <a href="{$enbase}/doc/it_IT.ISO8859-15/books/handbook/install.html">Guida di Installazione</a><br/>
			      &#183; <a href="{$u.rel.notes}">Note sulla Release</a><br/>
			      &#183; <a href="{$u.rel.hardware}">Note sull'Hardware</a><br/>
			      &#183; <a href="{$u.rel.installation}">Note sull'Installazione</a><br/>
			      &#183; <a href="{$u.rel.errata}">Errata Corrige</a><br/>
			      &#183; <a href="{$u.rel.migration}">Migration Guide</a></small>
			  </p>

			  <p><a href="{$u.rel2.announce}">
			      <font size="+1" color="#990000"><b>Release di Produzione (Legacy):
			    <xsl:value-of select="$rel2.current"/></b></font></a><br/>

			    <small>&#183; <a href="{$enbase}/doc/it_IT.ISO8859-15/books/handbook/install.html">Guida di Installazione</a><br/>
			      &#183; <a href="{$u.rel2.notes}">Note sulla Release</a><br/>
			      &#183; <a href="{$u.rel2.hardware}">Note sull'Hardware</a><br/>
			      &#183; <a href="{$u.rel2.installation}">Note sull'Installazione</a><br/>
			      &#183; <a href="{$u.rel2.errata}">Errata Corrige</a></small>
			  </p>

                          <p><a href="{$enbase}/snapshots/index.html">
                             <font size="+1" color="#990000"><b>Snapshot delle Release</b></font></a>
                          </p>

			  <p><font size="+1" color="#990000"><b>Novit� sul Progetto</b></font>
			    <xsl:text> </xsl:text>
			    <font color="#990000">(<a href="{$enbase}/news/news.rdf">RSS</a>)</font><br/>
			    <font size="-1">Ultimo aggiornamento:
			      <xsl:call-template name="html-index-news-project-items-lastmodified">
				<xsl:with-param name="news.project.xml-master" select="$news.project.xml" />
			      </xsl:call-template>

			      <br/>

			      <xsl:call-template name="html-index-news-project-items">
				<xsl:with-param name="news.project.xml" select="$news.project.xml" />
			      </xsl:call-template>

			      <a href="{$enbase}/news/newsflash.html">Altro...</a>
			    </font></p>

			  <p><font size="+1" color="#990000"><b>Stampa FreeBSD</b></font><br/>
			    <font size="-1">Ultimo aggiornamento:
			      <xsl:call-template name="html-index-news-press-items-lastmodified">
				<xsl:with-param name="news.press.xml-master" select="$news.press.xml" />
			      </xsl:call-template>

			      <br/>

			      <xsl:call-template name="html-index-news-press-items">
				<xsl:with-param name="news.press.xml" select="$news.press.xml" />
			      </xsl:call-template>

			      <a href="{$enbase}/news/press.html">Altro...</a>
			    </font>
			  </p>

			  <p><font size="+1" color="#990000"><b>Avvisi di Sicurezza</b></font>
			    <xsl:text> </xsl:text>
			    <font color="#990000">(<a href="{$enbase}/security/advisories.rdf">RSS</a>)</font><br/>
			    <font size="-1">Ultimo Aggiornamento:
			      <xsl:call-template name="html-index-advisories-items-lastmodified">
				<xsl:with-param name="advisories.xml" select="$advisories.xml" />
				<xsl:with-param name="type" select="'advisory'" />
			      </xsl:call-template>

			      <br/>

			      <xsl:call-template name="html-index-advisories-items">
				<xsl:with-param name="advisories.xml" select="$advisories.xml" />
				<xsl:with-param name="type" select="'advisory'" />
			      </xsl:call-template>

			      <a href="{$enbase}/security/index.html">Altro...</a>
			    </font>
			  </p>

			  <p><font size="+1" color="#990000"><b>Errata Corrige</b></font>
			    <xsl:text> </xsl:text>

			    <br/>

			    <font size="-1">Ultimo Aggiornamento:
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

	      <p>&#xa0;</p>

	      <table border="0" cellspacing="0" cellpadding="1"
		     bgcolor="#000000" width="100%">
		<tr>
		  <td>
		    <table cellpadding="4" cellspacing="0" border="0"
		      bgcolor="#FFFFFF" width="100%"><tr>
			<td>Per saperne di pi� su FreeBSD, visita la nostra
			  galleria di <a
			    href="{$enbase}/publish.html">pubblicazioni</a>
			  relative a FreeBSD o <a
			    href="{$enbase}/news/press.html">FreeBSD sulla stampa</a>,
			  e naviga all'interno di questo sito!</td>
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
		  src="{$enbase}/gifs/mall_title_medium.gif" alt="[FreeBSD Mall]"
		  height="65" width="165" border="0"/></a>
	    </td>

	    <td><a href="http://www.ugu.com/"><img
		src="{$enbase}/gifs/ugu_icon.gif" alt="[Sponsor del Unix Guru Universe]"
		height="64" width="76" border="0"/></a>
	    </td>

	    <td><a href="http://www.daemonnews.org/"><img
		  src="{$enbase}/gifs/darbylogo.gif" alt="[Daemon News]"
		  height="45" width="130" border="0"/></a>
	    </td>

	    <td><a href="{$enbase}/copyright/daemon.html"><img
		  src="{$enbase}/gifs/powerlogo.gif" alt="[Powered by FreeBSD]"
		  height="64" width="160" border="0"/></a>
	    </td>
	  </tr>
	</table>

	<table width="100%" cellpadding="0" border="0" cellspacing="0">
	  <tr>
	    <td align="left"
	      valign="top"><small><a href="{$base}/mailto.html">Contattaci</a><br/>
		<xsl:value-of select="$date"/></small></td>

	    <td align="right"
	      valign="top"><small><a href="{$enbase}/copyright/index.html">Note
		  legali</a> &#169; 1995-2005 The FreeBSD Project.<br/>
		Tutti i diritti riservati.</small></td>
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
