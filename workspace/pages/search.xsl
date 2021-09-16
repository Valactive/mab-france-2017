<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"></xsl:import>
<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />



<xsl:template match="data">

		<div >
			<div class="ui container grid "  >
				<section class="row page-header ui grid">
					<h1>
					<xsl:choose>
						<xsl:when test="$current-language='fr'">Recherche sur </xsl:when>
						<xsl:otherwise>Search on </xsl:otherwise>
					</xsl:choose>
					"<xsl:value-of select="/data/search/@keywords"/>"
					</h1>
				</section>
				
					<xsl:for-each select="/data/search/entry">
					<div class="extra content ui mini ui grid" >
						<xsl:choose>
							<!-- biosphere-->
							<xsl:when test="@section = 'biosphere'">
								<a href="{$root}/{$current-language}/{/data/navigation/page[@id=4]/item[@lang=$current-language]/@handle}/{nom[@lang=$current-language]/@handle}" target="_blank" title="En savoir plus"> 
									<xsl:value-of select="$root"/>/
									<xsl:value-of select="$current-language"/>/
									<xsl:value-of select="/data/navigation/page[@id=4]/item[@lang=$current-language]"/>/
									<xsl:value-of select="nom[@lang=$current-language]/@handle"/>
									<i class="arrow alternate circle right outline icon"></i>
									<br/>
									<strong>Biosphere</strong> <!-- <xsl:value-of select="nom"/> -->
									<div class="image">
										<img src="{$root}/image/1/100/0{/data/biosphere-logo-officiel/entry/image-ref-logo/@path}/{/data/biosphere-logo-officiel/entry/image-ref-logo/filename}" alt="{/data/biosphere-logo-officiel/entry/nom-ref-logo}"/>
										
									</div>
								</a>
							</xsl:when>
							<!-- eco-acteur-->
							<xsl:when test="@section = 'eco-acteurs'">
								<a href="{$root}/{$current-language}/{/data/navigation/page[@id=9]/item[@lang=$current-language]/@handle}/{eco-acteur-nom[@lang=$current-language]/@handle}" target="_blank" title="En savoir plus">
									<xsl:value-of select="$root"/>/
									<xsl:value-of select="$current-language"/>/
									<xsl:value-of select="/data/navigation/page[@id=9]/item[@lang=$current-language]"/>/
									<xsl:value-of select="eco-acteur-nom[@lang=$current-language]/@handle"/>
									<i class="arrow alternate circle right outline icon"></i>
									<br/>
									<strong>Eco-acteur</strong> <!-- <xsl:value-of select="eco-acteur-nom"/> -->
									<div class="image">
										<img src="{$root}/image/1/100/0/{image-a-la-une/@path}/{image-a-la-une/filename}" alt="image à la une"/>
									</div>
								</a>
							</xsl:when>
							<!-- page-->
							<xsl:when test="@section = 'page'">
								<xsl:choose>
									<!-- page niveau 1-->
									<xsl:when test="rubrique-parente/item/@handle != ''">
										<a href="{$root}/{$current-language}/{rubrique-parente/item/@handle}/{nom[@lang=$current-language]/@handle}" target="_blank" title="En savoir plus">
											<xsl:value-of select="$root"/>/
											<xsl:value-of select="$current-language"/>/
											<xsl:value-of select="rubrique-parente/item/@handle"/>/
											<xsl:value-of select="nom[@lang=$current-language]/@handle"/>
											<i class="arrow alternate circle right outline icon"></i>
										</a>
									</xsl:when>
									<!-- page niveau 2-->
									<xsl:when test="menu-niveau-2-page/item/@handle !=''">
										<xsl:variable name="page">
											<xsl:value-of select="nom/@handle"/>
										</xsl:variable>
										<xsl:variable name="nom-page">
											<xsl:value-of select="nom[@lang=$current-language]"/>
										</xsl:variable>
										<xsl:variable name="sous-menu">
											<xsl:value-of select="menu-niveau-2-page/item/@handle"/>
										</xsl:variable>
										<xsl:variable name="id-sous-menu">
											<xsl:value-of select="menu-niveau-2-page/item/@id"/>
										</xsl:variable>
										<xsl:variable name="id-menu">
											<xsl:value-of select="$id-sous-menu"/>
										</xsl:variable>
										<xsl:variable name="menu">
											<xsl:value-of select="/data/menu-principal/entry[@id=$id-menu]/rubrique-parente/item/@handle"/>
										</xsl:variable>
										<xsl:variable name="nom-menu">
											<xsl:value-of select="/data/menu-principal/entry[@id=$id-menu]/rubrique-parente/item"/>
										</xsl:variable>
										<a href="{$root}/{$current-language}/{$menu}/{$sous-menu}/{$page}" target="_blank" title="En savoir plus">
											<xsl:value-of select="$root"/>/
											<xsl:value-of select="$current-language"/>/
											<xsl:value-of select="$menu"/>/
											<xsl:value-of select="$sous-menu"/>/
											<xsl:value-of select="$page"/>										
											<!-- Page :  <xsl:value-of select="$nom-page"/> <br/>
											dans le menu :  <xsl:value-of select="$nom-page"/> <br/>
											dans le sous menu : <xsl:value-of select="$nom-menu"/> -->
											<i class="arrow alternate circle right outline icon"></i>
										</a>
									</xsl:when>
									<!-- page de symphony-->
									<xsl:otherwise>
										<a href="{$root}/{$current-language}/{rubrique-parente/item/@handle}/{nom[@lang=$current-language]/@handle}" target="_blank" title="En savoir plus">
											<xsl:value-of select="$root"/>/
											<xsl:value-of select="$current-language"/>/
											<xsl:value-of select="nom[@lang=$current-language]/@handle"/>/
											<!-- Page : <xsl:value-of select="nom[@lang=$current-language]"/> -->
											<i class="arrow alternate circle right outline icon"></i>
											</a>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<!-- lauréats des trophés -->
							<xsl:when test="@section = 'laureat'">
								<a href="{$root}/{$current-language}/{/data/navigation/page[@id=10]/item[@lang=$current-language]/@handle}/{laureat-nom[@lang=$current-language]/@handle}" target="_blank" title="En savoir plus"> 
									<xsl:value-of select="$root"/>/
									<xsl:value-of select="$current-language"/>/
									<xsl:value-of select="/data/navigation/page[@id=10]/item[@lang=$current-language]"/>/
									<xsl:value-of select="laureat-nom[@lang=$current-language]/@handle"/>
									<i class="arrow alternate circle right outline icon"></i>
									<br/>
									<strong>Lauréat des trophés</strong> <!-- <xsl:value-of select="nom"/> -->
									<div class="image">
										<img src="{$root}/image/1/100/0/{image-a-la-une/@path}/{image-a-la-une/filename}" alt="image à la une"/>
									</div>
								</a>
							</xsl:when>							
							<!-- actualité / publication-->
							<xsl:when test="@section = 'actualites-publications'">
								<a href="{$root}/{$current-language}/{/data/navigation/page[@id=8]/item[@lang=$current-language]/@handle}/{titre/@handle}" target="_blank" title="En savoir plus"> 
									<xsl:value-of select="$root"/>/
									<xsl:value-of select="$current-language"/>/
									<xsl:value-of select="/data/navigation/page[@id=8]/item[@lang=$current-language]"/>/
									<xsl:value-of select="titre/@handle"/>
									<i class="arrow alternate circle right outline icon"></i>
									<br/>
									<strong>Actualité/publication</strong> <!-- <xsl:value-of select="nom"/> -->
									<div class="image">
										<img src="{$root}/image/1/100/0/{image-a-la-une/@path}/{image-a-la-une/filename}" alt="image à la une"/>
									</div>
								</a>
							</xsl:when>
							<xsl:otherwise>
								<strong>Il y a une anomalie sur la section <xsl:value-of select="@section"></xsl:value-of>,</strong>
								<br/> faire une copie d'écran et de l'url, puis envoyer au webmaster staminh@valactive.com<br/>Merci
								<br/>
							</xsl:otherwise>
						</xsl:choose>
						<p><xsl:value-of select="excerpt" /> </p>
						<br/>
					</div > <!--   -->
					</xsl:for-each>

			
			</div> <!-- class="ui container ui segment"  id="content" -->
		</div> <!-- class="ui grid" -->
</xsl:template>
<xsl:template name="partage-facebook"/> <!-- partage facebook sur page actualite-->

</xsl:stylesheet>

