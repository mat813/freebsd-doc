# bsd.web.mk
# $Id: web.mk,v 1.9 1997-01-19 21:29:03 jfieber Exp $

#
# Build and install a web site.
#
# Basic targets:
#
# all (default) -- performs batch mode processing necessary
# install -- Installs everything
# clean -- remove anything generated by processing
#
# Transformations:
# 
#  copy  -- no processing, simply copy the file to install
#  spam  -- run the file through spam for processing and validation
#  m4    -- run through the m4 macro processor
#

.if exists(${.CURDIR}/../Makefile.inc)
.include "${.CURDIR}/../Makefile.inc"
.endif

WEBDIR?=	${.CURDIR:T}
CGIDIR?=	${.CURDIR:T}
DESTDIR?=	${HOME}/public_html

WEBOWN?=	${USER}
WEBGRP?=	${USER}
WEBMODE?=	${NOBINMODE}

CGIOWN?=	${USER}
CGIGRP?=	${USER}
CGIMODE?=	${BINMODE}

#
# Install dirs derived from the above.
#
DOCINSTALLDIR=	${DESTDIR}${WEBBASE}/${WEBDIR}
CGIINSTALLDIR=	${DESTDIR}${WEBBASE}/${CGIDIR}

#
# The orphan list contains sources specified in DOCS that there
# is no transform rule for.  We start out with all of them, and
# each rule below removes the ones it knows about.  If any are
# left over at the end, the user is warned about them.
#
ORPHANS:=	${DOCS}

COPY=	-c

##################################################################
# Transformation rules

###
# file.sgml --> file.html
#
# Runs file.sgml through spam to validate and expand some entity
# references are expanded.  file.html is added to the list of
# things to install.

.SUFFIXES:	.sgml .html
SGMLNORM=	sgmlnorm
CATALOG?=	/usr/local/share/sgml/HTML/catalog
SGMLNORMFLAGS=	-d ${SGMLNORMOPTS} -c ${CATALOG}
GENDOCS+=	${DOCS:M*.sgml:S/.sgml$/.html/g}
ORPHANS:=	${ORPHANS:N*.sgml}

.sgml.html:
	${SGMLNORM} ${SGMLNORMFLAGS} ${.IMPSRC} > ${.TARGET}

###
# file.docb --> file.html
#
# Generate HTML from docbook

.SUFFIXES:	.docb
GENDOCS+=	${DOCS:M*.docb:S/.docb$/.html/g}
ORPHANS:=	${ORPHANS:N*.docb}

.docb.html:
	sgmlfmt -d docbook -f html ${SGMLOPTS} ${.IMPSRC}

###
# file.java --> file.class
#
# Uses javac to compile java source.  Note: since we cannot tell
# what classes will come out of a java file, we have install all
# .class files.  The .if construction is there so that *.class
# is only put in if there are actually java files in the DOCS.
# Generally speaking, make and java were not made for each other.

.SUFFIXES:	.java .class
JAVAC?=		javac
JAVAFLAGS=	${JAVAOPTS}
_TMP:=		${DOCS:M*.java}
.if !empty(_TMP)
GENDOCS+=	${DOCS:M*.java:S/.java$/.class/g} *.class
.endif
ORPHANS:=	${ORPHANS:N*.java}

.java.class:
	${JAVAC} ${JAVAFLAGS} ${.IMPSRC}


###
# file.m4 --> file.html
#
# Runs file.m4 through the m4 preprocessor, generating file.sgml,
# which is then taken care of by the .sgml to .html rule.

.SUFFIXES:	.m4
M4?=		m4
M4FLAGS?=	${M4OPTS}
GENDOCS+=	${DOCS:M*.m4:S/.m4$/.html/g}
CLEANFILES+=	${DOCS:M*.m4:S/.m4$/.sgml/g}
ORPHANS:=	${ORPHANS:N*.m4}

.m4.sgml:
	${M4} ${M4OPTS} < ${.IMPSRC} > ${.TARGET}


##################################################################
# Targets

#
# If no target is specified, .MAIN is made
#
.MAIN: all

#
# Build most everything
#
all: ${COOKIE} orphans cvsdir ${GENDOCS} ${DATA} ${LOCAL} ${CGI} _PROGSUBDIR

#
# Warn about anything in DOCS that has no translation
#
.if !empty(ORPHANS)
orphans:
	@echo Warning!  I don\'t know what to do with: ${ORPHANS}
.else
orphans:
.endif

#
# Check these things out from cvs
#
cvsdir:
.if defined(CVSDIR) && !empty(CVSDIR)
	for i in ${CVSDIR}; do \
		if [ ! -e $$i ]; then \
			cvs co -P $$i; \
		fi \
	done
.endif

#
# Clean things up
#
.if !target(clean)
clean: _PROGSUBDIR
	rm -f Errs errs mklog ${GENDOCS} ${LOCAL} ${CLEANFILES}
.endif

#
# Really clean things up
#
.if !target(cleandir)
cleandir: clean _PROGSUBDIR
	rm -f ${.CURDIR}/tags .depend
	cd ${.CURDIR}; rm -rf obj;
.endif

#
# Install targets: before, real, and after.
#
.if !target(install)
.if !target(beforeinstall)
beforeinstall:
.endif
.if !target(afterinstall)
afterinstall:
.endif

_ALLINSTALL=	${GENDOCS} ${DATA} ${LOCAL}

realinstall: ${COOKIE} ${GENDOCS} ${DATA} ${LOCAL} ${CGI} _PROGSUBDIR
.if !empty(_ALLINSTALL)
	@mkdir -p ${DOCINSTALLDIR}
	for entry in ${_ALLINSTALL}; do \
		${INSTALL} ${COPY} -o ${WEBOWN} -g ${WEBGRP} -m ${WEBMODE} \
			${INSTALLFLAGS} $${entry} ${DOCINSTALLDIR}; \
	done
.if defined(INDEXLINK) && !empty(INDEXLINK)
	(cd ${DOCINSTALLDIR}; ln -s -f ${INDEXLINK} index.html)
.endif
.endif
.if defined(CGI) && !empty(CGI)
	@mkdir -p ${CGIINSTALLDIR}
	for entry in ${CGI}; do \
		${INSTALL} ${COPY} -o ${CGIOWN} -g ${CGIGRP} -m ${CGIMODE} \
			${INSTALLFLAGS} $${entry} ${CGIINSTALLDIR}; \
	done
.endif
.if defined(DOCSUBDIR) && !empty(DOCSUBDIR)
	for entry in ${DOCSUBDIR}; do \
		mkdir -p ${DOCINSTALLDIR}/$$entry; \
	done
.endif

realinstall2:
.if defined(DOCSUBDIR) && !empty(DOCSUBDIR)
	for entry in ${DOCSUBDIR}; do \
		(cd ${DOCINSTALLDIR}/$$entry; \
		tar czf $$entry-html.tar.gz $${entry}.html $${entry}_toc.html \
			$$entry[0-9]*.html; \
		ln -fs $${entry}.html index.html ) \
	done
.endif

# Set up install dependencies so they happen in the correct order.
install: afterinstall
afterinstall: realinstall2
realinstall: beforeinstall
realinstall2: realinstall
.endif 

#
# This recursively calls make in subdirectories.
#
#SUBDIR+=${DOCSUBDIR}
_PROGSUBDIR: .USE
.if defined(SUBDIR) && !empty(SUBDIR)
	@for entry in ${SUBDIR}; do \
		(${ECHODIR} "===> ${DIRPRFX}$$entry"; \
		cd ${.CURDIR}/$${entry}; \
		${MAKE} ${.TARGET:S/realinstall/install/:S/.depend/depend/} DIRPRFX=${DIRPRFX}$$entry/); \
	done
.endif
.if defined(DOCSUBDIR) && !empty(DOCSUBDIR)
	@for entry in ${DOCSUBDIR}; do \
		(${ECHODIR} "===> ${DIRPRFX}$$entry"; \
		cd ${.CURDIR}/$${entry}; \
		${MAKE} ${.TARGET:S/realinstall/install/:S/.depend/depend/} DIRPRFX=${DIRPRFX}$$entry/ ${PARAMS}); \
	done
.endif


#
# cruft for generating linuxdoc stuff
#

.if defined (DOCSUBDIR) && !empty(DOCSUBDIR)

FORMATS?=	"html ps latin1 ascii"
PARAMS=		DESTDIR=${DESTDIR} DOCDIR=${WEBBASE}/${WEBDIR}
PARAMS+=	DOCOWN=${WEBOWN} DOCGRP=${WEBGRP}
PARAMS+=	FORMATS=${FORMATS} COPY="${COPY}"

.endif

# THE END
