<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="http://www.w3.org/TR/html4/strict.dtd" doctype-public="-//W3C//DTD HTML 4.0.1//EN" indent="yes" />

<xsl:template match="/">
	<html>
		<head>
			<meta name="name" content="Websiteworkshop" />
			<meta name="description" content="Slides voor de websiteworkshop van USCKI Incognito." />
			<meta name="keywords" content="HTML,CSS,JavaScript,Git,Versiecontrole,USCKI Incognito,ICKI" />
			<meta name="author" content="Ruben D" />
			<meta name="copyright" content="2014&#xA9; ICKI" />
			<title>Websiteworkshop</title>
			<link rel="stylesheet" type="text/css" href="http://uscki.github.io/slides/index.css" />
			<xsl:if test="slide/achtergrond">
				<style>
					body {
						background-image: url('<xsl:value-of select="slide/achtergrond" />');
					}
				</style>
			</xsl:if>
			<script type="text/javascript" src="http://uscki.github.io/slides/index.js" />
		</head>
		<body onClick="volgendItem()">
			<xsl:attribute name="onLoad">init('<xsl:value-of select="slide/volgende" />','<xsl:value-of select="slide/vorige" />')</xsl:attribute>
			<div class="categoriebalk">
				<xsl:value-of select="slide/categorie" />
			</div>
			<div class="titelbalk">
				<xsl:value-of select="slide/titel" />
			</div>
			<xsl:for-each select="slide/element">
				<xsl:choose>
					<xsl:when test="@type = 'tekst'">
						<p style="visibility: hidden;">
							<xsl:attribute name="id">elem<xsl:value-of select="position()" /></xsl:attribute>
							<div>
								<span style="background-image: url('tekstAchtergrond.png');">
									<xsl:copy-of select="." />
								</span>
							</div>
						</p>
					</xsl:when>
					<xsl:when test="@type = 'bullet'">
						<ul style="visibility: hidden;">
							<xsl:attribute name="id">elem<xsl:value-of select="position()" /></xsl:attribute>
							<li>
								<span style="background-image: url('tekstAchtergrond.png');"><xsl:copy-of select="." /></span>
							</li>
						</ul>
					</xsl:when>
					<xsl:when test="@type = 'plaatje'">
						<p style="visibility: hidden;">
							<xsl:attribute name="id">elem<xsl:value-of select="position()" /></xsl:attribute>
							<img>
								<xsl:attribute name="src"><xsl:value-of select="." /></xsl:attribute>
								<xsl:if test="@grootte">
									<xsl:attribute name="style">width: <xsl:value-of select="@grootte" />%</xsl:attribute>
								</xsl:if>
							</img>
						</p>
					</xsl:when>
					<xsl:when test="@type = 'code'">
						<p style="visibility: hidden;">
							<xsl:attribute name="id">elem<xsl:value-of select="position()" /></xsl:attribute>
							<xsl:attribute name="style">visibility: hidden;
								<xsl:if test="@grootte">
									font-size: <xsl:value-of select="@grootte" />em;
								</xsl:if>
							</xsl:attribute>
							<div class="code">
								<xsl:call-template name="converteerWhitespace">
									<xsl:with-param name="string" select="." />
								</xsl:call-template>
							</div>
						</p>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</body>
	</html>
</xsl:template>

<xsl:template name="converteerWhitespace">
	<xsl:param name="string" select="." />
	<xsl:choose>
		<xsl:when test="contains($string,'&#xA;')">
			<xsl:call-template name="converteerTabs">
				<xsl:with-param name="string" select="substring-before($string,'&#xA;')" />
			</xsl:call-template>
			<br />
			<xsl:call-template name="converteerWhitespace">
				<xsl:with-param name="string" select="substring-after($string,'&#xA;')" />
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="converteerTabs">
				<xsl:with-param name="string" select="$string" />
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="converteerTabs">
	<xsl:param name="string" select="." />
	<xsl:choose>
		<xsl:when test="contains($string,'&#x9;')">
			<xsl:call-template name="converteerSpaties">
				<xsl:with-param name="string" select="substring-before($string,'&#x9;')" />
			</xsl:call-template>
			<img src="http://uscki.github.io/slides/spacer.gif" style="display: inline-block; width: 6.2%" height="1" />
			<xsl:call-template name="converteerTabs">
				<xsl:with-param name="string" select="substring-after($string,'&#x9;')" />
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="converteerSpaties">
				<xsl:with-param name="string" select="$string" />
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="converteerSpaties">
	<xsl:param name="string" select="." />
	<xsl:choose>
		<xsl:when test="contains($string,'&#x20;')">
			<xsl:value-of select="substring-before($string,'&#x20;')" />
			<img src="http://uscki.github.io/slides/spacer.gif" style="display: inline-block; width: 1.55%" height="1" />
			<xsl:call-template name="converteerSpaties">
				<xsl:with-param name="string" select="substring-after($string,'&#x20;')" />
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$string" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>