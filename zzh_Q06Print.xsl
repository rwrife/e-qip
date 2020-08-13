<?xml version="1.0" encoding="utf-8" standalone="no"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:template name="Q06Print" match="Question[@QuestionTag='OtherIdInfo']"><xsl:variable name="SectionHeader"><xsl:choose><xsl:when test="normalize-space(./Name)"><xsl:copy-of select="./Name/node()"/></xsl:when><xsl:otherwise><xsl:value-of select="./@QuestionTag"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="Container4SectionPresentNFlag" select="number(count(./QuestionData) and count(./QuestionData/OtherIdentifyingInformation))"/><xsl:variable name="BaseTitlePhrase" select="'Other Identifying Information'"/><xsl:variable name="IdPrefix" select="concat(@QuestionTag,'_')"/><table cellpadding="0" cellspacing="0" class="MaxWidth Section Report"><tbody><xsl:call-template name="SectionTabularWrapperPrint"><xsl:with-param name="IdPrefix" select="concat(@QuestionTag,'_')"/><xsl:with-param name="SectionHeader" select="$SectionHeader"/><xsl:with-param name="SectionTitle" select="$SectionHeader"/><xsl:with-param name="ShowSeperatorNFlag" select="number(false())"/><xsl:with-param name="WrapperHeaderStatusContent"><xsl:if test="number($Container4SectionPresentNFlag)        and ((./QuestionData/OtherIdentifyingInformation/@DoNotKnow='True') or (./QuestionData/OtherIdentifyingInformation/@NotApplicable='True'))"><xsl:value-of select="' '"/><xsl:call-template name="LeafContainerPrint"><xsl:with-param name="IdPrefix" select="concat($IdPrefix,'_')"/><xsl:with-param name="LeafContainerId" select="concat($IdPrefix,'_Section_Header')"/><xsl:with-param name="ShowContainerHeader" select="'N'"/><xsl:with-param name="AttribTitle" select="$SectionHeader"/><xsl:with-param name="LeafContainerElement" select="./QuestionData/OtherIdentifyingInformation"/></xsl:call-template><xsl:value-of select="' '"/></xsl:if></xsl:with-param><xsl:with-param name="WrapperDataContent"><xsl:if test="number($Container4SectionPresentNFlag) and count(./QuestionData/OtherIdentifyingInformation/*)"><xsl:call-template name="OtherIdInfoPrint"><xsl:with-param name="TitleType" select="'Field'"/><xsl:with-param name="BaseTitlePhrase" select="$BaseTitlePhrase"/><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="OtherIdInfo" select="./QuestionData/OtherIdentifyingInformation"/><xsl:with-param name="ShowSectionHeader" select="'N'"/></xsl:call-template><xsl:text/></xsl:if></xsl:with-param></xsl:call-template></tbody></table></xsl:template></xsl:stylesheet>