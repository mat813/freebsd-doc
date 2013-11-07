<?xml version='1.0'?>

<!-- $FreeBSD$ -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version='1.0'>

  <!-- Pull in the language-independent stylesheet -->
  <xsl:import href="../../../share/xsl/freebsd-dblatex.xsl"/>

  <xsl:param name="xetex.font">
  <xsl:text>\setmainfont{IPAPMincho}
  </xsl:text>
  <xsl:text>\setsansfont{IPAPGothic}
  </xsl:text>
  <xsl:text>\setmonofont{DejaVu Sans Mono}
  </xsl:text>
  </xsl:param>

</xsl:stylesheet>
