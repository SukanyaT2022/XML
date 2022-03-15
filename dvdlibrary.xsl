<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"
doctype-system="about:legacy-compat"
encoding="UTF-8"
indent="yes" />
<xsl:variable name="currentYear" select="2022" />
<xsl:template match="/">
<html>
<head>
<title>Jenna's DVD Collection</title>
<link href="dvdlibrarystyles.css"
rel="stylesheet" type="text/css" />
</head>
<body>
<header>
<h1>Jenna's DVD Collection</h1>
</header>
<section>
<h1>DVD List</h1>
<xsl:apply-templates select="dvdlibrary/dvd">
<xsl:sort select="title" />
</xsl:apply-templates>
</section>
</body>
</html>

</xsl:template>
<xsl:template match="dvd">
<article>
<h1>
<xsl:value-of select="title" />
</h1>
<h2>
Featuring:
<xsl:for-each select="characters/character">
[
<xsl:value-of select="." />
]
</xsl:for-each>
</h2>
<p>
Bonus Features:
<span>
<xsl:for-each select="bonus/feature">
<xsl:value-of select="." />/
</xsl:for-each>
</span>
</p>
<table>
<tr>
<th>Price</th>
<th>Location</th>
<th>Release Date</th>
<th>Years Since Release</th>
</tr>
<tr>
<td><xsl:value-of select="format-number(purchased/price, '$#,#0.00')" /></td>
<td><xsl:value-of select="purchased/location" /></td>
<td><xsl:value-of select="year" /></td>
<td><xsl:value-of select="$currentYear - year -1" /></td>
</tr>
<tr>
<td colspan="4">
<p>My Rating:
<xsl:call-template name="drawStars">
<xsl:with-param name="starFile" select="'star.png'" />
<xsl:with-param name="starCount" select="rating" />
<!--with param is like variable name-->
</xsl:call-template>
</p>
</td>
</tr>
</table>
</article>
</xsl:template>
<xsl:template name="drawStars">
<xsl:param name="starFile" />
<xsl:param name="starCount" />
<xsl:if test="$starCount > 0">
<!--starcount-help us to count how many star to put-->
<img src="{$starFile}" alt="" />
<!--actual star images that need to be showed-->
<xsl:call-template name="drawStars">
<xsl:with-param name="starFile" select="$starFile" />
<xsl:with-param name="starCount" select="$starCount - 1" />
</xsl:call-template>
</xsl:if>
</xsl:template>
</xsl:stylesheet>