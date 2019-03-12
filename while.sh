#!/usr/bin/env bash
file=/c/Users/jieen/Desktop/work/passwd
count=`cat $file | wc -l`

cat $file |
while read line; do
    user=`echo $line | awk -F ':' '{print $1}'`
    uid=`echo $line | awk -F ':' '{print $3}'`
    echo "hello, $user Your UUID is $uid"
done
echo "=====User_count:$count====="
