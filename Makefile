# $Id: Makefile,v 1.8 1999-08-29 16:53:23 nik Exp $

LINKS= 	en/ja en/es en/ru en/zh ja/web.mk 
LINKS+=	web.mk ../doc/en_US.ISO_8859-1/web.mk
LINKS+= ../doc/en_US.ISO_8859-1/includes.sgml

SUBDIR= en

all: links


links: ${LINKS}

clean:
	rm -f ${LINKS}


en/ja:
	cd en; ln -sf ../ja

en/es:
	cd en; ln -sf ../es

en/ru:
	cd en; ln -sf ../ru

en/zh:
	cd en; ln -sf ../zh

ja/web.mk:
	cd ja; ln -sf ../en/web.mk

web.mk:
	cd .;  ln -sf en/web.mk

../doc/en_US.ISO_8859-1/web.mk:
	cd ../doc/en_US.ISO_8859-1; ln -sf ../../www/en/web.mk

../doc/en_US.ISO_8859-1/includes.sgml:
	cd ../doc/en_US.ISO_8859-1; ln -sf ../../www/en/includes.sgml

.include <bsd.subdir.mk>
