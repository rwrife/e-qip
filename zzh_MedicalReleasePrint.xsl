<?xml version="1.0" encoding="utf-8" standalone="no"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:strip-space elements="*"/><xsl:template name="MedicalReleasePrint"><xsl:param name="IdPrefix" select="'Medical_Release_'"/><xsl:param name="Request"/><div class="ReleaseFormPage PageBreakBefore"><p class="ReleaseFormText" style="text-align:center;"><b><span style="font-size:14.0pt;   color:black">UNITED STATES OF AMERICA</span></b></p><p class="ReleaseFormText" style="text-align:center;"><b><span style="font-size:10.0pt;   font-family:Arial;color:black">AUTHORIZATION FOR RELEASE OF MEDICAL INFORMATION</span></b></p><p class="ReleaseFormText" style="text-align:center;"><span style="font-size:9.0pt;   color:black">Carefully read this authorization to release information about
		you, then sign and date it in ink.</span></p><p class="ReleaseFormText"><b><span style="font-size:10.0pt;color:black"> </span></b></p><h1 class="ReleaseFormPage">Instructions for Completing this Release</h1><p class="ReleaseFormText"><span style="font-size:10.0pt;color:black"> </span></p><p class="ReleaseFormText"><span style="font-size:10.0pt;color:black">This is a
		release for the investigator to ask your health practitioner(s) the three
		questions below concerning your mental health consultations. Your signature
		will allow the practitioner(s) to answer only these questions.</span></p><p class="ReleaseFormText"><span style="font-size:10.0pt;color:black"> </span></p><p class="ReleaseFormText"><span style="font-size:10.0pt;color:black">I am seeking
		assignment to or retention in a position with the Federal government which
		requires access to classified national security information or special nuclear
		information or material. As part of the clearance process, <b>I hereby
		authorize </b>the investigator, special agent, or duly accredited
		representative of the authorized Federal agency conducting my background
		investigation, to obtain the following information relating to my mental health
		consultations:</span></p><p class="ReleaseFormText"><span style="font-size:10.0pt;color:black"> </span></p><p class="ReleaseFormText"><span style="font-size:10.0pt;color:black">Does the person
		under investigation have a condition or treatment that could impair his/her
		judgment or reliability, particularly in the context of safeguarding classified
		national security information or special nuclear information or material?</span></p><p class="ReleaseFormText"><span style="font-size:10.0pt;color:black"> </span></p><p class="ReleaseFormText"><span style="font-size:10.0pt;color:black"> </span></p><p class="ReleaseFormText"><span style="font-size:10.0pt;color:black"> </span></p><p class="ReleaseFormText"><span style="font-size:10.0pt;color:black"> </span></p><p class="ReleaseFormText"><span style="font-size:10.0pt;color:black">If so, please
		describe the nature of the condition and the extent and duration of the
		impairment or treatment.</span></p><p class="ReleaseFormText"><span style="font-size:10.0pt;color:black"> </span></p><p class="ReleaseFormText"><span style="font-size:10.0pt;color:black">What is the
		prognosis?</span></p><p class="ReleaseFormText"><span style="font-size:10.0pt;color:black"> </span></p><p class="ReleaseFormText"><span style="font-size:10.0pt;color:black"> </span></p><p class="ReleaseFormText"><span style="font-size:10.0pt;color:black"> </span></p><p class="ReleaseFormText"><span style="font-size:10.0pt;color:black"> </span></p><p class="ReleaseFormText"><span style="font-size:10.0pt;color:black">I understand
		the information released pursuant to this release is for use by the Federal Government
		only for purposes provided in the Standard Form 86 and that it may be
		redisclosed by the Government only as authorized by law.</span></p><p class="ReleaseFormText"><span style="font-size:10.0pt;color:black"> </span></p><p class="ReleaseFormText"><span style="font-size:10.0pt;color:black">Copies of this
		authorization that show my signature are as valid as the original release
		signed by me. This authorization is valid for 1 year from the date signed or
		upon termination of my affiliation with the Federal Government, whichever is
		sooner.</span></p><p class="ReleaseFormText"><span style="font-size:10.0pt;font-family:Arial;   color:black"> </span></p><xsl:call-template name="ReleaseSignaturePrint"><xsl:with-param name="IdPrefix" select="$IdPrefix"/><xsl:with-param name="Request" select="$Request"/></xsl:call-template></div></xsl:template></xsl:stylesheet>