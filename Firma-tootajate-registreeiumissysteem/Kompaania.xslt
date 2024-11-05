<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:output method="html" indent="yes" encoding="utf-8"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Kompaania</title>
            </head>
            <body>
                <h2>Projekti Aruanded</h2>

                <table id="KompaaniaTable" border="1" cellpadding="5">

                    <xsl:for-each select="Kompaania/Tootaja">
                        <tr>
                            <td>
                                <xsl:value-of select="Tootaja/nimi-perenimi"/>
                            </td>
                            <td>
                                <xsl:value-of select="Tootaja/amet"/>
                            </td>
                            <td>
                                <xsl:value-of select="Tootaja/palk"/>
                            </td>
                            <td>
                                <xsl:value-of select="Tootaja/igapäevased_andmed/toopaev_algus"/>
                            </td>
                            <td>
                                <xsl:value-of select="Tootaja/igapäevased_andmed/toopaev_lopp"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
