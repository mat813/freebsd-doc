<?xml version="1.0" encoding="ISO-8859-1" ?>

<!-- $FreeBSD: www/en/gnome/includes.navgnome.xsl,v 1.5 2006/04/30 22:12:51 marcus Exp $ -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">


<xsl:variable name="gnome_sidenav">
	<div id="SIDEWRAP">

	<div id="SIDENAV">
		<h2 class="blockhide">Section Navigation</h2>
		<ul>
			<li><a href="{$base}/gnome/index.html">FreeBSD/GNOME</a>
				<ul>
					<li><a href="{$base}/gnome/docs/faq2.html#q1">Installation Instructions</a></li>
					<li><a href="{$base}/gnome/docs/faq214.html#q2">Upgrade Instructions</a></li>
					<li><a href="{$base}/gnome/../ports/gnome.html">Available Applications</a></li>
					<li><a href="{$base}/gnome/docs/volunteer.html">How to Help</a></li>
					<li><a href="{$base}/gnome/docs/bugging.html">Reporting a Bug</a></li>
					<li><a href="{$base}/gnome/screenshots.html">Screenshots</a></li>
					<li><a href="{$base}/gnome/contact.html">Contact Us</a></li>
				</ul>
			</li>
			<li><a href="{$base}/gnome/index.html">Documentation</a>
				<ul>
					<li><a href="{$base}/gnome/docs/faq2.html">FAQ</a></li>
					<li><a href="{$base}/gnome/docs/faq214.html">2.12 to 2.14 Upgrade FAQ</a></li>
					<li><a href="{$base}/gnome/docs/develfaq.html">Development Branch FAQ</a></li>
					<li><a href="{$base}/gnome/docs/porting.html">Creating Ports</a></li>
					<li><a href="{$base}/gnome/docs/faq214.html#q5">Known Issues</a></li>
				</ul>
			</li>
		</ul>
	</div> <!-- sidenav -->

	</div> <!-- sidewrap -->
</xsl:variable>

</xsl:stylesheet>
