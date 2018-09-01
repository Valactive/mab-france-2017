<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:import href="../utilities/content-page-header.xsl"></xsl:import>
	<xsl:import href="../utilities/advanced-truncate.xsl"></xsl:import>
	<xsl:import href="../utilities/pagination.xsl"></xsl:import>
	<xsl:param name="url-biosphere"></xsl:param>
	<xsl:param name="url-odd"></xsl:param>





	<xsl:template name="list-eco-acteurs">
		<div class="ui grid">
			<xsl:call-template name="content-page-header"></xsl:call-template>
			<div class="ui row"> <!-- filtre -->

				<h4 class="ui horizontal divider header">
				</h4>


				<div class="ui container" id="filtres">
					<div class="ui form">
						<div class="two fields">
							<div class="field">
								<label>Réserve de biosphere</label>
								<select id="eco-reserve" class="ui fluid search dropdown">
									<option value="">Réserve de biosphère</option>
									<option value="all">Toutes</option>
									<xsl:for-each select="biospheres-filtrees-par-eco-acteurs/entry">
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
								<div id="eco-odd" class="ui fluid search selection dropdown">
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
										<xsl:for-each select="logos-filtres-par-eco-acteurs/entry">
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
			</div> <!-- ui row-->
			<h4 class="ui horizontal divider header"> <!-- entete avec icone ecoacteurs-->
				<i class="users icon"></i>
				<xsl:choose>
					<xsl:when test="$current-language = 'fr'">Éco-acteurs																	</xsl:when>
					<xsl:otherwise>Eco-players</xsl:otherwise>
				</xsl:choose>
			</h4> <!-- ui horizontal divider hearder-->
			<div class="ui row cards-eco-acteurs"> <!-- la grille des vignettes-->
				<div class="ui container">
					<div class="ui four link cards">
						<xsl:for-each select="eco-acteurs-avec-filtres/entry">
							<div class="ui card">
								<a href="{$root}/eco-acteur/{eco-acteur-nom/item/@handle}/" class="card-header-image">
									<xsl:variable name="img" select="image-a-la-une"/>
									<!-- <xsl:call-template name="resize-direction-basic">
										<xsl:with-param name="type" select="'2'"/>
										<xsl:with-param name="oriWidth" select="image-a-la-une/meta/@width"/>
										<xsl:with-param name="oriHeigh" select="image-a-la-une/meta/@height"/>
										<xsl:with-param name="swidth" select="'260'"/>
										<xsl:with-param name="sheight" select="'0'"/>
										<xsl:with-param name="cropPoint" select="'2'"/>
										<xsl:with-param name="backColor" select="'FFFFFF/'"/>
										<xsl:with-param name="path" select="$img"/>
										<xsl:with-param name="class" select="''"/>
									</xsl:call-template> -->
									<img src="{$root}/image/1/280/0/{$img/@path}/{$img/filename}" alt="image de l'actualité"/>
								</a>
								<div class="content">
									<a href="{$root}/eco-acteur/{eco-acteur-nom/item/@handle}/" class="header">
										<xsl:value-of select="eco-acteur-nom/item[@lang=$language]"/>
									</a>
									<div class="description">
										<xsl:call-template name="truncate">
											<xsl:with-param name="node" select="eco-acteur-presentation/item[@lang=$language]"/>
											<xsl:with-param name="limit" select="25"/>
										</xsl:call-template>
										<!-- <xsl:copy-of select="eco-acteur-presentation/item[@lang=$language]"/> -->
									</div> <!-- description-->
								</div> <!--content-->
								<div class="extra content">
									<xsl:for-each select="logo-odd/item">
										<xsl:variable name="logo-odd-id">
											<xsl:value-of select="@id"/>
										</xsl:variable>
										<xsl:variable name="logo-odd" select="/data/logos-filtres-par-eco-acteurs/entry[@id=$logo-odd-id]"/>
										<div class="left floated logo-odd">
											<img class="ui image" src="{$root}/image/1/32/32{$logo-odd/image-ref-logo/@path}/{$logo-odd/image-ref-logo/filename}"/>
										</div>
									</xsl:for-each>
									<div class="right floated">
										<a href="{$root}/eco-acteur/{eco-acteur-nom/item/@handle}/" class="ui mini ">
											<xsl:choose>
												<xsl:when test="$current-language = 'fr'">Lire la suite</xsl:when>
												<xsl:otherwise>Learn more</xsl:otherwise>
											</xsl:choose>
											<i class="arrow alternate circle right outline icon"></i>
										</a>
									</div> <!--right floated-->
								</div> <!--extra content-->
							</div> <!--ui card-->
						</xsl:for-each>
					</div> <!--ui four link cards-->
				</div> <!--ui four link cards-->
			</div> <!--ui row cards-eco-acteurs-->
<div class="ui row cards-eco-acteurs">
	<div class="ui container grid centered">
		<!-- appel template de pagination-->
		<xsl:call-template name="pagination"> 
				<xsl:with-param name="pagination" select="/data/eco-acteurs-avec-filtres/pagination" /> 
				<xsl:with-param name="pagination-url" select="concat($root,'/',$current-language,'/',$rubrique,'/',$s-rubrique,'/?numpage=','$')"/> 
				<xsl:with-param name="show-range" select="'3'" /> 
				<xsl:with-param name="class-pagination" select="'ui pagination'" /> 
				<xsl:with-param name="class-previous" select="'ui item circular mini basic icon button'" /> 
				<xsl:with-param name="class-next" select="'ui item circular mini basic icon button'" /> 
			</xsl:call-template>
	</div>
</div>
			

<!-- pagination-->
<!-- 			<div class="ui pagination menu"> 
  				<a class="active item">1</a>
  				<div class="disabled item">...</div>
  				<a class="item">10</a>
  				<a class="item">11</a>
 				 <a class="item">12</a>
			</div> --> 
			<!-- ui pagination menu-->
		</div> <!-- ui grid-->
	</xsl:template>
</xsl:stylesheet>