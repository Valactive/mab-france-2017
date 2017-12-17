<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ap="http://git.io/sym-asset-pipeline"
    exclude-result-prefixes="ap">

<xsl:import href="../utilities/master.xsl"></xsl:import>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="data">
<!-- whitch template? -->
<!-- si $rubrique et $sous-rubrique vide = home -->
<!-- si $rubrique ok et $sous-rubrique vide = $rubrique -->
<!-- si $rubrique ok et $sous-rubrique ok = $sous-rubrique -->
<!-- vrai page ? -->

<!-- <div class="ui vertical ">
	<h1><xsl:value-of select="plh-page/page/item[@lang=$language]"/></h1>
	<xsl:value-of select="page-content/entry/rubrique-parente/item"></xsl:value-of> / 
</div> -->
	<!-- nom de la rubrique parente -->

	<xsl:choose>
		<xsl:when test="$rubrique = ''">
		Bonjour
		</xsl:when>
		<xsl:otherwise>
		<!-- breadcrumb -->

									<div class="ui breadcrumb">
										<a href="{$root}{$url-lang}" class="section"><xsl:value-of select="$page-title"></xsl:value-of></a>
										<!-- rubrique ? (non cliquable) -->
										<xsl:if test="$rubrique !=''">
											<div class="divider"> / </div>
											<a href="{$root}{$url-lang}/{$rubrique}/" class="section"><xsl:value-of select="/data/rubriques-principales/entry[nom/item/@handle = $rubrique]/nom/item[@lang=$language]"></xsl:value-of></a>
											<!-- sous rubrique ? (cliquable) -->
											<xsl:if test="$s-rubrique!=''">
												<div class="divider"> / </div>
												<a href="{$root}{$url-lang}/{$rubrique}/{$s-rubrique}/" class="section"><xsl:value-of select="/data/menu-principal/entry[nom/item/@handle = $s-rubrique]/nom/item[@lang=$language]"></xsl:value-of></a>
												<!-- ss rubrique ? (non cliquable -->
											</xsl:if>
										</xsl:if>	
									</div>
									<!-- end breadcrumb -->
	<div class="ui segment" id="content">
		<div class="ui sticky">
			<div class="right ui attached rail">
				<div id="tocContents">
					<xsl:apply-templates select="page-content/entry/contenu/item[@lang=$language]" mode="tableDesMatières"/>
				</div>
			</div>
		</div>	
		<p></p>
		<p></p>

		<!-- contenu de la section page -->
		<section id="contents">
		<h1><xsl:value-of select="page-content/entry/nom/item[@lang=$language]"></xsl:value-of></h1>
			<p><xsl:copy-of select="page-content/entry/contenu/item[@lang=$language]"></xsl:copy-of></p>
		</section>
	</div>
	</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match="item" mode="numérotation">
        <xsl:value-of select="count(preceding-sibling::section) + 1"/>
        <xsl:text>.</xsl:text>
    </xsl:template>
    <xsl:template match="item" mode="tableDesMatières">
        <xsl:variable name="numéro">
            <xsl:apply-templates select="ancestor-or-self::section" mode="numérotation"/>
        </xsl:variable>
        <li>
            <p>
                <a href="#section_{$numéro}" title="{title}">
                    <xsl:value-of select="$numéro"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="title"/>
                </a>
            </p>
            <xsl:if test="item">
                <ul>
                    <xsl:apply-templates select="item" mode="tableDesMatières"/>
                </ul>
            </xsl:if>
        </li>
    </xsl:template>
</xsl:stylesheet>
