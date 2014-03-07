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
			<link rel="stylesheet" type="text/css" href="index.css" />
			<script type="text/javascript" src="index.js" />
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
								<xsl:value-of select="." />
							</div>
						</p>
					</xsl:when>
					<xsl:when test="@type = 'bullet'">
						<ul style="visibility: hidden;">
							<xsl:attribute name="id">elem<xsl:value-of select="position()" /></xsl:attribute>
							<li>
								<xsl:value-of select="." />
							</li>
						</ul>
					</xsl:when>
					<xsl:when test="@type = 'plaatje'">
						<p style="visibility: hidden;">
							<xsl:attribute name="id">elem<xsl:value-of select="position()" /></xsl:attribute>
							<img>
								<xsl:attribute name="src"><xsl:value-of select="." /></xsl:attribute>
							</img>
						</p>
					</xsl:when>
					<xsl:when test="@type = 'code'">
						<p style="visibility: hidden;">
							<xsl:attribute name="id">elem<xsl:value-of select="position()" /></xsl:attribute>
							<div class="code">
								<xsl:value-of select="." />
							</div>
						</p>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</body>
	</html>
</xsl:template>

</xsl:stylesheet>