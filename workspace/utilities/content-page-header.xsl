<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="content-page-header">
		<div class="row page-header">
				<!-- breadcrumb -->
				<div class="bkg-breadcrumb">
					<div class="ui breadcrumb container">
						<a href="{$root}/{$url-lang}" class="section">
							<i class="home icon"></i>
							<!-- <xsl:value-of select="$page-title"></xsl:value-of> -->
						</a>
						<!-- rubrique ? (non cliquable) -->
						<xsl:if test="$rubrique !=''">
							<div class="divider"> / </div>
							<xsl:value-of select="/data/rubriques-principales/entry[nom/item/@handle = $rubrique]/nom/item[@lang=$language]"></xsl:value-of>
							<!-- sous rubrique ? (non cliquable) -->
							<xsl:if test="$s-rubrique!=''">
								<div class="divider"> / </div>
								<!-- <a href="{$root}{$url-lang}/{$rubrique}/{$s-rubrique}/" class="section"> -->
								<xsl:value-of select="/data/menu-principal/entry[nom/item/@handle = $s-rubrique]/nom/item[@lang=$language]"></xsl:value-of>
								<!-- </a> -->
								<!-- ss rubrique ? (non cliquable -->
							</xsl:if>
							<xsl:if test="$ss-rubrique!=''">
								<div class="divider"> / </div>
								<xsl:value-of select="/data/menu-principal/entry[nom/item/@handle = $ss-rubrique]/nom/item[@lang=$language]"></xsl:value-of>
							</xsl:if>
						</xsl:if>
						<xsl:if test="$current-page-id != 1">
							<div class="divider"> / </div>
							<xsl:value-of select="/data/plh-page[page/@id=$current-page-id]/page/item[@lang=$current-language]"/>
						</xsl:if>
					</div>
				</div>
				<!-- page header -->
				<div class="ui container">
					<h1 class="text-primary">
						<xsl:choose>
						<xsl:when test="$current-page-id = 1">
							<xsl:value-of select="page-content/entry/nom/item[@lang=$language]" />
						</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="/data/plh-page/page/item[@lang = $current-language]"/>
							</xsl:otherwise>
						</xsl:choose>

					</h1>
				</div>
				<!-- end page header -->
			</div>
			<!-- end breadcrumb -->

	</xsl:template>
</xsl:stylesheet>