html:
	xsltproc --encoding UTF-8 -o history.html history.xsl history.xml
	# Hack here :(
	sed -i 's/xmlns=""//' history.html

clean:
	rm -f history.html
