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

	

	<xsl:template match="data">
		<div class="ui grid">
			<xsl:call-template name="content-page-header"></xsl:call-template>
			<div class="row">
				
				<div class="ui container" id="filtres">
					<div class="ui grid">	
						<div class="one fields">
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
							</div> <!--field-->
						</div> <!--one field--> 
				
				
				
						<!--<div class="column six wide">
							<div class="item" data-value="isotope-item" data-text="Toutes">
									<p><i class="trash alternate outline icon"></i>
									Réinitialiser le filtre</p>
							</div>
						</div>-->

						<div class="column nine wide">
							<p>
								<xsl:choose>
								<xsl:when test="$current-language='fr'">
								LeMab France publie la Lettre de la biosphère quatre fois par an.
								Pour la recevoir dans votre boîte mail
								</xsl:when>
								<xsl:otherwise>
								The Mab France publishes the Letter of the biosphere four times a year.
								To subscribe
								</xsl:otherwise>
								</xsl:choose>
									<div class="createsend-button" style="height:27px;display:inline-block;" data-listid="r/54/8E5/071/1B4D77D32002385C"></div>
									<script type="text/javascript">(function () { var e = document.createElement('script'); 
																	e.type = 'text/javascript'; e.async = true; 
																	e.src = ('https:' == document.location.protocol ? 'https' : 'http') + '://btn.createsend1.com/js/sb.min.js?v=3'; 
																	e.className = 'createsend-script'; 
																	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(e, s); })();
									</script> 
							</p>
						</div>
					</div>
				
				</div> <!--ui container-->
			</div> <!-- row-->
		
			<h4 class="ui horizontal divider header center">
				<!-- entete avec icone laureat-->
				<i class="users icon"></i>
				<xsl:value-of select="/data/lettres-avec-filtre/pagination/@total-entries"/> 
				<xsl:choose>
					<xsl:when test="$current-language = 'fr'"> Lettres de la biosphère</xsl:when>
					<xsl:otherwise> Biosphere's letter</xsl:otherwise>
				</xsl:choose>
			</h4>
			
			<!-- ui horizontal divider hearder-->
			<div class="ui row cards-eco-acteurs">
				<!-- la grille des vignettes-->
				<div class="ui container">
					<div class="ui four link cards">
						<xsl:for-each select="lettres-avec-filtre/entry">
							<div class="ui card">
									<xsl:choose>
									<xsl:when test="image-a-la-une != ''">
										<xsl:variable name="img" select="image-a-la-une"/>
										<img src="{$root}/image/1/280/0/{$img/@path}/{$img/filename}" alt="image de la lettre"/>
									</xsl:when>
									<xsl:otherwise>
										<img  src="{$root}/workspace/uploads/image-a-la-une/vignettes-defaut.png" alt="vignette par defaut"/>
									</xsl:otherwise>
									</xsl:choose>
							<div class="content">
								<h4 class="text-primary">
								Lettre de la biosphère N°<xsl:value-of select="numero/@handle"/> 
								</h4>
							</div><!--content-->
							<div class="content">
								<xsl:value-of select="titre"/>
							
								<div class="description">
									Tribune à <xsl:value-of select="tribune-a"></xsl:value-of>
							</div>
							</div> <!--ui middle aligned divide list-->
								<div class="extra content">
									<div class="right floated">
										<xsl:if test="pdf != ''">
										<a href="{$workspace}/uploads/mab/documents/{pdf/item}" target="_blank" class="ui mini ">
											<xsl:choose>
												<xsl:when test="$current-language = 'fr'">Télécharger le pdf </xsl:when>
												<xsl:otherwise>Download pdf file </xsl:otherwise>
											</xsl:choose>
											<i class="arrow alternate circle right outline icon"></i>
										</a>
										</xsl:if>
									</div>		
									<div class="right floated">
										<a href="{url-version-web}" target="_blank" class="ui mini ">
											<xsl:choose>
												<xsl:when test="$current-language = 'fr'">Lire la lettre en ligne </xsl:when>
												<xsl:otherwise>Read on line </xsl:otherwise>
											</xsl:choose>
											<i class="arrow alternate circle right outline icon"></i>
										</a>
									</div>									<!--right floated-->
								</div>
								<div class="meta">
									<p class="small center aligned content">
										<xsl:call-template name="format-date">
													<xsl:with-param name="date" select="date"/>
													<xsl:with-param name="format" select="'%m+; - %y+;'"/>
													<xsl:with-param name="language" select=" 'fr' "/>
												</xsl:call-template>
									</p>
								</div> <!-- meta-->
							</div>	<!--ui card-->
						</xsl:for-each>
					</div>					<!--ui four link cards-->
				</div>				<!--ui four link cards-->
			</div>			<!--ui row cards-eco-acteurs-->
			<div class="ui row">
				<div class="ui twelve column padded grid content centered">
					<!-- appel template de pagination-->
					<xsl:call-template name="pagination">
						<xsl:with-param name="pagination" select="/data/lettres-avec-filtre/pagination"/>
						<xsl:with-param name="pagination-url">
							<xsl:value-of select="concat($current-url,'/?numpage=','$')"/>
							<xsl:if test="$url-annee!=''">
								<xsl:value-of select="concat('&amp;annee=',$url-annee)"></xsl:value-of>
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
	<xsl:template name="partage-facebook"/> <!-- partage facebook sur page actualite-->

</xsl:stylesheet>
