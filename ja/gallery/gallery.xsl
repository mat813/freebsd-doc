<?xml version="1.0" encoding="EUC-JP" ?>
<!-- Original revision: 1.1 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:import href="../includes.xsl"/>

  <xsl:variable name="base" select="'..'"/>
  <xsl:variable name="title" select="'The FreeBSD Gallery'"/>  
  <xsl:variable name="date" select="'$FreeBSD$'"/>

  <xsl:output type="html" encoding="EUC-JP"/>

  <xsl:template match="gallery">
    <html>
      <xsl:copy-of select="$header1"/>
      <body xsl:use-attribute-sets="att.body">
	<xsl:copy-of select="$header2"/>

	<p>�������, �׿�Ū�ʥ��󥿡��ͥåȥ��ץꥱ�������䥵���ӥ���
	  FreeBSD ��ư��Ƥ��ޤ�. ���Υ����꡼�� FreeBSD �����Ѥ��Ƥ���
	  <xsl:value-of select="count(//entry)"/> ���ȿ���Ŀͤΰ����Ǥ�.
	  ���� FreeBSD �� <b>���ʤ��Τ����</b>�����Ǥ���Τ���
	  ��ä�Ĵ�٤ƤߤƲ�����!</p>

	<ul>
	  <li><a href="cgallery.html"><xsl:value-of 
              select="count(//entry[@type='commercial'])"/> �ξ�������
	      </a></li>
	  <li><a href="npgallery.html"><xsl:value-of
              select="count(//entry[@type='nonprofit'])"/> �����������
              </a></li>
          <li><a href="pgallery.html"><xsl:value-of
              select="count(//entry[@type='personal'])"/> �θĿͥ�����
	      </a></li>
	</ul>

	<p>���ʤ��Υ����Ȥ򤳤Υꥹ�Ȥ��ɲä���ˤ�, ñ��
	  <a href="http://www.FreeBSD.org/cgi/gallery.cgi">���Υե�����</a>
	  ����������Ǥ�.</p>

	<table width="100%" border="0">
	  <tr>
	    <td align="left"><img src="../../gifs/powerlogo.gif" alt=""
				  align="left" border="0"/></td>

	    <td align="left"><img src="../../gifs/power-button.gif" alt="" 
				  align="left" border="0"/></td>
	  </tr>

	  <tr>
	    <td align="right"><img src="../../gifs/pbfbsd2.gif" width="171" 
				   height="64" border="0"/></td>

	    <td align="right"><img src="../../gifs/powerani.gif" width="171"
				   height="64"/></td>

	    <td align="right"><img src="../../gifs/fhp_mini.jpg" width="171"
				   height="64"/></td>
	  </tr>
	</table>
	
	<p align="center"><img src="../../gifs/banner1.gif" alt="" 
			       width="446" height="63" border="0"/></p>

	<p align="center"><img src="../../gifs/banner2.gif" alt="" width="310" 
			       height="63" border="0"/></p>

	<p align="center"><img src="../../gifs/banner3.gif" alt="" width="250" 
			       height="35" border="0"/></p>

	<p align="center"><img src="../../gifs/banner4.gif" alt="" width="225" 
			       height="46" border="0"/></p>

	<p>��� "Powered by FreeBSD" �Υ���
	  <a href="../../gifs/powerlogo.gif">��������ɤ���</a> FreeBSD
	  �����Ѥ��Ƥ���Ŀͤ侦�ѤΥۡ���ڡ�����ɽ�������Ƥ⹽���ޤ���.
	  ���Υ��ޤ��� <a href="../copyright/daemon.html">BSD �ǡ����</a>
	  ����Ӥ������ʪ�������Ū�ǻ��Ѥ������
	  <a href="mailto:taob@risc.org">Brian Tao</a> ("power"���κ��) ��
	  <a href="mailto:mckusick@mckusick.com">Marshall Kirk McKusick</a>
	  (BSD �ǡ����ξ�������Ͽ��ɸ�ݻ���) �ؤξ�����ɬ�פǤ�.</p>

	<xsl:copy-of select="$footer"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>