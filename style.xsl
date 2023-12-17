<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8" indent="yes" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
      <meta http-equiv="Content-Language" content="en"/>
      <meta http-equiv="Cache-Control" content="no-cache"/>
      <meta name="author" content="HTML code: Tatiana Pohlodova; e-mail: xpohlod@fi.muni.cz" />
      <meta http-equiv="Pragma" content="no-cache"/>
      <meta name="description" content="This website represents the simple database of personal contacts."/>
      <meta name="keywords" content="list,contacts,phone,email,mail,web,website,adress,instagram,facebook"/>
      <style type="text/css">
        <![CDATA[ 
          body { min-width: 39em; margin: auto; padding: 0em 2em; background-color: #ABDBE3; font-family: sans-serif, serif; color: #000000; } 
          #zahlavi { position: relative; top: 0em; min-width: 35em; max-width: 60em; height: 5em; margin: 0em auto; padding: 1em; background-color: #000000; color: #FFFFFF; } 
          #obsah { position: relative; min-width: 35em; max-width: 60em; margin: 0em auto; padding: 1em 1em; background-color: #eef8f9; color: #000000; } 
          a { color: #484848; } 
          a:hover { color: #9ac5cc; } 
          h3 { margin: 0.2em 0em 0em 0em; } 
          ]]>
      </style>
        <title>
          <xsl:value-of select="@title"/>
        </title>
      </head>

      <body>
        <div id="zahlavi">
          <h1>Contacts</h1>
        </div>
        <div id="obsah">
          <xsl:apply-templates select="contacts/contact">
            <xsl:sort select="name/lastname"/>
          </xsl:apply-templates>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="contact">
    <div class="contact">

      <h2>
        <xsl:value-of select="name/firstname"/>
        <xsl:if test="name/middlename">
          <xsl:text> </xsl:text>
          <xsl:value-of select="name/middlename"/>
        </xsl:if>
        <xsl:text> </xsl:text>
        <xsl:value-of select="name/lastname"/>
      </h2>

      <xsl:if test="email">
        <h3>E-mail:</h3>
        <ul>
          <xsl:for-each select="email">
            <li>
              <a href="mailto:{.}">
                <xsl:value-of select="."/>
              </a>
              <xsl:if test="@type">
                <xsl:text> (</xsl:text>
                  <xsl:value-of select="@type"/>
                <xsl:text>)</xsl:text>
              </xsl:if>
            </li>
          </xsl:for-each>
        </ul>
      </xsl:if>

      <xsl:if test="web">
        <h3>Website:</h3> 
        <ul>
          <xsl:for-each select="web">
            <li>
              <a href="{.}" target="_blank">
                <xsl:value-of select="."/>
              </a>
                <xsl:if test="@type">
                  <xsl:text> (</xsl:text>
                    <xsl:value-of select="@type"/>
                  <xsl:text>)</xsl:text>
                </xsl:if>
            </li>
          </xsl:for-each>
        </ul>
      </xsl:if>

      <xsl:if test="telephoneNumber">
        <h3>Telephone number:</h3>
        <ul>
          <xsl:for-each select="telephoneNumber">
            <li>
              <xsl:value-of select="."/>
              <xsl:if test="@type">
                <xsl:text> (</xsl:text>
                  <xsl:value-of select="@type"/>
                <xsl:text>)</xsl:text>
              </xsl:if>
            </li>
          </xsl:for-each>
        </ul>
      </xsl:if>

      <xsl:if test="otherContact">
        <xsl:for-each select="otherContact">
          <h3 style="display: inline;"><xsl:value-of select="./serviceName"/>: </h3><xsl:value-of select="./userID"/>
          <br/>
        </xsl:for-each>
      </xsl:if>

      <xsl:if test="address">
        <div class="address">
          <h3>Address:</h3>
          <xsl:value-of select="address/street"/> <xsl:text> </xsl:text> <xsl:value-of select="address/number/streetNumber"/> <xsl:if test="address/number/descriptiveIdentifier">/<xsl:value-of select="address/number/descriptiveIdentifier"/></xsl:if>
          <br/>
          <xsl:value-of select="address/postalCode"/> <xsl:text> </xsl:text> <xsl:value-of select="address/city"/>
          <xsl:if test="address/region">
            <br/>
            <xsl:value-of select="address/region"/>
          </xsl:if>
          <xsl:if test="address/state">
            <br/>
            <xsl:value-of select="address/state"/>
          </xsl:if>
        </div>
      </xsl:if>

      <xsl:if test="note">
        <div class="notes">
          <h4>Notes:</h4>
          <ol>
            <xsl:for-each select="note">
              <li>
                <xsl:value-of select="."/>
                <xsl:if test="@type">
                  <xsl:text> (</xsl:text>
                    <xsl:value-of select="@type"/>
                  <xsl:text>)</xsl:text>
                </xsl:if>
              </li>
            </xsl:for-each>
          </ol>
        </div>
      </xsl:if>
    </div>
    <br/>
  </xsl:template>

</xsl:transform>