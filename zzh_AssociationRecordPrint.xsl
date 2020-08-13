<?xml version="1.0" encoding="utf-8" standalone="no"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xt="http://www.jclark.com/xt"><xsl:strip-space elements="*"/><xsl:variable name="AssociationRecordQuestions" select="document('AssociationRecordQuestionTable.xml')"/><xsl:template name="AssociationRecordPrint"><xsl:param name="TitleType" select="'Field'"/><xsl:param name="TitlePrefixPhrase"/><xsl:param name="BaseTitlePhrase"/><xsl:param name="IdPrefix"/><xsl:param name="AssociationRecord"/><xsl:param name="RootIdPrefix" select="'Section_'"/><xsl:param name="ShowSectionHeader" select="'Y'"/><xsl:param name="ShowSectionAttribValues" select="'N'"/><xsl:param name="ShowSubsectionIds" select="'N'"/><xsl:param name="TitleDelimiter" select="':'"/><xsl:variable name="HeaderDelimiter"><xsl:if test="normalize-space(concat($TitlePrefixPhrase,$BaseTitlePhrase))"><xsl:value-of select="$TitleDelimiter"/></xsl:if></xsl:variable><div class="MaxWidth DataContent RptDetail"><xsl:variable name="OutStdContainerValues"><xsl:call-template name="LeafContainerPrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="LeafContainerId" select="concat($RootIdPrefix,'Header')"/><xsl:with-param name="LeafContainerHeader" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase,$HeaderDelimiter))"/><xsl:with-param name="ShowContainerHeader" select="$ShowSectionHeader"/><xsl:with-param name="TitleType" select="$TitleType"/><xsl:with-param name="LeafContainerTitle" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase))"/><xsl:with-param name="ShowAttribValues" select="$ShowSectionAttribValues"/><xsl:with-param name="AttribTitle" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase))"/><xsl:with-param name="LeafContainerElement" select="$AssociationRecord"/></xsl:call-template></xsl:variable><xsl:if test="string-length(normalize-space($OutStdContainerValues))"><xsl:copy-of select="$OutStdContainerValues"/><xsl:value-of select="' '"/></xsl:if></div><xsl:text/><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:call-template name="SubsectionTabularWrapperPrint"><xsl:with-param name="SubsectionId" select="'A.'"/><xsl:with-param name="ShowSubsectionId" select="'N'"/><xsl:with-param name="ShowSeperatorNFlag" select="number(false())"/><xsl:with-param name="WrapperDataContent"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:call-template name="SubsectionTitleAndStatusTabularWrapperPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'A_')"/><xsl:with-param name="SubsectionHeader" select="'Questions'"/><xsl:with-param name="ContainerElement" select="$AssociationRecord"/><xsl:with-param name="MustShowWrapperNFlag" select="number(true())"/><xsl:with-param name="WrapperDataContent"><xsl:call-template name="DataIndentWrapperPrint"><xsl:with-param name="WrapperDataContent"><xsl:variable name="QuestionEntryTitle" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase,' Question'))"/><xsl:variable name="AssociationRecordQuestionsLookUpPath" select="$AssociationRecordQuestions/AssociationRecordQuestions/Question"/><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:call-template name="QuestionTabularPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'A_')"/><xsl:with-param name="QuestionEntryTagName" select="'RadicalOrganization'"/><xsl:with-param name="QuestionEntryLookUpValue" select="$AssociationRecordQuestionsLookUpPath[@Code='RadicalOrganization']"/><xsl:with-param name="QuestionEntryTitle" select="$QuestionEntryTitle"/><xsl:with-param name="QuestionDataElement" select="$AssociationRecord/RadicalOrganization"/><xsl:with-param name="QuestionId" select="'a'"/><xsl:with-param name="AllowComment" select="'Y'"/><xsl:with-param name="ShowQuestionId" select="'Y'"/><xsl:with-param name="ShowSeperatorNFlag" select="number(false())"/></xsl:call-template><xsl:call-template name="QuestionTabularPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'A_')"/><xsl:with-param name="QuestionEntryTagName" select="'RadicalActivity'"/><xsl:with-param name="QuestionEntryLookUpValue" select="$AssociationRecordQuestionsLookUpPath[@Code='RadicalActivity']"/><xsl:with-param name="QuestionEntryTitle" select="$QuestionEntryTitle"/><xsl:with-param name="QuestionDataElement" select="$AssociationRecord/RadicalActivity"/><xsl:with-param name="QuestionId" select="'b'"/><xsl:with-param name="AllowComment" select="'Y'"/><xsl:with-param name="ShowQuestionId" select="'Y'"/><xsl:with-param name="ShowSeperatorNFlag" select="number(true())"/></xsl:call-template></tbody></table><xsl:text/></xsl:with-param></xsl:call-template><xsl:text/></xsl:with-param></xsl:call-template><xsl:text/></tbody></table><xsl:text/></xsl:with-param></xsl:call-template><xsl:if test="normalize-space($AssociationRecord//Answer[.='Yes'])"><xsl:call-template name="SubsectionTabularWrapperPrint"><xsl:with-param name="SubsectionId" select="'B.'"/><xsl:with-param name="ShowSubsectionId" select="'N'"/><xsl:with-param name="ShowSeperatorNFlag" select="number(true())"/><xsl:with-param name="WrapperDataContent"><table cellpadding="0" cellspacing="0" class="MaxWidth RptDetail"><tbody><xsl:call-template name="TitledLeafFieldTabularPrint"><xsl:with-param name="FieldNameHeader" select="'Explanation'"/><xsl:with-param name="FieldNameTitle" select="'Explanation'"/><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'B_','Explanation_')"/><xsl:with-param name="FieldElement" select="$AssociationRecord/Explanation"/></xsl:call-template><xsl:text/></tbody></table><xsl:text/></xsl:with-param></xsl:call-template><xsl:text/></xsl:if></tbody></table></xsl:template></xsl:stylesheet>