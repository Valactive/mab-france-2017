<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ap="http://git.io/sym-asset-pipeline" exclude-result-prefixes="ap">
	<xsl:import href="../utilities/master.xsl"></xsl:import>
	<xsl:import href="../utilities/home.xsl"></xsl:import>
	<xsl:import href="../utilities/page-content-with-toc.xsl"></xsl:import>
	<xsl:import href="../utilities/list-eco-acteurs.xsl"></xsl:import>
	<xsl:import href="../utilities/trophees.xsl"></xsl:import>
	<xsl:import href="../utilities/dates.xsl"></xsl:import>
	<xsl:import href="../utilities/img-resize-direction.xsl"></xsl:import>
	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
	<xsl:template match="data">
	<xsl:variable name="isEcoActeurs"><xsl:value-of select="count(/data/eco-acteurs/entry)"></xsl:value-of></xsl:variable>
	<xsl:variable name="isTrophees"><xsl:value-of select="count(/data/trophees/entry)"></xsl:value-of></xsl:variable>
		<!-- whitch template? -->
		<!-- si $rubrique et $sous-rubrique vide = home -->
		<!-- si $rubrique ok et $sous-rubrique vide = $rubrique -->
		<!-- si $rubrique ok et $sous-rubrique ok = $sous-rubrique -->
		<!-- vrai page ? -->
		<!-- <div class="ui vertical "><h1><xsl:value-of select="plh-page/page/item[@lang=$language]"/></h1><xsl:value-of select="page-content/entry/rubrique-parente/item"></xsl:value-of> /
		</div> -->
		<!-- nom de la rubrique parente -->
		<xsl:choose>

			<xsl:when test="$rubrique ='' and $s-rubrique = '' and $ss-rubrique = ''">
				<!-- home page -->
				<xsl:call-template name="home"></xsl:call-template>
				<!-- <h1><xsl:value-of select="page-content-1level/entry/nom/item[@lang=$language]"/></h1><p><xsl:copy-of select="page-content-1level/entry/contenu"></xsl:copy-of></p> -->
				<section class="menu-footer">
					<xsl:call-template name="mab-menu-principal-footer"/>
				</section>
			</xsl:when>

			<xsl:when test="/data/menu-principal/entry[nom/item[@lang=$current-language]/@handle=$s-rubrique]/@id = 22">
			<xsl:call-template name="list-eco-acteurs"></xsl:call-template>
			</xsl:when>

			<xsl:when test="$rubrique!='' and $s-rubrique!='' and $isTrophees > 0">
			<xsl:call-template name="trophees"></xsl:call-template>
			</xsl:when>	
					
			<!-- pages de contenus -->
			<xsl:otherwise>
				<xsl:call-template name="page-content-with-toc"></xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
