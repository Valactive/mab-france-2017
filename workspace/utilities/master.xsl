<?xml version="1.0" encoding="UTF-8"?>
<!-- master des pages du site mab-france.org -->
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:string="http://symphony-cms.com/functions">
	<!-- <xsl:import href="page-title.xsl"/><xsl:import href="date-time.xsl"/><xsl:import href="mab-menu-principal.xsl"/><xsl:import href="mab-menu-secondaire.xsl"/><xsl:import href="mab-menu-footer.xsl"/><xsl:import href="menu-langue.xsl"/><xsl:import href="get-diaporama.xsl"/><xsl:import href="get-actualites.xsl"/><xsl:import href="get-publications.xsl"/><xsl:import href="string-utils.xsl"/><xsl:import href="actions.xsl"/><xsl:import href="tools.xsl"/> -->
	<xsl:import href="menu-principal.xsl"/>
	
	<xsl:output method="html" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
	<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in"/>
	<!-- <xsl:variable name="labels" select="/data/textes-statiques/entry"/> -->
	<!-- <xsl:variable name="titre"/> -->
	<xsl:variable name="language" select="/data/fl-languages/current-language/@handle"/>
	<xsl:variable name="url-lang">
	<xsl:choose>
		<xsl:when test="$language='en'"><xsl:value-of select="'en/'"></xsl:value-of></xsl:when>
		<xsl:otherwise><xsl:value-of select="''"></xsl:value-of></xsl:otherwise>
	</xsl:choose>
	</xsl:variable>
	<xsl:template match="/">
		<xsl:comment>
			<![CDATA[[if IE 6]>
			<html lang="en" class="no-js ie6 lte-ie9 lte-ie8 lte-ie7 lte-ie6 gte-ie6">
			<![endif]]]>
		</xsl:comment>
		<xsl:comment>
		<![CDATA[[if IE 7]>
			<html lang="en" class="no-js ie7 lte-ie9 lte-ie8 lte-ie7 gte-ie7 gte-ie6">
		<![endif]]]>
		</xsl:comment>
		<xsl:comment>
		<![CDATA[[if IE 8]>
			<html lang="en" class="no-js ie8 lte-ie9 lte-ie8 gte-ie8 gte-ie7 gte-ie6">
		<![endif]]]>
		</xsl:comment>
		<xsl:comment>
		<![CDATA[[if IE 9]>
			<html lang="en" class="no-js ie9 lte-ie9 gte-ie9 gte-ie8 gte-ie7 gte-ie6">
		<![endif]]]>
		</xsl:comment>
		<xsl:comment>
		<![CDATA[[if !(lte IE 9)]>
		<!]]>
		</xsl:comment>
			<html lang="en" class="no-js">
		<xsl:comment>
		<![CDATA[
		<![endif]]]>
		</xsl:comment>
		<xsl:comment>master.xsl</xsl:comment>
		<head>
								<title>
									<xsl:value-of select="$website-name"></xsl:value-of>
								</title>
								<meta charset="utf-8"/>
								<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
		  Remove this if you use the .htaccess -->
								<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
								<meta name="keywords" content="MAB France, mab, Comité MAB France, Réserves de biosphère, Développement durable, programme mab, UNESCO, Comité français du mab, l'homme et la biosphère, Guadeloupe, Camargue, Cévennes, Luberon, Iroise, Ventoux, Fontainebleau, Tuamotu, Corse, Vosges"/>
								<meta name="author" content="valactive"/>
								<!-- Mobile viewport optimized: j.mp/bplateviewport -->
								<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
								<!-- <meta name="google-site-verification" content="AJta6kSh11NpeCGrwds_aC7awKODbNvE4hh7jv9hW9U" /> -->
								<!-- Place favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
								<link rel="shortcut icon" href="/favicon.ico"/>
								<link rel="apple-touch-icon" href="/apple-touch-icon.png"/>
								<!-- CSS: implied media="all" -->
								<link rel="stylesheet" href="{$workspace}/semantic/dist/semantic.css"/>
							</head>
							<body class="mab">
								<!-- HEADER -->
								<div class="ui main text container">
									<h1 class="ui header">
										<xsl:value-of select="$website-name"></xsl:value-of>
									</h1>
								</div>
								<!-- MENU PRINCIPAL -->
								<xsl:call-template name="mab-menu-principal"/>
								<!-- CONTENUS -->
								<div class="article">
									<div class="main ui container">
									<!-- contenus des pages -->
									<xsl:apply-templates />
								</div>
								</div>
								<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
								<!-- JS -->
								<script src="{$workspace}/semantic/dist/semantic.js"></script>
								<script src="{$workspace}/semantic/dist/libs/jqueryui/jquery-ui-1.9.1.custom.min.js"></script>
								<script src="{$workspace}/semantic/dist/jquery.tocify.min.js"></script>
								<script src="{$workspace}/semantic/dist/mab.js"></script>
							</body>
						</html>
					</xsl:template>
				</xsl:stylesheet>