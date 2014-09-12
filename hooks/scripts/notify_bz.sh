#! /bin/sh
# $FreeBSD$

# A trivial stop-gap script to send a cross-reference for commits to bugzilla.

TZ=UTC
export TZ

REPO="$1"
REV="$2"

if [ -z "$REV" -o -z "$REPO" -o ! -d "$REPO" ]; then
  echo "Bad args: repo rev" 1>&2
  exit 1
fi

PRS="$(svnlook info "$REPO" -r "$REV" | grep -e '^[[:space:]]*[pP][rR]:[[:space:]]*'|grep -Eo '([a-zA-Z]+\/)*[^[]([0-9]+)[^]]'|sed -Ee 's,[[:space:]],,g' -e 's,[a-zA-Z]+\/,,g')"

if [ -z "$PRS" ]; then
  exit 0
fi
WHO="$(svnlook author "$REPO" -r "$REV")"

for pr in $PRS; do
	(
		echo "From: commit-hook@freebsd.org"
		echo "To: notify-bz@freebsd.org"
		echo "Subject: [Bug $pr]"
		echo ""
		echo "A commit references this bug:"
		echo ""
		echo "Author: $WHO"
		echo "Date: $(date)"
		echo "New revision: $REV"
		echo "URL: http://svnweb.freebsd.org/changeset/doc/$REV"
		echo ""
		echo "Log:"
		svnlook log "$REPO" -r "$REV" | sed -e 's/^/  /'
		echo ""
		echo "Changes:"
		svnlook changed "$REPO" -r "$REV" | sed -E -e 's/^[A-Z]*[ 	]+/  /'
	) | sed -e 's/^[ 	]*$//' | cat -s | /usr/sbin/sendmail -oi -f commit-hook@freebsd.org notify-bz@freebsd.org
done
