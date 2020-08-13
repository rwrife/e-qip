<?xml version="1.0" encoding="utf-8" standalone="no"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:strip-space elements="*"/><xsl:template name="NamePrint"><xsl:param name="TitleType" select="'Field'"/><xsl:param name="TitlePrefixPhrase"/><xsl:param name="BaseTitlePhrase"/><xsl:param name="IdPrefix"/><xsl:param name="LegalName"/><xsl:param name="RootIdPrefix" select="'Name_'"/><xsl:param name="TitleDelimiter" select="':'"/><xsl:param name="ShowSectionHeader" select="'Y'"/><xsl:variable name="HeaderDelimiter"><xsl:if test="normalize-space(concat($TitlePrefixPhrase,$BaseTitlePhrase))"><xsl:value-of select="$TitleDelimiter"/></xsl:if></xsl:variable><xsl:variable name="OutStdContainerValues"><xsl:call-template name="LeafContainerPrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="LeafContainerId" select="concat($RootIdPrefix,'Header')"/><xsl:with-param name="LeafContainerHeader" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase,$HeaderDelimiter))"/><xsl:with-param name="ShowContainerHeader" select="$ShowSectionHeader"/><xsl:with-param name="TitleType" select="$TitleType"/><xsl:with-param name="LeafContainerTitle" select="'Last, First Middle Suffix'"/><xsl:with-param name="AttribTitle" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase))"/><xsl:with-param name="LeafContainerElement" select="$LegalName"/></xsl:call-template></xsl:variable><xsl:if test="string-length(normalize-space($OutStdContainerValues))"><xsl:copy-of select="$OutStdContainerValues"/><xsl:value-of select="' '"/></xsl:if><span class="RptDetail"><xsl:variable name="OutLastValues"><xsl:variable name="LastNameTitle" select="'Last Name'"/><xsl:call-template name="LeafFieldPrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="FieldNameId" select="concat($RootIdPrefix,'Last')"/><xsl:with-param name="FieldNameTitle" select="$LastNameTitle"/><xsl:with-param name="FieldElement" select="$LegalName/Last"/><xsl:with-param name="ShowAttribValues" select="'N'"/></xsl:call-template><xsl:if test="normalize-space($LegalName/Last/@Type)"><xsl:value-of select="' '"/><xsl:call-template name="OptionSelectionPrint"><xsl:with-param name="MouseOverTitle" select="$LastNameTitle"/><xsl:with-param name="ShownTitle"><xsl:value-of select="$LegalName/Last/@Type"/></xsl:with-param></xsl:call-template></xsl:if><xsl:if test="$LegalName[@MaidenName='True']"><xsl:value-of select="' '"/><xsl:text>« </xsl:text><span class="ContentStatus FieldContent"><xsl:attribute name="id"><xsl:value-of select="concat($IdPrefix, $RootIdPrefix,'MaidenName')"/></xsl:attribute><xsl:attribute name="title"><xsl:value-of select="'Last Name'"/></xsl:attribute><xsl:value-of select="'Maiden Name'"/></span><xsl:text> »</xsl:text></xsl:if></xsl:variable><xsl:variable name="OutFirstValues"><xsl:variable name="FirstNameTitle" select="'First Name'"/><xsl:call-template name="LeafFieldPrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="FieldNameId" select="concat($RootIdPrefix,'First')"/><xsl:with-param name="FieldNameTitle" select="$FirstNameTitle"/><xsl:with-param name="FieldElement" select="$LegalName/First"/><xsl:with-param name="ShowAttribValues" select="'N'"/></xsl:call-template><xsl:if test="normalize-space($LegalName/First/@Type)"><xsl:choose><xsl:when test="$LegalName/First/@Type='NA'"><xsl:value-of select="' '"/><xsl:call-template name="OptionSelectionPrint"><xsl:with-param name="MouseOverTitle" select="$FirstNameTitle"/><xsl:with-param name="ShownTitle"><xsl:value-of select="'NFN'"/></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise><xsl:value-of select="' '"/><xsl:call-template name="OptionSelectionPrint"><xsl:with-param name="MouseOverTitle" select="$FirstNameTitle"/><xsl:with-param name="ShownTitle"><xsl:value-of select="$LegalName/First/@Type"/></xsl:with-param></xsl:call-template></xsl:otherwise></xsl:choose></xsl:if></xsl:variable><xsl:variable name="OutMiddleValues"><xsl:variable name="MiddleNameTitle" select="'Middle Name'"/><xsl:call-template name="LeafFieldPrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="FieldNameId" select="concat($RootIdPrefix,'Middle')"/><xsl:with-param name="FieldNameTitle" select="$MiddleNameTitle"/><xsl:with-param name="FieldElement" select="$LegalName/Middle"/><xsl:with-param name="ShowAttribValues" select="'N'"/></xsl:call-template><xsl:if test="normalize-space($LegalName/Middle/@Type)"><xsl:choose><xsl:when test="$LegalName/Middle/@Type='NA'"><xsl:value-of select="' '"/><xsl:call-template name="OptionSelectionPrint"><xsl:with-param name="MouseOverTitle" select="$MiddleNameTitle"/><xsl:with-param name="ShownTitle"><xsl:value-of select="'NMN'"/></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise><xsl:value-of select="' '"/><xsl:call-template name="OptionSelectionPrint"><xsl:with-param name="MouseOverTitle" select="$MiddleNameTitle"/><xsl:with-param name="ShownTitle"><xsl:value-of select="$LegalName/Middle/@Type"/></xsl:with-param></xsl:call-template></xsl:otherwise></xsl:choose></xsl:if></xsl:variable><xsl:variable name="OutSuffixValues"><xsl:call-template name="LeafFieldPrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="FieldNameId" select="concat($RootIdPrefix,'Suffix')"/><xsl:with-param name="FieldNameTitle" select="'Name Suffix'"/><xsl:with-param name="FieldElement" select="$LegalName/Suffix"/></xsl:call-template></xsl:variable><xsl:if test="string-length(normalize-space($OutLastValues))"><xsl:copy-of select="$OutLastValues"/></xsl:if><xsl:if test="normalize-space($OutFirstValues) or normalize-space($OutMiddleValues)       or normalize-space($OutSuffixValues)"><xsl:text>,</xsl:text></xsl:if><xsl:if test="normalize-space($OutFirstValues)"><xsl:text> </xsl:text><xsl:value-of select="' '"/><xsl:copy-of select="$OutFirstValues"/></xsl:if><xsl:if test="string-length(normalize-space($OutMiddleValues))"><xsl:text> </xsl:text><xsl:value-of select="' '"/><xsl:copy-of select="$OutMiddleValues"/></xsl:if><xsl:if test="normalize-space($OutSuffixValues)"><xsl:if test="not(normalize-space($OutFirstValues)) and not(normalize-space($OutMiddleValues))"><xsl:text> </xsl:text><xsl:value-of select="' '"/></xsl:if><xsl:text>,</xsl:text></xsl:if><xsl:if test="string-length(normalize-space($OutSuffixValues))"><xsl:text> </xsl:text><xsl:value-of select="' '"/><xsl:copy-of select="$OutSuffixValues"/></xsl:if></span></xsl:template><xsl:template name="TabularNamePrint"><xsl:param name="TitlePrefixPhrase"/><xsl:param name="BaseTitlePhrase"/><xsl:param name="IdPrefix"/><xsl:param name="LegalName"/><xsl:param name="TitleDelimiter" select="':'"/><tr><td class="VertTop TabularDataContent TabularTitle TextRight"><span class="FieldContent FieldTitle SubsectionTitle NoWrap"><xsl:attribute name="title"><xsl:value-of select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase))"/></xsl:attribute><xsl:value-of select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase,$TitleDelimiter))"/></span></td><xsl:text/><td class="VertTop"><div class="MaxWidth DataContent RptDetail"><xsl:call-template name="NamePrint"><xsl:with-param name="TitlePrefixPhrase" select="$TitlePrefixPhrase"/><xsl:with-param name="BaseTitlePhrase" select="'Last, First Middle Suffix'"/><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="LegalName" select="$LegalName"/><xsl:with-param name="ShowSectionHeader" select="'N'"/></xsl:call-template></div></td></tr></xsl:template></xsl:stylesheet>