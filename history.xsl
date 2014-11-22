<?xml version="1.0" encoding="UTF-8"?>
<!--
With love from esseks <3

21 novembre 2014
-->
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.w3.org/1999/xhtml"
    version="1.0"
>
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:template match="/history">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="it">
            <head>
                <title>La storia del POuL</title>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <style type="text/css">
                    html {
                        font-size: 12pt;
                        max-width: 960px;
                        margin: auto;
                    }
                    section > h2 {
                        font-size: 14pt;
                    }
                    body > h1 {
                        font-size: 30pt;
                        text-align: center;
                    }
                    header > h1 {
                        font-size: 20pt;
                        margin: 0.5em 0;
                    }
                    header > small {
                        font-style: italic;
                    }
                    header {
                        font-size: 10pt;
                    }
                    blockquote {
                        font-style: italic;
                        color: grey;
                        border-left: 2px solid grey;
                        margin-left: 1em;
                        padding-left: 0.5em;
                    }
                    section {
                        border-top: 1px solid gray;
                    }
                    section > ul {
                        list-style: none;
                        padding: 0;
                    }
                    section > ul li {
                        display: inline-block;
                    }
                    footer {
                        border-top: 1px solid gray;
                        text-align: center;
                        padding-top: 0.2em;
                        color: gray;
                    }
                    .roles {
                        padding-left: 0;
                        list-style: none;
                    }
                    .roles li {
                        display: inline-block;
                    }
                    .roles li:not(:last-child):after {
                        content: ", "
                    }
                </style>
            </head>
            <body>
                <h1>La saggezza dei grandi padri ci accompagna</h1>
                <article>
                    <xsl:apply-templates select="veteran"/>
                </article>
                <footer>
                    <small>
                        <xsl:text>Ultimo aggiornamento: </xsl:text>
                        <xsl:value-of select="/history/@timestamp"/>
                    </small>
                </footer>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="veteran">
        <section>
            <header>
                <h1><xsl:value-of select="name"/></h1>
                <small>
                    <xsl:text>(</xsl:text>
                    <xsl:value-of select="period/from"/>
                    <xsl:text> - </xsl:text>
                    <xsl:value-of select="period/to"/>
                    <xsl:text>)</xsl:text>
                </small>
                <xsl:if test="face">
                </xsl:if>
                <ul class="roles">
                    <xsl:apply-templates select="governance"/>
                </ul>
                <xsl:apply-templates select="face"/>
            </header>
            <h2>Al POuL</h2>
            <blockquote><xsl:value-of select="tale"/></blockquote>
            <p><xsl:value-of select="biography"/></p>
            <h2>Dopo</h2>
            <p><xsl:value-of select="career"/></p>
            <xsl:if test="photos">
                <ul><xsl:apply-templates select="photos/photo"/></ul>
            </xsl:if>
        </section>
    </xsl:template>
    <xsl:template match="face">
        <p><a href="{text()}">
            <img src="{@thumb}" alt="{../name}"/>
        </a></p>
    </xsl:template>
    <xsl:template match="photo">
        <li>
            <a href="{text()}">
                <img src="{@thumb}" alt="{@desc}"/>
            </a>
        </li>
    </xsl:template>
    <xsl:template match="role">
        <li>
            <xsl:value-of select="."/>
            <xsl:text> nel </xsl:text>
            <xsl:value-of select="@year"/>
        </li>
    </xsl:template>
</xsl:stylesheet>

