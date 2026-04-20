<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Activity Badges</title>
        <style>
          body { font-family: 'Times New Roman', serif; margin: 20px; }
          h1 { margin-bottom: 20px; }
          h2 { margin-bottom: 5px; }
          .badge-container { border: 1px solid #ccc; padding: 10px; margin-bottom: 10px; }
          p.desc { margin-top: 5px; margin-bottom: 10px; }
          p.level { margin: 3px 0; }
          .footer { margin-top: 30px; font-style: italic; }
        </style>
      </head>
      <body>
        <h1>Activity Badges</h1>
        <div class="badges-list">
          <xsl:apply-templates select="badges/badge[@type='activity']">
            <xsl:sort select="name" order="ascending" data-type="text"/>
          </xsl:apply-templates>
        </div>
        <p class="footer">&#xA9; College Productions Ltd</p>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="badge">
    <div class="badge-container">
      <h2><xsl:value-of select="name"/></h2>
      <p class="desc"><xsl:value-of select="description"/></p>
      <xsl:apply-templates select="levels/availability"/>
    </div>
  </xsl:template>

  <xsl:template match="availability">
    <p class="level">
      <xsl:choose>
        <xsl:when test="@level = 'beaver'">Beaver: </xsl:when>
        <xsl:when test="@level = 'cub'">Cub: </xsl:when>
        <xsl:when test="@level = 'scout'">Scout: </xsl:when>
        <xsl:otherwise>Unknown: </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="."/>
    </p>
  </xsl:template>

</xsl:stylesheet>
