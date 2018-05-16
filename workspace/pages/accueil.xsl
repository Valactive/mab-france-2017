<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:ap="http://git.io/sym-asset-pipeline" exclude-result-prefixes="ap">
	<xsl:import href="../utilities/master.xsl"></xsl:import>
	<xsl:import href="../utilities/dates.xsl"></xsl:import>
	<xsl:import href="../utilities/img-resize-direction.xsl"></xsl:import>
	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
	<xsl:template match="data">
		<!-- whitch template? -->
		<!-- si $rubrique et $sous-rubrique vide = home -->
		<!-- si $rubrique ok et $sous-rubrique vide = $rubrique -->
		<!-- si $rubrique ok et $sous-rubrique ok = $sous-rubrique -->
		<!-- vrai page ? -->
		<!-- <div class="ui vertical "><h1><xsl:value-of select="plh-page/page/item[@lang=$language]"/></h1><xsl:value-of select="page-content/entry/rubrique-parente/item"></xsl:value-of> /
</div> -->
		<!-- nom de la rubrique parente -->
		<xsl:choose>
			<xsl:when test="$rubrique ='' and $s-rubrique = '' and $ss-rubrique = ''">
				<!-- home page -->
				<!-- 		<h1><xsl:value-of select="page-content-1level/entry/nom/item[@lang=$language]"/></h1><p><xsl:copy-of select="page-content-1level/entry/contenu"></xsl:copy-of></p> -->
				<section class="hero">
					<!-- Contenu hero -->
					<div class="ui grid container centered">
						<div class="hero-slogan items">
							<div class="item">
								<div class="bottom aligned content">
									<br/>
									<h1 class="ui center">
										<xsl:copy-of select="slogan-home-page/entry/slogan/item[@lang = $current-language]"/>
									</h1>
									<br/>
									<a href="{slogan-home-page/entry/lien-http-du-bouton-daction/item[@lang = $current-language]}" class="ui tiny blue button">
										<xsl:value-of select="slogan-home-page/entry/nom-du-bouton-daction/item[@lang = $current-language]"/>
									</a>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- Annonce home page -->
				<section class="annonce">
					<div class="ui container grid centered center">
						<div class="row">
							<h1 class="text-primary">
								<xsl:value-of select="home-page-annonce/entry/nom-home-page/item[@lang=$current-language]"/>
							</h1>
						</div>
						<div class="row">
							<xsl:copy-of select="home-page-annonce/entry/contenu-home-page/item[@lang=$current-language]"/>
						</div>
						<xsl:choose>
							<xsl:when test="home-page-annonce/entry/lien-1/item[@lang=$current-language] != '' and home-page-annonce/entry/lien-2/item[@lang=$current-language] != ''">
								<!-- two buttons -->
								<div class="three column row">
									<div class="six wide column right aligned content">
										<a href="{home-page-annonce/entry/lien-1/item[@lang=$current-language]}" class="ui primary circular tiny button">
											<xsl:value-of select="home-page-annonce/entry/nom-lien-1/item[@lang=$current-language]"/>
										</a>
									</div>
									<div class="two wide column">
										<p></p>
									</div>
									<div class="six wide column left aligned content">
										<a href="{home-page-annonce/entry/lien-2/item[@lang=$current-language]}" class="ui secondary circular tiny button">
											<xsl:value-of select="home-page-annonce/entry/nom-lien-2/item[@lang=$current-language]"/>
										</a>
									</div>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<!-- one button -->
								<div class="column row center aligned content">
									<a href="{home-page-annonce/entry/lien-1/item[@lang=$current-language]}" class="ui primary circular button">
										<xsl:value-of select="home-page-annonce/entry/nom-lien-1/item[@lang=$current-language]"/>
									</a>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</section>
				<!-- CONTENUS -->
				<section class="actu-newsletter">
					<div class="ui container">
						<!-- two columns page grid layout -->
						<div class="ui two column grid">
							<!-- left column -->
							<!-- new grid -->
							<div class="column">
								<div class="ui grid">
									<div class="two column row last-actu">
										<div class="column twelve wide top content aligned">
											<h2 class="left floated">
												<xsl:choose>
													<xsl:when test="$current-language = 'fr'">														Actualités &amp; publications													</xsl:when>
													<xsl:otherwise>														News &amp; publications													</xsl:otherwise>
												</xsl:choose>
											</h2>
										</div>
										<div class="column four wide bottom content aligned">
											<a href="#" class="ui mini primary button right floated">
												<xsl:choose>
													<xsl:when test="$current-language = 'fr'">													Tout voir												</xsl:when>
													<xsl:otherwise>See all</xsl:otherwise>
												</xsl:choose>
											</a>
										</div>
									</div>
									<!-- start cards row -->
									<div class="row">
										<div class="ui two column grid">
											<!-- <div class="column"> -->
											<!-- start card 1 -->
											<div class="ui two link cards">
												<xsl:for-each select="actualites-home-page/entry">
													<div class="card">
														<div class="image">
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
															<a href="#" class="ui primary basic button right floated">
																<xsl:choose>
																	<xsl:when test="$current-language = 'fr'">																		Lire la suite																	</xsl:when>
																	<xsl:otherwise>Learn moreh</xsl:otherwise>
																</xsl:choose>
																<i class="arrow alternate circle right outline icon"></i>
															</a>
															<br/>
															<br/>
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
											<!-- </div> -->
											<!-- end col2 -->
										</div>
										<!-- end grid 2cols for cards -->
									</div>
									<!-- end cards row -->
								</div>
								<!-- end col left grid -->
							</div>
							<!-- end col left -->
							<!-- start col right -->
							<div class="column">
								<div class="row">
									<div class="ui grid">
										<div class="column one wide"></div>
										<div class="column nine wide">
											<h2>Lettre de la biosphère</h2>
											<p class="marron">N°114 - Avril 2018</p>
										</div>
										<div class="column six wide right content aligned">
											<a href="#" class="ui mini button primary">
											<xsl:choose>
											<xsl:when test="$current-language='fr'">Lire la lettre en ligne</xsl:when>
											<xsl:otherwise>Read online</xsl:otherwise>
										</xsl:choose>
										</a>
										</div>
									</div>
								</div>
								<div class="ui grid">
									<div class="two column row">
										<div class="column one wide">
											<p></p>
										</div>
										<div class="column fifteen wide newsletterTextBlock">
										<xsl:choose>
											<xsl:when test="$current-language='fr'">
												<p>Le Mab France publie la Lettre de la biosphère quatre fois par an.</p>
												<p>Vous pouvez vous inscrire <a href="">sur nos listes</a> pour la recevoir	dans votre boite mail !</p>
												<p>Sinon, vous pouvez également <a href="">consulter en ligne</a> toutes les lettres que nous avons publié.</p>
											</xsl:when>
											<xsl:otherwise>
												<p>(en)Le Mab France publie la Lettre de la biosphère quatre fois par an.</p>
												<p>Vous pouvez vous inscrire <a href="">sur nos listes</a> pour la recevoir	dans votre boite mail !</p>
												<p>Sinon, vous pouvez également <a href="">consulter en ligne</a> toutes les lettres que nous avons publié.</p>											
											</xsl:otherwise>
										</xsl:choose>
											
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- end 2 col grid -->
					</div>
					<!-- end container  -->
				</section>
				<!-- end section actu-newsletter -->
				<section class="reserves container">
					<div class="ui">
						<div class="ui two column grid title">
							<div class="row">
								<div class="column five wide right aligned content">
									<h2 class="osibv">
									<xsl:choose>
										<xsl:when test="$current-language='fr'">Explorez</xsl:when>
										<xsl:otherwise>Discover</xsl:otherwise>
									</xsl:choose></h2>
								</div>
								<div class="column eleven wide">
									<h2 class="osliv">
									<xsl:choose>
										<xsl:when test="$current-language='fr'">Les 14 Réserves de biosphère en France</xsl:when>
										<xsl:otherwise>The 14 Biosphere Reserves in France</xsl:otherwise>
									</xsl:choose> </h2>
								</div>
							</div>
						</div>
						<!-- end row ; start new row -->
						<div class="ui grid">
							<div class="column five wide">
								<div class="ui list list-rb">
									<a data-reserve="guadeloupe" href="{$root}/biosphere/reserve-de-biosphere-" class="item">
										<i class="circle icon c-guadeloupe"></i>
										<div class="content">
											<div class="header">RB de l’archipel de Guadeloupe</div>
										</div>
									</a>
									<a data-reserve="iroise" href="{$root}/biosphere/reserve-de-biosphere-" class="item">
										<i class="circle icon c-iroise"></i>
										<div class="content">
											<div class="header">RB des Îles et de la mer d’Iroise</div>
										</div>
									</a>
									<a data-reserve="audomarois" href="{$root}/biosphere/reserve-de-biosphere-" class="item">
										<i class="circle icon c-audomarois"></i>
										<div class="content">
											<div class="header">RB du marais Audomarois</div>
										</div>
									</a>
									<a data-reserve="fontainebleau" href="{$root}/biosphere/reserve-de-biosphere-" class="item">
										<i class="circle icon c-fontainebleau"></i>
										<div class="content">
											<div class="header">RB de Fontainebleau et du Gâtinais</div>
										</div>
									</a>
									<a data-reserve="vosges" href="{$root}/biosphere/reserve-de-biosphere-" class="item">
										<i class="circle icon c-vosges"></i>
										<div class="content">
											<div class="header">RB transfrontière des Vosges du Nord-Pfälzerwald</div>
										</div>
									</a>
									<a data-reserve="cevennes" href="{$root}/biosphere/reserve-de-biosphere-" class="item">
										<i class="circle icon c-cevennes"></i>
										<div class="content">
											<div class="header">RB des Cévennes</div>
										</div>
									</a>
									<a data-reserve="dordogne" href="{$root}/biosphere/reserve-de-biosphere-" class="item">
										<i class="circle icon c-dordogne"></i>
										<div class="content">
											<div class="header">RB du bassin de la Dordogne</div>
										</div>
									</a>
									<a data-reserve="gardon" href="{$root}/biosphere/reserve-de-biosphere-" class="item">
										<i class="circle icon c-gardon"></i>
										<div class="content">
											<div class="header">RB des gorges du Gardon</div>
										</div>
									</a>
									<a data-reserve="camargue" href="{$root}/biosphere/reserve-de-biosphere-" class="item">
										<i class="circle icon c-camargue"></i>
										<div class="content">
											<div class="header">RB de Camargue (delta du Rhône)</div>
										</div>
									</a>
									<a data-reserve="luberon" href="{$root}/biosphere/reserve-de-biosphere-" class="item">
										<i class="circle icon c-luberon"></i>
										<div class="content">
											<div class="header">RB Luberon-Lure</div>
										</div>
									</a>
									<a data-reserve="ventoux" href="{$root}/biosphere/reserve-de-biosphere-" class="item">
										<i class="circle icon c-ventoux"></i>
										<div class="content">
											<div class="header">RB du Mont Ventoux</div>
										</div>
									</a>
									<a data-reserve="viso" href="{$root}/biosphere/reserve-de-biosphere-" class="item">
										<i class="circle icon c-viso"></i>
										<div class="content">
											<div class="header">RB transfrontière du Mont Viso</div>
										</div>
									</a>
									<a data-reserve="fango" href="{$root}/biosphere/reserve-de-biosphere-" class="item">
										<i class="circle icon c-fango"></i>
										<div class="content">
											<div class="header">RB de la vallée du Fango</div>
										</div>
									</a>
									<a data-reserve="fakarava" href="{$root}/biosphere/reserve-de-biosphere-" class="item">
										<i class="circle icon c-fakarava"></i>
										<div class="content">
											<div class="header">RB de la commune de Fakarava</div>
										</div>
									</a>
								</div>
							</div>

							<div class="column eleven wide right aligned content">
								<svg id="carte-rb" 
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 754.41 527.79">
									<g id="fonds">
										<path id="france" class="cls-1" d="M356.35,451.92c-7.75.71-8.52-3.82-14.16-6h-7.44c-3.37-.72-9.06-3.64-7.2-8.64l2.88-3.6v-.24h-.24c-4.25,1.49-15.35-8.9-13.44-13.92,1.37-3.61,4.68-2.25,8.16-3.84l8.4-9.12c2.53-4.94,1.93-10.07,3.84-15.6,2.1-6.09,4.78-14,6.72-20.4,2.05-6.79.35-13.58,1.68-19.68,2.05-9.39,5-20.7,7.2-30.24,1-4.07,1.47-8,2.16-11.52v-4.8l2.88-4.32c-1.35-1.41-4-2.52-5-4.08-4-5.87,3.74-12.41,6.48-15.12,0-1.88.41-5.6,0-6.24-1.46-3.09-5.42-4.77-3.12-9.84-4.85-4.91-15.92-7.56-19.68-13-2.14-3.07-1.65-8.67-3.84-11.76-2.68-3.78-9.71-9-8.16-15.6.8-3.39,4-4.36,5.28-7.44-2.34-.88-6.31-2.13-7.2-4.56-.4-1.08-.09-2.69-.48-3.12-2.13-2.49-7.72-2.14-9.84-5.28-1.37-2,.11-9.67-1-10.56-1.7-1-2.3-.23-4.56-.72-2.57-.56-5.3-3.51-6.48-5.52-1.87.59-4.54,1.15-6.24,0-2.76-1.87-2.26-6.71-5.52-8.4l-4.8-.48-4.08-4.06c-5.06-3.78-9.54-.51-13-7h-4.28c-3.39,1.43-12.31,3.75-14.4-1-1.76-4,1.77-7.71-1.92-10.08-3.34-2.15-9.3-2-10.32-6.48s3.33-6.46,6.24-6.72c.66-.06.87,0,.48-.48.67-2.15,0-3-.48-5-3.06-.32-3.45-1.87-4.8-3.84h-.2c-.75,3.32-8.67,5.85-13.2,4.08-4.27-1.67-3.16-5.5-5.28-9.36-1.76-3.19-5.65-4.23-6-8.88,6.55-10.16,22.12,3.44,24,11.28l.48-.24c-.23-15.09,11.11-16.77,22.32-19.44,2-.48,3.53.83,4.8.72,2.71-.23,7-2.55,10.32-1.68L277,112l3.6-.48,3.36,1.44c1.23-3,4.52-8.06,9.84-6.72l2.64,1.2,4.08-1.68a85.2,85.2,0,0,1,9.84.72,76,76,0,0,1,9.6,18.72l.72-.72c4.41-1.47,14.92-10.53,17.76-1,4.35-.24,14.53-7.73,16.8-.24v3.36l1.68-.24v-.16c-.32-1.15-1.28-7-1-8.4l1.68-4.8c.17-3.35-2.52-8.34-.24-12-2.94-6.74-10.19-16.17-6-24.72-2.05-2.63-4.69-9.25,0-11.28,4.73-2.39,9.19,2.61,12.72,3.6,3,.84,4.54-1.66,7-2.16,6.62-1.36,12.71,3.75,12.24,9.84l-2.64,5.28,2.16,4.08c6.54-.68,5.87,1.4,10.08,2.64,8.62,2.54,14,.74,20.16,5.76,3.19-.29,5.6-1,7-3.12-2.23-5.85.35-8.22,2.64-12.24,1.31-2.3,2-4.79,4.08-6.24,1.77-1.23,3.45-1,5.76-1.92,4.09-1.58,6.84-4.78,12.24-5.52,7.79-1.07,14.74-.48,20.16-4.32,5.75-4.08,9.19-9.08,11-16.56,1.74-7-.91-13.07.72-19.68l1.44-2.4c.54-2.51-1.55-5.72,0-8.4,1-1.76,2.57-1.32,4.32-2.4L486,7.9l22.32-3.6c4.57-1.14,6.76-5.36,12.48-4.08,2,2.51,5.52,12,3.6,15.12,2.42.77,3.41,2.84,4.32,5l6.72-2.64c4.78-1,10.62,6.34,11.28,9.12.52,2.21.11,3.83.24,6,6-2.33,13.49,3.72,13.44,9.6h.24l.24-.2c1.54-.25,2.9.68,3.84,1s2.77-1.6,4.8-1c1,.31,9.31,7.27,9.6,8.16.87,2.65-1.11,4.07-1.68,6,1,1.55,1.41,7,2.88,8.16l2.16,1c5.46-3.24,6.56-12.39,14.64-12.48,2.33,1.13,5.91,4.83,5,8.88-.44,2.05-1.69,2.47-1.92,5a9.29,9.29,0,0,1,1.92,6.72c2.38.86,3.45,2.94,5.28,4.32,2.33,1.76,5.47,2.48,7.92,4.32s4.12,4.64,6.48,6.48c3-1.18,12.87-2.34,14.64.24,1.31,1.92.77,3.21,2.64,4.56l4.08-2.16c3.44-.69,5,1.79,7,2.64,8.7,3.75,7.79,1.75,12,10.32,1,2.09,2.87,3.16,3.6,6,1.4-1,11.32-3.83,13.68-3.12,2,.61,2.51,2.75,3.6,4.32a9.48,9.48,0,0,1,4.32-1.44c3.33-5-.8-7.31,1-12L690.27,96l-4.56-9.12c2.76-1.57,6.63-.58,10.32-1.92l8.16-7c.85-2.33.39-4.34,1.44-6l3.36-.48c.92.32.5,0,1,.72l1.2,3.12,1.2-.24c.93-3.35,2.55-5.27,4.32-7.68,2.59,2.52-.27,8.85.48,13l1.68,4.8c.33,3.08-1.9,5-2.4,7.68-.81,4.27,1,7.85-1,10.56-1.61.56-4.07,1.62-4.8,3.12l-1.8,10.1c2.75.57,3.2,3.1,5.28,3.84l3.36-.24c2.42.54,6.65,3.26,5.76,7-.65,2.71-3.79,4-5,6.24l-1.68,6c-1,1.55-2.88,1.61-4.08,2.88-.14.15-3.6,6-3.6,6l-.24,3.6c-.93,4-1.51,8.33-2.88,12.72-1.14,3.65-4.52,7.35-5.76,10.8l1.2,10.08c-.41,1.93-2.14,2.93-2.64,4.32l.24,6.24c-.84,3.72-.56,9.2-1.68,12.48-1.56,4.57-10.78,8.82-17,7-.3,4.68-7.88,13.72-10.8,16.32l-3.12,1.92c-1.25,2-.15,3.47-1.92,4.8-.8.6-6,2.12-6.24,2.4-1.57,2.06.24,6.07-1,8.16-2,3.43-7.6,4.58-10.08,7.68s-.87,6.81-4.56,9.6l1.68,1.68.24.72c3.51-2.23,4-.35,6.72-1.2l3.12-1.92h4.56c7.35-1.35,11.63.94,13.92,6.48,1.81,4.39-2.32,6.83-1,9.12,4.68,2.68,10.63,13.29,6,20.16-1.31,2-4.66,1.91-6.24,3.6,1.26,1.93,4.25,1.78,5.52,3.6,1.46,2.1,0,4.77,1,6.72,1.52,3.12,7.91,4.75,7.44,9.6-.2,2.08-2.1,3.55-2.4,5-.43,2.15,1.9,4.69.24,7.2-2.42,3.66-6.49,2.2-10.56,4.32-.7,2.52-1.95,2.77-4.08,3.84l.48.72c5.16,1.92,5.85,6.81,9.12,10.56,4.06-1.35,7.77-4.45,11.52-5.52,5.5-1.57,10.24,2.37,13.68,3.36,2.66.77,3.47-.31,4.56,1.92,1.34,2.69.35,8.12-1,9.84-2.15,2.83-7.49,1.39-11.52,2.4-6.12,1.53-14.52,4.95-19.2,8.4-.14,2-1.1,5.82-1,6.24,1.31,2.78,4.14,5.75,6,8.16,3.09-.06,5.54,1.57,7.44,1.44,4.09-.27,12.74-4.74,15.84,0,1,1.5.14,2.69.48,4.56,1.17,6.44-2.74,8.11-4.56,12.72l.24,5.76c.46,4.82-4.12,6.52-8.16,7.2-.53,4.7-4.06,2.88-6.72,4.56-.86,1-.47,3.47-1.2,4.56-1.63,2.44-4.51,1.46-7,3.12l-2,3.82c-1.86,1.85-5.24,1.74-7.44,2.64-.49,2.66,1.15,6.68-.48,9.12-3.73,5.59-9.21,2.36-13,5L653,459.1c-1.85,1.37-4.46.09-6.72.72l-1.36,1.7c-3.78,2.34-8.1.6-10.56-1.2-2.32.28-3.42,2.21-6.48,1.44-3.46-.87-3.88-4.13-6.24-5.76l-4.08-.72-2.88-2.64h-3.36c-6.26-1-7-1.79-8.16-7.2-4.51,1.34-7.77.3-10.32-1.68-5.18,2.68-19,2.51-19.2-4.8a18.43,18.43,0,0,1-17-6.24c-2,.73-14.48,8.37-15.84,9.84-1,1.07-1.21,2.49-2.4,3.36-3,2.18-7.13-.49-9.84,1.44s-7,7.11-7.68,10.56l.48,4.32c-.77,5.72-2.42,12.12-2.16,18,10.91,4.83,2.57,20-8.16,11.52-2.11.21-6.56,1.2-8.16,2.16s-1.8,3.08-4.32,3.6c-9.06,1.87-12.13-4.43-19-5.52-2.85,2.27-11,5.2-13.68,1.2-1-1.45-.88-3.23-2.16-4.32-4.82-4.1-9.53.61-8.64-9.84l-2.16-1.44c-7.56,6-8.33.44-11.52-4.8-3.75.3-7,.84-8.88-1.68l-1.2-2.64c-1.7-1.46-3.73.43-6-.48l-2.4-2.16h-.24c.12,9-10.48,6.07-17,5.28-3.67-.44-5.54,3.21-8.64-1.68-10.67,2.95-14.58-3.45-20.64-8.16-1.88.78-7.8,2-10.08,1.44S356.41,454.77,356.35,451.92Z" transform="translate(0.04 0.02)"/>
										<g id="guadeloupe">
											<path class="cls-1" d="M35.23,11.52c3.87.28,8.2,4.66,9.12,7.92s-.44,6.18,1.2,8.4c2.06,2.79,5,1.11,8.64,2.64a124.75,124.75,0,0,1,13.68,9.36L67.63,41l-1.92,2.18c-3,0-5-1.56-7.2-1.44-9.85.55-23.33,10.44-31,2.16l-1.68.24v1.2c3.66,12.93,3.11,19.84-6.72,25.68-2.15,1.28-5.7,3.73-8.4,2.16-1.21-5.07-3.94-6.66-6.24-10.8-2-3.53-.26-7.84-1.44-12.72C2,45.23-1.17,39.13.39,33.86c1.42-3.2,3.81-6.57,8.16-7,2.6,2.08,5.64,2.4,9.12,3.84,2.56,1.06,4,3,6,4.56l2.88-.72c.58-3.93,2.67-4.23,4.08-6.72-1.42-.28-2.08-.51-2.64-1.68-.71-1.47-1.64-5.34-1-7C28.73,15.12,32.17,14.13,35.23,11.52Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M23.47,27.6a3.74,3.74,0,0,1,2.4,1.68c.53,1.31-.12,1.83-.72,2.64-1.42.35-2,.77-3.6.48a3.13,3.13,0,0,1-.48-2.88C21.66,28.22,22.29,28.22,23.47,27.6Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M80.35,28.08c1.89,0,4.06.64,4.8,1.92v1.44c-1,2.06-11,8.43-13.44,4.32V34.32C73.34,31.39,77.61,30,80.35,28.08Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M71.47,46.08l2.16,1,.24,1.44L72,50.92H69.79l-1.92-1.7a3.36,3.36,0,0,1,.72-2.4Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M54.87,64.08c4.35.16,5.76,1.91,7.2,5,.86,1.88,3.59,3,2.64,6.72-1.17,4.54-9.78,7.65-14.64,4.8l-2.88-7.2A21.75,21.75,0,0,1,54.87,64.08Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M23.71,77.28l2.16.24,1.44,2.16c-.14.93-2.5,5.09-3.12,6H24A11.62,11.62,0,0,1,16.27,83l.72-3.6C19.38,78.58,21.18,78.39,23.71,77.28Z" transform="translate(0.04 0.02)"/>
										</g>
										<g id="Fakarava_archipel" data-name="Fakarava archipel">
											<path class="cls-1" d="M192,11.28l1.44.24V15.6c-.7,1.55-2.44,2.3-4.56,2.4l-1.68-1.2.24-1.44C188.28,13.54,190.49,12.56,192,11.28Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M211.39,12c2.4,0,3.34.49,4.08,2.16-.83,2.21-3.13,4.53-6.24,3.6A6.12,6.12,0,0,1,211.39,12Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M181.63,13.68c2.21.23,3.08.7,3.84,2.4-.9,2-2.18,2.62-4.32,3.36L179.71,18C179,15.68,180.09,14.53,181.63,13.68Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M205.87,17.76l2.4.48,1,1.2v1c-1.37,1.12-2.67,2.69-4.8,1.68a6.51,6.51,0,0,1,.24-3.36Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M132.67,22.32l1.2.24c-.15,2-1,2.84-1.92,4.08-1.89.64-4.88.24-4.08-2.16C128.87,22.63,130.93,23.34,132.67,22.32Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M139.87,24a11,11,0,0,1,4.32.72l.72,2.64c-.81,2.24-1.66,4.35-4.56,4.56l-.24-.24c-2.17-1-2.61-4.36-1.68-7Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M218.87,24.48h3.36V25c.69,1.39.23,2.3-.48,3.36h-.24l-1.92-.24-1.72-1.44a3.59,3.59,0,0,1,.48-1.92Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M150,25c1.2.49,3,.27,4.8,1l3.84,4.56c1.55,1,3,1,4.32,1.92a3,3,0,0,1-.72,2.16C155.57,35.86,141.14,33,150,25Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M171.31,30.48a11.31,11.31,0,0,1,4.8,1.92l.24.48c.14,4-2.64,5.34-5.76,4.56l-2.16-3.36Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M182.11,33.12l4.08.48,1,1.2c.32,5.34-2,7.07-6.72,5.76l-.72-1.2C178.87,36.48,180.53,34.37,182.11,33.12Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M198.67,33.84c8.47-.19,29.52,4,27.6,12.24-1.39,6-7.85,12.51-13.2,14.64L204,62.88v.24c2.81.08,5.06.69,6.48,2.16l-.24,1.2-1.44,1.44a6.2,6.2,0,0,1-4.56.24c-1.22-1.61-2.87-2.38-2.4-5-15,1.35-29.32-.83-23-15.36-5.9.25-10-.81-10.32-6.48l.72-.72c3,.1,5.76,1,9.12,1.68a10.11,10.11,0,0,1,1.92,3.6c4.24-3.17,8.5-7.6,13-10.32Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M139.39,43.68l1.44.24,1.68,1.68-.72,2.16h-2.64l-1.68-1.92.24-.72C138.2,44.22,138.57,44.22,139.39,43.68Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M223.63,54.72l1.68.24.72.48a5.11,5.11,0,0,1-.48,2.64h-1.2a6.74,6.74,0,0,1-1.92-2.16l.24-.72Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M227,56.88a4.59,4.59,0,0,1,2.4,1.44l-.48,2.16a2.85,2.85,0,0,1-2.64-.48v-.24l.24-2.16Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M236.87,57.12l.24,7.2h-1l-2.4-3.12.24-1.68C234.6,58.15,235.61,57.9,236.87,57.12Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M227,61.22l2.4.48c.87,2.16.71,2.78-1,4.08l.72,1.2a3.22,3.22,0,0,1-1.92,1.68c-1.77-.64-1.58-4.4-1-7Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M231.55,63.6c2,0,1.86.28,2.64,1.44l-.24.72-.48.48h-2.6l-.72-1.44Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M215.47,64.8h2.16c1.18,1.63,2.92,2.45,4.32,3.84a3.88,3.88,0,0,1-1,3.12h-.48c-3.77,1.13-7.15-1.76-8.88-3.6a5.21,5.21,0,0,1,.48-2.64Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M225.55,71.28a5.25,5.25,0,0,1,3.12.72,5.07,5.07,0,0,1-1,4.08l-.48.24a3.59,3.59,0,0,1-1.92-.48l-1.92-2.16.72-1.92Z" transform="translate(0.04 0.02)"/>
											<path class="cls-1" d="M199.87,77.52c1.9.26,4.77,1.11,5.52,2.64v1.2c-.17,1.24-.3,1.43-1.2,1.92-1.44.47-4.76-1.34-6-2.16a5.27,5.27,0,0,1-.24-2.64Z" transform="translate(0.04 0.02)"/>
										</g>
										<path id="corse" class="cls-1" d="M742.75,431.28c6.2.14,5,3.33,6.24,7.92.44,1.59,1.83,4.52,1.44,6.72-.36,2-2.23,4.87-1.68,7l3.12,4.8V463c.83,3.76,3.54,17.15,2.16,21.84-.92,3.14-4.32,5.58-5.28,8.4-1.33,3.94.71,7.86,0,11.76l-2.88,10.76-2.64,2.16v2.64a21.27,21.27,0,0,1-3.36,7c-2.56.68-7.62.12-8.88-1.92-.64-1,0-1.89-1-2.64l-6.72-1.92-4.8-3.6c-.91-3.16-.31-5,.24-7.68l-.48-.48c-2.18.63-4.55-1.07-5.28-2.64l-.24-1.92c1.08-1.79,3-3,3.6-5.28l-1,.24c-.62,0-2.24.89-3.36.24l-1.68-1.2c-.38-1.79-1.32-4.45-.72-6a13.69,13.69,0,0,1,4.08-4.32l-.24-.48a15.4,15.4,0,0,1-4.8-2.16c-.65-3.27-2.13-6-1.44-8.88l1.92-1.2a6.62,6.62,0,0,1-1.68-6.72c4.15-2.73,3.66-7.48,6.48-11.52.72-1,10.19-4.18,13-5,1.74-5.2,6.76-5.79,11.76-4.08v-.24c-1.73-3.47-.86-5.9,0-9.6.45-1.94-.67-3.73.48-5.28Z" transform="translate(0.04 0.02)"/>
									</g>
									<g id="reserves-off">
										<path id="guadeloupe" data-reserve="guadeloupe" class="cls-2" d="M35.23,11.76c3.83.4,8,4.74,8.88,8.16v5.76c.38,1.79,2.34,2.53,2.88,3.84L46.75,44.4c-9.24,1.07-11,5-19.2-.72l-1.92.24v2.64c3.56,11.87,3,18.51-6.24,24-2.15,1.29-5.81,3.88-8.4,2.4-1-5.07-3.83-6.44-6.24-10.8-1.93-3.51-.31-8-1.44-12.72-2-8.46-6.53-18.52,4.8-22.32,4.93,2.37,12.35,4.2,15.36,8.64l3.36-1c.67-4.21,3.48-4.76,4.08-7.2a3.25,3.25,0,0,1-2.4-1.2c-.8-1.19-1.77-5.58-1.2-7C29,15.31,32.56,14.7,35.23,11.76Z" transform="translate(0.04 0.02)"/>
										<path id="fakarava" data-reserve="fakarava" class="cls-2" d="M197.71,33.84c9.89-.25,27.42,3.17,28.8,10.32.77,4-3.2,7.56-4.8,9.6-2.09,2.66-4.87,5.57-8.16,7-6.61,2.79-24.29,5.06-31.2,1C165.69,51.8,188.77,38,197.71,33.84Z" transform="translate(0.04 0.02)"/>
										<path id="iroise" data-reserve="iroise" class="cls-2" d="M216.43,115.68c10.77-.21,20.23,8.72,20.88,18-1.59,3.19-9.26,6.23-14.16,4.08-4-1.76-3.08-6.25-5.28-9.84-1.85-3-5.44-3.7-5.52-8.64C213.38,117.28,214.74,117,216.43,115.68Z" transform="translate(0.04 0.02)"/>
										<path id="fontainebleau" data-reserve="fontainebleau" class="cls-2" d="M510.43,137.52c3.54,0,13.56,6.15,14.4,8.4,1.92,4.64-2.45,6.82-4.32,8.64l-2.4,6.72c-5.38,1.65-14.09-1.39-14.4-6.72-3.73-.34-6-2.43-7.92-4.56a30.3,30.3,0,0,0,0-8.4C499,138.41,506.44,140,510.43,137.52Z" transform="translate(0.04 0.02)"/>
										<path id="vosges-allemagne" data-reserve="vosges" class="vosges cls-2" d="M688,109.14c1.24-5.21-1.52-9,1.92-13-.85-3.7-4.07-6.59-4.32-9.6,2.61-1.21,6.35-.55,9.84-1.68,3-1,5.37-4.54,8.16-6.24.52-2.19.66-5.12,1.68-6.72a8.55,8.55,0,0,1,4.56-.48,17.61,17.61,0,0,0,1.44,3.84h.24c1.87-2.28,3.21-5.43,4.84-7.82.92.32.5,0,1,.72,1.48,3-.66,7.72-.24,11.28l1.68,4.8v.24c.57,3.68-1.6,5.22-2.16,7.92v10.08l-1.2,1v.24c-1.64.48-4.08,1.65-4.8,3.12,0,.27-1.71,10-1.76,10.28Z" transform="translate(0.04 0.02)"/>
										<path id="vosges" data-reserve="vosges" class="cls-2" d="M716.35,67.44c.92.32.5,0,1,.72,1.48,3-.66,7.72-.24,11.28l1.68,4.8v.24c.57,3.68-1.6,5.22-2.16,7.92v10.08l-1.2,1v.24c-1.64.48-4.08,1.65-4.8,3.12l-1.76,10.28c-.46.68-1.41.68-1.92,1.44-1.34,3.48,2.58,4.78,1.92,7.44-2.21,4.58-7.45,1.79-11,1l-1.68,4.08h-.72l-1.2-2.64c-2.65,1.71-5,1.32-8.64,2.64-.42.15-4.33,3.27-5.76,4.08-.17,3.79-.39,7.1-3.36,8.16-2.23.89-6.19-1-6.72-2.64v-2.46l-1.92-1.2c-1.85-1.66-2-4-2.64-7a8.67,8.67,0,0,1-3.12-1.68c.89-5.47,3.91-5.77,9.36-6.72,1.18-1.68,1.35-3.59.72-6-2.4-1.1-4.79-.05-7.2-.48V112.5c1.31-.4,3.76.06,5.52-.48,3.94-1.2,3.67-5.94,9.84-4.56.93,1.26,1.72,2.44,2.64,3.84,1.36-.77,3.73-1.29,5-2.16,1.56-5.51-1.63-8.85,1.92-13-.85-3.7-4.07-6.59-4.32-9.6,2.61-1.21,6.35-.55,9.84-1.68,3-1,5.37-4.54,8.16-6.24.52-2.19.66-5.12,1.68-6.72a8.55,8.55,0,0,1,4.56-.48,17.61,17.61,0,0,0,1.44,3.84h.24C713.38,73,714.72,69.83,716.35,67.44Z" transform="translate(0.04 0.02)"/>
										<path id="dorgogne" data-reserve="dordogne" class="cls-2" d="M491.23,299.28c20.24-.45,27.43,11.19,21.84,30.48-1.69,5.82-2.79,11.17-6,15.36-6.57,8.56-16.35,2.75-26.64,6.72-7.86,3-12.6,10.72-21.12,12.72-6.6,1.55-12.2-3.94-16.32-5.76-5.31-2.35-11.35-2.77-18-4.08-12.69-2.5-28.91,2.51-37.44-3.6-3.75-2.69-11.58-15.94-7.44-22.8,2.62-4.35,9.26-5.56,13.68-8.16,6.4-3.76,10.06-9,18.48-11,7.82-1.86,19.1,3.77,22.32-.48,2.69-1.26,4.71-3.41,8.16-4.08,8.58-1.66,12,6,19.2,5,3.14-.39,5-2.53,7.44-3.6,4.3-1.85,10.53-2.29,15.84-1.2C485.78,300.6,487.87,300.66,491.23,299.28Z" transform="translate(0.04 0.02)"/>
										<path id="cevennes" data-reserve="cevennes" class="cls-2" d="M544.27,369.6c6.49,0,6.05,2.57,9.36,4.8l8.16,1.68c11.86,5,.7,10.83-2.88,14.16.06,1.7.67,2.46.48,2.88-1.19,1.53-3.13,2.55-3.84,4.56s.71,2.84,1,4.08l-4.8,5-9.6-1c-1.12.2-3.17.92-4.56.24-2.39-1.17-2-3.93-3.36-6.24-2.63-4.65-10.83-7.14-8.88-14.64,1.52-1.07,6-2.58,6.72-4.32.63-1.46.18-4,.72-5.28,1.91-.18,4.81.3,6.48-.48C540.15,372.39,542.59,371.53,544.27,369.6Z" transform="translate(0.04 0.02)"/>
										<path id="gardon" data-reserve="gardon" class="cls-2" d="M558.87,403c3.31-.25,6.59-4.1,8.16-6.24,3.23,1.16,11.39,3.86,10.32,8.88l-3.36,5c-1.36,2.39-1.85,4.91-3.36,7-5,.1-8-1.53-11.76-2.64Z" transform="translate(0.04 0.02)"/>
										<path id="camargue" data-reserve="camargue" class="cls-2" d="M579.07,416.16c3.68.26,9.67.91,12.24,2.64l.72,7.44c1.74,1.22,4,2.37,5,4.32l-3.12,5,.72,1.44,1.68.48c-.7,2.91-2.07,4.52-3.6,6.48L579,443c-2.28-1-3-3.67-4.8-5-2.33-1.73-6.38-1.82-9.6-2.64-2.61-3.61-1.07-6-1.2-10.8l-.48-3.6.48-1c3.28-.76,9.87,1.42,12-.24C577,418.91,577.5,417.22,579.07,416.16Z" transform="translate(0.04 0.02)"/>
										<path id="ventou" data-reserve="ventou" class="cls-2" d="M600.19,373.68c3.66.06,12.62,4.21,13.92,6.24l1.2,4.32c.8,2,2.59,3,4.08,4.32v.24c-3.4,4.35-5.89.58-10.56,2.4-4,1.55-4.06,7-9.36,7.44L596.59,397v-.74c1.43-1,3.83-2.18,4.56-3.84,2.23-5.7-4.18-11.47-1.92-17.52Z" transform="translate(0.04 0.02)"/>
										<path id="luberon" data-reserve="luberon" class="cls-2" d="M632.35,381.12a14.59,14.59,0,0,1,8.4,1.92c1.37,9,2,19.89-2.64,25.68l-4.56,3.36c-1.62,2-2,4.2-4.56,5.28-4.51,1.9-8.72-.63-12.24-1.68l-8.64-.72c-3.47-1-12.3-7.9-14.64-10.56,0-2.28.83-3.85,2.4-4.56,2.37-1.08,8.66-.45,11.28-1.2,2.37-7.82,8.52-1.74,13.68-5.28,2.44-1.67,1.43-7.58,3.12-10.08C625.19,381.45,630.12,382,632.35,381.12Z" transform="translate(0.04 0.02)"/>
										<path id="viso" data-reserve="viso" class="cls-2" d="M661.63,343c7.35.11,15.08,7.3,16.32,13.68,10.71-5,12.31-7.23,24.72-2.64,2.51.93,4.15-.12,5.28,2.16,1.76,3.17.44,9.42-1.68,11-2.37,1.81-6.8.64-10.32,1.44-5.35,1.22-17.48,5.66-19.92,9.84l-.72-.48c-1.76-4.83-3.69-6-9.6-7v-1.2a14.47,14.47,0,0,0,1.44-5.28l-.24-.48h-.24c-1.38,1.06-4.18,3.54-6.48,2.64-2.54-1.26-6-19.94-5.28-21.12Z" transform="translate(0.04 0.02)"/>
										<path id="fango" data-reserve="fango" class="cls-2" d="M719.23,459.12c4,1.79,6.1,7.11,4.8,12.24l-1.44,1.44c-5.4.16-9.29-2.68-9.12-8.16C714.87,461.78,716.87,461,719.23,459.12Z" transform="translate(0.04 0.02)"/>
										<path id="audomarois" data-reserve="audomarois" class="cls-2" d="M503.47,11c5.11-.12,11.89,4.52,9.6,9.36-5.27,1.13-12.28-3.12-12.48-7.92l.72-1Z" transform="translate(0.04 0.02)"/>
									</g>
									<g id="reserves-on">
										<path id="corse-on" data-reserve="corse-on" class="corse-on cls-1" d="M742.75,431.28c6.2.14,5,3.33,6.24,7.92.44,1.59,1.83,4.52,1.44,6.72-.36,2-2.23,4.87-1.68,7l3.12,4.8V463c.83,3.76,3.54,17.15,2.16,21.84-.92,3.14-4.32,5.58-5.28,8.4-1.33,3.94.71,7.86,0,11.76l-2.88,10.76-2.64,2.16v2.64a21.27,21.27,0,0,1-3.36,7c-2.56.68-7.62.12-8.88-1.92-.64-1,0-1.89-1-2.64l-6.72-1.92-4.8-3.6c-.91-3.16-.31-5,.24-7.68l-.48-.48c-2.18.63-4.55-1.07-5.28-2.64l-.24-1.92c1.08-1.79,3-3,3.6-5.28l-1,.24c-.62,0-2.24.89-3.36.24l-1.68-1.2c-.38-1.79-1.32-4.45-.72-6a13.69,13.69,0,0,1,4.08-4.32l-.24-.48a15.4,15.4,0,0,1-4.8-2.16c-.65-3.27-2.13-6-1.44-8.88l1.92-1.2a6.62,6.62,0,0,1-1.68-6.72c4.15-2.73,3.66-7.48,6.48-11.52.72-1,10.19-4.18,13-5,1.74-5.2,6.76-5.79,11.76-4.08v-.24c-1.73-3.47-.86-5.9,0-9.6.45-1.94-.67-3.73.48-5.28Z" transform="translate(0.04 0.02)"/>
										<path id="guadeloupe-on" data-reserve="guadeloupe-on" class="guadeloupe-on cls-3" d="M35.23,11.76c3.83.4,8,4.74,8.88,8.16v5.76c.38,1.79,2.34,2.53,2.88,3.84L46.75,44.4c-9.24,1.07-11,5-19.2-.72l-1.92.24v2.64c3.56,11.87,3,18.51-6.24,24-2.15,1.29-5.81,3.88-8.4,2.4-1-5.07-3.83-6.44-6.24-10.8-1.93-3.51-.31-8-1.44-12.72-2-8.46-6.53-18.52,4.8-22.32,4.93,2.37,12.35,4.2,15.36,8.64l3.36-1c.67-4.21,3.48-4.76,4.08-7.2a3.25,3.25,0,0,1-2.4-1.2c-.8-1.19-1.77-5.58-1.2-7C29,15.31,32.56,14.7,35.23,11.76Z" transform="translate(0.04 0.02)"/>
										<path id="fakarava-on" data-reserve="fakarava-on" class="fakarava-on cls-4" d="M197.71,33.84c9.89-.25,27.42,3.17,28.8,10.32.77,4-3.2,7.56-4.8,9.6-2.09,2.66-4.87,5.57-8.16,7-6.61,2.79-24.29,5.06-31.2,1C165.69,51.8,188.77,38,197.71,33.84Z" transform="translate(0.04 0.02)"/>
										<path id="iroise-on" data-reserve="iroise-on" class="iroise-on cls-5" d="M216.43,115.68c10.77-.21,20.23,8.72,20.88,18-1.59,3.19-9.26,6.23-14.16,4.08-4-1.76-3.08-6.25-5.28-9.84-1.85-3-5.44-3.7-5.52-8.64C213.38,117.28,214.74,117,216.43,115.68Z" transform="translate(0.04 0.02)"/>
										<path id="fontainebleau-on" data-reserve="fontainebleau-on" class="fontainebleau-on cls-6" d="M510.43,137.52c3.54,0,13.56,6.15,14.4,8.4,1.92,4.64-2.45,6.82-4.32,8.64l-2.4,6.72c-5.38,1.65-14.09-1.39-14.4-6.72-3.73-.34-6-2.43-7.92-4.56a30.3,30.3,0,0,0,0-8.4C499,138.41,506.44,140,510.43,137.52Z" transform="translate(0.04 0.02)"/>
										<path id="vosges-allemagne-on" data-reserve="vosges-on" class="vosges-on cls-7" d="M688,109.14c1.24-5.21-1.52-9,1.92-13-.85-3.7-4.07-6.59-4.32-9.6,2.61-1.21,6.35-.55,9.84-1.68,3-1,5.37-4.54,8.16-6.24.52-2.19.66-5.12,1.68-6.72a8.55,8.55,0,0,1,4.56-.48,17.61,17.61,0,0,0,1.44,3.84h.24c1.87-2.28,3.21-5.43,4.84-7.82.92.32.5,0,1,.72,1.48,3-.66,7.72-.24,11.28l1.68,4.8v.24c.57,3.68-1.6,5.22-2.16,7.92v10.08l-1.2,1v.24c-1.64.48-4.08,1.65-4.8,3.12,0,.27-1.71,10-1.76,10.28Z" transform="translate(0.04 0.02)"/>
										<path id="vosges-on" data-reserve="vosges-on" class="vosges-on cls-8" d="M708.87,117.12a8.12,8.12,0,0,1-.94.69,2.35,2.35,0,0,0-1,.75c-1.34,3.48,2.58,4.78,1.92,7.44-2.21,4.58-7.45,1.79-11,1l-1.68,4.08h-.72l-1.2-2.64c-2.65,1.71-5,1.32-8.64,2.64-.42.15-4.33,3.27-5.76,4.08-.17,3.79-.39,7.1-3.36,8.16-2.23.89-6.19-1-6.72-2.64v-2.46l-1.92-1.2c-1.85-1.66-2-4-2.64-7a8.67,8.67,0,0,1-3.12-1.68c.89-5.47,3.91-5.77,9.36-6.72,1.18-1.68,1.35-3.59.72-6-2.4-1.1-4.79-.05-7.2-.48V112.5c1.31-.4,3.76.06,5.52-.48,3.94-1.2,3.67-5.94,9.84-4.56.93,1.26,1.72,2.44,2.64,3.84,1.36-.77,3.73-1.29,5-2.16Z" transform="translate(0.04 0.02)"/>
										<path id="dorgogne-on" data-reserve="dordogne-on" class="dordogne-on cls-9" d="M491.23,299.28c20.24-.45,27.43,11.19,21.84,30.48-1.69,5.82-2.79,11.17-6,15.36-6.57,8.56-16.35,2.75-26.64,6.72-7.86,3-12.6,10.72-21.12,12.72-6.6,1.55-12.2-3.94-16.32-5.76-5.31-2.35-11.35-2.77-18-4.08-12.69-2.5-28.91,2.51-37.44-3.6-3.75-2.69-11.58-15.94-7.44-22.8,2.62-4.35,9.26-5.56,13.68-8.16,6.4-3.76,10.06-9,18.48-11,7.82-1.86,19.1,3.77,22.32-.48,2.69-1.26,4.71-3.41,8.16-4.08,8.58-1.66,12,6,19.2,5,3.14-.39,5-2.53,7.44-3.6,4.3-1.85,10.53-2.29,15.84-1.2C485.78,300.6,487.87,300.66,491.23,299.28Z" transform="translate(0.04 0.02)"/>
										<path id="cevennes-on" data-reserve="cevennes-on" class="cevennes-on cls-10" d="M544.27,369.6c6.49,0,6.05,2.57,9.36,4.8l8.16,1.68c11.86,5,.7,10.83-2.88,14.16.06,1.7.67,2.46.48,2.88-1.19,1.53-3.13,2.55-3.84,4.56s.71,2.84,1,4.08l-4.8,5-9.6-1c-1.12.2-3.17.92-4.56.24-2.39-1.17-2-3.93-3.36-6.24-2.63-4.65-10.83-7.14-8.88-14.64,1.52-1.07,6-2.58,6.72-4.32.63-1.46.18-4,.72-5.28,1.91-.18,4.81.3,6.48-.48C540.15,372.39,542.59,371.53,544.27,369.6Z" transform="translate(0.04 0.02)"/>
										<path id="gardon-on" data-reserve="gardon-on" class="gardon-on cls-11" d="M558.87,403c3.31-.25,6.59-4.1,8.16-6.24,3.23,1.16,11.39,3.86,10.32,8.88l-3.36,5c-1.36,2.39-1.85,4.91-3.36,7-5,.1-8-1.53-11.76-2.64Z" transform="translate(0.04 0.02)"/>
										<path id="camargue-on" data-reserve="camargue-on" class="camargue-on cls-12" d="M579.07,416.16c3.68.26,9.67.91,12.24,2.64l.72,7.44c1.74,1.22,4,2.37,5,4.32l-3.12,5,.72,1.44,1.68.48c-.7,2.91-2.07,4.52-3.6,6.48L579,443c-2.28-1-3-3.67-4.8-5-2.33-1.73-6.38-1.82-9.6-2.64-2.61-3.61-1.07-6-1.2-10.8l-.48-3.6.48-1c3.28-.76,9.87,1.42,12-.24C577,418.91,577.5,417.22,579.07,416.16Z" transform="translate(0.04 0.02)"/>
										<path id="ventou-on" data-reserve="ventou-on" class="ventou-on cls-13" d="M600.19,373.68c3.66.06,12.62,4.21,13.92,6.24l1.2,4.32c.8,2,2.59,3,4.08,4.32v.24c-3.4,4.35-5.89.58-10.56,2.4-4,1.55-4.06,7-9.36,7.44L596.59,397v-.74c1.43-1,3.83-2.18,4.56-3.84,2.23-5.7-4.18-11.47-1.92-17.52Z" transform="translate(0.04 0.02)"/>
										<path id="luberon-on" data-reserve="luberon-on" class="luberon-on cls-14" d="M632.35,381.12a14.59,14.59,0,0,1,8.4,1.92c1.37,9,2,19.89-2.64,25.68l-4.56,3.36c-1.62,2-2,4.2-4.56,5.28-4.51,1.9-8.72-.63-12.24-1.68l-8.64-.72c-3.47-1-12.3-7.9-14.64-10.56,0-2.28.83-3.85,2.4-4.56,2.37-1.08,8.66-.45,11.28-1.2,2.37-7.82,8.52-1.74,13.68-5.28,2.44-1.67,1.43-7.58,3.12-10.08C625.19,381.45,630.12,382,632.35,381.12Z" transform="translate(0.04 0.02)"/>
										<path id="viso-on" data-reserve="viso-on" class="viso-on cls-15" d="M661.63,343c7.35.11,15.08,7.3,16.32,13.68,10.71-5,12.31-7.23,24.72-2.64,2.51.93,4.15-.12,5.28,2.16,1.76,3.17.44,9.42-1.68,11-2.37,1.81-6.8.64-10.32,1.44-5.35,1.22-17.48,5.66-19.92,9.84l-.72-.48c-1.76-4.83-3.69-6-9.6-7v-1.2a14.47,14.47,0,0,0,1.44-5.28l-.24-.48h-.24c-1.38,1.06-4.18,3.54-6.48,2.64-2.54-1.26-6-19.94-5.28-21.12Z" transform="translate(0.04 0.02)"/>
										<path id="viso-italie-on" data-reserve="viso-on" class="viso-on cls-7" d="M690.8,351.27c6-.68,8.15,1.79,11.87,2.73s5.72-.4,6.1,6.2c.62,10.76-9.65,7.61-17.06,10.26-4.86,1.73-10.83,3.94-15.68,8,0-4.38,2.15-7.68,3.68-11.1,2.27-5.1-.53-5.7-1.52-10.66A42,42,0,0,1,690.8,351.27Z" transform="translate(0.04 0.02)"/>
										<path id="fango-on" data-reserve="fango-on" class="fango-on cls-17" d="M719.23,459.12c4,1.79,6.1,7.11,4.8,12.24l-1.44,1.44c-5.4.16-9.29-2.68-9.12-8.16C714.87,461.78,716.87,461,719.23,459.12Z" transform="translate(0.04 0.02)"/>
										<path id="audomarois-on" data-reserve="audomarois-on" class="audomarois-on cls-18" d="M503.47,11c5.11-.12,11.89,4.52,9.6,9.36-5.27,1.13-12.28-3.12-12.48-7.92l.72-1Z" transform="translate(0.04 0.02)"/>
									</g>
								</svg>
							</div>
						</div>
					</div>
				</section>
				<section class="contact">
					<div class="ui container">
						<div class="ui two column grid">
							<div class="column">
								<h2 class="marron">
								<xsl:choose>
									<xsl:when test="$current-language='fr'">Suivez-nous...</xsl:when>
									<xsl:otherwise>Follow us...</xsl:otherwise>
								</xsl:choose>
								</h2>
								<div class="ui middle aligned selection list">
									<div class="item">
										<img class="ui avatar image" src="/workspace/img/facebook-logo.svg" alt=""></img>
										<div class="content">
											<div class="header">
											<xsl:choose>
												<xsl:when test="$current-language='fr'">Sur notre page Facebook</xsl:when>
												<xsl:otherwise>On Facebook</xsl:otherwise>
											</xsl:choose>
											</div>
										</div>
									</div>
									<div class="item">
										<img class="ui avatar image" src="/workspace/img/instagram-logo.svg" alt=""></img>
										<div class="content">
											<div class="header">
											<xsl:choose>
												<xsl:when test="$current-language='fr'">Sur Instagram</xsl:when>
												<xsl:otherwise>On Instagram</xsl:otherwise>
											</xsl:choose>
											</div>
										</div>
									</div>
									<div class="item">
										<img class="ui avatar image" src="/workspace/img/vimeo-social-logo.svg" alt=""></img>
										<div class="content">
											<div class="header">
											<xsl:choose>
												<xsl:when test="$current-language='fr'">Sur Vimeo</xsl:when>
												<xsl:otherwise>On Vimeo</xsl:otherwise>
											</xsl:choose>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="column">
								<h2 class="marron">
								<xsl:choose>
									<xsl:when test="$current-language='fr'">Contactez-nous</xsl:when>
									<xsl:otherwise>Contact-us</xsl:otherwise>
								</xsl:choose>
								</h2>
								<p>MAB France									
									<br/>24, chemin de Borderouge,									
									<br/>Auzeville CS 532627									
									<br/>31326 Castanet Tolosan Cedex									
									<br/>contact[at]mab-france.org
								</p>
							</div>
						</div>
					</div>
				</section>
				<!--  -->
				<section class="menu-footer">
					<xsl:call-template name="mab-menu-principal-footer"/>
				</section>
			</xsl:when>
			<!-- pages de contenus -->
			<xsl:otherwise>
				<div class="main ui container">
					<!-- breadcrumb -->
					<div class="ui breadcrumb">
						<a href="{$root}{$url-lang}" class="section">
							<xsl:value-of select="$page-title"></xsl:value-of>
						</a>
						<!-- rubrique ? (non cliquable) -->
						<xsl:if test="$rubrique !=''">
							<div class="divider"> / </div>
							<xsl:value-of select="/data/rubriques-principales/entry[nom/item/@handle = $rubrique]/nom/item[@lang=$language]"></xsl:value-of>
							<!-- sous rubrique ? (cliquable) -->
							<xsl:if test="$s-rubrique!=''">
								<div class="divider"> / </div>
								<a href="{$root}{$url-lang}/{$rubrique}/{$s-rubrique}/" class="section">
									<xsl:value-of select="/data/menu-principal/entry[nom/item/@handle = $s-rubrique]/nom/item[@lang=$language]"></xsl:value-of>
								</a>
								<!-- ss rubrique ? (non cliquable -->
							</xsl:if>
						</xsl:if>
					</div>
					<!-- end breadcrumb -->
					<!-- toc -->
					<div class="ui segment" id="content">
						<div class="ui rail right very close">
							<div class="ui sticky">
								<div id="tocContents"></div>
							</div>
						</div>
						<!-- contenu de la section page -->
						<!-- acceuil sinon s-rubrique ou ss-rubrique -->
						<section id="contents">
							<h1>
								<xsl:value-of select="page-content/entry/nom/item[@lang=$language]"></xsl:value-of>
							</h1>
							<p>
								<xsl:copy-of select="page-content/entry/contenu/item[@lang=$language]"></xsl:copy-of>
							</p>
						</section>
					</div>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>