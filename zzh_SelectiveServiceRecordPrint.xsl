<?xml version="1.0" encoding="utf-8" standalone="no"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:strip-space elements="*"/><xsl:variable name="SelectiveServiceRecordQuestions" select="document('SelectiveServiceRecordQuestionTable.xml')"/><xsl:template name="SelectiveServiceRecordPrint"><xsl:param name="TitleType" select="'Field'"/><xsl:param name="TitlePrefixPhrase"/><xsl:param name="BaseTitlePhrase"/><xsl:param name="IdPrefix"/><xsl:param name="SelectiveServiceRecord"/><xsl:param name="RootIdPrefix" select="'Section_'"/><xsl:param name="ShowSectionHeader" select="'Y'"/><xsl:param name="ShowSectionAttribValues" select="'N'"/><xsl:param name="ShowSubsectionIds" select="'N'"/><xsl:param name="TitleDelimiter" select="':'"/><xsl:variable name="HeaderDelimiter"><xsl:if test="normalize-space(concat($TitlePrefixPhrase,$BaseTitlePhrase))"><xsl:value-of select="$TitleDelimiter"/></xsl:if></xsl:variable><div class="MaxWidth DataContent RptDetail"><xsl:variable name="OutStdContainerValues"><xsl:call-template name="LeafContainerPrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="LeafContainerId" select="concat($RootIdPrefix,'Header')"/><xsl:with-param name="LeafContainerHeader" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase,$HeaderDelimiter))"/><xsl:with-param name="ShowContainerHeader" select="$ShowSectionHeader"/><xsl:with-param name="TitleType" select="$TitleType"/><xsl:with-param name="LeafContainerTitle" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase))"/><xsl:with-param name="ShowAttribValues" select="$ShowSectionAttribValues"/><xsl:with-param name="AttribTitle" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase))"/><xsl:with-param name="LeafContainerElement" select="$SelectiveServiceRecord"/></xsl:call-template></xsl:variable><xsl:if test="string-length(normalize-space($OutStdContainerValues))"><xsl:copy-of select="$OutStdContainerValues"/><xsl:value-of select="' '"/></xsl:if></div><xsl:text/><xsl:variable name="QuestionEntryTitle" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase,' Question'))"/><xsl:variable name="SelectiveServiceRecordQuestionsLookUpPath" select="$SelectiveServiceRecordQuestions/SelectiveServiceRecordQuestions/Question"/><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:call-template name="QuestionTabularPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'A_')"/><xsl:with-param name="QuestionEntryTagName" select="'RegistrationRequired'"/><xsl:with-param name="QuestionEntryLookUpValue" select="$SelectiveServiceRecordQuestionsLookUpPath[@Code='RegistrationRequired']"/><xsl:with-param name="QuestionEntryTitle" select="$QuestionEntryTitle"/><xsl:with-param name="QuestionDataElement" select="$SelectiveServiceRecord/RegistrationRequired"/><xsl:with-param name="QuestionId" select="'a'"/><xsl:with-param name="AllowComment" select="'Y'"/><xsl:with-param name="ShowQuestionId" select="'Y'"/><xsl:with-param name="ShowSeperatorNFlag" select="number(false())"/></xsl:call-template><xsl:text/><xsl:if test="not(normalize-space($SelectiveServiceRecord/RegistrationRequired/Answer))              or normalize-space($SelectiveServiceRecord/RegistrationRequired/Answer)='Yes'             or normalize-space($SelectiveServiceRecord/RegistrationRequired/Registered)"><xsl:call-template name="QuestionTabularPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'A_')"/><xsl:with-param name="QuestionEntryTagName" select="'Registered'"/><xsl:with-param name="QuestionEntryLookUpValue" select="$SelectiveServiceRecordQuestionsLookUpPath[@Code='Registered']"/><xsl:with-param name="QuestionEntryTitle" select="$QuestionEntryTitle"/><xsl:with-param name="QuestionDataElement" select="$SelectiveServiceRecord/RegistrationRequired/Registered"/><xsl:with-param name="QuestionId" select="'b'"/><xsl:with-param name="AllowComment" select="'Y'"/><xsl:with-param name="ShowQuestionId" select="'Y'"/><xsl:with-param name="ShowSeperatorNFlag" select="number(true())"/><xsl:with-param name="WrapperDataRowContent"><xsl:call-template name="RegisteredInfoPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'A','_','b','_')"/><xsl:with-param name="Registered" select="$SelectiveServiceRecord/RegistrationRequired/Registered"/><xsl:with-param name="SubsectionTitle" select="concat($TitlePrefixPhrase,' ',$BaseTitlePhrase, ' Registered')"/></xsl:call-template><xsl:text/></xsl:with-param></xsl:call-template><xsl:text/></xsl:if></tbody></table><xsl:text/></xsl:template><xsl:template name="RegisteredInfoPrint"><xsl:param name="IdPrefix"/><xsl:param name="Registered"/><xsl:param name="SubsectionTitle"/><xsl:if test="not(normalize-space($Registered/Answer)) or normalize-space($Registered/Answer)='Yes'    or normalize-space($Registered/RegistrationNumber)"><xsl:call-template name="TitledLeafFieldTabularPrint"><xsl:with-param name="FieldNameHeader" select="'Registration Number'"/><xsl:with-param name="FieldNameTitle" select="'Registration Number'"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Registration_Number_')"/><xsl:with-param name="FieldElement" select="$Registered/RegistrationNumber"/></xsl:call-template><xsl:text/></xsl:if><xsl:if test="not(normalize-space($Registered/Answer)) or normalize-space($Registered/Answer)='No'    or normalize-space($Registered/Explanation)"><xsl:call-template name="TitledLeafFieldTabularPrint"><xsl:with-param name="FieldNameHeader" select="'Legal Exemption Explanation'"/><xsl:with-param name="FieldNameTitle" select="'Legal Exemption Explanation'"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'Legal_Exemption_Explanation_')"/><xsl:with-param name="FieldElement" select="$Registered/Explanation"/></xsl:call-template><xsl:text/></xsl:if></xsl:template></xsl:stylesheet>