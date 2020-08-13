<?xml version="1.0" encoding="utf-8" standalone="no"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:template name="TableOptionsPrint"><xsl:param name="IdPrefix"/><xsl:param name="FieldEntryTitle"/><xsl:param name="ListElement"/><xsl:param name="ShowEmptyItems" select="'N'"/><xsl:param name="IsOrderedList" select="'N'"/><xsl:param name="ShowCodeAsPrefixCode" select="'N'"/><xsl:if test="normalize-space($ListElement)"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><tr><td class="VertTop SectionTitle TabularTitle TextRight"><xsl:for-each select="$ListElement"><xsl:if test="normalize-space(.) or $ShowEmptyItems='Y'"><xsl:call-template name="TableOptionItemPrint"><xsl:with-param name="SubsectionId" select="position()"/><xsl:with-param name="PrefixCode"><xsl:choose><xsl:when test="$ShowCodeAsPrefixCode='Y'"><xsl:value-of select="concat(' ',normalize-space(./@Code))"/></xsl:when><xsl:when test="count(./@KeyCode)"><xsl:value-of select="concat(' ',normalize-space(./@KeyCode))"/></xsl:when><xsl:when test="$IsOrderedList='Y'"><xsl:value-of select="position()"/></xsl:when><xsl:otherwise/></xsl:choose></xsl:with-param><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="FieldNameId" select="'Table_Option_Item'"/><xsl:with-param name="FieldEntryTitle" select="$FieldEntryTitle"/><xsl:with-param name="ListElement" select="."/><xsl:with-param name="IsOrderedList" select="$IsOrderedList"/></xsl:call-template></xsl:if></xsl:for-each></td></tr></tbody></table></xsl:if></xsl:template><xsl:template name="TableOptionItemPrint"><xsl:param name="PrefixCode"/><xsl:param name="SubsectionId"/><xsl:param name="IdPrefix"/><xsl:param name="FieldNameId"/><xsl:param name="FieldEntryTitle"/><xsl:param name="ListElement"/><xsl:param name="IsOrderedList" select="'N'"/><xsl:variable name="Spacer" select="'   '"/><xsl:text/><table cellpadding="0" cellspacing="0" class="RptDetail MaxTableOptionSize FloatLeftBot"><tbody><tr><td class="VertTop SectionTitle TabularTitle TextRight"><xsl:if test="$PrefixCode"><xsl:value-of select="substring($Spacer,1,4 - (2 * string-length($PrefixCode)))"/><xsl:value-of select="concat($PrefixCode,' -')"/></xsl:if></td><td class="MaxWidth VertTop"><div class="MaxWidth DataContent RptDetail"><xsl:choose><xsl:when test="normalize-space($ListElement)"><xsl:call-template name="LeafFieldPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,$FieldNameId,'_',$SubsectionId)"/><xsl:with-param name="FieldNameId" select="''"/><xsl:with-param name="FieldNameTitle" select="$FieldEntryTitle"/><xsl:with-param name="FieldElement" select="$ListElement"/></xsl:call-template></xsl:when><xsl:otherwise> </xsl:otherwise></xsl:choose></div></td></tr></tbody></table></xsl:template></xsl:stylesheet>