<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="mab-menu-principal">
		<div class="ui stackable row main menu borderless menu-principal">
			<div class="ui fluid container">
				<a href="{$root}/{$url-lang}/" class="header item">
					<!-- <img class="logo" src="assets/images/logo.png"/> -->
					<xsl:value-of select="$page-title"></xsl:value-of>
				</a>
				<!-- 1er niveau -->
				<xsl:for-each select="/data/rubriques-principales/entry/nom/item[@lang=$language]">
					<xsl:variable name="rubrique-principale-handle">
						<xsl:value-of select="./@handle"></xsl:value-of>
					</xsl:variable>
					<xsl:variable name="rubrique-principale">
						<xsl:value-of select="."></xsl:value-of>
					</xsl:variable>
					<!-- rubrique-principale = rubrique-parente -->
					<!-- rubrique-parente = menu-niveau-2-page -->
					<xsl:choose>
						<xsl:when test="count(/data/menu-principal/entry[rubrique-parente/item/@handle=$rubrique-principale-handle])>0">
							<!-- si 2eme niveau -->
							<div class="ui pointing dropdown link item">
								<!-- <xsl:attribute name="class">
									<xsl:choose>
										<xsl:when test="$rubrique = $rubrique-principale-handle">ui pointing dropdown link item active</xsl:when>
										<xsl:otherwise>ui pointing dropdown link item</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute> -->


								<span class="text">
									<!-- <a href="{$root}/{$url-lang}{$rubrique-principale-handle}/"> -->
									<xsl:value-of select="$rubrique-principale" />
									<!-- </a> -->
								</span>
								<i class="dropdown icon"></i>
								<div class="menu">
									<xsl:for-each select="/data/menu-principal/entry[rubrique-parente/item/@handle=$rubrique-principale-handle]">
										<xsl:variable name="rubrique-parente-handle" select="nom/item[@lang=$language]/@handle" />
										<!-- si 3eme niveau -->
										<xsl:choose>
											<xsl:when test="count(//entry[menu-niveau-2-page/item/@handle = $rubrique-parente-handle]/nom/item[@lang=$language])>0">
												<div class="item" href="{$root}/{$url-lang}{$rubrique-principale-handle}/{$rubrique-parente-handle}/">
													<i class="dropdown icon"></i>
													<span class="text">
														<!-- <a href="{$root}/{$url-lang}{$rubrique-principale-handle}/{$rubrique-parente-handle}/"> -->
														<xsl:value-of select="nom/item[@lang=$language]"/>
														<!-- </a> -->
													</span>
													<div class="menu">
														<xsl:for-each select="//menu-principal/entry[menu-niveau-2-page/item/@handle = $rubrique-parente-handle]/nom/item[@lang=$language]">
															<div class="item">
																<a href="{$root}/{$url-lang}{$rubrique-principale-handle}/{$rubrique-parente-handle}/{./@handle}/">
																	<xsl:value-of select="." />
																</a>
															</div>
														</xsl:for-each>
													</div>
												</div>
											</xsl:when>
											<xsl:otherwise>
												<div class="item">
													<a href="{$root}/{$url-lang}{$rubrique-principale-handle}/{$rubrique-parente-handle}/">
														<xsl:value-of select="nom/item[@lang=$language]" />
													</a>
												</div>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</div>
							</div>
						</xsl:when>
						<xsl:otherwise>
							<div class="item">
								<span class="text">
									<xsl:value-of select="$rubrique-principale" />
								</span>
								<!-- <a href="{$root}/{$url-lang}{$rubrique-principale-handle}/"><xsl:value-of select="$rubrique-principale" /></a> -->
							</div>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- social links -->
				<div class="ui right menu social-menu">
					<a href="#" class="ui right v-vimeo"></a>
					<a href="#" class="ui right v-facebook"></a>
					<a href="#" class="ui right v-instagram"></a>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>