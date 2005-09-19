<?xml version="1.0" encoding="euc-jp"?>

<!-- $FreeBSD: www/ja/share/sgml/templates.usergroups.xsl,v 1.1 2005/09/18 06:25:00 hrs Exp $ -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:cvs="http://www.FreeBSD.org/XML/CVS"
  exclude-result-prefixes="cvs">

  <!-- must point to master copy, www/share/sgml/templates.usergroups.xsl -->
  <xsl:import href="../../../share/sgml/templates.usergroups.xsl" />

  <xsl:output type="xml" encoding="euc-jp"
	      indent="yes"/>

  <!-- template: "html-usergroups-list-header"
       print header part of usergroup listing (l10n) -->

  <xsl:template name="html-usergroups-list-header">
    <p>FreeBSD �Ϲ����Ȥ��Ƥ��ꡢ������ˤ�������Υ桼�����롼�פ�����ޤ���
      ���Υꥹ�Ȥ˺ܤäƤ��ʤ��桼�����롼�פ�¸�ΤǤ����顢
      ���ҡ�<a href="http://www.freebsd.org/send-pr.html">�㳲���</a
	>�� www ���ƥ����ȤäƤ��Τ餻����������
      ���ϤǤ���� HTML �����ǡ���ñ�ʾҲ��ź����褦�ˤ��ꤤ���ޤ���</p>

    <h3>�ϰ�</h3>
  </xsl:template>

</xsl:stylesheet>
