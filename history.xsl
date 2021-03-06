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
    <xsl:output
        method="html" indent="yes" encoding="UTF-8"
        doctype-system="about:legacy-compat" omit-xml-declaration="yes"
        cdata-section-elements="style" media-type="text/html" version="5.0"
    />
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
                        margin: 1em auto;
                        font-family: Arial, Helvetica, sans-serif;
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
                    img {
                        max-width: 100%;
                        box-shadow: 3px 3px 3px gray;
                    }
                    blockquote {
                        font-style: italic;
                        color: grey;
                        border-left: 2px solid gray;
                        margin-left: 1em;
                        padding-left: 0.5em;
                    }
                    section {
                        border-top: 1px solid gray;
                    }
                    .tiles {
                        list-style: none;
                        padding: 0;
                    }
                    .tiles li {
                        display: inline-block;
                        margin: 0 5px 5px 0;
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
                    #index {
                        text-align: center;
                    }
                    #index > li:not(:last-child):after {
                        content: " | ";
                    }
                    a[href="#main"] {
                        float: right;
                        text-decoration: none;
                    }
                </style>
            </head>
            <body>
                <h1 id="main">La saggezza degli antichi ci accompagna</h1>
                <ul class="tiles" id="index">
                    <xsl:for-each select="veteran">
                        <li><a href="#{@id}">
                            <xsl:value-of select="name"/>
                        </a></li>
                    </xsl:for-each>
                </ul>
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
        <section id="{@id}">
            <header>
                <a href="#main">↑ Top</a>
                <h1><xsl:value-of select="name"/></h1>
                <small>
                    <xsl:text>(</xsl:text>
                    <xsl:value-of select="period/from"/>
                    <xsl:text> - </xsl:text>
                    <xsl:value-of select="period/to"/>
                    <xsl:text>)</xsl:text>
                </small>
                <xsl:if test="governance/role">
                    <ul class="roles">
                        <xsl:apply-templates select="governance"/>
                    </ul>
                </xsl:if>
                <xsl:apply-templates select="face"/>
            </header>
            <xsl:if test="biography/text() | tale/text()">
                <h2>Chi è</h2>
                <blockquote><xsl:copy-of select="tale/node()"/></blockquote>
                <xsl:apply-templates select="biography"/>
            </xsl:if>
            <xsl:if test="attribution/text()">
                <h2>Al POuL</h2>
                <xsl:apply-templates select="attribution"/>
            </xsl:if>
            <xsl:if test="career/text()">
                <h2>Dopo</h2>
                <xsl:apply-templates select="career"/>
            </xsl:if>
            <xsl:if test="photos/photo">
                <ul class="tiles">
                    <xsl:apply-templates select="photos/photo"/>
                </ul>
            </xsl:if>
        </section>
    </xsl:template>
    <xsl:template match="face">
        <p><a href="{text()}">
            <img src="{@thumb}" alt="{../name}"/>
        </a></p>
    </xsl:template>
    <xsl:template match="photo">
        <li><a href="{text()}">
            <xsl:if test="@desc">
                <xsl:attribute name="title">
                    <xsl:value-of select="@desc"/>
                </xsl:attribute>
            </xsl:if>
            <img src="{@thumb}" alt="{@desc}"/>
        </a></li>
    </xsl:template>
    <xsl:template match="role">
        <li>
            <xsl:value-of select="."/>
            <xsl:if test="@year">
                <xsl:text> nel </xsl:text>
                <xsl:value-of select="@year"/>
            </xsl:if>
        </li>
    </xsl:template>
    <xsl:template match="attribution | career | biography">
        <xsl:for-each select="node()">
            <xsl:choose>
                <xsl:when test="self::text()[normalize-space()]">
                    <p><xsl:value-of select="."/></p>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>

