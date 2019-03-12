#!/usr/bin/env bash
mailfolder=/c/Users/jieen/Desktop/work/readme.txt

if [ -r "$mailfolder" ]; then
    echo "$mailfolder has message from : "
    echo | grep "^echo " $mailfolder >> readme2.txt
    chmod +r readme.txt
    cat readme2.txt >> $mailfolder
    rm -f readme2.txt
else
    echo "Can not read $mailfolder"
    touch $mailfolder
    chmod +rw $mailfolder
    echo "echo 人生自古谁无死，六区蛋清找旱情！" >> $mailfolder
fi