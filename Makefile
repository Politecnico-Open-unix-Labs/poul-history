html:
	# XSLTproc output requires some hand trimming :(
	#
	# 1. Add <!DOCTYPE html>
	# 2. Remove <meta> for encoding (we already have the HTML5 one)
	# 3. <img> and <meta> are closed even if they should not.
	#
	xsltproc --encoding UTF-8 -o history.html history.xsl history.xml

clean:
	rm -f history.html
