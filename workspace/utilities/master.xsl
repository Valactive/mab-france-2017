<?xml version="1.0" encoding="UTF-8"?>
<!-- master des pages du site mab-france.org -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:string="http://symphony-cms.com/functions">
	<!-- <xsl:import href="page-title.xsl"/><xsl:import href="date-time.xsl"/><xsl:import href="mab-menu-principal.xsl"/><xsl:import href="mab-menu-secondaire.xsl"/><xsl:import href="mab-menu-footer.xsl"/><xsl:import href="menu-langue.xsl"/><xsl:import href="get-diaporama.xsl"/><xsl:import href="get-actualites.xsl"/><xsl:import href="get-publications.xsl"/><xsl:import href="string-utils.xsl"/><xsl:import href="actions.xsl"/><xsl:import href="tools.xsl"/> -->
	<xsl:import href="menu-principal.xsl" />
	<xsl:import href="menu-principal-mobile.xsl" />
	<xsl:import href="menu-principal-footer.xsl" />

	<xsl:output method="html" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	 omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

	<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in" />
	<xsl:variable name="rubrique" />
	<xsl:variable name="s-rubrique" />
	<xsl:variable name="ss-rubrique" />
	<!-- <xsl:variable name="labels" select="/data/textes-statiques/entry"/> -->
	<!-- <xsl:variable name="titre"/> -->
	<xsl:variable name="language" select="/data/fl-languages/current-language/@handle" />
	<xsl:variable name="url-lang">
		<xsl:choose>
			<xsl:when test="$language='en'">
				<xsl:value-of select="'en/'"></xsl:value-of>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''"></xsl:value-of>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<!-- language switch -->
	<!-- variable for localized uri -->
	<xsl:variable name="next-lang">
		<xsl:choose>
			<xsl:when test="$current-language = 'fr'">en</xsl:when>
			<xsl:otherwise>fr</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="localized-n1-handle">
		<xsl:choose>
			<xsl:when test="$rubrique != ''">
				<xsl:value-of select="concat(//rubriques-principales/entry/nom[item/@handle = $rubrique]//item[@lang=$next-lang]/@handle,'/')" />
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="localized-n2-handle">
		<xsl:choose>
			<xsl:when test="$s-rubrique != ''">
				<xsl:value-of select="concat(//menu-principal/entry/nom[item/@handle = $s-rubrique]//item[@lang=$next-lang]/@handle,'/')" />
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="localized-n3-handle">
		<xsl:choose>
			<xsl:when test="$ss-rubrique != ''">
				<xsl:value-of select="concat(//menu-principal/entry/nom[item/@handle = $ss-rubrique]//item[@lang=$next-lang]/@handle,'/')" />
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:template match="/">
		<!-- [if IE 6]><html lang="{$current-language}" class="no-js ie6 lte-ie9 lte-ie8 lte-ie7 lte-ie6 gte-ie6"><![endi]]-->
		<!-- [if IE 7]><html lang="{$current-language}" class="no-js ie7 lte-ie9 lte-ie8 lte-ie7 gte-ie7 gte-ie6"><![endif]-->
		<!--[if IE 8]><html lang="{$current-language}" class="no-js ie8 lte-ie9 lte-ie8 gte-ie8 gte-ie7 gte-ie6"><![endif]-->
		<!--[if IE 9]><html lang="{$current-language}" class="no-js ie9 lte-ie9 gte-ie9 gte-ie8 gte-ie7 gte-ie6"><![endif]-->
		<!--[if !(lte IE 9)]><!-->
		<html lang="{$current-language}" class="no-js">
		<!--<![endif]-->
		<xsl:comment>master.xsl</xsl:comment>

		<head>
			<title>
				<xsl:value-of select="$website-name"></xsl:value-of>
			</title>
			<!-- production -->
			<xsl:choose>
				<xsl:when test="$http-host = 'mab-france.org' or $http-host='www.mab-france.org'">
					<!-- Global site tag (gtag.js) - Google Analytics -->
				<script async="async" src="https://www.googletagmanager.com/gtag/js?id=UA-2132372-18"></script>
				<script>
				window.dataLayer = window.dataLayer || [];
				function gtag(){dataLayer.push(arguments);}
				gtag('js', new Date());

				gtag('config', 'UA-2132372-18');
				</script>
					<meta charset="utf-8" />
					<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
							Remove this if you use the .htaccess -->
					<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
					<meta name="keywords" content="MAB France, mab, Comité MAB France, Réserves de biosphère, Développement durable, programme mab, UNESCO, Comité français du mab, l'homme et la biosphère, Guadeloupe, Camargue, Cévennes, Luberon, Iroise, Ventoux, Fontainebleau, Tuamotu, Corse, Vosges" />
					<meta name="author" content="valactive" />
					<!-- Mobile viewport optimized: j.mp/bplateviewport -->
					<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
					<!-- <meta name="google-site-verification" content="AJta6kSh11NpeCGrwds_aC7awKODbNvE4hh7jv9hW9U" /> -->
					<!-- Place favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
					<xsl:call-template name="partage-actualite" />
					<link rel="shortcut icon" href="/favicon.ico" />
					<link rel="apple-touch-icon" href="/apple-touch-icon.png" />
					<!-- google font open sans -->
					<link href="https://fonts.googleapis.com/css?family=Open+Sans:300i,400,700i" rel="stylesheet" />
					<!-- CSS: implied media="all" -->
					<link rel="stylesheet" href="{$workspace}/semantic/dist/semantic.min.css" />
				</xsl:when>
				<xsl:otherwise>
					<!-- developpement -->
					<meta charset="utf-8" />
					<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
							Remove this if you use the .htaccess -->
					<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
					<meta name="keywords" content="MAB France, mab, Comité MAB France, Réserves de biosphère, Développement durable, programme mab, UNESCO, Comité français du mab, l'homme et la biosphère, Guadeloupe, Camargue, Cévennes, Luberon, Iroise, Ventoux, Fontainebleau, Tuamotu, Corse, Vosges" />
					<meta name="author" content="valactive" />
					<meta name="robots" content="noindex, nofollow">
					<!-- Mobile viewport optimized: j.mp/bplateviewport -->
					<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
					<!-- <meta name="google-site-verification" content="AJta6kSh11NpeCGrwds_aC7awKODbNvE4hh7jv9hW9U" /> -->
					<!-- Place favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
					<xsl:call-template name="partage-actualite" />
					<link rel="shortcut icon" href="/favicon.ico" />
					<link rel="apple-touch-icon" href="/apple-touch-icon.png" />
					<!-- google font open sans -->
					<link href="https://fonts.googleapis.com/css?family=Open+Sans:300i,400,700i" rel="stylesheet" />
					<!-- CSS: implied media="all" -->				
					<link rel="stylesheet" href="{$workspace}/semantic/dist/semantic.css" />
				</xsl:otherwise>
			</xsl:choose>
		</head>

		<body>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="$current-page-id = 1 and $rubrique = ''">home mab</xsl:when>
					<xsl:when test="$current-page-id = 4">biosphere</xsl:when>
					<xsl:otherwise>mab</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<div class="ui very wide sidebar" style="background-color:white;">
				<xsl:call-template name="mab-menu-mobile-principal" />
			</div>
			<!-- TOP HEADER -->
			<div class="pusher">
				<div class="ui internally right aligned grid menu secondary site-top-header computer only">

					<!-- sitename -->
					<div class="seven wide column left floated right aligned middle aligned content">
						<span class="site-name">
							<xsl:value-of select="$website-name"></xsl:value-of>
						</span>
					</div>
					<!-- logo - lien home page  -->
					<div class="two wide column middle aligned content">
						<a href="{$root}" class="ui medium img">
							<img class="ui tiny centered image" src="{$workspace}/img/logos/france-2016.png" alt="logo du Mab France" />
						</a>
					</div>
					<!-- baseline -->
					<div class="left floated left aligned four wide column middle aligned content">
						<span class="site-baseline">L'Homme &amp; la Biosphère<br />Man &amp; the Biosphere</span>
					</div>
					<!-- que les cas de creation de page dynamique-->
					<!-- afficher le bouton changement de langue-->
					<!--<xsl:choose>
							<xsl:when test="$rubrique != ''">-->
					<!-- menu langue -->
					<div class="right floated right aligned middle aligned content three wide column">
						<a class="ui mini button right floated lang-switcher">
							<xsl:choose>
								<xsl:when test="$current-language = 'fr'">
									<xsl:attribute name="href">
										<xsl:value-of select="concat($root,'/en/',$localized-n1-handle,$localized-n2-handle,$localized-n3-handle)" />
									</xsl:attribute>
									<i class="world icon"></i>
									English
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="href">
										<xsl:value-of select="concat($root,'/fr/',$localized-n1-handle,$localized-n2-handle,$localized-n3-handle)" />
									</xsl:attribute>
									<i class="world icon"></i>
									Français
								</xsl:otherwise>
							</xsl:choose>
						</a>
					</div>
					<!-- fin menu langue -->
					<!--</xsl:when>
					</xsl:choose>-->
				</div>
				<!-- MENU MOBILE / TABLETTE -->
				<div class="ui three column grid menu secondary container site-top-header tablet only mobile only">
					<div class="row">
						<div class="column">
							<button class="ui left floated mini button menu-mobile"><i class="bars icon"></i> Menu</button>
						</div>
						<div class="column center aligned">
							<!-- <a href="{$root}" class="ui medium img">
								<img class="ui mini centered image" src="{$workspace}/img/logos/france-2016.png" alt="logo du Mab France" />
							</a> -->
							<div class="ui center aligned">
								<h3 style="color:white;">MAB FRANCE</h3>
							</div>
						</div>
						<div class="column">
							<a class="ui right floated mini button right floated lang-switcher">
								<xsl:choose>
									<xsl:when test="$current-language = 'fr'">
										<xsl:attribute name="href">
											<xsl:value-of select="concat($root,'/en/',$localized-n1-handle,$localized-n2-handle,$localized-n3-handle)" />
										</xsl:attribute>
										<i class="world icon"></i>
										En
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="href">
											<xsl:value-of select="concat($root,'/fr/',$localized-n1-handle,$localized-n2-handle,$localized-n3-handle)" />
										</xsl:attribute>
										<i class="world icon"></i>
										Fr
									</xsl:otherwise>
								</xsl:choose>
							</a>
						</div>
					</div>
				</div>
				<!-- MAIN MENU -->
				<div class="ui grid computer only" style="margin:0;height:62px;">
					<xsl:call-template name="mab-menu-principal" />
				</div>
				<!-- FULL CONTENT -->
				<div class="main-content">


					<!-- symphony page contents -->
					<xsl:apply-templates />
					<!-- entire website common section -->
					<section class="ui grid footer">
						<div class="ui container grid">
							<div class="column">
								<div class="ui horizontal list">
									<div class="item">©MAB FRANCE 2019</div>

									<a class="item" href="https://intranet.mab-france.org/fr/" target="_blank">intranet</a>
									<a class="item" href="{$root}/{$current-language}/mentions-legales/">Mentions-légales/crédits/RGPD</a>

								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
			<!-- END FULL CONTENT -->
			<script src="{$workspace}/js/jquery-3.3.1.min.js" crossorigin="anonymous"></script>
			<script src="{$workspace}/semantic/dist/semantic.min.js"></script>
			<script src="{$workspace}/js/jquery-ui-1.9.1.custom.min.js"></script>
			<script src="{$workspace}/js/jquery.tocify.min.js"></script>
			<script src="{$workspace}/semantic/dist/themes/default/assets/js/mab.js"></script>
		</body>

		</html>
	</xsl:template>
</xsl:stylesheet>