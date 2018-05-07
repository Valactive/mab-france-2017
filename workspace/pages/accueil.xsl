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
	<xsl:when test="$rubrique ='' and $s-rubrique = '' and $ss-rubrique = ''">
		<!-- home page -->
<!-- 		<h1><xsl:value-of select="page-content-1level/entry/nom/item[@lang=$language]"/></h1>
<p><xsl:copy-of select="page-content-1level/entry/contenu"></xsl:copy-of></p> -->
<section class="hero">
	<!-- Contenu hero -->
	<div class="ui grid container centered">
		<div class="hero-slogan items">
			<div class="item">
				<div class="bottom aligned content">
					<br/>
					<h1 class="ui center">Le réseau MAB FRANCE, un soutien important<br/>pour la gestion des réserves de biosphère</h1>
					<br/>
					<a href="{$root}" class="ui tiny blue button">Découvrez nos actions</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Annonce home page -->
<section class="annonce">
	<div class="ui container grid centered center">


		<div class="row">
			<h1 class="text-primary"><xsl:value-of select="home-page-annonce/entry/nom-home-page[item/@lang=$language]"/></h1>
		</div>
		<div class="row">
			<xsl:copy-of select="home-page-annonce/entry/contenu-home-page[item/@lang=$language]"/>
		</div>
<xsl:choose>
	<xsl:when test="home-page-annonce/entry/lien-1/item[@lang=$language] != '' and home-page-annonce/entry/lien-2/item[@lang=$language] != ''">
			<!-- two buttons -->
			<div class="three column row">
				<div class="six wide column right aligned content">
					<a href="{home-page-annonce/entry/lien-1/item[@lang=$language]}" class="ui primary circular tiny button"><xsl:value-of select="home-page-annonce/entry/nom-lien-1/item[@lang=$language]"/></a>
				</div>
				<div class="two wide column">
					<p></p>
				</div>
				<div class="six wide column left aligned content">
					<a href="{home-page-annonce/entry/lien-2/item[@lang=$language]}" class="ui secondary circular tiny button"><xsl:value-of select="home-page-annonce/entry/nom-lien-2/item[@lang=$language]"/></a>
				</div>
			</div>
</xsl:when>
	<xsl:otherwise>
		<!-- one button -->
		<div class="column row center aligned content">
			<a href="{home-page-annonce/entry/lien-1/item[@lang=$language]}" class="ui primary circular button"><xsl:value-of select="home-page-annonce/entry/lien-1/item[@lang=$language]"/></a>
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
								<h2 class="left floated">Actualités &amp; publications</h2>
							</div>
							<div class="column four wide bottom content aligned">
								<a href="#" class="ui mini primary button right floated">Tout voir</a>
							</div>
						</div>
						<!-- start cards row -->
						<div class="row">
							<div class="ui two column grid">
								<!-- <div class="column"> -->
								<!-- start card 1 -->
								<div class="ui two link cards">
									<div class="card">
										<div class="image">
											<img src="/workspace/img/img-actu.png" alt="image de l'actualité"/>
										</div>
										<div class="content">
											<a href="#" class="header">Construire et rénover : paille, chanvre et terre</a>
											<div class="description">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim.</div>
										</div>
										<div class="meta">
											<a href="#" class="ui primary basic button right floated"> Lire la suite <i class="arrow alternate circle right outline icon"></i></a>
											<br/><br/>
											<p class="small center aligned content">Actualités - 12 décembre 2017</p>
										</div>
									</div> <!-- end card 1 -->
									<!-- </div> --> <!-- end col1 -->


									<!-- card two col2 -->
									<!-- <div class="ui column"> -->
									<!-- start card 2 -->
									<div class="card">
										<div class="image">
											<img src="/workspace/img/img-actu.png" alt="image de l'actualité"/>
										</div>
										<div class="content">
											<a href="#" class="header">Construire et rénover : paille, chanvre et terre</a>
											<div class="description">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim.</div>
										</div>
										<div class="meta">
											<a href="#" class="ui primary basic button right floated"> Lire la suite <i class="arrow alternate circle right outline icon"></i></a>
											<br/><br/>
											<p class="small center aligned content">Actualités - 12 décembre 2017</p>
										</div>
									</div><!-- end card 2 -->
								</div> <!-- end cards -->
								<!-- </div> --><!-- end col2 -->
							</div><!-- end grid 2cols for cards -->

						</div> <!-- end cards row -->

					</div> <!-- end col left grid -->
				</div> <!-- end col left -->
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
								<a href="#" class="ui mini button primary">Lire la lettre en ligne</a>
							</div>
						</div>
					</div>
					<div class="ui grid">
						<div class="two column row">
							<div class="column one wide"><p></p></div>
							<div class="column fifteen wide newsletterTextBlock">
								<p>Le Mab France publie la Lettre de la biosphère quatre fois
									par an.</p>

									<p>Vous pouvez vous inscrire <a href="">sur nos listes</a> pour la recevoir
									dans votre boite mail !</p>
									<p>
										Sinon, vous pouvez également <a href="">consulter en ligne</a> toutes les
										lettres que nous avons publié.</p>
									</div>
								</div>
							</div>
						</div>
					</div> <!-- end 2 col grid -->
				</div> <!-- end container  -->
			</section> <!-- end section actu-newsletter -->
			<section class="reserves container">
				<div class="ui">
					<div class="ui two column grid title">
						<div class="row">
							<div class="column five wide right aligned content">
								<h2 class="osibv">Explorez</h2>
							</div>

							<div class="column eleven wide">
								<h2 class="osliv">Les 14 réserves de biosphère en France</h2>
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
								<a data-reserve="dorgogne" href="{$root}/biosphere/reserve-de-biosphere-" class="item">
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
								xmlns="http://www.w3.org/2000/svg"
								viewBox="0 0 754.41 527.79">
								<g id="fonds">
									<path id="france" class="cls-1" d="M493.48,564.7c-7.75.71-8.52-3.82-14.16-6h-7.44c-3.37-.72-9.06-3.64-7.2-8.64l2.88-3.6v-.24h-.24c-4.25,1.49-15.35-8.9-13.44-13.92,1.37-3.61,4.68-2.25,8.16-3.84l8.4-9.12c2.53-4.94,1.93-10.07,3.84-15.6,2.1-6.09,4.78-14,6.72-20.4,2.05-6.79.35-13.58,1.68-19.68,2.05-9.39,5-20.7,7.2-30.24,1-4.07,1.47-8,2.16-11.52v-4.8l2.88-4.32c-1.35-1.41-4-2.52-5-4.08-4-5.87,3.74-12.41,6.48-15.12,0-1.88.41-5.6,0-6.24-1.46-3.09-5.42-4.77-3.12-9.84-4.85-4.91-15.92-7.56-19.68-13-2.14-3.07-1.65-8.67-3.84-11.76-2.68-3.78-9.71-9-8.16-15.6.8-3.39,4-4.36,5.28-7.44-2.34-.88-6.31-2.13-7.2-4.56-.4-1.08-.09-2.69-.48-3.12-2.13-2.49-7.72-2.14-9.84-5.28-1.37-2,.11-9.67-1-10.56-1.7-1-2.3-.23-4.56-.72-2.57-.56-5.3-3.51-6.48-5.52-1.87.59-4.54,1.15-6.24,0-2.76-1.87-2.26-6.71-5.52-8.4l-4.8-.48L416.68,287c-5.06-3.78-9.54-.51-13-7H399.4c-3.39,1.43-12.31,3.75-14.4-1-1.76-4,1.77-7.71-1.92-10.08-3.34-2.15-9.3-2-10.32-6.48s3.33-6.46,6.24-6.72c.66-.06.87,0,.48-.48.67-2.15-.05-3-.48-5-3.06-.32-3.45-1.87-4.8-3.84H374c-.75,3.32-8.67,5.85-13.2,4.08-4.27-1.67-3.16-5.5-5.28-9.36-1.76-3.19-5.65-4.23-6-8.88,6.55-10.16,22.12,3.44,24,11.28l.48-.24c-.23-15.09,11.11-16.77,22.32-19.44,2-.48,3.53.83,4.8.72,2.71-.23,7-2.55,10.32-1.68l2.64,1.92,3.6-.48,3.36,1.44c1.23-3,4.52-8.06,9.84-6.72l2.64,1.2,4.08-1.68a83.22,83.22,0,0,1,9.84.72,75.87,75.87,0,0,1,9.6,18.72l.72-.72c4.41-1.47,14.92-10.53,17.76-1,4.35-.24,14.53-7.73,16.8-.24v3.36l1.68-.24V239c-.32-1.15-1.28-7-1-8.4l1.68-4.8c.17-3.35-2.52-8.34-.24-12-2.94-6.74-10.19-16.17-6-24.72-2.05-2.63-4.69-9.25,0-11.28,4.73-2.39,9.19,2.61,12.72,3.6,3,.84,4.54-1.66,7-2.16,6.62-1.36,12.71,3.75,12.24,9.84l-2.64,5.28,2.16,4.08c6.54-.68,5.87,1.4,10.08,2.64,8.62,2.54,14,.74,20.16,5.76,3.19-.29,5.6-1,7-3.12-2.23-5.85.35-8.22,2.64-12.24,1.31-2.3,2-4.79,4.08-6.24,1.77-1.23,3.45-1,5.76-1.92,4.09-1.58,6.84-4.78,12.24-5.52,7.79-1.07,14.74-.48,20.16-4.32,5.75-4.08,9.19-9.08,11-16.56,1.74-7-.91-13.07.72-19.68l1.44-2.4c.54-2.51-1.55-5.72,0-8.4,1-1.76,2.57-1.32,4.32-2.4l3.6-3.36,22.32-3.6c4.57-1.14,6.76-5.36,12.48-4.08,2,2.51,5.52,12,3.6,15.12,2.42.77,3.41,2.84,4.32,5l6.72-2.64c4.78-1,10.62,6.34,11.28,9.12.52,2.21.11,3.83.24,6,6-2.33,13.49,3.72,13.44,9.6h.24L698,155c1.54-.25,2.9.68,3.84,1s2.77-1.6,4.8-1c1,.31,9.31,7.27,9.6,8.16.87,2.65-1.11,4.07-1.68,6,1,1.55,1.41,7,2.88,8.16l2.16,1c5.46-3.24,6.56-12.39,14.64-12.48,2.33,1.13,5.91,4.83,5,8.88-.44,2.05-1.69,2.47-1.92,5a9.27,9.27,0,0,1,1.92,6.72c2.38.86,3.45,2.94,5.28,4.32,2.33,1.76,5.47,2.48,7.92,4.32s4.12,4.64,6.48,6.48c3-1.18,12.87-2.34,14.64.24,1.31,1.92.77,3.21,2.64,4.56l4.08-2.16c3.44-.69,5,1.79,7,2.64,8.7,3.75,7.79,1.75,12,10.32,1,2.09,2.87,3.16,3.6,6,1.4-1,11.32-3.83,13.68-3.12,2,.61,2.51,2.75,3.6,4.32a9.51,9.51,0,0,1,4.32-1.44c3.33-5-.8-7.31,1-12l1.92-2.16-4.56-9.12c2.76-1.57,6.63-.58,10.32-1.92l8.16-7c.85-2.33.39-4.34,1.44-6l3.36-.48c.92.32.5,0,1,.72l1.2,3.12,1.2-.24c.93-3.35,2.55-5.27,4.32-7.68,2.59,2.52-.27,8.85.48,13l1.68,4.8c.33,3.08-1.9,5-2.4,7.68-.81,4.27,1,7.85-1,10.56-1.61.56-4.07,1.62-4.8,3.12L846,229.42c2.75.57,3.2,3.1,5.28,3.84l3.36-.24c2.42.54,6.65,3.26,5.76,7-.65,2.71-3.79,4-5,6.24l-1.68,6c-1,1.55-2.88,1.61-4.08,2.88-.14.15-3.6,6-3.6,6l-.24,3.6c-.93,4-1.51,8.33-2.88,12.72-1.14,3.65-4.52,7.35-5.76,10.8l1.2,10.08c-.41,1.93-2.14,2.93-2.64,4.32l.24,6.24c-.84,3.72-.56,9.2-1.68,12.48-1.56,4.57-10.78,8.82-17,7-.3,4.68-7.88,13.72-10.8,16.32l-3.12,1.92c-1.25,2-.15,3.47-1.92,4.8-.8.6-6,2.12-6.24,2.4-1.57,2.06.24,6.07-1,8.16-2,3.43-7.6,4.58-10.08,7.68s-.87,6.81-4.56,9.6l1.68,1.68.24.72c3.51-2.23,4-.35,6.72-1.2l3.12-1.92h4.56c7.35-1.35,11.63.94,13.92,6.48,1.81,4.39-2.32,6.83-1,9.12,4.68,2.68,10.63,13.29,6,20.16-1.31,1.95-4.66,1.91-6.24,3.6,1.26,1.93,4.25,1.78,5.52,3.6,1.46,2.1,0,4.77,1,6.72,1.52,3.12,7.91,4.75,7.44,9.6-.2,2.08-2.1,3.55-2.4,5-.43,2.15,1.9,4.69.24,7.2-2.42,3.66-6.49,2.2-10.56,4.32-.7,2.52-1.95,2.77-4.08,3.84l.48.72c5.16,1.92,5.85,6.81,9.12,10.56,4.06-1.35,7.77-4.45,11.52-5.52,5.5-1.57,10.24,2.37,13.68,3.36,2.66.77,3.47-.31,4.56,1.92,1.34,2.69.35,8.12-1,9.84-2.15,2.83-7.49,1.39-11.52,2.4-6.12,1.53-14.52,4.95-19.2,8.4-.14,2-1.1,5.82-1,6.24,1.31,2.78,4.14,5.75,6,8.16,3.09-.06,5.54,1.57,7.44,1.44,4.09-.27,12.74-4.74,15.84,0,1,1.5.14,2.69.48,4.56,1.17,6.44-2.74,8.11-4.56,12.72l.24,5.76c.46,4.82-4.12,6.52-8.16,7.2-.53,4.7-4.06,2.88-6.72,4.56-.86,1-.47,3.47-1.2,4.56-1.63,2.44-4.51,1.46-7,3.12L812.68,552c-1.86,1.85-5.24,1.74-7.44,2.64-.49,2.66,1.15,6.68-.48,9.12-3.73,5.59-9.21,2.36-13,5l-1.68,3.12c-1.85,1.37-4.46.09-6.72.72L782,574.3c-3.78,2.34-8.1.6-10.56-1.2-2.32.28-3.42,2.21-6.48,1.44-3.46-.87-3.88-4.13-6.24-5.76l-4.08-.72-2.88-2.64h-3.36c-6.26-1-7-1.79-8.16-7.2-4.51,1.34-7.77.3-10.32-1.68-5.18,2.68-19,2.51-19.2-4.8a18.44,18.44,0,0,1-17-6.24c-2,.73-14.48,8.37-15.84,9.84-1,1.07-1.21,2.49-2.4,3.36-2.95,2.18-7.13-.49-9.84,1.44s-7,7.11-7.68,10.56l.48,4.32c-.77,5.72-2.42,12.12-2.16,18,10.91,4.83,2.57,20-8.16,11.52-2.11.21-6.56,1.2-8.16,2.16s-1.8,3.08-4.32,3.6c-9.06,1.87-12.13-4.43-19-5.52-2.85,2.27-11,5.2-13.68,1.2-1-1.45-.88-3.23-2.16-4.32-4.82-4.1-9.53.61-8.64-9.84L590,590.38c-7.56,6-8.33.44-11.52-4.8-3.75.3-7,.84-8.88-1.68l-1.2-2.64c-1.7-1.46-3.73.43-6-.48l-2.4-2.16h-.24c.12,9-10.48,6.07-17,5.28-3.67-.44-5.54,3.21-8.64-1.68-10.67,2.95-14.58-3.45-20.64-8.16-1.88.78-7.8,2-10.08,1.44S493.54,567.55,493.48,564.7Z" transform="translate(-137.13 -112.78)"/><g id="guadeloupe">
									<path class="cls-1" d="M172.36,124.3c3.87.28,8.2,4.66,9.12,7.92s-.44,6.18,1.2,8.4c2.06,2.79,5,1.11,8.64,2.64A123.65,123.65,0,0,1,205,152.62l-.24,1.2L202.84,156c-3,0-5-1.56-7.2-1.44-9.85.55-23.33,10.44-31,2.16l-1.68.24v1.2c3.66,12.93,3.11,19.84-6.72,25.68-2.15,1.28-5.7,3.73-8.4,2.16-1.21-5.07-3.94-6.66-6.24-10.8-2-3.53-.26-7.84-1.44-12.72-1.08-4.47-4.2-10.57-2.64-15.84,1.42-3.2,3.81-6.57,8.16-7,2.6,2.08,5.64,2.4,9.12,3.84,2.56,1.06,4,3,6,4.56l2.88-.72c.58-3.93,2.67-4.23,4.08-6.72-1.42-.28-2.08-.51-2.64-1.68-.71-1.47-1.64-5.34-1-7C165.86,127.9,169.3,126.91,172.36,124.3Z" transform="translate(-137.13 -112.78)"/>
									<path class="cls-1" d="M160.6,140.38a3.74,3.74,0,0,1,2.4,1.68c.53,1.31-.12,1.83-.72,2.64-1.42.35-2,.77-3.6.48a3.13,3.13,0,0,1-.48-2.88C158.79,141,159.42,141,160.6,140.38Z" transform="translate(-137.13 -112.78)"/>
									<path class="cls-1" d="M217.48,140.86c1.89,0,4.06.64,4.8,1.92v1.44c-1,2.06-11,8.43-13.44,4.32V147.1C210.47,144.17,214.74,142.79,217.48,140.86Z" transform="translate(-137.13 -112.78)"/>
									<path class="cls-1" d="M208.6,158.86l2.16,1,.24,1.44-1.92,2.4h-2.16L205,162a3.34,3.34,0,0,1,.72-2.4Z" transform="translate(-137.13 -112.78)"/>
									<path class="cls-1" d="M192,176.86c4.35.16,5.76,1.91,7.2,5,.86,1.88,3.59,3,2.64,6.72-1.17,4.54-9.78,7.65-14.64,4.8l-2.88-7.2A21.76,21.76,0,0,1,192,176.86Z" transform="translate(-137.13 -112.78)"/>
									<path class="cls-1" d="M160.84,190.06l2.16.24,1.44,2.16c-.14.93-2.5,5.09-3.12,6h-.24a11.62,11.62,0,0,1-7.68-2.64l.72-3.6C156.51,191.36,158.31,191.17,160.84,190.06Z" transform="translate(-137.13 -112.78)"/></g><g id="Fakarava_archipel" data-name="Fakarava archipel">
									<path class="cls-1" d="M329.08,124.06l1.44.24v4.08c-.7,1.55-2.44,2.3-4.56,2.4l-1.68-1.2.24-1.44C325.41,126.32,327.62,125.34,329.08,124.06Z" transform="translate(-137.13 -112.78)"/>
									<path class="cls-1" d="M348.52,124.78c2.4,0,3.34.49,4.08,2.16-.83,2.21-3.13,4.53-6.24,3.6A6.11,6.11,0,0,1,348.52,124.78Z" transform="translate(-137.13 -112.78)"/>
									<path class="cls-1" d="M318.76,126.46c2.21.23,3.08.7,3.84,2.4-.9,2-2.18,2.62-4.32,3.36l-1.44-1.44C316.13,128.46,317.22,127.31,318.76,126.46Z" transform="translate(-137.13 -112.78)"/>
									<path class="cls-1" d="M343,130.54l2.4.48,1,1.2v1c-1.37,1.12-2.67,2.69-4.8,1.68a6.53,6.53,0,0,1,.24-3.36Z" transform="translate(-137.13 -112.78)"/>
									<path class="cls-1" d="M269.8,135.1l1.2.24c-.15,2-1,2.84-1.92,4.08-1.89.64-4.88.24-4.08-2.16C266,135.41,268.06,136.12,269.8,135.1Z" transform="translate(-137.13 -112.78)"/>
									<path class="cls-1" d="M277,136.78a11.06,11.06,0,0,1,4.32.72l.72,2.64c-.81,2.24-1.66,4.35-4.56,4.56l-.24-.24c-2.17-1-2.61-4.36-1.68-7Z" transform="translate(-137.13 -112.78)"/>
									<path class="cls-1" d="M356,137.26h3.36v.48c.69,1.39.23,2.3-.48,3.36h-.24l-1.92-.24L355,139.42a3.61,3.61,0,0,1,.48-1.92Z" transform="translate(-137.13 -112.78)"/><path class="cls-1" d="M287.08,137.74c1.2.49,3,.27,4.8,1l3.84,4.56c1.55,1,3,1,4.32,1.92a3.07,3.07,0,0,1-.72,2.16C292.7,148.64,278.27,145.75,287.08,137.74Z" transform="translate(-137.13 -112.78)"/><path class="cls-1" d="M308.44,143.26a11.31,11.31,0,0,1,4.8,1.92l.24.48c.14,4-2.64,5.34-5.76,4.56l-2.16-3.36Z" transform="translate(-137.13 -112.78)"/><path class="cls-1" d="M319.24,145.9l4.08.48,1,1.2c.32,5.34-2,7.07-6.72,5.76l-.72-1.2C316,149.26,317.66,147.15,319.24,145.9Z" transform="translate(-137.13 -112.78)"/><path class="cls-1" d="M335.8,146.62c8.47-.19,29.52,4,27.6,12.24-1.39,6-7.85,12.51-13.2,14.64l-9.12,2.16v.24c2.81.08,5.06.69,6.48,2.16l-.24,1.2-1.44,1.44a6.2,6.2,0,0,1-4.56.24c-1.22-1.61-2.87-2.38-2.4-5-15,1.35-29.32-.83-23-15.36-5.9.25-10-.81-10.32-6.48l.72-.72c3,.1,5.76,1,9.12,1.68a10.22,10.22,0,0,1,1.92,3.6c4.24-3.17,8.5-7.6,13-10.32Z" transform="translate(-137.13 -112.78)"/><path class="cls-1" d="M276.52,156.46l1.44.24,1.68,1.68-.72,2.16h-2.64l-1.68-1.92.24-.72C275.33,157,275.7,157,276.52,156.46Z" transform="translate(-137.13 -112.78)"/><path class="cls-1" d="M360.76,167.5l1.68.24.72.48a5.17,5.17,0,0,1-.48,2.64h-1.2a6.76,6.76,0,0,1-1.92-2.16l.24-.72Z" transform="translate(-137.13 -112.78)"/><path class="cls-1" d="M364.12,169.66a4.55,4.55,0,0,1,2.4,1.44l-.48,2.16a2.85,2.85,0,0,1-2.64-.48v-.24l.24-2.16Z" transform="translate(-137.13 -112.78)"/><path class="cls-1" d="M374,169.9l.24,7.2h-1l-2.4-3.12.24-1.68C371.73,170.93,372.74,170.68,374,169.9Z" transform="translate(-137.13 -112.78)"/><path class="cls-1" d="M364.12,174l2.4.48c.87,2.16.71,2.78-1,4.08l.72,1.2a3.24,3.24,0,0,1-1.92,1.68c-1.77-.64-1.58-4.4-1-7Z" transform="translate(-137.13 -112.78)"/><path class="cls-1" d="M368.68,176.38c2.05,0,1.86.28,2.64,1.44l-.24.72-.48.48H368l-.72-1.44Z" transform="translate(-137.13 -112.78)"/><path class="cls-1" d="M352.6,177.58h2.16c1.18,1.63,2.92,2.45,4.32,3.84a3.89,3.89,0,0,1-1,3.12h-.48c-3.77,1.13-7.15-1.76-8.88-3.6a5.19,5.19,0,0,1,.48-2.64Z" transform="translate(-137.13 -112.78)"/><path class="cls-1" d="M362.68,184.06a5.26,5.26,0,0,1,3.12.72,5.08,5.08,0,0,1-1,4.08l-.48.24a3.61,3.61,0,0,1-1.92-.48l-1.92-2.16.72-1.92Z" transform="translate(-137.13 -112.78)"/><path class="cls-1" d="M337,190.3c1.9.26,4.77,1.11,5.52,2.64v1.2c-.17,1.24-.3,1.43-1.2,1.92-1.44.47-4.76-1.34-6-2.16a5.27,5.27,0,0,1-.24-2.64Z" transform="translate(-137.13 -112.78)"/></g><path id="corse" class="cls-1" d="M879.88,544.06c6.2.14,5,3.33,6.24,7.92.44,1.59,1.83,4.52,1.44,6.72-.36,2-2.23,4.87-1.68,7l3.12,4.8v5.28c.83,3.76,3.54,17.15,2.16,21.84-.92,3.14-4.32,5.58-5.28,8.4-1.33,3.94.71,7.86,0,11.76L883,628.54l-2.64,2.16v2.64a21.25,21.25,0,0,1-3.36,7c-2.56.68-7.62.12-8.88-1.92-.64-1,0-1.89-1-2.64l-6.72-1.92-4.8-3.6c-.91-3.16-.31-5,.24-7.68l-.48-.48c-2.18.63-4.55-1.07-5.28-2.64l-.24-1.92c1.08-1.79,3-3,3.6-5.28l-1,.24c-.62,0-2.24.89-3.36.24l-1.68-1.2c-.38-1.79-1.32-4.45-.72-6a13.69,13.69,0,0,1,4.08-4.32l-.24-.48a15.3,15.3,0,0,1-4.8-2.16c-.65-3.27-2.13-6-1.44-8.88l1.92-1.2a6.64,6.64,0,0,1-1.68-6.72c4.15-2.73,3.66-7.48,6.48-11.52.72-1,10.19-4.18,13-5,1.74-5.2,6.76-5.79,11.76-4.08v-.24c-1.73-3.47-.86-5.9,0-9.6.45-1.94-.67-3.73.48-5.28Z" transform="translate(-137.13 -112.78)"/></g><g id="reseves-off"><path id="guadeloupe-2" data-name="guadeloupe" class="cls-2" d="M172.36,124.54c3.83.4,8,4.74,8.88,8.16v5.76c.38,1.79,2.34,2.53,2.88,3.84l-.24,14.88c-9.24,1.07-11,5-19.2-.72l-1.92.24v2.64c3.56,11.87,3,18.51-6.24,24-2.15,1.29-5.81,3.88-8.4,2.4-1-5.07-3.83-6.44-6.24-10.8-1.93-3.51-.31-8-1.44-12.72-2-8.46-6.53-18.52,4.8-22.32,4.93,2.37,12.35,4.2,15.36,8.64l3.36-1c.67-4.21,3.48-4.76,4.08-7.2a3.25,3.25,0,0,1-2.4-1.2c-.8-1.19-1.77-5.58-1.2-7C166.13,128.09,169.69,127.48,172.36,124.54Z" transform="translate(-137.13 -112.78)"/><path id="fakarava" class="cls-2" d="M334.84,146.62c9.89-.25,27.42,3.17,28.8,10.32.77,4-3.2,7.56-4.8,9.6-2.09,2.66-4.87,5.57-8.16,7-6.61,2.79-24.29,5.06-31.2,1C302.82,164.58,325.9,150.73,334.84,146.62Z" transform="translate(-137.13 -112.78)"/><path id="iroise" class="cls-2" d="M353.56,228.46c10.77-.21,20.23,8.72,20.88,18-1.59,3.19-9.26,6.23-14.16,4.08-4-1.76-3.08-6.25-5.28-9.84-1.85-3-5.44-3.7-5.52-8.64C350.51,230.06,351.87,229.73,353.56,228.46Z" transform="translate(-137.13 -112.78)"/><path id="fontainebleau" class="cls-2" d="M647.56,250.3c3.54,0,13.56,6.15,14.4,8.4,1.92,4.64-2.45,6.82-4.32,8.64l-2.4,6.72c-5.38,1.65-14.09-1.39-14.4-6.72-3.73-.34-6-2.43-7.92-4.56a29.92,29.92,0,0,0,0-8.4C636.14,251.19,643.57,252.79,647.56,250.3Z" transform="translate(-137.13 -112.78)"/><path id="vosges" class="cls-2" d="M853.48,180.22c.92.32.5,0,1,.72,1.48,2.95-.66,7.72-.24,11.28l1.68,4.8v.24c.57,3.68-1.6,5.22-2.16,7.92v10.08l-1.2,1v.24c-1.64.48-4.08,1.65-4.8,3.12L846,229.9c-.46.68-1.41.68-1.92,1.44-1.34,3.48,2.58,4.78,1.92,7.44-2.21,4.58-7.45,1.79-11,1l-1.68,4.08h-.72l-1.2-2.64c-2.65,1.71-5,1.32-8.64,2.64-.42.15-4.33,3.27-5.76,4.08-.17,3.79-.39,7.1-3.36,8.16-2.23.89-6.19-1-6.72-2.64V251l-1.92-1.2c-1.85-1.66-2-4-2.64-7a8.68,8.68,0,0,1-3.12-1.68c.89-5.47,3.91-5.77,9.36-6.72,1.18-1.68,1.35-3.59.72-6-2.4-1.1-4.79-.05-7.2-.48v-2.64c1.31-.4,3.76.06,5.52-.48,3.94-1.2,3.67-5.94,9.84-4.56.93,1.26,1.72,2.44,2.64,3.84,1.36-.77,3.73-1.29,5-2.16,1.56-5.51-1.63-8.85,1.92-13-.85-3.7-4.07-6.59-4.32-9.6,2.61-1.21,6.35-.55,9.84-1.68,3-1,5.37-4.54,8.16-6.24.52-2.19.66-5.12,1.68-6.72a8.58,8.58,0,0,1,4.56-.48,17.26,17.26,0,0,0,1.44,3.84h.24C850.51,185.76,851.85,182.61,853.48,180.22Z" transform="translate(-137.13 -112.78)"/><path id="dorgogne" class="cls-2" d="M628.36,412.06c20.24-.45,27.43,11.19,21.84,30.48-1.69,5.82-2.79,11.17-6,15.36-6.57,8.56-16.35,2.75-26.64,6.72-7.86,3-12.6,10.72-21.12,12.72-6.6,1.55-12.2-3.94-16.32-5.76-5.31-2.35-11.35-2.77-18-4.08-12.69-2.5-28.91,2.51-37.44-3.6-3.75-2.69-11.58-15.94-7.44-22.8,2.62-4.35,9.26-5.56,13.68-8.16,6.4-3.76,10.06-9,18.48-11,7.82-1.86,19.1,3.77,22.32-.48,2.69-1.26,4.71-3.41,8.16-4.08,8.58-1.66,12,6,19.2,5,3.14-.39,5-2.53,7.44-3.6,4.3-1.85,10.53-2.29,15.84-1.2C622.91,413.38,625,413.44,628.36,412.06Z" transform="translate(-137.13 -112.78)"/><path id="cevennes" class="cls-2" d="M681.4,482.38c6.49,0,6.05,2.57,9.36,4.8l8.16,1.68c11.86,5,.7,10.83-2.88,14.16.06,1.7.67,2.46.48,2.88-1.19,1.53-3.13,2.55-3.84,4.56s.71,2.84,1,4.08l-4.8,5-9.6-1c-1.12.2-3.17.92-4.56.24-2.39-1.17-2-3.93-3.36-6.24-2.63-4.65-10.83-7.14-8.88-14.64,1.52-1.07,6-2.58,6.72-4.32.63-1.46.18-4,.72-5.28,1.91-.18,4.81.3,6.48-.48C677.28,485.17,679.72,484.31,681.4,482.38Z" transform="translate(-137.13 -112.78)"/><path id="gardon" class="cls-2" d="M696,515.74c3.31-.25,6.59-4.1,8.16-6.24,3.23,1.16,11.39,3.86,10.32,8.88l-3.36,5c-1.36,2.39-1.85,4.91-3.36,7-5,.1-8-1.53-11.76-2.64Z" transform="translate(-137.13 -112.78)"/><path id="camargue" class="cls-2" d="M716.2,528.94c3.68.26,9.67.91,12.24,2.64l.72,7.44c1.74,1.22,4,2.37,5,4.32l-3.12,5,.72,1.44,1.68.48c-.7,2.91-2.07,4.52-3.6,6.48l-13.68-1c-2.28-1-3-3.67-4.8-5-2.33-1.73-6.38-1.82-9.6-2.64-2.61-3.61-1.07-6-1.2-10.8l-.48-3.6.48-1c3.28-.76,9.87,1.42,12-.24C714.15,531.69,714.63,530,716.2,528.94Z" transform="translate(-137.13 -112.78)"/><path id="ventoux" class="cls-2" d="M737.32,486.46c3.66.06,12.62,4.21,13.92,6.24l1.2,4.32c.8,2,2.59,3,4.08,4.32v.24c-3.4,4.35-5.89.58-10.56,2.4-4,1.55-4.06,7-9.36,7.44l-2.88-1.68V509c1.43-1,3.83-2.18,4.56-3.84,2.23-5.7-4.18-11.47-1.92-17.52Z" transform="translate(-137.13 -112.78)"/><path id="luberon" class="cls-2" d="M769.48,493.9a14.63,14.63,0,0,1,8.4,1.92c1.37,9,2,19.89-2.64,25.68l-4.56,3.36c-1.62,2-2,4.2-4.56,5.28-4.51,1.9-8.72-.63-12.24-1.68l-8.64-.72c-3.47-1-12.3-7.9-14.64-10.56,0-2.28.83-3.85,2.4-4.56,2.37-1.08,8.66-.45,11.28-1.2,2.37-7.82,8.52-1.74,13.68-5.28,2.44-1.67,1.43-7.58,3.12-10.08C762.32,494.23,767.25,494.78,769.48,493.9Z" transform="translate(-137.13 -112.78)"/><path id="viso" class="cls-2" d="M798.76,455.74c7.35.11,15.08,7.3,16.32,13.68,10.71-5,12.31-7.23,24.72-2.64,2.51.93,4.15-.12,5.28,2.16,1.76,3.17.44,9.42-1.68,11-2.37,1.81-6.8.64-10.32,1.44-5.35,1.22-17.48,5.66-19.92,9.84l-.72-.48c-1.76-4.83-3.69-6-9.6-7v-1.2a14.38,14.38,0,0,0,1.44-5.28l-.24-.48h-.24c-1.38,1.06-4.18,3.54-6.48,2.64-2.54-1.26-6-19.94-5.28-21.12Z" transform="translate(-137.13 -112.78)"/><path id="fango" class="cls-2" d="M856.36,571.9c4,1.79,6.1,7.11,4.8,12.24l-1.44,1.44c-5.4.16-9.29-2.68-9.12-8.16C852,574.56,854,573.75,856.36,571.9Z" transform="translate(-137.13 -112.78)"/><path id="audomarois" class="cls-2" d="M640.6,123.82c5.11-.12,11.89,4.52,9.6,9.36-5.27,1.13-12.28-3.12-12.48-7.92l.72-1Z" transform="translate(-137.13 -112.78)"/></g><g id="reseves-on"><path id="corse-on" class="cls-1" d="M879.88,544.06c6.2.14,5,3.33,6.24,7.92.44,1.59,1.83,4.52,1.44,6.72-.36,2-2.23,4.87-1.68,7l3.12,4.8v5.28c.83,3.76,3.54,17.15,2.16,21.84-.92,3.14-4.32,5.58-5.28,8.4-1.33,3.94.71,7.86,0,11.76L883,628.54l-2.64,2.16v2.64a21.25,21.25,0,0,1-3.36,7c-2.56.68-7.62.12-8.88-1.92-.64-1,0-1.89-1-2.64l-6.72-1.92-4.8-3.6c-.91-3.16-.31-5,.24-7.68l-.48-.48c-2.18.63-4.55-1.07-5.28-2.64l-.24-1.92c1.08-1.79,3-3,3.6-5.28l-1,.24c-.62,0-2.24.89-3.36.24l-1.68-1.2c-.38-1.79-1.32-4.45-.72-6a13.69,13.69,0,0,1,4.08-4.32l-.24-.48a15.3,15.3,0,0,1-4.8-2.16c-.65-3.27-2.13-6-1.44-8.88l1.92-1.2a6.64,6.64,0,0,1-1.68-6.72c4.15-2.73,3.66-7.48,6.48-11.52.72-1,10.19-4.18,13-5,1.74-5.2,6.76-5.79,11.76-4.08v-.24c-1.73-3.47-.86-5.9,0-9.6.45-1.94-.67-3.73.48-5.28Z" transform="translate(-137.13 -112.78)"/><path id="guadeloupe-on" class="cls-3" d="M172.36,124.54c3.83.4,8,4.74,8.88,8.16v5.76c.38,1.79,2.34,2.53,2.88,3.84l-.24,14.88c-9.24,1.07-11,5-19.2-.72l-1.92.24v2.64c3.56,11.87,3,18.51-6.24,24-2.15,1.29-5.81,3.88-8.4,2.4-1-5.07-3.83-6.44-6.24-10.8-1.93-3.51-.31-8-1.44-12.72-2-8.46-6.53-18.52,4.8-22.32,4.93,2.37,12.35,4.2,15.36,8.64l3.36-1c.67-4.21,3.48-4.76,4.08-7.2a3.25,3.25,0,0,1-2.4-1.2c-.8-1.19-1.77-5.58-1.2-7C166.13,128.09,169.69,127.48,172.36,124.54Z" transform="translate(-137.13 -112.78)"/><path id="fakarava-on" class="cls-4" d="M334.84,146.62c9.89-.25,27.42,3.17,28.8,10.32.77,4-3.2,7.56-4.8,9.6-2.09,2.66-4.87,5.57-8.16,7-6.61,2.79-24.29,5.06-31.2,1C302.82,164.58,325.9,150.73,334.84,146.62Z" transform="translate(-137.13 -112.78)"/><path id="iroise-on" class="cls-5" d="M353.56,228.46c10.77-.21,20.23,8.72,20.88,18-1.59,3.19-9.26,6.23-14.16,4.08-4-1.76-3.08-6.25-5.28-9.84-1.85-3-5.44-3.7-5.52-8.64C350.51,230.06,351.87,229.73,353.56,228.46Z" transform="translate(-137.13 -112.78)"/><path id="fontainebleau-on" class="cls-6" d="M647.56,250.3c3.54,0,13.56,6.15,14.4,8.4,1.92,4.64-2.45,6.82-4.32,8.64l-2.4,6.72c-5.38,1.65-14.09-1.39-14.4-6.72-3.73-.34-6-2.43-7.92-4.56a29.92,29.92,0,0,0,0-8.4C636.14,251.19,643.57,252.79,647.56,250.3Z" transform="translate(-137.13 -112.78)"/><path id="vosges-on" class="cls-7" d="M853.48,180.22c.92.32.5,0,1,.72,1.48,2.95-.66,7.72-.24,11.28l1.68,4.8v.24c.57,3.68-1.6,5.22-2.16,7.92v10.08l-1.2,1v.24c-1.64.48-4.08,1.65-4.8,3.12L846,229.9c-.46.68-1.41.68-1.92,1.44-1.34,3.48,2.58,4.78,1.92,7.44-2.21,4.58-7.45,1.79-11,1l-1.68,4.08h-.72l-1.2-2.64c-2.65,1.71-5,1.32-8.64,2.64-.42.15-4.33,3.27-5.76,4.08-.17,3.79-.39,7.1-3.36,8.16-2.23.89-6.19-1-6.72-2.64V251l-1.92-1.2c-1.85-1.66-2-4-2.64-7a8.68,8.68,0,0,1-3.12-1.68c.89-5.47,3.91-5.77,9.36-6.72,1.18-1.68,1.35-3.59.72-6-2.4-1.1-4.79-.05-7.2-.48v-2.64c1.31-.4,3.76.06,5.52-.48,3.94-1.2,3.67-5.94,9.84-4.56.93,1.26,1.72,2.44,2.64,3.84,1.36-.77,3.73-1.29,5-2.16,1.56-5.51-1.63-8.85,1.92-13-.85-3.7-4.07-6.59-4.32-9.6,2.61-1.21,6.35-.55,9.84-1.68,3-1,5.37-4.54,8.16-6.24.52-2.19.66-5.12,1.68-6.72a8.58,8.58,0,0,1,4.56-.48,17.26,17.26,0,0,0,1.44,3.84h.24C850.51,185.76,851.85,182.61,853.48,180.22Z" transform="translate(-137.13 -112.78)"/><path id="dorgogne-on" class="cls-8" d="M628.36,412.06c20.24-.45,27.43,11.19,21.84,30.48-1.69,5.82-2.79,11.17-6,15.36-6.57,8.56-16.35,2.75-26.64,6.72-7.86,3-12.6,10.72-21.12,12.72-6.6,1.55-12.2-3.94-16.32-5.76-5.31-2.35-11.35-2.77-18-4.08-12.69-2.5-28.91,2.51-37.44-3.6-3.75-2.69-11.58-15.94-7.44-22.8,2.62-4.35,9.26-5.56,13.68-8.16,6.4-3.76,10.06-9,18.48-11,7.82-1.86,19.1,3.77,22.32-.48,2.69-1.26,4.71-3.41,8.16-4.08,8.58-1.66,12,6,19.2,5,3.14-.39,5-2.53,7.44-3.6,4.3-1.85,10.53-2.29,15.84-1.2C622.91,413.38,625,413.44,628.36,412.06Z" transform="translate(-137.13 -112.78)"/><path id="cevennes-on" class="cls-9" d="M681.4,482.38c6.49,0,6.05,2.57,9.36,4.8l8.16,1.68c11.86,5,.7,10.83-2.88,14.16.06,1.7.67,2.46.48,2.88-1.19,1.53-3.13,2.55-3.84,4.56s.71,2.84,1,4.08l-4.8,5-9.6-1c-1.12.2-3.17.92-4.56.24-2.39-1.17-2-3.93-3.36-6.24-2.63-4.65-10.83-7.14-8.88-14.64,1.52-1.07,6-2.58,6.72-4.32.63-1.46.18-4,.72-5.28,1.91-.18,4.81.3,6.48-.48C677.28,485.17,679.72,484.31,681.4,482.38Z" transform="translate(-137.13 -112.78)"/><path id="gardon-on" class="cls-10" d="M696,515.74c3.31-.25,6.59-4.1,8.16-6.24,3.23,1.16,11.39,3.86,10.32,8.88l-3.36,5c-1.36,2.39-1.85,4.91-3.36,7-5,.1-8-1.53-11.76-2.64Z" transform="translate(-137.13 -112.78)"/><path id="camargue-on" class="cls-11" d="M716.2,528.94c3.68.26,9.67.91,12.24,2.64l.72,7.44c1.74,1.22,4,2.37,5,4.32l-3.12,5,.72,1.44,1.68.48c-.7,2.91-2.07,4.52-3.6,6.48l-13.68-1c-2.28-1-3-3.67-4.8-5-2.33-1.73-6.38-1.82-9.6-2.64-2.61-3.61-1.07-6-1.2-10.8l-.48-3.6.48-1c3.28-.76,9.87,1.42,12-.24C714.15,531.69,714.63,530,716.2,528.94Z" transform="translate(-137.13 -112.78)"/><path id="ventoux-on" class="cls-12" d="M737.32,486.46c3.66.06,12.62,4.21,13.92,6.24l1.2,4.32c.8,2,2.59,3,4.08,4.32v.24c-3.4,4.35-5.89.58-10.56,2.4-4,1.55-4.06,7-9.36,7.44l-2.88-1.68V509c1.43-1,3.83-2.18,4.56-3.84,2.23-5.7-4.18-11.47-1.92-17.52Z" transform="translate(-137.13 -112.78)"/><path id="luberon-on" class="cls-13" d="M769.48,493.9a14.63,14.63,0,0,1,8.4,1.92c1.37,9,2,19.89-2.64,25.68l-4.56,3.36c-1.62,2-2,4.2-4.56,5.28-4.51,1.9-8.72-.63-12.24-1.68l-8.64-.72c-3.47-1-12.3-7.9-14.64-10.56,0-2.28.83-3.85,2.4-4.56,2.37-1.08,8.66-.45,11.28-1.2,2.37-7.82,8.52-1.74,13.68-5.28,2.44-1.67,1.43-7.58,3.12-10.08C762.32,494.23,767.25,494.78,769.48,493.9Z" transform="translate(-137.13 -112.78)"/><path id="viso-on" class="cls-14" d="M798.76,455.74c7.35.11,15.08,7.3,16.32,13.68,10.71-5,12.31-7.23,24.72-2.64,2.51.93,4.15-.12,5.28,2.16,1.76,3.17.44,9.42-1.68,11-2.37,1.81-6.8.64-10.32,1.44-5.35,1.22-17.48,5.66-19.92,9.84l-.72-.48c-1.76-4.83-3.69-6-9.6-7v-1.2a14.38,14.38,0,0,0,1.44-5.28l-.24-.48h-.24c-1.38,1.06-4.18,3.54-6.48,2.64-2.54-1.26-6-19.94-5.28-21.12Z" transform="translate(-137.13 -112.78)"/><path id="fango-on" class="cls-15" d="M856.36,571.9c4,1.79,6.1,7.11,4.8,12.24l-1.44,1.44c-5.4.16-9.29-2.68-9.12-8.16C852,574.56,854,573.75,856.36,571.9Z" transform="translate(-137.13 -112.78)"/><path id="audomarois-on" class="cls-16" d="M640.6,123.82c5.11-.12,11.89,4.52,9.6,9.36-5.27,1.13-12.28-3.12-12.48-7.92l.72-1Z" transform="translate(-137.13 -112.78)"/></g></svg>
								</div>
							</div>
						</div>
					</section>
					<section class="contact">
						<div class="ui container">
							<div class="ui two column grid">
								<div class="column">
									<h2 class="marron">Suivez-nous...</h2>
									<div class="ui middle aligned selection list">
										<div class="item">
											<img class="ui avatar image" src="/workspace/img/facebook-logo.svg" alt=""></img>
											<div class="content">
												<div class="header">Sur notre page Facebook</div>
											</div>
										</div>
										<div class="item">
											<img class="ui avatar image" src="/workspace/img/flickr-logo.svg" alt=""></img>
											<div class="content">
												<div class="header">Admirez nos photos sur Flickr</div>
											</div>
										</div>
										<div class="item">
											<img class="ui avatar image" src="/workspace/img/vimeo-social-logo.svg" alt=""></img>
											<div class="content">
												<div class="header">Consultez nos vidéos sur Viméo</div>
											</div>
										</div>
									</div>
								</div>
								<div class="column">
									<h2 class="marron">Contactez-nous</h2>
									<p>MAB France<br/>
									24, chemin de Borderouge,<br/>
									Auzeville CS 532627<br/>
									31326 Castanet Tolosan Cedex</p>

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
							<a href="{$root}{$url-lang}" class="section"><xsl:value-of select="$page-title"></xsl:value-of></a>
							<!-- rubrique ? (non cliquable) -->
							<xsl:if test="$rubrique !=''">
								<div class="divider"> / </div>
								<xsl:value-of select="/data/rubriques-principales/entry[nom/item/@handle = $rubrique]/nom/item[@lang=$language]"></xsl:value-of>
								<!-- sous rubrique ? (cliquable) -->
								<xsl:if test="$s-rubrique!=''">
									<div class="divider"> / </div>
									<a href="{$root}{$url-lang}/{$rubrique}/{$s-rubrique}/" class="section"><xsl:value-of select="/data/menu-principal/entry[nom/item/@handle = $s-rubrique]/nom/item[@lang=$language]"></xsl:value-of></a>
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
								<h1><xsl:value-of select="page-content/entry/nom/item[@lang=$language]"></xsl:value-of></h1>
								<p><xsl:copy-of select="page-content/entry/contenu/item[@lang=$language]"></xsl:copy-of></p>
							</section>

						</div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:template>
	</xsl:stylesheet>
