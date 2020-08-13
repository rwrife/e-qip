<?xml version="1.0" encoding="utf-8" standalone="no"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:preserve-space elements="*"/><xsl:template name="LeafContainerPrint"><xsl:param name="IdPrefix"/><xsl:param name="LeafContainerId"/><xsl:param name="LeafContainerHeader"/><xsl:param name="LeafContainerTitle"/><xsl:param name="LeafContainerElement"/><xsl:param name="TitleType" select="'Field'"/><xsl:param name="AttribTitle" select="''"/><xsl:param name="ShowAsUnexpectedValue" select="'N'"/><xsl:param name="ShowIfMissingValue" select="'N'"/><xsl:param name="ShowContainerHeader" select="'Y'"/><xsl:param name="ShowAttribValues" select="'Y'"/><xsl:variable name="OutLeafContainerHeader" select="number(string-length(normalize-space($LeafContainerHeader)))"/><xsl:variable name="HasDNKValue"><xsl:choose><xsl:when test="$LeafContainerElement"><xsl:value-of select="number($LeafContainerElement[@DoNotKnow='True'] and $ShowAttribValues='Y')"/></xsl:when><xsl:otherwise><xsl:value-of select="number(false())"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="HasNAValue"><xsl:choose><xsl:when test="$LeafContainerElement"><xsl:value-of select="number($LeafContainerElement[@NotApplicable='True'] and $ShowAttribValues='Y')"/></xsl:when><xsl:otherwise><xsl:value-of select="number(false())"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="HasStatusAttribValues"><xsl:value-of select="number(number($HasDNKValue) or number($HasNAValue))"/></xsl:variable><xsl:if test="number($OutLeafContainerHeader) and $ShowContainerHeader='Y'"><span><xsl:attribute name="title"><xsl:value-of select="$LeafContainerTitle"/></xsl:attribute><xsl:choose><xsl:when test="$TitleType = 'Section'"><xsl:attribute name="class"><xsl:value-of select="'SectionTitle'"/></xsl:attribute></xsl:when><xsl:when test="$TitleType = 'Subsection'"><xsl:attribute name="class"><xsl:value-of select="'SubsectionTitle'"/></xsl:attribute></xsl:when><xsl:when test="$TitleType = 'Field'"><xsl:attribute name="class"><xsl:value-of select="'FieldContent FieldTitle SubsectionTitle NoWrap'"/></xsl:attribute></xsl:when><xsl:otherwise/></xsl:choose><xsl:choose><xsl:when test="normalize-space($LeafContainerHeader)"><xsl:choose><xsl:when test="$ShowAsUnexpectedValue = 'Y'"><span class="UnexpectedContent"><xsl:if test="$LeafContainerId"><xsl:attribute name="id"><xsl:value-of select="concat($IdPrefix,$LeafContainerId)"/></xsl:attribute></xsl:if><xsl:value-of select="concat('? ',normalize-space($LeafContainerHeader),' ?')"/></span></xsl:when><xsl:otherwise><span><xsl:attribute name="id"><xsl:value-of select="concat($IdPrefix,$LeafContainerId)"/></xsl:attribute><xsl:value-of select="normalize-space($LeafContainerHeader)"/></span></xsl:otherwise></xsl:choose></xsl:when><xsl:otherwise><xsl:choose><xsl:when test="$ShowContentValue='Y' and $ShowIfMissingValue = 'Y'"><xsl:text>« </xsl:text><span class="MissingContent"><xsl:value-of select="concat('?',$LeafContainerTitle,'?')"/></span><xsl:text> »</xsl:text></xsl:when><xsl:otherwise/></xsl:choose></xsl:otherwise></xsl:choose></span></xsl:if><xsl:if test="number($OutLeafContainerHeader) and number($HasStatusAttribValues)"><xsl:value-of select="' '"/></xsl:if><xsl:if test="number($HasDNKValue)"><xsl:text>« </xsl:text><span class="FieldContent ContentStatus"><xsl:attribute name="id"><xsl:value-of select="concat($IdPrefix,$LeafContainerId,'_DNK')"/></xsl:attribute><xsl:if test="$AttribTitle"><xsl:attribute name="title"><xsl:value-of select="$AttribTitle"/></xsl:attribute></xsl:if><xsl:value-of select="'DNK'"/></span><xsl:text> »</xsl:text></xsl:if><xsl:if test="number($HasDNKValue) and number($HasNAValue)"><xsl:value-of select="' '"/></xsl:if><xsl:if test="number($HasNAValue)"><xsl:text>« </xsl:text><span class="FieldContent ContentStatus"><xsl:attribute name="id"><xsl:value-of select="concat($IdPrefix,$LeafContainerId,'_NA')"/></xsl:attribute><xsl:if test="$AttribTitle"><xsl:attribute name="title"><xsl:value-of select="$AttribTitle"/></xsl:attribute></xsl:if><xsl:value-of select="'NA'"/></span><xsl:text> »</xsl:text></xsl:if></xsl:template></xsl:stylesheet>