<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
    version="1.0" 
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

<xsl:template match="*"/>
<xsl:template match="svn">
<html>
  <head>
    <title>[SVN]:
      <xsl:if test="string-length(index/@name) != 0">
        <xsl:value-of select="index/@name"/>:
      </xsl:if>
      <xsl:value-of select="index/@path"/>
    </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  
    <style type="text/css">
      body {
        font-family: verdana, tahoma, arial, sans-serif;
        font-size: 11px;
        text-align: left;
        margin: 15px;
        background-color: #fff;
      }
      a, a:visited {
        color: #333;
        text-decoration: none;
      }
      a:hover {
        color: #000;
        border-bottom: 1px solid #000;
      }
      div {
        padding: 5px 0px 5px 5px
      }
      .header {
        font-size: 20px;
        font-weight: bold;
        background-color: #eee;
        padding-left: 10px;
      }
      .path {
        font-size: 15px;
        font-weight: bold;
        background-color: #fefefe;
        padding-left: 20px;
        border: 1px solid #ddd;
      }
      .updir {
        padding-left: 20px !important;
      }
      .title {
        font-size: 20px;
        font-weight: bold;
        width: 100%;
        background-color: #eee;
      }
      .dir {
      	background-color: #eee;
        padding-left: 30px;
        border-left: 1px solid #ddd;
        border-right: 1px solid #ddd;
      }
      .dir:hover {
        background-color: #fefefe;
      }
      .file {
        padding: 5px 20px 5px 40px;
      	background-color: #e3ebf4;
        border-left: 1px solid #ddd;
        border-right: 1px solid #ddd;
      }
      .file:hover {
        background-color: #f3ffff;
      }
      #footer {
        background-color: #eee;
        border: 1px solid #ddd;
        text-align: right;
        padding: 10px;
      }
  -->
  </style>
</head>

<body>
  <xsl:apply-templates />
  <div id="footer">
    Powered by 
    <xsl:element name="a">
      <xsl:attribute name="href">
        <xsl:value-of select="@href"/>
      </xsl:attribute>
      <xsl:attribute name="title">Subversion</xsl:attribute>
      <b><xsl:text>Subversion </xsl:text></b>
      <xsl:value-of select="@version"/>
    </xsl:element>. <b>XSL</b> stylesheet by <a href="http://gibbon.pl/"><b>Sija</b></a>.
  </div>
</body>
</html>
</xsl:template>

<xsl:template match="index">
  <xsl:variable name="type">
    <xsl:choose>
      <xsl:when test="@path = 'Collection of Repositories'">collection</xsl:when>
      <xsl:when test="@rev = 0">virginal</xsl:when>
    </xsl:choose>
  </xsl:variable>

  <div class="header">
    <xsl:if test="string-length(@name) != 0">
      <xsl:value-of select="@name"/>
      <xsl:if test="string-length(@rev) != 0">
        <xsl:text> &#8212; </xsl:text>
      </xsl:if>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="$type = 'collection'">
        <xsl:value-of select="@path"/>
      </xsl:when>
      <xsl:when test="$type = 'virginal'">
        Virginal repository
      </xsl:when>
      <xsl:otherwise>
        Revision <xsl:value-of select="@rev"/>
      </xsl:otherwise>
    </xsl:choose>
  </div>
  <div class="path">
    <xsl:choose>
      <xsl:when test="$type != 'collection'">
        <xsl:value-of select="@path"/>
      </xsl:when>
      <xsl:otherwise>
        [root]
      </xsl:otherwise>
    </xsl:choose>
  </div>
  <xsl:apply-templates select="updir"/>
  <xsl:apply-templates select="dir"/>
  <xsl:apply-templates select="file"/>
</xsl:template>

<xsl:template match="updir">
  <div class="dir updir">
    <b>[</b>
    <xsl:element name="a">
      <xsl:attribute name="href">..</xsl:attribute>
      <xsl:attribute name="title">Parent directory</xsl:attribute>
      <xsl:text>.. &#8593;</xsl:text>
    </xsl:element>
    <b>]</b>
  </div>
  <!-- xsl:apply-templates/ -->
</xsl:template>

<xsl:template match="dir">
  <div class="dir">
    <xsl:element name="a">
      <xsl:attribute name="href">
        <xsl:value-of select="@href"/>
      </xsl:attribute>
      <xsl:attribute name="title">
        <xsl:value-of select="@name"/>
      </xsl:attribute>
      <xsl:value-of select="@name"/>/
    </xsl:element>
  </div>
  <!-- xsl:apply-templates/ -->
</xsl:template>

<xsl:template match="file">
  <div class="file">
    <xsl:element name="a">
      <xsl:attribute name="href">
        <xsl:value-of select="@href"/>
      </xsl:attribute>
      <xsl:attribute name="title">
        <xsl:value-of select="@name"/>
      </xsl:attribute>
      <xsl:value-of select="@name"/>
    </xsl:element>
  </div>
  <!-- xsl:apply-templates/ -->
</xsl:template>
</xsl:stylesheet>