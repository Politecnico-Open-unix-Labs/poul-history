html:
	xsltproc --encoding UTF-8 -o history.html history.xsl history.xml

clean:
	rm -f history.html
