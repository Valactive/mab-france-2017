<?xml version="1.0" encoding="UTF-8"?>
<!-- ********************************************************************** -->
<!-- *  construit toutes les pages                                        * -->
<!-- *  en tete computer                        		   	              * -->
<!-- *  en tete mobile contenu de la page                                 * -->
<!-- *  menu computer                                                     * -->
<!-- *  menu mobile                                                       * -->
<!-- *  contenu de la page                                                * -->
<!-- *  footer                                                            * -->
<!-- *                                                                    * -->
<!-- *  STMSEARCH pour ajouter des sections au champ "rechercher"         * -->
<!-- *                                                                    * -->
<!-- *                                                                    * -->
<!-- *                                                                    * -->

<!-- ********************************************************************** -->


<!-- master des pages du site mab-france.org -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:string="http://symphony-cms.com/functions">
	<!-- <xsl:import href="page-title.xsl"/><xsl:import href="date-time.xsl"/><xsl:import href="mab-menu-principal.xsl"/><xsl:import href="mab-menu-secondaire.xsl"/><xsl:import href="mab-menu-footer.xsl"/><xsl:import href="menu-langue.xsl"/><xsl:import href="get-diaporama.xsl"/><xsl:import href="get-actualites.xsl"/><xsl:import href="get-publications.xsl"/><xsl:import href="string-utils.xsl"/><xsl:import href="actions.xsl"/><xsl:import href="tools.xsl"/> -->
	<xsl:import href="menu-principal.xsl" />
	<xsl:import href="menu-principal-mobile.xsl" />
	<xsl:import href="menu-principal-footer.xsl" />

	<xsl:output method="html" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

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
				<xsl:value-of select="'fr/'"></xsl:value-of>
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
			<!-- FFTM -->
			<!-- si page actualités et publications, lien vers la liste -->
			<xsl:when test="$rubrique = ''">
				<xsl:value-of select="concat(//page[@id = $current-page-id]/item[@lang=$next-lang]/@handle,'/')"/>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="localized-n2-handle">
		<xsl:choose>
			<xsl:when test="$s-rubrique != ''">
				<xsl:value-of select="concat(//menu-principal/entry/nom[item/@handle = $s-rubrique]//item[@lang=$next-lang]/@handle,'/')" />
			</xsl:when>
			<!-- FFTM -->
			<!--  si page actualites et publication, lien vers le détail de l'actu via $titre-actualite -->
			<xsl:when test="$rubrique = '' and $current-page-id = '8'">
				<xsl:value-of select="concat($titre-actualite,'/')"/>
			</xsl:when>
			<!--  si page eco-acteur, lien vers le détail eco-acteur via  $nom-eco-acteur-->
			<xsl:when test="$rubrique = '' and $current-page-id = '9'">
				<!-- recup de la version traduite du nom de l'entrée -->
				<xsl:variable name="eco-acteur-lang" select="/data/eco-acteur-detail/entry/eco-acteur-nom[item/@handle=$nom-eco-acteur]/item[@lang=$next-lang]/@handle"/>
				<xsl:value-of select="concat($eco-acteur-lang,'/')"/>
			</xsl:when>
			<!--  si page laureat, lien vers le détail laureat via  $nom-laureat -->
			<xsl:when test="$rubrique = '' and $current-page-id = '10'">
				<!-- recup de la version traduite du nom de l'entrée -->
				<xsl:variable name="nom-laureat-lang" select="/data/laureat-detail/entry/laureat-nom[item/@handle=$nom-laureat]/item[@lang=$next-lang]/@handle"/>
				<xsl:value-of select="concat($nom-laureat-lang,'/')"/>
			</xsl:when>
			<!-- STM 27/08/2021-->
			<!--  changement de langue quand on est sur la page biosphere =>  $nom -->
			<xsl:when test="$rubrique = '' and $current-page-id = '4'">
				<!-- recup de la version traduite du nom de l'entrée -->
				<xsl:variable name="nom-lang" select="/data/biosphere/entry/nom[item/@handle=$nom]/item[@lang=$next-lang]/@handle"/>
				<xsl:value-of select="concat($nom-lang,'/')"/>
			</xsl:when>
			<!--  changement de langue quand on est sur la page search =>  $nom -->
			<xsl:when test="$rubrique = '' and $current-page-id = '13'">
				<!--  STM a completer avec les parametres passes-->
				<xsl:variable name="page-de-recherche">
					<xsl:value-of select="/data/navigation/page[@id = 13]//item[@lang=$next-lang]/@handle"></xsl:value-of>
				</xsl:variable>
				<form action="/{$page-de-recherche}/" method="get">
					<div class="ui icon input">
						<i class="search icon"></i>
						<input type="hidden" name="sections" value="biosphere,eco-acteurs,page,laureat,actualites-publications" />
					</div>
				</form>
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
						<xsl:call-template name="partage-facebook" />
						<link rel="shortcut icon" href="{$workspace}/favicon.ico" />
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
						<meta name="robots" content="noindex, nofollow"/>
						<!-- Mobile viewport optimized: j.mp/bplateviewport -->
						<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
						<!-- <meta name="google-site-verification" content="AJta6kSh11NpeCGrwds_aC7awKODbNvE4hh7jv9hW9U" /> -->
						<!-- Place favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
						<xsl:call-template name="partage-facebook" />
						<link rel="shortcut icon" href="{$workspace}/favicon.ico" />
						<link rel="apple-touch-icon" href="/apple-touch-icon.png" />
						<!-- google font open sans -->
						<link href="https://fonts.googleapis.com/css?family=Open+Sans:300i,400,700i" rel="stylesheet" />
						<!-- CSS: implied media="all" -->
						<link rel="stylesheet" href="{$workspace}/semantic/dist/semantic.css" />
						<!-- STM - preparation mise en prod -->
						<!--<link rel="stylesheet" href="{$workspace}/semantic/dist/semantic.min.css" />-->
					</xsl:otherwise>
				</xsl:choose>
				<!-- tarteaucitron-->
				<script type="text/javascript" src="{$workspace}/tarteaucitron/tarteaucitron.js"></script>

				<script type="text/javascript">
        tarteaucitron.init({
    	  "privacyUrl": "", /* Privacy policy url */

    	  "hashtag": "#tarteaucitron", /* Open the panel with this hashtag */
    	  "cookieName": "tarteaucitron", /* Cookie name */
    
    	  "orientation": "middle", /* Banner position (top - bottom) */
    	  "showAlertSmall": false, /* Show the small banner on bottom right */
    	  "cookieslist": true, /* Show the cookie list */

    	  "adblocker": false, /* Show a Warning if an adblocker is detected */
    	  "AcceptAllCta" : true, /* Show the accept all button when highPrivacy on */
    	  "highPrivacy": true, /* Disable auto consent */
    	  "handleBrowserDNTRequest": false, /* If Do Not Track == 1, disallow all */

    	  "removeCredit": false, /* Remove credit link */
    	  "moreInfoLink": true, /* Show more info link */
    	  "useExternalCss": false, /* If false, the tarteaucitron.css file will be loaded */

    	  //"cookieDomain": ".my-multisite-domaine.fr", /* Shared cookie for multisite */
                          
    	  "readmoreLink": "/cookiespolicy" /* Change the default readmore link */
        });
				</script>
				<!--fin tarteaucitron-->
			</head>

			<body>
				<!-- stm je ne comprend pas a quoi sert le code ci-dessous-->
				<!-- type de page ? a utiliser poue navigation anglais ?-->
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

					<!-- EN TETE COMPUTER -->
					<div class="ui internally right aligned grid menu secondary site-top-header computer only">
						<!-- sitename -->
						<div class="six wide column left floated right aligned middle aligned content">
							<span class="site-name">
								<xsl:value-of select="$website-name"></xsl:value-of>
							</span>
						</div>
						<!-- logo - lien home page  --> 
						<div class="two wide column middle aligned content">
							<a href="{$root}" class="ui medium image" style="background-color:white">
								<img src="{$workspace}/img/logos/logo-mab-2021.svg" alt="logo du Mab France 2021" />
							</a>
						</div>
						<!-- baseline -->
						<div class="three wide column middle aligned content">
							<span class="site-baseline">L'Homme &amp; la Biosphère<br/> Man &amp; the Biosphere</span>
						</div>
						<!-- que les cas de creation de page dynamique-->
						<!-- Bouton recherche-->
						<div class="three wide column middle aligned content">
							<xsl:variable name="page-de-recherche">
								<xsl:value-of select="concat($root,'/',$current-language,'/',/data/navigation/page[@id = 13]//item[@lang=$current-language]/@handle,'/')"></xsl:value-of>
							</xsl:variable>
							<xsl:variable name="placeholder-recherche">
								<xsl:value-of select="/data/navigation/page[@id = 13]//item[@lang=$current-language]/@handle"></xsl:value-of>
							</xsl:variable>
							<form action="{$page-de-recherche}" method="get">
								<div class="ui icon input">
									<i class="search icon"></i>
									<input class="ui prompt" placeholder="{$placeholder-recherche}" type="text" name="keywords"/>
									<input type="hidden" name="sections" value="biosphere,eco-acteurs,page,laureat,actualites-publications" />
								</div>
							</form>
						</div>						<!-- class="three wide column middle aligned content" -->
						<div class="two wide column middle aligned content">
							<a class="ui mini button">
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
						</div>						<!--class="two wide column middle aligned content"-->
						<!-- fin menu langue -->
					</div>					<!-- FIN EN TETE COMPUTER -->

					<!-- MENU MOBILE / TABLETTE STM ajouter le bouton recherhce-->
					<div class="ui three column grid menu secondary container site-top-header tablet only mobile only">
						<div class="row">
							<div class="column">
								<button class="ui left floated mini button menu-mobile">
									<i class="bars icon"></i> Menu
								</button>
							</div>
							<div class="column center aligned">
								<div class="ui center aligned">
									<a href="{$root}" ><h3 style="color:white;">MAB FRANCE</h3></a>
								</div>
							</div>
							<!-- pas de recherche sur la version mobile
							<div class="column">
								<button class="ui mini button" type="submit"><i class="search icon link"></i></button>
							</div> -->
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
						<!-- pas de bouton recherche sur la version mobile 
						<div class="row">
							<xsl:variable name="page-de-recherche">
								<xsl:value-of select="concat($root,'/',$current-language,'/',/data/navigation/page[@id = 13]//item[@lang=$current-language]/@handle,'/')"></xsl:value-of>
							</xsl:variable>
							<form  action="{$page-de-recherche}" method="get">
								<input class="ui mini button" placeholder="...." type="text" name="keywords"/>
								<input type="hidden" name="sections" value="biosphere,eco-acteurs,page,laureat,actualites-publications" />
								<button class="ui mini button" type="submit"><i class="search icon link"></i></button>
							</form>
						</div> -->
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
						<section class="ui grid footer ">
							<div class="ui container grid">
								<div class="column">
									<div class="ui horizontal list">
										<div class="item">©MAB FRANCE 2019-2021</div>
										<a class="item" href="https://intranet.mab-france.org/" target="_blank">intranet</a>
										<a class="item" href="{$root}/{$current-language}/mentions-legales/">Mentions-légales/crédits/RGPD</a>

									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
				<!-- END FULL CONTENT -->
				<script src="{$workspace}/js/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
				<script src="{$workspace}/semantic/dist/semantic.min.js"></script>
				<script src="{$workspace}/js/jquery-ui.min.js"></script>
				<script src="{$workspace}/js/jquery.tocify.min.js"></script>
				<script src="{$workspace}/semantic/dist/themes/default/assets/js/mab.js"></script>
				<!-- autorisation cookies-->
				<script type="text/javascript">
 		    	tarteaucitron.user.gajsUa = 'UA-2132372-18';
        		tarteaucitron.user.gajsMore = function () { /* add here your optionnal _ga.push() */ };
        		(tarteaucitron.job = tarteaucitron.job || []).push('gajs');
				</script>

			</body>

		</html>
	</xsl:template>
</xsl:stylesheet>