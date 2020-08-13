<?xml version="1.0" encoding="utf-8" standalone="no"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:template name="OtherNamesPrint"><xsl:param name="TitleType" select="'Field'"/><xsl:param name="TitlePrefixPhrase"/><xsl:param name="BaseTitlePhrase"/><xsl:param name="IdPrefix"/><xsl:param name="OtherNames"/><xsl:param name="RootIdPrefix" select="'Section_'"/><xsl:param name="ShowSectionHeader" select="'Y'"/><xsl:param name="ShowSectionAttribValues" select="'N'"/><xsl:param name="AllowComment" select="'Y'"/><xsl:param name="TitleDelimiter" select="':'"/><xsl:variable name="HeaderDelimiter"><xsl:if test="normalize-space(concat($TitlePrefixPhrase,$BaseTitlePhrase))"><xsl:value-of select="$TitleDelimiter"/></xsl:if></xsl:variable><div class="MaxWidth DataContent RptDetail"><xsl:variable name="OutStdContainerValues"><xsl:call-template name="LeafContainerPrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="LeafContainerId" select="concat($RootIdPrefix,'Header')"/><xsl:with-param name="LeafContainerHeader" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase,$HeaderDelimiter))"/><xsl:with-param name="ShowContainerHeader" select="$ShowSectionHeader"/><xsl:with-param name="TitleType" select="$TitleType"/><xsl:with-param name="LeafContainerTitle" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase))"/><xsl:with-param name="ShowAttribValues" select="$ShowSectionAttribValues"/><xsl:with-param name="AttribTitle" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase))"/><xsl:with-param name="LeafContainerElement" select="$OtherNames"/></xsl:call-template></xsl:variable><xsl:if test="string-length(normalize-space($OutStdContainerValues))"><xsl:copy-of select="$OutStdContainerValues"/><xsl:value-of select="' '"/></xsl:if></div><xsl:variable name="DoNotShowContent" select="number((not(normalize-space($OtherNames)) and (($OtherNames/@DoNotKnow='True') or ($OtherNames/@NotApplicable='True'))))"/><xsl:if test="not(number($DoNotShowContent))"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:for-each select="$OtherNames/OtherName"><xsl:call-template name="OtherNameHeaderPrint"><xsl:with-param name="SubsectionId" select="position()"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,position(),'_')"/><xsl:with-param name="OtherName" select="."/><xsl:with-param name="ShowSeperator" select="number(position()!=1)"/><xsl:with-param name="AllowComment" select="$AllowComment"/></xsl:call-template></xsl:for-each></tbody></table></xsl:if></xsl:template><xsl:template name="OtherNameHeaderPrint"><xsl:param name="SubsectionId"/><xsl:param name="IdPrefix"/><xsl:param name="OtherName"/><xsl:param name="ShowSeperator"/><xsl:param name="AllowComment" select="'Y'"/><xsl:call-template name="SubsectionTabularWrapperPrint"><xsl:with-param name="SubsectionId" select="concat(substring('   ',1,4 - (2 * string-length($SubsectionId))),'#',$SubsectionId)"/><xsl:with-param name="ShowSubsectionId" select="'Y'"/><xsl:with-param name="ShowSeperatorNFlag" select="$ShowSeperator"/><xsl:with-param name="SubsectionFormatClassList"/><xsl:with-param name="WrapperDataContent"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:call-template name="OtherNamePrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'OtherName','_')"/><xsl:with-param name="OtherName" select="$OtherName"/><xsl:with-param name="ShowSeperator" select="number(false())"/><xsl:with-param name="AllowComment" select="$AllowComment"/></xsl:call-template></tbody></table></xsl:with-param></xsl:call-template></xsl:template><xsl:template name="OtherNamePrint"><xsl:param name="IdPrefix"/><xsl:param name="OtherName"/><xsl:param name="ShowSeperator"/><xsl:param name="AllowComment" select="'Y'"/><xsl:call-template name="TabularTimeFramePrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="FromDate" select="$OtherName/FromDate/Date"/><xsl:with-param name="ToDate" select="$OtherName/ToDate/Date"/><xsl:with-param name="Precision" select="'month'"/></xsl:call-template><xsl:text/><xsl:call-template name="TabularNamePrint"><xsl:with-param name="BaseTitlePhrase" select="'Name'"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Alias','_')"/><xsl:with-param name="LegalName" select="$OtherName/LegalName"/></xsl:call-template><xsl:text/><xsl:if test="$AllowComment='Y'"><xsl:call-template name="TabularCommentsPrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="Comment" select="$OtherName/Comment"/><xsl:with-param name="ShowSeperatorNFlag" select="$ShowSeperator"/></xsl:call-template></xsl:if></xsl:template></xsl:stylesheet>