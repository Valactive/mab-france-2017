<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:import href="../utilities/master.xsl"></xsl:import>
	<xsl:import href="../utilities/dates.xsl"></xsl:import>

	<xsl:template match="data">
		<xsl:variable name="logos-odd" select="actualite-detail/entry/logo-odd" />
		
		<div class="ui grid">
			<div class="row page-header">
				<!-- breadcrumb -->
				<div class="bkg-breadcrumb">
					<div class="ui breadcrumb container">
						<a href="{$root}{$url-lang}" class="section">
							<i class="home icon"></i>
						</a>
						<div class="divider"> / </div>
						<xsl:value-of select="plh-page/page/item[@lang=$current-language]"></xsl:value-of>
						<div class="divider"> / </div>
						<xsl:value-of select="actualite-detail/entry/titre"></xsl:value-of>
					</div>
				</div>
				<!-- page header -->
				<div class="ui container">
					<h1 class="text-primary">
						<xsl:value-of select="actualite-detail/entry/titre" /><br/>
					</h1>
				</div> <!-- ui container-->
				<!-- end page header -->
			</div>
			<!-- end breadcrumb -->
			<div class="two wide column items">
			</div>
			<div class="nine wide column items">
				<h2><xsl:copy-of select="actualite-detail/entry/type-de-publication"/></h2>
				<xsl:copy-of select="actualite-detail/entry/texte"/>
			</div> <!--nine wide columns item-->
			<div class="five wide column">
				<h1 class="ui text-primary">
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="actualite-detail/entry/date/date/start"/>
						<xsl:with-param name="format" select="'%m+; - %y+;'"/>
						<xsl:with-param name="language" select=" 'fr' "/>
					</xsl:call-template>
				</h1>
				<div class="ui middle aligned divided list">
					<xsl:for-each select="$logos-odd/item">
						<xsl:variable name="logo-odd-id">
							<xsl:value-of select="@id"></xsl:value-of>
						</xsl:variable>
						<a class="item" href="{/data/logos-odd/entry[@id=$logo-odd-id]/lien-http-ref-logo}" target="_blank">
							<img class="ui image" src="{$root}/image/1/48/48{/data/logos-odd/entry[@id=$logo-odd-id]/image-ref-logo/@path}/{/data/logos-odd/entry[@id=$logo-odd-id]/image-ref-logo/filename}"/>
							<div class="content header"><xsl:value-of select="/data/logos-odd/entry[@id=$logo-odd-id]/nom-ref-logo"></xsl:value-of></div>
						</a>
					</xsl:for-each>	
				</div> <!--ui middle aligned divide list-->
				<div class="ui middle aligned divided list">
					<xsl:if test="actualite-detail/entry/document-joint != ''">
						<a href="{$workspace}/uploads/actualites{actualité-detail/entry/document-joint/@path}/{actualite-detail/entry/document-joint/filename}" target="_blank" class="ui circular mini button download-press">
							<xsl:value-of select="actualite-detail/entry/nom-du-document-joint"></xsl:value-of>
							<i class="right download icon"></i>
						</a>
					</xsl:if>
				</div> <!--ui middle aligned divide list-->

				<div id="fb-root"></div>
  <script>(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&amp;version=v3.0";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));</script>
				
				<div class="ui middle aligned divided list">
					<a onclick="window.open('https://www.facebook.com/sharer/sharer.php?u='+encodeURIComponent('{$current-url}'),'facebook-share-dialog','width=626,height=436'); return false;">
					<img 
						class="ui avatar image" 
						src="/workspace/img/facebook-logo.svg" 
						alt="_blank"
						
						></img>
						<xsl:choose>
							<xsl:when test="$current-language='fr'">Partager sur Facebook</xsl:when>
							<xsl:otherwise>Share on Facebook</xsl:otherwise>
						</xsl:choose>
					</a>
				</div>	
			</div> <!-- five wide column-->

		</div>
	</xsl:template>

	<xsl:template name="partage-actualite"> <!-- partage facebook sur page actualite-->
			<meta property="og:url"           content="{$current-url}" />
			<meta property="og:type"          content="website" />
			<meta property="og:title"         content="Mab France, actualite" />
			<meta property="og:description"   content="coucou, Le comité MAB France anime au niveau national les activités menées dans le cadre du Programme MAB de l'UNESCO et coordonne les actions de développement durable dans les 10 réserves de biosphère françaises en favorisant les échanges d'information et d'expérience " />
			<meta property="og:image"         content="{$root}/image/1/280/0/{data/actualite-detail/entry/image-a-la-une/@path}/{data/actualite-detail/entry/image-a-la-une/filename}" />
	</xsl:template>

</xsl:stylesheet>
