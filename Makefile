DOC=lfp

install : ${DOC}.7
	mkdir -p ${PREFIX}/usr/local/man/man7/
	cp ${DOC}.7 ${PREFIX}/usr/local/man/man7
	chmod 644 ${PREFIX}/usr/local/man/man7/${DOC}.7

all : install pdf html

html : ${DOC}.html

${DOC}.html : ${DOC}.7
	groff -man -T html ${DOC}.7 >${DOC}.html

pdf : ${DOC}.pdf

${DOC}.pdf : ${DOC}.ps
	ps2pdf ${DOC}.ps

${DOC}.ps : ${DOC}.7
	groff -man -P-pletter ${DOC}.7 >${DOC}.ps

clean :
	rm -r ${DOC}.ps

clean-all :
	rm -rf ${DOC}.pdf ${DOC}.ps ${DOC}.html
