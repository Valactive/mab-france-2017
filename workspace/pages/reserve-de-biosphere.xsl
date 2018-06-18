<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="../utilities/master.xsl"></xsl:import>

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
		</xsl:template>
	</xsl:stylesheet>