#!/usr/bin/env bash
a=$1
b=$2
#-z 如果$a为string且为空则为true（0）
[ -z $a ] && echo "please \$1 number1" && exit 1
[ -z $b ] && echo "please \$2 number2" && exit 2
# $#参数的个数
[ ! $# -eq 2 ] && echo "--please num1 num2" && exit 3

#求和
echo "$a + $b = $(($a+$b))"
#求差
echo "$a - $b = $(($a-$b))"
#求积
echo "$a * $b = $(($a*$b))"
#求商
echo "$a / $b = $(($a/$b))"