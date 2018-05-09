<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="resize-direction-basic">
	<xsl:param name="type"></xsl:param>
	<xsl:param name="position"></xsl:param>
	<xsl:param name="_width"></xsl:param>
	<xsl:param name="_height"></xsl:param>
	<xsl:param name="swidth"></xsl:param>
	<xsl:param name="sheight"></xsl:param>	
	<xsl:param name="path"></xsl:param>
	<xsl:param name="class"></xsl:param>
	<!-- var for resize img -->
		<xsl:variable name="resizeDirection">
			<xsl:choose>
				<xsl:when test="$_width &gt; $_height">
						<xsl:value-of select="$swidth"/>/<xsl:value-of select="$sheight"/>
					</xsl:when>
					<xsl:otherwise><xsl:value-of select="$sheight"/>/<xsl:value-of select="$swidth"/>
					</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="filepath"><xsl:value-of select="$path/@path"/></xsl:variable>
		<xsl:variable name="filename"><xsl:value-of select="$path/filename"/></xsl:variable>
 		<img class="{$class}" src="{$root}/image/{$type}/{$resizeDirection}/{$filepath}/{$filename}" />
</xsl:template>

</xsl:stylesheet>