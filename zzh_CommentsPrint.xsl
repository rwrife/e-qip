<?xml version="1.0" encoding="utf-8" standalone="no"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:template name="CommentsPrint"><xsl:param name="TitleType" select="'Field'"/><xsl:param name="TitlePrefixPhrase"/><xsl:param name="BaseTitlePhrase"/><xsl:param name="IdPrefix"/><xsl:param name="Comment"/><xsl:param name="RootIdPrefix" select="'Comment_'"/><xsl:param name="TitleDelimiter" select="': '"/><xsl:param name="ShowSectionHeader" select="'Y'"/><xsl:param name="ShowContainerAttribValues" select="'Y'"/><xsl:variable name="HeaderDelimiter"><xsl:if test="normalize-space(concat($TitlePrefixPhrase,$BaseTitlePhrase))"><xsl:value-of select="$TitleDelimiter"/></xsl:if></xsl:variable><xsl:variable name="OutStdContainerValues"><xsl:call-template name="LeafContainerPrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="LeafContainerId" select="concat($RootIdPrefix,'Header')"/><xsl:with-param name="LeafContainerHeader" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase,$HeaderDelimiter))"/><xsl:with-param name="ShowContainerHeader" select="$ShowSectionHeader"/><xsl:with-param name="TitleType" select="$TitleType"/><xsl:with-param name="LeafContainerTitle" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase))"/><xsl:with-param name="AttribTitle" select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase))"/><xsl:with-param name="ShowAttribValues" select="$ShowContainerAttribValues"/><xsl:with-param name="LeafContainerElement" select="$Comment"/></xsl:call-template></xsl:variable><xsl:if test="string-length(normalize-space($OutStdContainerValues))"><xsl:copy-of select="$OutStdContainerValues"/><xsl:value-of select="' '"/></xsl:if><span class="RptDetail"><span><xsl:attribute name="id"><xsl:value-of select="concat($IdPrefix,'Comment')"/></xsl:attribute><xsl:attribute name="title"><xsl:value-of select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase))"/></xsl:attribute><xsl:value-of select="normalize-space($Comment)"/></span></span></xsl:template><xsl:template name="TabularCommentsPrint"><xsl:param name="TitlePrefixPhrase" select="'Additional'"/><xsl:param name="BaseTitlePhrase" select="'Comments'"/><xsl:param name="IdPrefix"/><xsl:param name="Comment"/><xsl:param name="ShowSeperatorNFlag" select="0"/><xsl:param name="TitleDelimiter" select="':'"/><tr><td><xsl:attribute name="class"><xsl:choose><xsl:when test="$ShowSeperatorNFlag"><xsl:value-of select="'VertTop TabularTitle TextRight SeparatorBorder'"/></xsl:when><xsl:otherwise><xsl:value-of select="'VertTop TabularTitle TextRight'"/></xsl:otherwise></xsl:choose></xsl:attribute><span class="FieldContent FieldTitle SubsectionTitle NoWrap"><span><xsl:attribute name="title"><xsl:value-of select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase))"/></xsl:attribute><xsl:value-of select="normalize-space(concat($TitlePrefixPhrase,' ',$BaseTitlePhrase,$TitleDelimiter))"/></span></span></td><td><xsl:attribute name="class"><xsl:choose><xsl:when test="$ShowSeperatorNFlag"><xsl:value-of select="'MaxWidth VertTop SeparatorBorder'"/></xsl:when><xsl:otherwise><xsl:value-of select="'MaxWidth VertTop'"/></xsl:otherwise></xsl:choose></xsl:attribute><div class="MaxWidth DataContent RptDetail"><xsl:call-template name="CommentsPrint"><xsl:with-param name="TitlePrefixPhrase" select="$TitlePrefixPhrase"/><xsl:with-param name="BaseTitlePhrase" select="$BaseTitlePhrase"/><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="Comment" select="$Comment"/><xsl:with-param name="ShowSectionHeader" select="'N'"/></xsl:call-template></div></td></tr></xsl:template></xsl:stylesheet>