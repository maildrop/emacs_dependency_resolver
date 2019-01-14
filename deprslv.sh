#!/bin/sh

LIST_DIR=.deplist
if [ ! -d ${LIST_DIR} ]; then
    mkdir ${LIST_DIR}
fi;

if [ -d ${LIST_DIR} ] ; then
    listfile_name0=${1##*/}
    listfile_name=${listfile_name0%.*}.list
    if [ ! -f ${LIST_DIR}/${listfile_name} ] ; then
        echo $1 > ${LIST_DIR}/${listfile_name}
	    ldd $1 | perl ldd_filter.pl | xargs -I'{}' which '{}' | tee -a ${LIST_DIR}/${listfile_name} | xargs -I'{}' /bin/sh $0 '{}'
    fi;
fi;



