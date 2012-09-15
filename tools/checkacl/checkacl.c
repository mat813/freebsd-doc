/*
 * Ok, so this isn't exactly pretty, so sue me.
 *
 * FreeBSD Subversion tree ACL check helper.  The program looks in
 * relevant access files to find out if the committer may commit.
 *
 * From: Id: cvssh.c,v 1.38 2008/05/31 02:54:58 peter Exp
 * $FreeBSD$
 */

#include <sys/param.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <stdio.h>
#include <stdlib.h>
#include <paths.h>
#include <pwd.h>
#include <grp.h>
#include <unistd.h>
#include <string.h>
#include <err.h>
#include <signal.h>
#include <stdarg.h>
#include <fcntl.h>

#define SRCACCESS	"/s/svn/base/conf/access"
#define DOCACCESS	"/s/svn/doc/conf/access"
#define PORTSACCESS	"/home/pcvs/CVSROOT/access"


static char username[32];
static char committag[256];

static void
msg(const char *fmt, ...)
{
	va_list ap;

	va_start(ap, fmt);
	vfprintf(stderr, fmt, ap);
	fprintf(stderr, "\n");
	va_end(ap);
}

static int
karmacheck(FILE *fp, char *name)
{
	char buf[1024];
	char *p, *s;
	int karma;

	karma = 0;
	while ((p = fgets(buf, sizeof(buf) - 1, fp)) != NULL) {
		while ((s = strsep(&p, " \t\n")) != NULL) {
			if (*s == '\0')
				continue;	/* whitespace */
			if (*s == '#' || *s == '/' || *s == ';')
				break;		/* comment */
			if (strcmp(s, "*") == 0) {	/* all */
				karma++;
				break;
			}
			if (strcmp(s, name) == 0) {
				karma++;
				break;
			}
			break;	/* ignore further tokens on line */
		}
	}
	return karma;
}

/* ARGUSED */
int
main(void)
{
	struct passwd *pw;
	struct stat st;
	FILE *fp;
	int i;
	gid_t repogid;
	gid_t mygroups[NGROUPS_MAX];
	int ngroups;
	int writeable;
	int dockarma;
#ifdef PORTSACCESS
	int portskarma;
#endif
#ifdef SRCACCESS
	int srckarma;
#endif
	const char *comma;

#ifdef PORTSACCESS
	portskarma = 0;
#endif
#ifdef SRCACCESS
	srckarma = 0;
#endif
	dockarma = 0;
	writeable = 0;
	pw = getpwuid(getuid());
	if (pw == NULL) {
		msg("no user for uid %d", getuid());
		exit(1);
	}
	if (pw->pw_dir == NULL) {
		msg("no home directory");
		exit(1);
	}

	/* save in a static buffer */
	strlcpy(username, pw->pw_name, sizeof(username));

	if (stat("/s/svn", &st) < 0) {
		msg("Cannot stat %s", "/s/svn");
		exit(1);
	}
	repogid = st.st_gid;
	if (repogid < 10) {
		msg("unsafe repo gid %d\n", repogid);
		exit(1);
	}
	ngroups = getgroups(NGROUPS_MAX, mygroups);
	if (ngroups > 0) {
		for (i = 0; i < ngroups; i++)
			if (mygroups[i] == repogid)
				writeable = 1;
	}
	if (!writeable)
		printf("export SVN_READONLY=y\n");

	fp = fopen(DOCACCESS, "r");
	if (fp == NULL) {
		msg("Cannot open %s", DOCACCESS);
		exit(1);
	} else {
		dockarma += karmacheck(fp, pw->pw_name);
		fclose(fp);
	}
#ifdef SRCACCESS
	if (dockarma == 0 && (fp = fopen(SRCACCESS, "r")) != NULL) {
		srckarma += karmacheck(fp, pw->pw_name);
		fclose(fp);
	}
#endif
#ifdef PORTSACCESS
	if (dockarma == 0 && (fp = fopen(PORTSACCESS, "r")) != NULL) {
		portskarma += karmacheck(fp, pw->pw_name);
		fclose(fp);
	}
#endif

	if (dockarma == 0) {
		strcpy(committag, "SVN_COMMIT_ATTRIB=");
		comma = "";
#ifdef SRCACCESS
		if (srckarma > 0) {
			strcat(committag, comma);
			strcat(committag, "src");
			comma = ",";
			dockarma += srckarma;
		}
#endif
#ifdef PORTSACCESS
		if (portskarma > 0) {
			strcat(committag, comma);
			strcat(committag, "ports");
			comma = ",";
			dockarma += portskarma;
		}
#endif
		if (dockarma != 0) {
			printf("export %s\n", committag);
		}
	}
		
	if (dockarma == 0) {
		/* If still zero, its a readonly access */
		printf("export SVN_READONLY=y\n");
	}
	return (0);
}
