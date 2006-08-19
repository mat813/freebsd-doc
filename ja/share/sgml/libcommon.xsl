<?xml version="1.0" encoding="euc-jp"?>
<!DOCTYPE xsl:stylesheet PUBLIC "-//FreeBSD//DTD FreeBSD XSLT 1.0 DTD//EN"
				"http://www.FreeBSD.org/XML/www/share/sgml/xslt10-freebsd.dtd">
<!-- $FreeBSD$ -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="http://www.FreeBSD.org/XML/www/share/sgml/libcommon.xsl"/>

  <!-- default format for date string -->
  <xsl:param name="param-l10n-date-format-YMD"
             select="'%Y ǯ %M %D ��'" />
  <xsl:param name="param-l10n-date-format-YM"
             select="'%Y ǯ %M'" />
  <xsl:param name="param-l10n-date-format-MD"
             select="'%M %D ��'" />

  <!-- template: "html-news-list-newsflash-preface" -->
  <xsl:template name="html-news-list-newsflash-preface">
    <img src="&base;/gifs/news.jpg" align="right" border="0" width="193"
      height="144" alt="FreeBSD News"/>

    <p>FreeBSD �ϵ�®��ȯŸ��³���륪�ڥ졼�ƥ��󥰥����ƥ�ʤΤǡ�
      �ǿ��ο���ˤĤ��ƹԤ��Τ����ݤˤʤ��������ޤ���͡�
      �����̤ˤʤ뤿��ˡ����Υڡ��������Ū�˥����å�����褦�ˤ��ޤ��礦��
      <a href="&base;/doc/en_US.ISO8859-1/books/handbook/eresources.html#ERESOURCES-MAIL">
	freebsd-announce �᡼��󥰥ꥹ��</a>����ɤ���Ȥ褤�����Τ�ޤ���</p>

    <p>���줾��Υץ������Ȥκǿ�����ϡ����γƥ����֥ڡ�����������������</p>

    <ul>
      <li><a href="&base;/java/newsflash.html">&java; on FreeBSD</a></li>
      <li><a href="http://freebsd.kde.org/">KDE on FreeBSD</a></li>
      <li><a href="&base;/gnome/newsflash.html">GNOME on FreeBSD</a></li>
    </ul>

    <p>�����ߡ������ƾ���Υ�꡼���ξܺ٤ˤĤ��Ƥϡ�
      <strong><a href="&base;/releases/index.html">��꡼������</a></strong>
      �Υڡ�����������������</p>

    <p>FreeBSD �������ƥ�����ˤĤ��Ƥϡ�<a href="&base;/security/#adv">
	�������ƥ�����</a> �Υڡ�����������������</p>
  </xsl:template>

  <!-- template: "html-news-list-newsflash-homelink" -->
  <xsl:template name="html-news-list-newsflash-homelink">
    <a href="news.html">�˥塼���ڡ���</a>
  </xsl:template>

  <xsl:template name="html-news-make-olditems-list">
    <p>���Υ˥塼��:
      <a href="2002/index.html">2002</a>,
      <a href="2001/index.html">2001</a>,
      <a href="2000/index.html">2000</a>,
      <a href="1999/index.html">1999</a>,
      <a href="1998/index.html">1998</a>,
      <a href="1997/index.html">1997</a>,
      <a href="1996/index.html">1996</a></p>
  </xsl:template>

  <!-- template: "html-news-list-press-preface" -->
  <xsl:template name="html-news-list-press-preface">
    <p>�����˺ܤäƤ��ʤ� FreeBSD �˴�Ϣ�����˥塼��������¸���ʤ顢
      �桹�������˺ܤ�����褦�˾ܺ٤�
      <a href="mailto:www@freebsd.org">www@FreeBSD.org</a> �ޤ�
      (�Ѹ��) ���äƤ���������</p>
  </xsl:template>

  <!-- for l10n -->
  <xsl:template name="html-news-month-headings">
    <xsl:param name="year" />
    <xsl:param name="month" />

    <xsl:value-of select="concat($year, ' ǯ ', $month)" />
  </xsl:template>

  <xsl:template name="html-events-list-preface">
    <p>iCalendar �������б������������塼��������եȥ�������ȤäƤ���ʤ顢
      ���٥�Ȥ򽸤᤿
      <a href="&enbase;/events/events.ics">FreeBSD ���٥�ȥ�������</a>
      �����ѤǤ��ޤ���</p>
  </xsl:template>

  <xsl:template name="html-events-list-upcoming-heading">
    <h2 id="upcoming">Current/Upcoming Events:</h2>
  </xsl:template>

  <xsl:template name="html-events-list-past-heading">
    <h2 id="past">Past Events:</h2>
  </xsl:template>
</xsl:stylesheet>
