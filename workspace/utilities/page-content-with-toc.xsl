<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/content-page-header.xsl"></xsl:import>
	<xsl:template name="page-content-with-toc">
		<div class="ui grid">
			<xsl:call-template name="content-page-header"></xsl:call-template>
			<!-- toc -->
			<div class="main ui container">

				<div class="ui segment" id="content">
					<div class="ui right rail very close">
						<div class="ui sticky">
							<div id="tocContents">
								<strong>Dans cette page</strong>
							</div>
						</div>
					</div>
					<!-- contenu de la section page -->
					<!-- accueil sinon s-rubrique ou ss-rubrique -->
					<!-- <section id="contents"> -->

					<xsl:copy-of select="page-content/entry/contenu/item[@lang=$language]"></xsl:copy-of>
					<!-- </section> -->
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>