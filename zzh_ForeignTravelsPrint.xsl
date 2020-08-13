<?xml version="1.0" encoding="utf-8" standalone="no"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:variable name="TravelTypes" select="document('TravelTypesTable.xml')"/><xsl:template name="ForeignTravelsPrint"><xsl:param name="TitleType" select="'Field'"/><xsl:param name="TitlePrefixPhrase"/><xsl:param name="BaseTitlePhrase"/><xsl:param name="IdPrefix"/><xsl:param name="ForeignTravels"/><xsl:param name="RootIdPrefix" select="'Section_'"/><xsl:param name="ShowSectionHeader" select="'Y'"/><xsl:param name="ShowSectionAttribValues" select="'N'"/><xsl:param name="ShowSubsectionIds" select="'N'"/><xsl:param name="TitleDelimiter" select="':'"/><xsl:variable name="HeaderDelimiter"><xsl:if test="normalize-space(concat($TitlePrefixPhrase,$BaseTitlePhrase))"><xsl:value-of select="$TitleDelimiter"/></xsl:if></xsl:variable><div class="MaxWidth DataContent RptDetail"><xsl:variable name="OutStdContainerValues"><xsl:call-template name="LeafContainerPrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="LeafContainerId" select="concat($RootIdPrefix,'Header')"/><xsl:with-param name="LeafContainerHeader" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase,$HeaderDelimiter))"/><xsl:with-param name="ShowContainerHeader" select="$ShowSectionHeader"/><xsl:with-param name="TitleType" select="$TitleType"/><xsl:with-param name="LeafContainerTitle" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase))"/><xsl:with-param name="ShowAttribValues" select="$ShowSectionAttribValues"/><xsl:with-param name="AttribTitle" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase))"/><xsl:with-param name="LeafContainerElement" select="$ForeignTravels"/></xsl:call-template></xsl:variable><xsl:if test="string-length(normalize-space($OutStdContainerValues))"><xsl:copy-of select="$OutStdContainerValues"/><xsl:value-of select="' '"/></xsl:if></div><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:for-each select="$ForeignTravels/ForeignTravel"><xsl:call-template name="ForeignTravelHeaderPrint"><xsl:with-param name="SubsectionId" select="position()"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,$RootIdPrefix,position(),'_')"/><xsl:with-param name="ForeignTravel" select="."/><xsl:with-param name="ShowSeperator" select="number(position()!=1)"/><xsl:with-param name="TitlePrefixPhrase" select="$TitlePrefixPhrase"/><xsl:with-param name="BaseTitlePhrase" select="$BaseTitlePhrase"/><xsl:with-param name="ShowSubsectionId" select="$ShowSubsectionIds"/></xsl:call-template></xsl:for-each></tbody></table><xsl:text/></xsl:template><xsl:template name="ForeignTravelHeaderPrint"><xsl:param name="SubsectionId"/><xsl:param name="IdPrefix"/><xsl:param name="ForeignTravel"/><xsl:param name="ShowSeperator"/><xsl:param name="TitlePrefixPhrase"/><xsl:param name="BaseTitlePhrase"/><xsl:param name="ShowSubsectionId"/><xsl:call-template name="SubsectionTabularWrapperPrint"><xsl:with-param name="SubsectionId" select="concat(substring('   ',1,4 - (2 * string-length($SubsectionId))),'#',$SubsectionId)"/><xsl:with-param name="ShowSubsectionId" select="'Y'"/><xsl:with-param name="ShowSeperatorNFlag" select="$ShowSeperator"/><xsl:with-param name="SubsectionFormatClassList"/><xsl:with-param name="WrapperDataContent"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:call-template name="ForeignTravelInfoPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'a','_')"/><xsl:with-param name="ForeignTravel" select="$ForeignTravel"/><xsl:with-param name="SubsectionHeader" select="'ForeignTravel'"/><xsl:with-param name="SubsectionTitle" select="concat($TitlePrefixPhrase,' ',$BaseTitlePhrase, ' ForeignTravel')"/></xsl:call-template></tbody></table></xsl:with-param></xsl:call-template></xsl:template><xsl:template name="ForeignTravelInfoPrint"><xsl:param name="IdPrefix"/><xsl:param name="ForeignTravel"/><xsl:param name="SubsectionHeader"/><xsl:param name="SubsectionTitle"/><xsl:call-template name="TabularTimeFramePrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="FromDate" select="$ForeignTravel/FromDate/Date"/><xsl:with-param name="ToDate" select="$ForeignTravel/ToDate/Date"/><xsl:with-param name="Precision" select="'month'"/></xsl:call-template><xsl:text/><xsl:call-template name="CodeLookUpTabularPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Foreign_Travel_Type_')"/><xsl:with-param name="TitlePrefixPhrase" select="'Visit'"/><xsl:with-param name="BaseTitlePhrase" select="'Purpose'"/><xsl:with-param name="LookUpTable" select="$TravelTypes"/><xsl:with-param name="CodeValue2LookUp" select="$ForeignTravel/@Type"/></xsl:call-template><xsl:text/><xsl:call-template name="TitledLeafFieldTabularPrint"><xsl:with-param name="FieldNameHeader" select="'Country'"/><xsl:with-param name="FieldNameTitle" select="'Country'"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Country_')"/><xsl:with-param name="FieldElement" select="$ForeignTravel/Country"/></xsl:call-template><xsl:text/><xsl:if test="not(count($ForeignTravel/@ManyShortTrips)) or $ForeignTravel/@ManyShortTrips='True'"><xsl:call-template name="TitledLeafFieldTabularPrint"><xsl:with-param name="FieldNameHeader" select="'Many Short Trips'"/><xsl:with-param name="FieldNameTitle" select="'Many Short Trips'"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Many_Short_Trips_')"/><xsl:with-param name="FieldDataContent"><div class="MaxWidth RptDetail DataContent"><xsl:if test="count($ForeignTravel/@ManyShortTrips)"><xsl:call-template name="OptionSelectionPrint"><xsl:with-param name="MouseOverTitle" select="'Many Short Trips'"/><xsl:with-param name="ShownTitle"><xsl:choose><xsl:when test="$ForeignTravel/@ManyShortTrips='True'"><xsl:value-of select="'Yes'"/></xsl:when><xsl:otherwise><xsl:value-of select="'No'"/></xsl:otherwise></xsl:choose></xsl:with-param></xsl:call-template></xsl:if></div></xsl:with-param></xsl:call-template><xsl:text/></xsl:if><xsl:call-template name="TabularCommentsPrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="Comment" select="$ForeignTravel/Comment"/></xsl:call-template><xsl:text/></xsl:template></xsl:stylesheet>