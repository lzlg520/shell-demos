#!/usr/bin/env bash
path=/c/Users/jieen/Desktop/work
cd $path
for i in $path/* ; do
    echo "Hello, $i"
done
count=`ls -l|grep '^-' | wc -l`
echo "=====$path has $count files and directories."