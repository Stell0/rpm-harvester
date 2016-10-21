#!/bin/bash


TMPFILE=$(mktemp)

cat ./yum.conf > $TMPFILE
for REPOFILE in $(ls ./yum.repos.d/*.repo); do
    cat $REPOFILE >> $TMPFILE
done

for i in $(cat ./yum_variables.conf | grep -v '^#' | sort |tac); do 
    VAR=$(echo $i | cut -d= -f1)
    VALUE=$(echo $i | cut -d= -f2)
    sed -i 's/\$'${VAR}'/'${VALUE}'/g' $TMPFILE
done


yumdownloader -c $TMPFILE --destdir ./RPMs $@
rm $TMPFILE
