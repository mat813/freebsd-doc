<?xml version="1.0" encoding="EUC-JP" ?>
<!-- Original revision: 1.3 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:import href="../includes.xsl"/>

  <!-- Should be set on the command line, specifies the type of entries to
       include in the output.  One of "commercial", "nonprofit", or 
       "personal" -->
  <xsl:param name="type"/>

  <xsl:variable name="base" select="'..'"/>
  
  <xsl:variable name="date" select="'$FreeBSD: www/ja/gallery/gallery-entry.xsl,v 1.3 2002/05/13 20:09:03 hrs Exp $'"/>

  <xsl:output type="html" encoding="EUC-JP"/>

  <xsl:variable name="title">
    <xsl:choose>
      <xsl:when test="$type = 'commercial'">Gallery - ��������</xsl:when>
      <xsl:when test="$type = 'nonprofit'">Gallery - ���������</xsl:when>
      <xsl:when test="$type = 'personal'">Gallery - �Ŀͥ�����</xsl:when>
      <xsl:otherwise>
	Unknown value for $type: <xsl:value-of select="$type"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="commercial-intro">
    <p>FreeBSD �ϳ׿�Ū�� Internet ���ץꥱ�������䥵���ӥ���
      ��������󶡤��Ƥ��ޤ���
      ���Υ����꡼�� FreeBSD �����Ѥ��Ƥ��뾦�����ΤΥ��硼������
      �ȤʤäƤ��ޤ���
      FreeBSD �� <b>���ʤ���</b> ���򤷤Ƥ����Τ��򸫤Ĥ��Ƥ���������
    </p>
  </xsl:variable>

  <xsl:variable name="nonprofit-intro">
    <p>FreeBSD �ϳ׿�Ū�� Internet ���ץꥱ�������䥵���ӥ���
      ��������󶡤��Ƥ��ޤ���
      ���Υ����꡼�� FreeBSD �����Ѥ��Ƥ�����������ΤΥ��硼������
      �ȤʤäƤ��ޤ���
      FreeBSD �� <b>���ʤ���</b> ���򤷤Ƥ����Τ��򸫤Ĥ��Ƥ���������
    </p>
  </xsl:variable>

  <xsl:variable name="personal-intro">
    <p>FreeBSD �ϳ׿�Ū�� Internet ���ץꥱ�������䥵���ӥ���
      ��������󶡤��Ƥ��ޤ���
      ���Υ����꡼�� FreeBSD �����Ѥ��Ƥ���ĿͤΥ��硼������
      �ȤʤäƤ��ޤ���
      FreeBSD �� <b>���ʤ���</b> ���򤷤Ƥ����Τ��򸫤Ĥ��Ƥ���������
    </p>
  </xsl:variable>

  <xsl:template match="gallery">
    <html>
      <xsl:copy-of select="$header1"/>
      <body xsl:use-attribute-sets="att.body">
	<xsl:copy-of select="$header2"/>

	<xsl:choose>
	  <xsl:when test="$type = 'commercial'">
	    <xsl:copy-of select="$commercial-intro"/>
	  </xsl:when>
	  <xsl:when test="$type = 'nonprofit'">
	    <xsl:copy-of select="$nonprofit-intro"/>
	  </xsl:when>
	  <xsl:when test="$type = 'personal'">
	    <xsl:copy-of select="$personal-intro"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <p>No clue what to put here for $type = 
	      <xsl:value-of select="$type">.</xsl:value-of></p>
	  </xsl:otherwise>
	</xsl:choose>

	<ul>
	  <!-- Select all entries of the correct type, doing a case
               insensitive sort -->
	  <xsl:apply-templates select="entry[@type = $type]">
	    <xsl:sort select="translate(string(./name),
		      'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 
		      'abcdefghijklmnopqrstuvwxyz')"/>
	  </xsl:apply-templates>
	</ul>

	<xsl:copy-of select="$footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="entry">
    <xsl:variable name="url"><xsl:value-of select="url"/></xsl:variable>
    <li><a href="{$url}"><b><xsl:value-of select="name"/></b></a> --
      <xsl:value-of select="descr"/></li>
  </xsl:template>
</xsl:stylesheet>
