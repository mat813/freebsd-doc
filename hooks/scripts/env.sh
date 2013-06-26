# source this file
# $FreeBSD$
PATH=/s/svn/doc/hooks/scripts:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH
cd /s/svn/doc
umask 002
if [ -x /usr/local/bin/checkacl-doc ]; then
  eval `/usr/local/bin/checkacl-doc doc`
elif [ -x /usr/local/bin/checkacl ]; then
  eval `/usr/local/bin/checkacl doc`
fi
