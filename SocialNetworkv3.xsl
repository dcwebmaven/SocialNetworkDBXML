<?xml version="1.0"?>
<xsl:stylesheet
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
version="2.0">

<xsl:output name="my-index-format" method="xhtml" indent="yes"
            doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
            doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"/>

<xsl:output method="html" indent="yes" name="html"/>

<xsl:template match="/">
<xsl:result-document href="SocialIndex.html" format="my-index-format">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head><title>My Social Network</title></head>
    <body style="background-color: white;">
      <h1>List of Friends</h1>
      <table border="1">
     <tr bgcolor="#9acd32">
       <th>Name</th>
       <th>Mailing Address</th>
       <th>Email Address</th>
     </tr>
        <xsl:for-each select="//Person">
     <tr>
       <td><a href="friend-{position()}.html"><xsl:value-of select="concat(First, ' ', Last)"/></a></td>
       <td><xsl:value-of select="Address"/></td>
       <td><xsl:value-of select="Email"/></td>
     </tr>
     </xsl:for-each>
   </table>
    </body>
  </html>

</xsl:result-document>

<xsl:for-each select="//Person">
  <xsl:result-document href="friend-{position()}.html" format="html">
  <html><body style="background-color: white;">
    <h1>Profile for <xsl:value-of select="concat(First, ' ', Last)"/> </h1>
    <b>Birthday:</b> <xsl:value-of select="Birthday"/><br/>
    <b><xsl:value-of select="Phone/@Type"/> Phone:</b> <xsl:value-of select="Phone"/><br/>
    <b>IM Service:</b> <xsl:value-of select="IM/@Service"/> <br/><b>IM Account:</b> <xsl:value-of select="IM"/><br/>
    <b>Social Circle:</b> <xsl:value-of select="Social"/><br/>
  </body></html>
  </xsl:result-document>
</xsl:for-each>

</xsl:template>

</xsl:stylesheet>