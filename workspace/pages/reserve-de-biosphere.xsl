<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="../utilities/master.xsl"></xsl:import>
	<xsl:import href="../utilities/dates.xsl"></xsl:import>
	<xsl:import href="../utilities/img-resize-direction.xsl"></xsl:import>

	<xsl:output method="xml"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		omit-xml-declaration="yes"
		encoding="UTF-8"
		indent="yes" />

		<xsl:template match="data">
			<xsl:variable name="logo-officiel-id">
				<xsl:value-of select="/data/biosphere/entry/logo-officiel/item/@id"/>
			</xsl:variable>
			<!-- page header -->
			<section class="ui grid padded biosphere page-head">
				<div class="ui grid container">
					<div class="row">
						<div class="two wide column items">
							<div class="ui item">
								<div class="image">
									<img class="ui tiny right floated image" src="{$root}/image/1/75/0{/data/biosphere-logo-officiel/entry/image-ref-logo/@path}/{/data/biosphere-logo-officiel/entry/image-ref-logo/filename}" alt="{/data/biosphere-logo-officiel/entry/nom-ref-logo}"/>
								</div>
							</div>
						</div>
						<div class="nine wide column items">
							<h1 class="ui text-primary">
								<small><xsl:value-of select="biosphere/entry/prefixe-du-nom/item[@lang=$current-language]"></xsl:value-of></small><br/>
								<xsl:value-of select="biosphere/entry/nom/item[@lang=$current-language]"/>
							</h1>
							<!-- main page content -->
							<div class="main-page-content">
								<h2>
									<xsl:choose>
										<xsl:when test="$current-language='fr'">Présentation</xsl:when>
										<xsl:otherwise>Introduction</xsl:otherwise>
									</xsl:choose>
								</h2>
								<xsl:copy-of select="biosphere/entry/biosphere-presentation"/>
							</div>
						</div>
						<div class="five wide column">
							<!-- territoire illustration -->
							<div class="image">
								<img class="illus-territoire" src="{$root}/image/1/140/0{/data/biosphere/entry/illustration-territoire/@path}/{/data/biosphere/entry/illustration-territoire/filename}" alt="carte du territoire"/>
							</div>
							<div class="sidebar-content">
								<h2>
									<xsl:choose>
										<xsl:when test="$current-language='fr'">Identité</xsl:when>
										<xsl:otherwise>Identity</xsl:otherwise>
									</xsl:choose>
								</h2>
								<table>
									<tr>
										<td>
											<p class="table-list-title">
												<xsl:choose>
													<xsl:when test="$current-language='fr'">Nombre de communes :</xsl:when>
													<xsl:otherwise>Number of municipalities :</xsl:otherwise>
												</xsl:choose>
											</p>
										</td>
										<td><p><xsl:value-of select="biosphere/entry/nombre-communes"/></p></td>
									</tr>
									<tr>
										<td>
											<p class="table-list-title">
												<xsl:choose>
													<xsl:when test="$current-language='fr'">Nombre d'habitants :</xsl:when>
													<xsl:otherwise>Population :</xsl:otherwise>
												</xsl:choose>
											</p>
										</td>
										<td><p><xsl:value-of select="biosphere/entry/biosphere-nb-habitants"/></p></td>
									</tr>
									<tr>
										<td>
											<p class="table-list-title">
												<xsl:choose>
													<xsl:when test="$current-language='fr'">Superficie :</xsl:when>
													<xsl:otherwise>Area :</xsl:otherwise>
												</xsl:choose>
											</p>
										</td>
										<td>
											<p><xsl:value-of select="biosphere/entry/biosphere-superficie"/></p>
										</td>
									</tr>
									<tr>
										<td>
											<p class="table-list-title">
												<xsl:choose>
													<xsl:when test="$current-language='fr'">Régions :</xsl:when>
													<xsl:otherwise>Regions :</xsl:otherwise>
												</xsl:choose>
											</p>
										</td>
										<td>
											<p>
												<xsl:for-each select="biosphere/entry/biosphere-region/item">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()"> , </xsl:if>
												</xsl:for-each>
											</p>
										</td>
									</tr>
									<tr>
										<td>
											<p class="table-list-title">
												<xsl:choose>
													<xsl:when test="$current-language='fr'">Départements :</xsl:when>
													<xsl:otherwise>Departments :</xsl:otherwise>
												</xsl:choose>
											</p>
										</td>
										<td>
											<p>
												<xsl:for-each select="biosphere/entry/biosphere-departement/item">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()"> , </xsl:if>
												</xsl:for-each>
											</p>
										</td>
									</tr>
									<tr>
										<td>
											<p class="table-list-title">
												<xsl:choose>
													<xsl:when test="$current-language='fr'">Date de création :</xsl:when>
													<xsl:otherwise>Creation date :</xsl:otherwise>
												</xsl:choose>
											</p>
										</td>
										<td><p><xsl:value-of select="biosphere/entry/biosphere-annee-creation"/></p></td>
									</tr>
									<xsl:if test="biosphere/entry/biosphere-annee-renouvellement != ''">
										<tr>
											<td>
												<p class="table-list-title">
													<xsl:choose>
														<xsl:when test="$current-language='fr'">Date de renouvellement :</xsl:when>
														<xsl:otherwise>Renew date :</xsl:otherwise>
													</xsl:choose>
												</p>
											</td>
											<td><p><xsl:value-of select="biosphere/entry/biosphere-annee-renouvellement"/></p></td>
										</tr>
									</xsl:if>
								</table>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="coordonnees">
				<div class="ui container">
					<div class="ui segment picto-deco">
						<div class="ui grid">
							<div class="height wide column">
								<table>
									<tr>
										<td>
											<p class="table-list-title">
												<xsl:choose>
													<xsl:when test="$current-language='fr'">Adresse :</xsl:when>
													<xsl:otherwise>Address :</xsl:otherwise>
												</xsl:choose>
											</p>
											<td><p><xsl:copy-of select="biosphere/entry/biosphere-adresse"/></p></td>
										</td>
									</tr>
									<tr>
										<td>
											<p class="table-list-title">
												<xsl:choose>
													<xsl:when test="$current-language='fr'">Tél :</xsl:when>
													<xsl:otherwise>Phone :</xsl:otherwise>
												</xsl:choose>
											</p>
											<td><p><xsl:copy-of select="biosphere/entry/biosphere-telephone"/></p></td>
										</td>
									</tr>

									<tr>
										<td>
											<p class="table-list-title">
												<xsl:choose>
													<xsl:when test="$current-language='fr'">Email :</xsl:when>
													<xsl:otherwise>Email :</xsl:otherwise>
												</xsl:choose>
											</p>
											<td>
												<p><xsl:copy-of select="biosphere/entry/biosphere-mail"/></p>
												<xsl:if test="biosphere/entry/mail2">
													<p><xsl:copy-of select="biosphere/entry/mail2"/></p>
												</xsl:if>
											</td>
										</td>
									</tr>
								</table>
							</div>
							<div class="height wide column">
								<table>
									<tr>
										<td><p class="table-list-title">
											<xsl:choose>
												<xsl:when test="$current-language='fr'">Site web :</xsl:when>
												<xsl:otherwise>Website :</xsl:otherwise>
											</xsl:choose>
										</p>
									</td>
									<td>
										<p><a href="{biosphere/entry/biosphere-lien-site-web}" target="_blank"><xsl:value-of select="biosphere/entry/biosphere-nom-site-web"/></a><i class="right external alternate icon text-marron"></i></p>
										<xsl:if test="biosphere/entry/biosphere-nom-site-web-2 !=''">
											<p><a href="{biosphere/entry/biosphere-lien-site-web-2}" target="_blank"><xsl:value-of select="biosphere/entry/biosphere-nom-site-web-2"/></a><i class="right external alternate icon text-marron"></i></p>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td></td>
									<td>
										<xsl:if test="biosphere/entry/biosphere-page-facebook!=''">
											<span class="social-menu"><a href="{biosphere/entry/biosphere-page-facebook}" target="_blank" class="v-facebook marron"></a></span>
										</xsl:if>
										<xsl:if test="biosphere/entry/biosphere-lien-instagram!=''">
											<span class="social-menu"><a href="{biosphere/entry/biosphere-lien-instagram}" target="_blank" class="v-instagram marron"></a></span>
										</xsl:if>
										<xsl:if test="biosphere/entry/dossier-presse != ''">
											<a href="{$workspace}{biophere/entry/dossier-presse/@path}{biosphere/entry/dossier-presse/filename}" class="ui circular mini button download-press">
												<xsl:choose>
													<xsl:when test="$current-language='fr'">Télécharger le dossier de presse</xsl:when>
													<xsl:otherwise>Download press review</xsl:otherwise>
												</xsl:choose>
												<i class="right download icon"></i>
											</a>
										</xsl:if>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="territoire">
			<div class="ui container">
				<img class="ui fluid image" src="{$root}/image/1/900/0{biosphere/entry/carte-territoire/@path}/{biosphere/entry/carte-territoire/filename}" alt=""/>
			</div>
		</section>
		<section class="actu-biosphere">
			<div class="ui container">
				<div class="ui grid">
					<div class="row">
						<h2 class="left floated">
							<xsl:choose>
								<xsl:when test="$current-language = 'fr'">Actualités &amp; publications</xsl:when>
								<xsl:otherwise>News &amp; publications</xsl:otherwise>
							</xsl:choose>
						</h2>
					</div>
					<div class="row">
						<div class="ui four link cards">
							<xsl:for-each select="actualites-page-biosphere/entry">
								<div class="card">
									<div class="card-header-image">
										<xsl:variable name="img" select="image-a-la-une"/>
										<xsl:call-template name="resize-direction-basic">
											<xsl:with-param name="type" select="'1'"/>
											<xsl:with-param name="oriWidth" select="image-a-la-une/meta/@width"/>
											<xsl:with-param name="oriHeigh" select="image-a-la-une/meta/@height"/>
											<xsl:with-param name="swidth" select="'130'"/>
											<xsl:with-param name="sheight" select="'240'"/>
											<xsl:with-param name="path" select="$img"/>
											<xsl:with-param name="class" select="''"/>
										</xsl:call-template>
										<!-- <img src="{$root}/image/" alt="image de l'actualité"/> -->
									</div>
									<div class="content">
										<a href="#" class="header">
											<xsl:value-of select="titre"/>
										</a>
										<!-- <div class="description"><xsl:value-of select="texte" mode="formatted"/></div> -->
									</div>
									<div class="meta">
										<a href="#" class="ui mini basic button fluid">
											<xsl:choose>
												<xsl:when test="$current-language = 'fr'">																		Lire la suite																	</xsl:when>
												<xsl:otherwise>Learn more</xsl:otherwise>
											</xsl:choose>
											<i class="arrow alternate circle right outline icon"></i>
										</a>

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
												<xsl:otherwise><xsl:value-of select="type/item"/></xsl:otherwise>
											</xsl:choose> -
											<xsl:call-template name="format-date">
												<xsl:with-param name="date" select="date/date/start"/>
												<xsl:with-param name="format" select=" $dateFormat "/>
												<xsl:with-param name="language" select="$current-language"/>
											</xsl:call-template>
										</p>
									</div>
								</div>
							</xsl:for-each>
						</div>
						<!-- end cards -->
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
</xsl:stylesheet>