<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:exsl="http://exslt.org/common">

	<xsl:import href="../utilities/master.xsl"></xsl:import>
	<xsl:import href="../utilities/content-page-header.xsl"></xsl:import>
	<xsl:import href="../utilities/advanced-truncate.xsl"></xsl:import>
	<xsl:import href="../utilities/dates.xsl"></xsl:import>

	
	<xsl:import href="../utilities/pagination.xsl"></xsl:import>
	<xsl:param name="url-annee"></xsl:param>
	<xsl:param name="url-typo"></xsl:param>
	<xsl:param name="url-biosphere"></xsl:param>
	
	

	<xsl:template match="data">
		<div class="ui grid">
			<xsl:call-template name="content-page-header"></xsl:call-template>
			<div class="ui row">				<!-- filtre -->

				<h4 class="ui horizontal divider header">
				</h4>


				<div class="ui container" id="filtres">
					<div class="ui form">
						<div class="three fields">
							<div class="field">
								<label>Année</label>
								<select id="actualite-annee" class="ui fluid search dropdown">
									<option value="">Année</option>
									<option value="all">Toutes</option>
									<xsl:for-each select="liste-annees/entry">
										<option value="{annee/@handle}">
											<xsl:if test="$url-annee = annee/@handle">
												<xsl:attribute name="selected"></xsl:attribute>
											</xsl:if>
											<xsl:value-of select="annee"></xsl:value-of>
										</option>
									</xsl:for-each>
								</select>
							</div>
							<div class="field">
								<label>Type de publication</label>
								<select id="actualite-typo" class="ui fluid search dropdown">
									<option value="">Typologie</option>
									<option value="all">Toutes</option>
									<xsl:for-each select="liste-typo/entry">
										<option value="{@id}">
											<xsl:if test="$url-typo = @id">
												<xsl:attribute name="selected"></xsl:attribute>
											</xsl:if>
											<xsl:value-of select="nom-ref-type-de-publi/item[@lang=$language]"></xsl:value-of>
										</option>
									</xsl:for-each>
								</select>
							</div>
							<div class="field">
								<label>Réserve de biosphere</label>
								<select id="actualite-reserve" class="ui fluid search dropdown">
									<option value="">Réserve de biosphère</option>
									<option value="all">Toutes</option>
									<xsl:for-each select="liste-reserves-de-biosphere/entry">
										<option value="{@id}">
											<xsl:if test="$url-biosphere = @id">
												<xsl:attribute name="selected"></xsl:attribute>
											</xsl:if>
											<xsl:value-of select="nom/item[@lang=$language]"></xsl:value-of>
										</option>
									</xsl:for-each>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div> <!-- ui row-->
			<h4 class="ui horizontal divider header">
				<!-- entete avec icone laureat-->
				<i class="users icon"></i>
				<xsl:value-of select="/data/actualites-avec-filtre/pagination/@total-entries"/> 
				<xsl:choose>
					<xsl:when test="$current-language = 'fr'"> Actualités &amp; publications																</xsl:when>
					<xsl:otherwise> News &amp; publications</xsl:otherwise>
				</xsl:choose>
			</h4>
			<!-- ui horizontal divider hearder-->
			<div class="ui row cards-eco-acteurs">
				<!-- la grille des vignettes-->
				<div class="ui container">
					<div class="ui four link cards">
						<xsl:for-each select="actualites-avec-filtre/entry">
							<xsl:variable name="actualite-name-handle">
								<xsl:value-of select="titre/@handle"></xsl:value-of>		
							</xsl:variable>
							<xsl:variable name="actualite-name">
								<xsl:value-of select="titre"></xsl:value-of>
							</xsl:variable>
							<div class="ui card">
								<a href="{$root}/{$current-language}/actualite-et-publication/{$actualite-name-handle}/" class="card-header-image">
									<xsl:choose>
									<xsl:when test="image-a-la-une != ''">
										<xsl:variable name="img" select="image-a-la-une"/>
										<img src="{$root}/image/1/280/0/{$img/@path}/{$img/filename}" alt="image de l'actualite"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:choose>
											<xsl:when test="type-de-publication/item/@handle = 'actualite'">
											<i class=" huge copyright icon"></i>
											</xsl:when>
											<xsl:when test="type-de-publication/item/@handle = 'newsletter'">
											<i class=" huge pencil alternate icon"></i>
											</xsl:when>
											<xsl:otherwise >
											<i class=" huge eye slash icon"></i>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
									</xsl:choose>
								</a>
								<div class="content">
									<a href="{$root}/{$current-language}/actualite-et-publication/{$actualite-name-handle}/" class="header">
										<xsl:call-template name="truncate">
											<xsl:with-param name="node" select="titre"/>
											<xsl:with-param name="limit" select="35"/>
										</xsl:call-template>
									</a>
									
									<!-- description-->
								</div>
								<!--content-->
								<div class="extra content">
									<xsl:for-each select="logo-odd/item">
										<xsl:variable name="logo-odd-id">
											<xsl:value-of select="@id"/>
										</xsl:variable>
										<xsl:variable name="logo-odd" select="/data/logos-filtres-par-actualites/entry[@id=$logo-odd-id]"/>
										<div class="left floated logo-odd">
											<img class="ui image" src="{$root}/image/1/32/32{$logo-odd/image-ref-logo/@path}/{$logo-odd/image-ref-logo/filename}"/>
										</div>
									</xsl:for-each>
									<div class="right floated">
										<a href="{$root}/{$current-language}/actualite-et-publication/{$actualite-name-handle}/" class="ui mini ">
											<xsl:choose>
												<xsl:when test="$current-language = 'fr'">Lire la suite</xsl:when>
												<xsl:otherwise>Learn more</xsl:otherwise>
											</xsl:choose>
											<i class="arrow alternate circle right outline icon"></i>
										</a>
									</div>									<!--right floated-->
								</div>
								<div class="meta">
									<p class="small center aligned content">
										<xsl:variable name="dateFormat">
											<xsl:choose>
											<xsl:when test="$current-language='fr'">%0d;/%0m;/%y+;
											</xsl:when>
											<xsl:otherwise>%0m;/%0d;/%y2;</xsl:otherwise>
											</xsl:choose>
										</xsl:variable>

										<xsl:choose>
											<xsl:when test="type/item = 'Actualité' and $current-language='en'">News</xsl:when>
											<xsl:otherwise><xsl:value-of select="type-de-publication/item"/></xsl:otherwise>
										</xsl:choose> -
										<xsl:call-template name="format-date">
											<xsl:with-param name="date" select="date/date/start"/>
											<xsl:with-param name="format" select=" $dateFormat "/>
											<xsl:with-param name="language" select="$current-language"/>
										</xsl:call-template>
									</p>
								</div> <!-- meta-->
							</div>	<!--ui card-->
						</xsl:for-each>
					</div>					<!--ui four link cards-->
				</div>				<!--ui four link cards-->
			</div>			<!--ui row cards-eco-acteurs-->
			<div class="ui row cards-eco-acteurs">
				<div class="ui container grid centered">
					<!-- appel template de pagination-->
					<xsl:call-template name="pagination">
						<xsl:with-param name="pagination" select="/data/actualites-avec-filtre/pagination"/>
						<xsl:with-param name="pagination-url">
							<xsl:value-of select="concat($current-url,'/?numpage=','$')"/>
							<xsl:if test="$url-annee!=''">
								<xsl:value-of select="concat('&amp;annee=',$url-annee)"></xsl:value-of>
							</xsl:if>
							<xsl:if test="$url-typo!=''">
								<xsl:value-of select="concat('&amp;typo=',$url-typo)"></xsl:value-of>
							</xsl:if>
							<xsl:if test="$url-biosphere!=''">
								<xsl:value-of select="concat('&amp;biosphere=',$url-biosphere)"></xsl:value-of>
							</xsl:if>
						</xsl:with-param>

						<xsl:with-param name="show-range" select="'3'" />
						<xsl:with-param name="class-pagination" select="'ui pagination'" />
						<xsl:with-param name="class-previous" select="'ui item circular mini basic icon button'" />
						<xsl:with-param name="class-next" select="'ui item circular mini basic icon button'" />
					</xsl:call-template>
				</div>
			</div>
		</div>		<!-- ui grid-->
	</xsl:template>
	<xsl:template name="partage-actualite"/> <!-- partage facebook sur page actualite-->

</xsl:stylesheet>
