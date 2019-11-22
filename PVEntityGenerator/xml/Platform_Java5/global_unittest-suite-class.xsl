<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0"
>

<xsl:import href="platform_defaults.xsl"/>

<xsl:output method="text" encoding="ISO-8859-1"/>


<!-- ***** AllTests class generieren ***** -->
<xsl:template match="/">
<xsl:if test="$platform/parameters/parameter[@name='generate-unittest-suite']='true'">

  <!-- File Header, package, import statements -->
  <xsl:value-of select="$platform/parameters/parameter[@name='file-header']"/><xsl:text>
package </xsl:text><xsl:value-of select="$platform/parameters/parameter[@name='unittest-package']"/><xsl:text>;

import junit.framework.Test;
import junit.framework.TestSuite;

</xsl:text>

  <!-- Class-Kommentar -->
  <xsl:if test="$generate-comments">
    <xsl:text>/**
 * Unit Test Suite.
 * @author Generated by PVEntityGenerator
 */
</xsl:text>
  </xsl:if>

  <!-- Class Beginn -->
  <xsl:text>public class AllTests {

</xsl:text>
  <xsl:if test="$generate-comments">
    <xsl:text>  /**
   * Test suite.
   * @return Test
   */
</xsl:text>
  </xsl:if>
<xsl:text>  public static Test suite() {
    TestSuite suite = new TestSuite("</xsl:text><xsl:value-of select="$platform/parameters/parameter[@name='unittest-package']"/><xsl:text>");
</xsl:text>

  <xsl:for-each select="$db-definition/entities/entity">
    <xsl:variable name="generate-entity" select="key('generate-entity', @name)"/>
    <xsl:if test="$platform/parameters/parameter[@name='generate-unittest']='true'
      and $generate-entity/parameters/parameter[@name='generate-entity']='true'">
      <xsl:text>    suite.addTest(</xsl:text><xsl:value-of select="$platform/parameters/parameter[@name='unittest-package']"/>
      <xsl:text>.</xsl:text><xsl:value-of select="@name"/><xsl:text>Test.suite());
</xsl:text>
    </xsl:if>
  </xsl:for-each>

  <!-- Placeholder for manual class extensions -->
  <xsl:text>
//+++ Custom class extensions START +++
// To prevent deleting your changes from PVEntityGenerator put your manual class extensions only here

//+++ Custom class extensions END +++

    return suite;
  }
</xsl:text>

  <!-- Class End -->
  <xsl:text>
}
</xsl:text>

</xsl:if>
</xsl:template>


</xsl:stylesheet>
