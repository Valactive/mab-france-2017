<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:import href="../utilities/master.xsl"></xsl:import>

	<xsl:template match="data">
		<xsl:variable name="logos-odd" select="eco-acteur-detail/entry/logo-odd" />
		<div class="ui grid">
			<div class="row page-header">
				<!-- breadcrumb -->
				<div class="bkg-breadcrumb">
					<div class="ui breadcrumb container">
						<a href="{$root}{$url-lang}" class="section">
							<i class="home icon"></i>
							<!-- <xsl:value-of select="$page-title"></xsl:value-of> -->
						</a>
						<div class="divider"> / </div>
						<xsl:value-of select="plh-page/page/item[@lang=$current-language]"></xsl:value-of>
						<div class="divider"> / </div>
						<xsl:value-of select="eco-acteur-detail/entry/eco-acteur-nom"></xsl:value-of>


					</div>
				</div>
				<!-- page header -->
				<div class="ui container">
					<h1 class="text-primary">
						<xsl:value-of select="eco-acteur-detail/entry/eco-acteur-nom" />
					</h1>
				</div>
				<!-- end page header -->
			</div>
			<!-- end breadcrumb -->
			<div class="ui container grid">
				<div class="eight wide column">
					<xsl:copy-of select="eco-acteur-detail/entry/eco-acteur-presentation"/>
				</div>
				<div class="eight wide column">
					<h1 class="ui text-primary">
								<small><xsl:value-of select="nom-biosphere-filtree-par-eco-acteur/entry/prefixe-du-nom/item[@lang=$current-language]"></xsl:value-of></small><br/>
								<xsl:value-of select="nom-biosphere-filtree-par-eco-acteur/entry/nom/item[@lang=$current-language]"/>
					</h1>
					<!-- <h3>
						<xsl:value-of select="eco-acteur-detail/entry/biosphere/item"></xsl:value-of>
					</h3>-->
					<div class="ui middle aligned divided list">
						<xsl:for-each select="$logos-odd/item">
							<xsl:variable name="logo-odd-id">
								<xsl:value-of select="@id"></xsl:value-of>
							</xsl:variable>

							<a class="item" href="{/data/logos-odd/entry[@id=$logo-odd-id]/lien-http-ref-logo}" target="_blank">
							
							<img class="ui image" src="{$root}/image/1/48/48{/data/logos-odd/entry[@id=$logo-odd-id]/image-ref-logo/@path}/{/data/logos-odd/entry[@id=$logo-odd-id]/image-ref-logo/filename}"/>
							<div class="content header"><xsl:value-of select="/data/logos-odd/entry[@id=$logo-odd-id]/nom-ref-logo"></xsl:value-of></div>
						</a>
						</xsl:for-each>	
					</div>
					
				</div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>
