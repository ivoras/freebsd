#!/bin/sh
# $FreeBSD$

desc="open returns EISDIR when trying to open a directory for writing"

dir=`dirname $0`
. ${dir}/../misc.sh

require chflags

echo "1..8"

n0=`namegen`

expect 0 mkdir ${n0} 0755

expect 0 open ${n0} O_RDONLY
expect EISDIR open ${n0} O_WRONLY
expect EISDIR open ${n0} O_RDWR
expect EISDIR open ${n0} O_RDONLY,O_TRUNC
expect EISDIR open ${n0} O_WRONLY,O_TRUNC
expect EISDIR open ${n0} O_RDWR,O_TRUNC

expect 0 rmdir ${n0}
