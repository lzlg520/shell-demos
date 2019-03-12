#!/usr/bin/env bash
#for i in $(seq 0 4) ; do
#    echo $i
#done

#for i in `seq 0 4` ; do
#    echo $i
#done

#for (( i = 0; i < 5; i++ )); do
#    echo $i
#done

#for i in {0..4} ; do
#    echo $i
#done

#[[ 1 > 2 ]] && echo True || echo False

#pids="15681"
#shell脚本的遍历替换${value//pattern/string}
#arr=(${pids// / })
#echo "arr value is : $arr"
#for data in ${arr[@]}
#do
#    echo ${data}
#done
arr="abc123"
temp=(${arr//[0-9]/""})
echo $temp
