<?xml version="1.0" encoding="utf-8" standalone="no"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xt="http://www.jclark.com/xt"><xsl:template name="MultiLineFieldPrint"><xsl:param name="IdPrefix"/><xsl:param name="FieldEntryTitle"/><xsl:param name="FieldElementsContainer"/><xsl:param name="IsOrderedList" select="'N'"/><xsl:param name="ShowEmptyItems" select="'N'"/><xsl:if test="normalize-space($FieldElementsContainer)"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:variable name="ItemsList" select="xt:node-set($FieldElementsContainer)"/><xsl:for-each select="$ItemsList/*"><xsl:if test="normalize-space(.) or $ShowEmptyItems='Y'"><xsl:variable name="CeilingElementPosition" select="number(position()+1)"/><xsl:call-template name="MultiLineItemPrint"><xsl:with-param name="SubsectionId"><xsl:choose><xsl:when test="$ShowEmptyItems='N'"><xsl:value-of select="count($ItemsList/*[normalize-space(.) and position()&lt;$CeilingElementPosition])"/></xsl:when><xsl:otherwise><xsl:value-of select="position()"/></xsl:otherwise></xsl:choose></xsl:with-param><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="FieldNameId" select="'Enum_Item'"/><xsl:with-param name="FieldEntryTitle" select="$FieldEntryTitle"/><xsl:with-param name="FieldElement" select="."/><xsl:with-param name="IsOrderedList" select="$IsOrderedList"/></xsl:call-template></xsl:if></xsl:for-each></tbody></table></xsl:if></xsl:template><xsl:template name="MultiLineItemPrint"><xsl:param name="SubsectionId"/><xsl:param name="IdPrefix"/><xsl:param name="FieldNameId"/><xsl:param name="FieldEntryTitle"/><xsl:param name="FieldElement"/><xsl:param name="IsOrderedList" select="'N'"/><xsl:text/><tr><td class="VertTop SectionTitle TabularTitle TextRight"><xsl:if test="$IsOrderedList='Y'"><xsl:value-of select="substring('   ',1,4 - (2 * string-length($SubsectionId)))"/><xsl:value-of select="concat('#',$SubsectionId)"/></xsl:if></td><td class="MaxWidth VertTop"><div class="MaxWidth DataContent RptDetail"><xsl:choose><xsl:when test="normalize-space($FieldElement)"><xsl:call-template name="LeafFieldPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,$FieldNameId,'_',$SubsectionId)"/><xsl:with-param name="FieldNameId" select="''"/><xsl:with-param name="FieldNameTitle" select="$FieldEntryTitle"/><xsl:with-param name="FieldElement" select="$FieldElement"/></xsl:call-template></xsl:when><xsl:otherwise> </xsl:otherwise></xsl:choose></div></td></tr></xsl:template></xsl:stylesheet>