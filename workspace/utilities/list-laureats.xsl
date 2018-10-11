<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:exsl="http://exslt.org/common">

	<xsl:import href="../utilities/content-page-header.xsl"></xsl:import>
	<xsl:import href="../utilities/advanced-truncate.xsl"></xsl:import>
	<xsl:import href="../utilities/pagination.xsl"></xsl:import>
	<xsl:param name="url-biosphere"></xsl:param>
	<xsl:param name="url-odd"></xsl:param>
	<xsl:param name="url-annee"></xsl:param>

	<xsl:template name="list-laureats">
		<div class="ui grid">
			<xsl:call-template name="content-page-header"></xsl:call-template>
	<!-- filtre -->
			<div class="ui row">
				<h4 class="ui horizontal divider header">
				</h4>
				<div class="ui container" id="filtres">
					<div class="ui form">
						<div class="three fields">
							<div class="field">
								<label>Année</label>
								<select id="laureat-annee" class="ui fluid search dropdown">
									<option value="">Année</option>
									<option value="all">Toutes</option>
									<xsl:for-each select="annees-filtrees-par-laureats/entry">
										<option value="{@id}">
											<xsl:if test="$url-annee = @id">
												<xsl:attribute name="selected"></xsl:attribute>
											</xsl:if>
											<xsl:value-of select="annee"></xsl:value-of>
										</option>
									</xsl:for-each>
								</select>
							</div>
							<div class="field">
								<label>Réserve de biosphere</label>
								<select id="laureat-reserve" class="ui fluid search dropdown">
									<option value="">Réserve de biosphère</option>
									<option value="all">Toutes</option>
									<xsl:for-each select="biospheres-filtrees-par-laureats/entry">
										<option value="{@id}">
											<xsl:if test="$url-biosphere = @id">
												<xsl:attribute name="selected"></xsl:attribute>
											</xsl:if>
											<xsl:value-of select="nom/item[@lang=$language]"></xsl:value-of>
										</option>
									</xsl:for-each>
								</select>
							</div>
							<div class="field">
								<label>Objectifs de Développement Durable</label>
								<div id="laureat-odd" class="ui fluid search selection dropdown">
									<i class="dropdown icon"></i>
									<xsl:choose>
										<xsl:when test="$url-odd != ''">
											<div class="text">
												<img class="ui mini image" src="{$root}/image/1/32/32{/data/logos-odd/entry[@id=$url-odd]/image-ref-logo/@path}/{/data/logos-odd/entry[@id=$url-odd]/image-ref-logo/filename}"/>
												<xsl:value-of select="/data/logos-odd/entry[@id=$url-odd]/nom-ref-logo"></xsl:value-of>
											</div>
										</xsl:when>
										<xsl:otherwise>
											<div class="default text">
													Objectifs de Développement Durable
											</div>
										</xsl:otherwise>
									</xsl:choose>
									<div class="menu">
										<div class="item" data-value="all">Tous</div>
										<xsl:for-each select="logos-odd/entry">
											<div class="item" data-value="{@id}">
												<img class="ui mini image" src="{$root}/image/1/32/32{image-ref-logo/@path}/{image-ref-logo/filename}"/>
												<xsl:value-of select="nom-ref-logo"></xsl:value-of>
											</div>
										</xsl:for-each>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ui row-->
			<h4 class="ui horizontal divider header">
				<!-- entete avec icone laureat-->
				<i class="users icon"></i>
				<xsl:value-of select="/data/laureats-avec-filtre/pagination/@total-entries"/> 
				<xsl:choose>
					<xsl:when test="$current-language = 'fr'"> Lauréats																	</xsl:when>
					<xsl:otherwise> Winners</xsl:otherwise>
				</xsl:choose>
			</h4>
			<!-- ui horizontal divider hearder-->
			<div class="ui row cards-eco-acteurs">
				<!-- la grille des vignettes-->
				<div class="ui container">
					<div class="ui four link cards">
						<xsl:for-each select="laureats-avec-filtre/entry">
							<xsl:variable name="laureat-name-handle">
								<xsl:choose>
									<xsl:when test="laureat-nom/item[@lang=$language]!=''">
										<xsl:value-of select="laureat-nom/item[@lang=$language]/@handle"></xsl:value-of>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="laureat-nom/item[@lang='fr']/@handle"></xsl:value-of>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="laureat-name">
								<xsl:choose>
									<xsl:when test="laureat-nom/item[@lang=$language]!=''">
										<xsl:value-of select="laureat-nom/item[@lang=$language]"></xsl:value-of>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="laureat-nom/item[@lang='fr']"></xsl:value-of>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>

							<div class="ui card">
								<a href="{$root}/{$current-language}/laureat/{$laureat-name-handle}/" class="card-header-image">
									<xsl:variable name="img" select="image-a-la-une"/>
									<img src="{$root}/image/1/280/0/{$img/@path}/{$img/filename}" alt="image du laureat-nom"/>
								</a>
								<div class="content">
									<a href="{$root}/{$current-language}/laureat/{$laureat-name-handle}/" class="header">

										<xsl:value-of select="$laureat-name"/>
									</a>
									<div class="description">
										<xsl:choose>
											<xsl:when test="laureat-presentation/item[@lang=$language]!=''">
												<xsl:call-template name="truncate">
													<xsl:with-param name="node" select="laureat-presentation/item[@lang=$language]"/>
													<xsl:with-param name="limit" select="45"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="truncate">
													<xsl:with-param name="node" select="laureat-presentation/item[@lang='fr']"/>
													<xsl:with-param name="limit" select="45"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</div>
									<!-- description-->
								</div>
								<!--content-->
								<div class="extra content">
									<xsl:for-each select="logo-odd/item">
										<xsl:variable name="logo-odd-id">
											<xsl:value-of select="@id"/>
										</xsl:variable>
										<xsl:variable name="logo-odd" select="/data/logos-filtres-par-laureats/entry[@id=$logo-odd-id]"/>
										<div class="left floated logo-odd">
											<img class="ui image" src="{$root}/image/1/32/32{$logo-odd/image-ref-logo/@path}/{$logo-odd/image-ref-logo/filename}"/>
										</div>
									</xsl:for-each>
									<div class="right floated">
										<a href="{$root}/{$current-language}/laureat/{$laureat-name-handle}/" class="ui mini ">
											<xsl:choose>
												<xsl:when test="$current-language = 'fr'">Lire la suite</xsl:when>
												<xsl:otherwise>Learn more</xsl:otherwise>
											</xsl:choose>
											<i class="arrow alternate circle right outline icon"></i>
										</a>
									</div>									<!--right floated-->
								</div>								<!--extra content-->
							</div>							<!--ui card-->
						</xsl:for-each>
					</div>					<!--ui four link cards-->
				</div>				<!--ui four link cards-->
			</div>			<!--ui row cards-eco-acteurs-->
			<div class="ui row cards-eco-acteurs">
				<div class="ui container grid centered">
					<!-- appel template de pagination-->
					<xsl:call-template name="pagination">
						<xsl:with-param name="pagination" select="/data/laureats-avec-filtre/pagination"/>
						<xsl:with-param name="pagination-url">
							<xsl:value-of select="concat($root,'/',$current-language,'/',$rubrique,'/',$s-rubrique,'/?numpage=','$')"/>
							<xsl:if test="$url-annee!=''">
								<xsl:value-of select="concat('&amp;annee=',$url-annee)"></xsl:value-of>
							</xsl:if>
							<xsl:if test="$url-biosphere!=''">
								<xsl:value-of select="concat('&amp;biosphere=',$url-biosphere)"></xsl:value-of>
							</xsl:if>
							<xsl:if test="$url-odd!=''">
								<xsl:value-of select="concat('&amp;odd=',$url-odd)"></xsl:value-of>
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
</xsl:stylesheet>