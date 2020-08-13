<?xml version="1.0" encoding="utf-8" standalone="no"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:template name="OtherIdInfoPrint"><xsl:param name="TitleType" select="'Field'"/><xsl:param name="TitlePrefixPhrase"/><xsl:param name="BaseTitlePhrase"/><xsl:param name="IdPrefix"/><xsl:param name="OtherIdInfo"/><xsl:param name="RootIdPrefix" select="'IdInfo_'"/><xsl:param name="ShowSectionHeader" select="'Y'"/><xsl:param name="TitleDelimiter" select="':'"/><xsl:variable name="HeaderDelimiter"><xsl:if test="normalize-space(concat($TitlePrefixPhrase,$BaseTitlePhrase))"><xsl:value-of select="$TitleDelimiter"/></xsl:if></xsl:variable><div class="MaxWidth DataContent RptDetail"><xsl:variable name="OutStdContainerValues"><xsl:call-template name="LeafContainerPrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="LeafContainerId" select="concat($RootIdPrefix,'Header')"/><xsl:with-param name="LeafContainerHeader" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase,$HeaderDelimiter))"/><xsl:with-param name="ShowContainerHeader" select="$ShowSectionHeader"/><xsl:with-param name="TitleType" select="$TitleType"/><xsl:with-param name="LeafContainerTitle" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase))"/><xsl:with-param name="AttribTitle" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase))"/><xsl:with-param name="LeafContainerElement" select="$OtherIdInfo"/></xsl:call-template></xsl:variable><xsl:if test="string-length(normalize-space($OutStdContainerValues))"><xsl:copy-of select="$OutStdContainerValues"/><xsl:value-of select="' '"/></xsl:if></div><table cellpadding="0" cellspacing="0" class="RptDetail"><tbody><xsl:call-template name="OtherIdInfo"><xsl:with-param name="TitleType" select="'Field'"/><xsl:with-param name="TitlePrefixPhrase" select="''"/><xsl:with-param name="BaseTitlePhrase" select="''"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,$RootIdPrefix)"/><xsl:with-param name="OtherIdInfo" select="$OtherIdInfo"/></xsl:call-template></tbody></table></xsl:template><xsl:template name="OtherIdInfo"><xsl:param name="TitleType" select="'Field'"/><xsl:param name="TitlePrefixPhrase"/><xsl:param name="BaseTitlePhrase"/><xsl:param name="IdPrefix"/><xsl:param name="OtherIdInfo"/><xsl:variable name="HeightHeader"><xsl:value-of select="'Height (Feet and Inches)'"/></xsl:variable><tr><td class="VertTop TabularTitle TextRight"><span class="FieldContent FieldTitle SubsectionTitle NoWrap"><span><xsl:attribute name="title"><xsl:value-of select="$HeightHeader"/></xsl:attribute><xsl:value-of select="concat($HeightHeader,':')"/></span></span></td><xsl:text/><td class="VertTop"><div class="MaxWidth DataContent RptDetail"><xsl:variable name="OutHeightInFeet"><xsl:call-template name="LeafFieldPrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="FieldNameId" select="'Height_Feet_'"/><xsl:with-param name="FieldNameTitle" select="'Feet'"/><xsl:with-param name="FieldElement" select="$OtherIdInfo/Height/Feet"/></xsl:call-template></xsl:variable><xsl:if test="string-length(normalize-space($OutHeightInFeet))"><xsl:copy-of select="$OutHeightInFeet"/>'</xsl:if><xsl:text/><xsl:variable name="OutHeightInInch"><xsl:call-template name="LeafFieldPrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="FieldNameId" select="'Height_Inches_'"/><xsl:with-param name="FieldNameTitle" select="'Inches'"/><xsl:with-param name="FieldElement" select="$OtherIdInfo/Height/Inches"/></xsl:call-template></xsl:variable><xsl:if test="string-length(normalize-space($OutHeightInInch))"><xsl:copy-of select="$OutHeightInInch"/>"</xsl:if></div></td></tr><xsl:text/><xsl:variable name="WeightHeader"><xsl:value-of select="'Weight'"/><xsl:if test="$OtherIdInfo/Height/@Units"><xsl:value-of select="concat(' (',$OtherIdInfo/Weight/@Units,')')"/></xsl:if></xsl:variable><xsl:call-template name="TitledLeafFieldTabularPrint"><xsl:with-param name="TitleType" select="$TitleType"/><xsl:with-param name="FieldNameHeader" select="normalize-space($WeightHeader)"/><xsl:with-param name="FieldNameTitle" select="normalize-space($WeightHeader)"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Weight_')"/><xsl:with-param name="FieldElement" select="$OtherIdInfo/Weight"/></xsl:call-template><xsl:text/><xsl:call-template name="TitledLeafFieldTabularPrint"><xsl:with-param name="TitleType" select="$TitleType"/><xsl:with-param name="FieldNameHeader" select="concat('Hair Color')"/><xsl:with-param name="FieldNameTitle" select="concat('Hair Color')"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Hair_Color_')"/><xsl:with-param name="FieldElement" select="$OtherIdInfo/HairColor"/></xsl:call-template><xsl:text/><xsl:call-template name="TitledLeafFieldTabularPrint"><xsl:with-param name="TitleType" select="$TitleType"/><xsl:with-param name="FieldNameHeader" select="concat('Eye Color')"/><xsl:with-param name="FieldNameTitle" select="concat('Eye Color')"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Eye_Color_')"/><xsl:with-param name="FieldElement" select="$OtherIdInfo/EyeColor"/></xsl:call-template><xsl:text/><xsl:call-template name="TitledLeafFieldTabularPrint"><xsl:with-param name="TitleType" select="$TitleType"/><xsl:with-param name="FieldNameHeader" select="concat('Sex')"/><xsl:with-param name="FieldNameTitle" select="concat('Sex')"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Sex_')"/><xsl:with-param name="FieldElement" select="$OtherIdInfo/Sex"/></xsl:call-template><xsl:text/><xsl:call-template name="TabularCommentsPrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="Comment" select="$OtherIdInfo/Comment"/></xsl:call-template></xsl:template></xsl:stylesheet>