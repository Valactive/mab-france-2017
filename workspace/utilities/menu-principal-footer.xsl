<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="mab-menu-principal-footer">
		<div class="ui stackable row borderless">
			<div class="ui container six column grid">
				<!-- 1er niveau -->
				<xsl:for-each select="/data/rubriques-principales/entry/nom/item[@lang=$language]">

					<xsl:variable name="rubrique-principale-handle">
						<xsl:value-of select="./@handle"></xsl:value-of>
					</xsl:variable>
					<xsl:variable name="rubrique-principale">
						<xsl:value-of select="."></xsl:value-of>
					</xsl:variable>

					<xsl:choose>
						<xsl:when test="count(/data/menu-principal/entry[rubrique-parente/item/@handle=$rubrique-principale-handle])>0">
							<!-- si 2eme niveau -->
							<div class="column">
								<span class="text">
									<!-- <a href="{$root}/{$url-lang}{$rubrique-principale-handle}/"> -->
									<h5><xsl:value-of select="$rubrique-principale" /></h5>
									<!-- </a> -->
								</span>

								<ul class="ui list">
									<xsl:for-each select="/data/menu-principal/entry[rubrique-parente/item/@handle=$rubrique-principale-handle]">
										<xsl:variable name="rubrique-parente-handle" select="nom/item[@lang=$language]/@handle" />
										<!-- si 3eme niveau -->
										<xsl:choose>
											<xsl:when test="count(//entry[menu-niveau-2-page/item/@handle = $rubrique-parente-handle]/nom/item[@lang=$language])>0">
												<li class="item" href="{$root}/{$url-lang}{$rubrique-principale-handle}/{$rubrique-parente-handle}/">
													<span class="text">
														<!-- <a href="{$root}/{$url-lang}{$rubrique-principale-handle}/{$rubrique-parente-handle}/"> -->
														<xsl:value-of select="nom/item[@lang=$language]"/>
														<!-- </a> -->
													</span>
													<ul class="menu">
														<xsl:for-each select="//menu-principal/entry[menu-niveau-2-page/item/@handle = $rubrique-parente-handle]/nom/item[@lang=$language]">
															<li class="item">
																<a href="{$root}/{$url-lang}{$rubrique-principale-handle}/{$rubrique-parente-handle}/{./@handle}/">
																	<xsl:value-of select="." />
																</a>
															</li>
														</xsl:for-each>
													</ul>
												</li>
											</xsl:when>
											<xsl:otherwise>
												<li class="item">
													<a href="{$root}/{$url-lang}{$rubrique-principale-handle}/{$rubrique-parente-handle}/">
														<xsl:value-of select="nom/item[@lang=$language]" />
													</a>
												</li>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</ul>
							</div>
						</xsl:when>
						<xsl:otherwise>
							<div class="column">
								<span class="text">
									<h5><xsl:value-of select="$rubrique-principale" /></h5>
								</span>
								<!-- <a href="{$root}/{$url-lang}{$rubrique-principale-handle}/"><xsl:value-of select="$rubrique-principale" /></a> -->
							</div>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>

			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>