<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8" indent="yes" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
      <meta http-equiv="Content-Language" content="sk"/>
      <meta http-equiv="Cache-Control" content="no-cache"/>
      <meta http-equiv="Pragma" content="no-cache"/>
      <meta name="description" content="This website represents the simple database of personal contacts."/>
      <meta name="keywords" content="list,contacts,phone,email,mail,web,website,adress,instagram,facebook"/>
      <style type="text/css">
        <![CDATA[ body { min-width: 39em; margin: auto; padding: 0em 2em; background-color: #FFCC7F; font-family: sans-serif, serif; color: #000000; } #zahlavi { position: relative; top: 0em; min-width: 35em; max-width: 50em; height: 5em; margin: 0em auto; padding: 1em; background-color: #000000; color: #FFFFFF; } #obsah { position: relative; min-width: 35em; max-width: 52em; margin: 0em auto; padding: 1em 0em; background-color: #FFF3E0; color: #000000; } #text { padding: 0em 1em; } a { color: #807340; } a:hover { color: #FF6600; } h3 { margin: 0.5em 0em 0em 0em; } .program-background h3 { background-color: #FFF3E0; color: #000000; } .program-group-background h3 { background-color: #807340; color: #000000; } .program-name { padding: 0em 0.5em; background-color: #E6E1CF; color: #000000; } .program-group-name { padding: 0em 0.5em; background-color: #807340; color: #E6E1CF; } .program-background { margin: 0; padding: 0.5em 0.3em 0.3em 2em; list-style: none; background-color: #E6E1CF; color: #000000; } .program-group-background { padding: 0.5em 0em 0em 2em; background-color: #807340; color: #000000; } div.value { text-indent: 1.5em; } .label { font-style: italic; } ]]>
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
            <xsl:sort select="name/lastname"/> <!-- Sort by last name -->
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
        <p><h3>E-mail:</h3>
          <ul>
            <xsl:for-each select="email">
              <li>
                <a href="mailto:{.}" target="_blank">
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
        </p>
      </xsl:if>

      <xsl:if test="web">
        <p><h3>Website:</h3> 
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
        </p>
      </xsl:if>

      <xsl:if test="telephoneNumber">
        <p><h3>Telephone number:</h3>
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
        </p>
      </xsl:if>

      <xsl:if test="otherContact">
        <p>
          <xsl:for-each select="otherContact">
            <h3 style="display: inline;"><xsl:value-of select="./serviceName"/>: </h3><xsl:value-of select="./userID"/>
            <br/>
          </xsl:for-each>
        </p>
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
          <p><h3>Notes:</h3>
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
        </p>

        </div>
      </xsl:if>
    </div>
  </xsl:template>

</xsl:transform>