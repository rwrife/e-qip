<?xml version="1.0" encoding="utf-8" standalone="no"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:strip-space elements="*"/><xsl:variable name="EmploymentTypes" select="document('EmploymentTypesTable.xml')"/><xsl:variable name="MilitaryBranchs" select="document('MilitaryBranchsTable.xml')"/><xsl:template name="EmploymentsPrint"><xsl:param name="TitleType" select="'Field'"/><xsl:param name="TitlePrefixPhrase"/><xsl:param name="BaseTitlePhrase"/><xsl:param name="IdPrefix"/><xsl:param name="Employments"/><xsl:param name="RootIdPrefix" select="'Section_'"/><xsl:param name="ShowSectionHeader" select="'Y'"/><xsl:param name="ShowSectionAttribValues" select="'N'"/><xsl:param name="ShowSubsectionIds" select="'N'"/><xsl:param name="TitleDelimiter" select="':'"/><xsl:variable name="HeaderDelimiter"><xsl:if test="normalize-space(concat($TitlePrefixPhrase,$BaseTitlePhrase))"><xsl:value-of select="$TitleDelimiter"/></xsl:if></xsl:variable><div class="MaxWidth DataContent RptDetail"><xsl:variable name="OutStdContainerValues"><xsl:call-template name="LeafContainerPrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="LeafContainerId" select="concat($RootIdPrefix,'Header')"/><xsl:with-param name="LeafContainerHeader" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase,$HeaderDelimiter))"/><xsl:with-param name="ShowContainerHeader" select="$ShowSectionHeader"/><xsl:with-param name="TitleType" select="$TitleType"/><xsl:with-param name="LeafContainerTitle" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase))"/><xsl:with-param name="ShowAttribValues" select="$ShowSectionAttribValues"/><xsl:with-param name="AttribTitle" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase))"/><xsl:with-param name="LeafContainerElement" select="$Employments"/></xsl:call-template></xsl:variable><xsl:if test="string-length(normalize-space($OutStdContainerValues))"><xsl:copy-of select="$OutStdContainerValues"/><xsl:value-of select="' '"/></xsl:if></div><xsl:if test="normalize-space($Employments/Employment/@Type) or not(($Employments/@DoNotKnow='True') or ($Employments/@NotApplicable='True'))"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:for-each select="$Employments/Employment"><xsl:call-template name="EmploymentHeaderPrint"><xsl:with-param name="SubsectionId" select="position()"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,$RootIdPrefix,position(),'_')"/><xsl:with-param name="Employment" select="."/><xsl:with-param name="ShowSeperator" select="number(position()!=1)"/><xsl:with-param name="TitlePrefixPhrase" select="$TitlePrefixPhrase"/><xsl:with-param name="BaseTitlePhrase" select="$BaseTitlePhrase"/><xsl:with-param name="ShowSubsectionId" select="$ShowSubsectionIds"/></xsl:call-template></xsl:for-each></tbody></table></xsl:if></xsl:template><xsl:template name="EmploymentHeaderPrint"><xsl:param name="SubsectionId"/><xsl:param name="IdPrefix"/><xsl:param name="Employment"/><xsl:param name="ShowSeperator"/><xsl:param name="TitlePrefixPhrase"/><xsl:param name="BaseTitlePhrase"/><xsl:param name="ShowSubsectionId"/><xsl:call-template name="SubsectionTabularWrapperPrint"><xsl:with-param name="SubsectionId" select="concat(substring('   ',1,4 - (2 * string-length($SubsectionId))),'#',$SubsectionId)"/><xsl:with-param name="ShowSubsectionId" select="'Y'"/><xsl:with-param name="ShowSeperatorNFlag" select="$ShowSeperator"/><xsl:with-param name="SubsectionFormatClassList"/><xsl:with-param name="WrapperDataContent"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:call-template name="SubsectionTabularWrapperPrint"><xsl:with-param name="SubsectionId" select="'a.'"/><xsl:with-param name="ShowSubsectionId" select="$ShowSubsectionId"/><xsl:with-param name="ShowSeperatorNFlag" select="number(false())"/><xsl:with-param name="WrapperDataContent"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:call-template name="EmploymentInfoPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'a','_')"/><xsl:with-param name="Employment" select="$Employment"/><xsl:with-param name="SubsectionTitle" select="concat($TitlePrefixPhrase,' ',$BaseTitlePhrase, ' Employment')"/></xsl:call-template></tbody></table></xsl:with-param></xsl:call-template><xsl:if test="count($Employment/CivilEmployment)"><xsl:call-template name="SubsectionTabularWrapperPrint"><xsl:with-param name="SubsectionId" select="'b.'"/><xsl:with-param name="ShowSubsectionId" select="$ShowSubsectionId"/><xsl:with-param name="ShowSeperatorNFlag" select="number(false())"/><xsl:with-param name="WrapperDataContent"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:call-template name="CivilEmploymentPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Civil_Employment','_')"/><xsl:with-param name="Employment" select="$Employment"/><xsl:with-param name="SubsectionHeader" select="''"/><xsl:with-param name="SubsectionTitle" select="''"/></xsl:call-template></tbody></table></xsl:with-param></xsl:call-template></xsl:if><xsl:if test="count($Employment/MilitaryService)"><xsl:call-template name="SubsectionTabularWrapperPrint"><xsl:with-param name="SubsectionId" select="'c.'"/><xsl:with-param name="ShowSubsectionId" select="$ShowSubsectionId"/><xsl:with-param name="ShowSeperatorNFlag" select="number(false())"/><xsl:with-param name="WrapperDataContent"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:call-template name="MilitaryServicePrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Military_Service','_')"/><xsl:with-param name="Employment" select="$Employment"/><xsl:with-param name="SubsectionHeader" select="''"/><xsl:with-param name="SubsectionTitle" select="''"/></xsl:call-template></tbody></table></xsl:with-param></xsl:call-template></xsl:if><xsl:if test="count($Employment/SelfEmployment)"><xsl:call-template name="SubsectionTabularWrapperPrint"><xsl:with-param name="SubsectionId" select="'d.'"/><xsl:with-param name="ShowSubsectionId" select="$ShowSubsectionId"/><xsl:with-param name="ShowSeperatorNFlag" select="number(false())"/><xsl:with-param name="WrapperDataContent"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:call-template name="SelfEmploymentPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Self-Employment','_')"/><xsl:with-param name="Employment" select="$Employment"/><xsl:with-param name="SubsectionHeader" select="''"/><xsl:with-param name="SubsectionTitle" select="''"/></xsl:call-template></tbody></table></xsl:with-param></xsl:call-template></xsl:if><xsl:if test="count($Employment/Unemployment)"><xsl:call-template name="SubsectionTabularWrapperPrint"><xsl:with-param name="SubsectionId" select="'e.'"/><xsl:with-param name="ShowSubsectionId" select="$ShowSubsectionId"/><xsl:with-param name="ShowSeperatorNFlag" select="number(false())"/><xsl:with-param name="WrapperDataContent"><xsl:call-template name="DataIndentWrapperPrint"><xsl:with-param name="WrapperDataContent"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:call-template name="TabularTimeFramePrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="FromDate" select="$Employment/FromDate/Date"/><xsl:with-param name="ToDate" select="$Employment/ToDate/Date"/><xsl:with-param name="Precision" select="'month'"/></xsl:call-template><xsl:text/></tbody></table></xsl:with-param></xsl:call-template><xsl:text/><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:call-template name="UnemploymentPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Unemployment','_')"/><xsl:with-param name="Employment" select="$Employment"/><xsl:with-param name="SubsectionHeader" select="''"/><xsl:with-param name="SubsectionTitle" select="''"/></xsl:call-template></tbody></table></xsl:with-param></xsl:call-template></xsl:if><xsl:variable name="PreviousEmployments" select="$Employment/PreviousEmployments"/><xsl:if test="(not(count($Employment/Unemployment)) or normalize-space($PreviousEmployments/PreviousEmployment))       and count($PreviousEmployments/PreviousEmployment)"><xsl:call-template name="SubsectionTabularWrapperPrint"><xsl:with-param name="SubsectionId" select="'x.'"/><xsl:with-param name="ShowSubsectionId" select="'N'"/><xsl:with-param name="ShowSeperatorNFlag" select="number(true())"/><xsl:with-param name="WrapperDataContent"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:call-template name="SubsectionTitleAndStatusTabularWrapperPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'x_')"/><xsl:with-param name="SubsectionHeader" select="'Previous Employment'"/><xsl:with-param name="ContainerElement" select="$PreviousEmployments"/><xsl:with-param name="WrapperDataContent"><xsl:call-template name="DataIndentWrapperPrint"><xsl:with-param name="WrapperDataContent"><xsl:if test="normalize-space($PreviousEmployments/PreviousEmployment) or not(($PreviousEmployments/@DoNotKnow='True') or ($PreviousEmployments/@NotApplicable='True'))"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:for-each select="$PreviousEmployments/PreviousEmployment"><xsl:call-template name="PreviousEmploymentsEntryPrint"><xsl:with-param name="SubsectionId" select="position()"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'x_',position(),'_')"/><xsl:with-param name="PreviousEmployment" select="."/><xsl:with-param name="ShowSeperator" select="number(position()!=1)"/><xsl:with-param name="TitlePrefixPhrase" select="$TitlePrefixPhrase"/><xsl:with-param name="BaseTitlePhrase" select="$BaseTitlePhrase"/><xsl:with-param name="ShowSubsectionId" select="$ShowSubsectionId"/></xsl:call-template></xsl:for-each></tbody></table><xsl:text/></xsl:if></xsl:with-param></xsl:call-template><xsl:text/></xsl:with-param></xsl:call-template><xsl:text/></tbody></table><xsl:text/></xsl:with-param></xsl:call-template><xsl:text/></xsl:if><xsl:call-template name="SubsectionTabularWrapperPrint"><xsl:with-param name="SubsectionId" select="'f.'"/><xsl:with-param name="ShowSubsectionId" select="$ShowSubsectionId"/><xsl:with-param name="ShowSeperatorNFlag" select="number(true())"/><xsl:with-param name="WrapperDataContent"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:call-template name="TabularCommentsPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'f','_')"/><xsl:with-param name="Comment" select="$Employment/Comment"/><xsl:with-param name="TitlePrefixPhrase" select="''"/><xsl:with-param name="BaseTitlePhrase" select="'Additional Comments'"/></xsl:call-template><xsl:text/></tbody></table><xsl:text/></xsl:with-param></xsl:call-template><xsl:text/></tbody></table><xsl:text/></xsl:with-param></xsl:call-template><xsl:text/></xsl:template><xsl:template name="EmploymentInfoPrint"><xsl:param name="IdPrefix"/><xsl:param name="Employment"/><xsl:param name="SubsectionTitle"/><xsl:variable name="EmploymentType" select="$EmploymentTypes/EmploymentTypes/EmploymentType[@Code=$Employment/@Type]"/><xsl:variable name="EmploymentKeyType" select="$EmploymentTypes/EmploymentTypes/EmploymentType[@Code=$Employment/@Type]/@KeyCode"/><xsl:variable name="EmploymentTypeHeader"><xsl:choose><xsl:when test="string-length(normalize-space($EmploymentType))"><xsl:attribute name="id"><xsl:value-of select="concat($IdPrefix,'Employment_Type')"/></xsl:attribute><xsl:attribute name="title"><xsl:value-of select="'Employment Type'"/></xsl:attribute><xsl:value-of select="normalize-space($EmploymentType)"/><xsl:value-of select="' ('"/><xsl:call-template name="LeafFieldPrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="FieldNameId" select="concat($IdPrefix,'Employment_Type_Key_Code')"/><xsl:with-param name="FieldNameTitle" select="'Employment Type Code'"/><xsl:with-param name="FieldElement" select="$EmploymentKeyType"/><xsl:with-param name="ShowAttribValues" select="'N'"/><xsl:with-param name="ShowContentValue" select="'Y'"/></xsl:call-template><xsl:value-of select="') '"/></xsl:when><xsl:when test="not(string-length(normalize-space($Employment/@Type)))"><xsl:attribute name="title"><xsl:value-of select="'Employment Period'"/></xsl:attribute><xsl:value-of select="'Employment Type Code'"/></xsl:when><xsl:otherwise><xsl:call-template name="LeafContainerPrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="LeafContainerId" select="'Employment_Type'"/><xsl:with-param name="LeafContainerTitle" select="'Employment Type'"/><xsl:with-param name="LeafContainerHeader" select="$Employment/@Type"/><xsl:with-param name="TitleType" select="'Subsection'"/><xsl:with-param name="ShowAsUnexpectedValue" select="'Y'"/><xsl:with-param name="ShowAttribValues" select="'N'"/></xsl:call-template></xsl:otherwise></xsl:choose></xsl:variable><xsl:call-template name="SubsectionTitleAndStatusTabularWrapperPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Employment_')"/><xsl:with-param name="ContainerElement" select="$Employment"/><xsl:with-param name="WrapperHeaderContent"><xsl:copy-of select="$EmploymentTypeHeader"/><xsl:if test="(($Employment/@DoNotKnow='True') or ($Employment/@NotApplicable='True'))"><xsl:value-of select="' '"/><xsl:call-template name="LeafContainerPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'_')"/><xsl:with-param name="LeafContainerId" select="concat($IdPrefix,'Employment_Type_Header')"/><xsl:with-param name="ShowContainerHeader" select="'N'"/><xsl:with-param name="AttribTitle" select="'Employment Type Status'"/><xsl:with-param name="LeafContainerElement" select="$Employment"/></xsl:call-template><xsl:value-of select="' '"/></xsl:if></xsl:with-param><xsl:with-param name="WrapperDataContent"><xsl:if test="not(normalize-space($EmploymentType)) and normalize-space($Employment/@Type)"><xsl:call-template name="DataIndentWrapperPrint"><xsl:with-param name="WrapperDataContent"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:call-template name="TabularTimeFramePrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="FromDate" select="$Employment/FromDate/Date"/><xsl:with-param name="ToDate" select="$Employment/ToDate/Date"/><xsl:with-param name="Precision" select="'month'"/></xsl:call-template><xsl:text/></tbody></table></xsl:with-param></xsl:call-template><xsl:text/></xsl:if></xsl:with-param></xsl:call-template></xsl:template><xsl:template name="CivilEmploymentPrint"><xsl:param name="IdPrefix"/><xsl:param name="Employment"/><xsl:param name="SubsectionHeader"/><xsl:param name="SubsectionTitle"/><xsl:call-template name="LocationInfoTabularWrapperPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Employer_Location','_')"/><xsl:with-param name="Location" select="$Employment/CivilEmployment/EmployersLocation"/><xsl:with-param name="SubsectionHeader" select="normalize-space($SubsectionHeader)"/><xsl:with-param name="SubsectionTitle" select="normalize-space($SubsectionTitle)"/><xsl:with-param name="WrapperDataContent"><xsl:call-template name="TabularTimeFramePrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="FromDate" select="$Employment/FromDate/Date"/><xsl:with-param name="ToDate" select="$Employment/ToDate/Date"/><xsl:with-param name="Precision" select="'month'"/></xsl:call-template><xsl:text/><xsl:call-template name="TitledLeafFieldTabularPrint"><xsl:with-param name="FieldNameHeader" select="&quot;Position's Title&quot;"/><xsl:with-param name="FieldNameTitle" select="&quot;Position's Title&quot;"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Position_Title_')"/><xsl:with-param name="FieldElement" select="$Employment/CivilEmployment/PositionTitle"/></xsl:call-template><xsl:text/><xsl:call-template name="TitledLeafFieldTabularPrint"><xsl:with-param name="FieldNameHeader" select="'Name'"/><xsl:with-param name="FieldNameTitle" select="'Name'"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Employer_')"/><xsl:with-param name="FieldElement" select="$Employment/CivilEmployment/Employer"/></xsl:call-template><xsl:text/></xsl:with-param></xsl:call-template><xsl:call-template name="LocationInfoTabularWrapperPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Job_Location','_')"/><xsl:with-param name="Location" select="$Employment/CivilEmployment/JobLocation"/><xsl:with-param name="SubsectionHeader" select="normalize-space(concat($SubsectionHeader,' Job Location'))"/><xsl:with-param name="SubsectionTitle" select="normalize-space(concat($SubsectionTitle,' Job Location'))"/><xsl:with-param name="ShowSeperatorNFlag" select="number(true())"/></xsl:call-template><xsl:call-template name="ContactInfoPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Supervisor','_')"/><xsl:with-param name="Verifier" select="$Employment/CivilEmployment/Supervisor"/><xsl:with-param name="SubsectionHeader" select="normalize-space(concat($SubsectionHeader, ' Supervisor'))"/><xsl:with-param name="SubsectionTitle" select="normalize-space(concat($SubsectionTitle, ' Supervisor'))"/><xsl:with-param name="ShowSeperatorNFlag" select="number(true())"/></xsl:call-template></xsl:template><xsl:template name="MilitaryServicePrint"><xsl:param name="IdPrefix"/><xsl:param name="Employment"/><xsl:param name="SubsectionHeader"/><xsl:param name="SubsectionTitle"/><xsl:call-template name="LocationInfoTabularWrapperPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Duty_Station','_')"/><xsl:with-param name="Location" select="$Employment/MilitaryService/DutyStation"/><xsl:with-param name="SubsectionHeader" select="normalize-space($SubsectionHeader)"/><xsl:with-param name="SubsectionTitle" select="normalize-space($SubsectionTitle)"/><xsl:with-param name="WrapperDataContent"><xsl:call-template name="TabularTimeFramePrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="FromDate" select="$Employment/FromDate/Date"/><xsl:with-param name="ToDate" select="$Employment/ToDate/Date"/><xsl:with-param name="Precision" select="'month'"/></xsl:call-template><xsl:text/><xsl:call-template name="TitledLeafFieldTabularPrint"><xsl:with-param name="FieldNameHeader" select="'Service Branch'"/><xsl:with-param name="FieldNameTitle" select="'Service Branch'"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Branch_')"/><xsl:with-param name="FieldElement" select="$Employment/MilitaryService/Branch"/></xsl:call-template><xsl:text/><xsl:call-template name="TitledLeafFieldTabularPrint"><xsl:with-param name="FieldNameHeader" select="'Rank'"/><xsl:with-param name="FieldNameTitle" select="'Rank'"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Rank_')"/><xsl:with-param name="FieldElement" select="$Employment/MilitaryService/Rank"/></xsl:call-template><xsl:text/><xsl:call-template name="TitledLeafFieldTabularPrint"><xsl:with-param name="FieldNameHeader" select="'Duty Location'"/><xsl:with-param name="FieldNameTitle" select="'Duty Location'"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Duty_Location_')"/><xsl:with-param name="FieldElement" select="$Employment/MilitaryService/DutyStation/DutyLocation"/></xsl:call-template><xsl:text/></xsl:with-param></xsl:call-template><xsl:call-template name="LocationInfoTabularWrapperPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Job_Location','_')"/><xsl:with-param name="Location" select="$Employment/MilitaryService/JobLocation"/><xsl:with-param name="SubsectionHeader" select="normalize-space(concat($SubsectionHeader,' Job Location'))"/><xsl:with-param name="SubsectionTitle" select="normalize-space(concat($SubsectionTitle,' Job Location'))"/><xsl:with-param name="ShowSeperatorNFlag" select="number(true())"/></xsl:call-template><xsl:call-template name="ContactInfoPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Supervisor','_')"/><xsl:with-param name="Verifier" select="$Employment/MilitaryService/Supervisor"/><xsl:with-param name="SubsectionHeader" select="normalize-space(concat($SubsectionHeader, ' Supervisor'))"/><xsl:with-param name="SubsectionTitle" select="normalize-space(concat($SubsectionTitle, ' Supervisor'))"/><xsl:with-param name="ShowSeperatorNFlag" select="number(true())"/></xsl:call-template></xsl:template><xsl:template name="SelfEmploymentPrint"><xsl:param name="IdPrefix"/><xsl:param name="Employment"/><xsl:param name="SubsectionHeader"/><xsl:param name="SubsectionTitle"/><xsl:call-template name="LocationInfoTabularWrapperPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Location','_')"/><xsl:with-param name="Location" select="$Employment/SelfEmployment/Business"/><xsl:with-param name="SubsectionHeader" select="normalize-space($SubsectionHeader)"/><xsl:with-param name="SubsectionTitle" select="normalize-space($SubsectionTitle)"/><xsl:with-param name="WrapperDataContent"><xsl:call-template name="TabularTimeFramePrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="FromDate" select="$Employment/FromDate/Date"/><xsl:with-param name="ToDate" select="$Employment/ToDate/Date"/><xsl:with-param name="Precision" select="'month'"/></xsl:call-template><xsl:text/><xsl:call-template name="TitledLeafFieldTabularPrint"><xsl:with-param name="FieldNameHeader" select="'Occupation'"/><xsl:with-param name="FieldNameTitle" select="'Occupation'"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Occupation_')"/><xsl:with-param name="FieldElement" select="$Employment/SelfEmployment/Occupation"/></xsl:call-template><xsl:text/><xsl:call-template name="TitledLeafFieldTabularPrint"><xsl:with-param name="FieldNameHeader" select="normalize-space(concat($SubsectionTitle,' Business Name'))"/><xsl:with-param name="FieldNameTitle" select="normalize-space(concat($SubsectionTitle,' Business Name'))"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Name_')"/><xsl:with-param name="FieldElement" select="$Employment/SelfEmployment/Business/Name"/></xsl:call-template><xsl:text/></xsl:with-param></xsl:call-template><xsl:call-template name="ContactInfoPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Verifier','_')"/><xsl:with-param name="Verifier" select="$Employment/SelfEmployment/Verifier"/><xsl:with-param name="SubsectionHeader" select="normalize-space(concat($SubsectionHeader, ' Verifier'))"/><xsl:with-param name="SubsectionTitle" select="normalize-space(concat($SubsectionTitle, ' Verifier'))"/><xsl:with-param name="ShowSeperatorNFlag" select="number(true())"/></xsl:call-template></xsl:template><xsl:template name="UnemploymentPrint"><xsl:param name="IdPrefix"/><xsl:param name="Employment"/><xsl:param name="SubsectionHeader"/><xsl:param name="SubsectionTitle"/><xsl:call-template name="ContactInfoPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Verifier','_')"/><xsl:with-param name="Verifier" select="$Employment/Unemployment/Verifier"/><xsl:with-param name="SubsectionHeader" select="normalize-space(concat($SubsectionHeader, ' Verifier'))"/><xsl:with-param name="SubsectionTitle" select="normalize-space(concat($SubsectionTitle, ' Verifier'))"/><xsl:with-param name="ShowSeperatorNFlag" select="number(true())"/></xsl:call-template></xsl:template><xsl:template name="LocationInfoTabularWrapperPrint"><xsl:param name="IdPrefix"/><xsl:param name="Location"/><xsl:param name="SubsectionHeader"/><xsl:param name="SubsectionTitle"/><xsl:param name="ShowSeperatorNFlag" select="number(false())"/><xsl:param name="WrapperHeaderContent"/><xsl:param name="WrapperDataContent"/><xsl:param name="AllowAddress" select="'Y'"/><xsl:param name="AllowTelephoneDevice" select="'Y'"/><xsl:call-template name="SubsectionTitleAndStatusTabularWrapperPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Location_')"/><xsl:with-param name="ContainerElement" select="$Location"/><xsl:with-param name="SubsectionHeader" select="$SubsectionHeader"/><xsl:with-param name="ShowSeperatorNFlag" select="$ShowSeperatorNFlag"/><xsl:with-param name="MustShowWrapperNFlag" select="number(true())"/><xsl:with-param name="WrapperHeaderContent"><xsl:copy-of select="$WrapperHeaderContent"/></xsl:with-param><xsl:with-param name="SubsectionTitle" select="$SubsectionTitle"/><xsl:with-param name="WrapperDataContent"><xsl:call-template name="DataIndentWrapperPrint"><xsl:with-param name="WrapperDataContent"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:if test="$WrapperDataContent"><xsl:copy-of select="$WrapperDataContent"/></xsl:if><xsl:value-of select="' '"/><xsl:if test="$AllowAddress='Y'"><xsl:call-template name="AddressTabularPrint"><xsl:with-param name="TitlePrefixPhrase"/><xsl:with-param name="BaseTitlePhrase" select="'Address'"/><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="Address" select="$Location/Address"/><xsl:with-param name="AllowDirections" select="'N'"/></xsl:call-template><xsl:text/></xsl:if><xsl:if test="$AllowTelephoneDevice='Y'"><xsl:call-template name="TelephoneDeviceTabularPrint"><xsl:with-param name="TitlePrefixPhrase" select="''"/><xsl:with-param name="BaseTitlePhrase" select="'Phone'"/><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="TelephoneDevice" select="$Location/Telephone"/><xsl:with-param name="ShowSectionHeader" select="'N'"/></xsl:call-template><xsl:text/></xsl:if></tbody></table></xsl:with-param></xsl:call-template><xsl:text/></xsl:with-param></xsl:call-template></xsl:template><xsl:template name="PreviousEmploymentsEntryPrint"><xsl:param name="SubsectionId"/><xsl:param name="IdPrefix"/><xsl:param name="PreviousEmployment"/><xsl:param name="ShowSeperator"/><xsl:param name="TitlePrefixPhrase"/><xsl:param name="BaseTitlePhrase"/><xsl:param name="ShowSubsectionId"/><xsl:call-template name="SubsectionTabularWrapperPrint"><xsl:with-param name="SubsectionId" select="concat(substring('   ',1,4 - (2 * string-length($SubsectionId))),'#',$SubsectionId)"/><xsl:with-param name="ShowSubsectionId" select="'Y'"/><xsl:with-param name="ShowSeperatorNFlag" select="$ShowSeperator"/><xsl:with-param name="SubsectionFormatClassList"/><xsl:with-param name="WrapperDataContent"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:call-template name="SubsectionTabularWrapperPrint"><xsl:with-param name="SubsectionId" select="'a.'"/><xsl:with-param name="ShowSubsectionId" select="$ShowSubsectionId"/><xsl:with-param name="ShowSeperatorNFlag" select="number(false())"/><xsl:with-param name="WrapperDataContent"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:call-template name="PreviousEmploymentInfoPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'a','_')"/><xsl:with-param name="PreviousEmployment" select="$PreviousEmployment"/><xsl:with-param name="SubsectionTitle" select="concat($TitlePrefixPhrase,' ',$BaseTitlePhrase, ' Previous Employment')"/></xsl:call-template></tbody></table></xsl:with-param></xsl:call-template></tbody></table></xsl:with-param></xsl:call-template></xsl:template><xsl:template name="PreviousEmploymentInfoPrint"><xsl:param name="IdPrefix"/><xsl:param name="PreviousEmployment"/><xsl:param name="SubsectionTitle"/><xsl:call-template name="TabularTimeFramePrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="FromDate" select="$PreviousEmployment/FromDate/Date"/><xsl:with-param name="ToDate" select="$PreviousEmployment/ToDate/Date"/><xsl:with-param name="Precision" select="'month'"/></xsl:call-template><xsl:text/><xsl:call-template name="TitledLeafFieldTabularPrint"><xsl:with-param name="FieldNameHeader" select="'Position Title'"/><xsl:with-param name="FieldNameTitle" select="'Position Title'"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Position_Title_')"/><xsl:with-param name="FieldElement" select="$PreviousEmployment/PositionTitle"/></xsl:call-template><xsl:text/><xsl:call-template name="TitledLeafFieldTabularPrint"><xsl:with-param name="FieldNameHeader" select="'Supervisor'"/><xsl:with-param name="FieldNameTitle" select="'Supervisor'"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Supervisor_')"/><xsl:with-param name="FieldElement" select="$PreviousEmployment/Supervisor"/></xsl:call-template><xsl:text/></xsl:template></xsl:stylesheet>