<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"></xsl:import>
<xsl:import href="../utilities/content-page-header.xsl"></xsl:import>
<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="data">
		<div class="ui grid">
			<xsl:call-template name="content-page-header"></xsl:call-template>
			<!-- toc -->
			<div class="main ui container">

				<div class="ui segment" id="content">
					<div class="ui right rail very close">
						<div class="ui sticky">
							<div id="tocContents">
								<xsl:choose>
									<xsl:when test="$current-language = 'fr'"><strong>Dans cette page</strong>															</xsl:when>
									<xsl:otherwise><strong>In this page</strong></xsl:otherwise>
								</xsl:choose>
							</div> <!-- topContents-->
						</div>
					</div>
					<!-- contenu de la section page -->
					<!-- accueil sinon s-rubrique ou ss-rubrique -->
					<!-- <section id="contents"> -->

					<xsl:copy-of select="mentions-legales/entry/contenu/item[@lang=$language]"></xsl:copy-of>
					<!-- </section> -->
				</div>
			</div>
		</div>
</xsl:template>
<xsl:template name="partage-facebook"/> <!-- partage facebook sur page actualite-->

</xsl:stylesheet>
