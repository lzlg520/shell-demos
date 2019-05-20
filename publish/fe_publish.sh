#!/bin/bash
#使用该命令前默认该shell存放在用户家目录下 cd ~
#使用该命令前，需确保前端项目已打包上传
#预生产环境使用的shell命令
cd /tt/app
#前端项目
#打包旧的static文件夹和index.html到/tt/www/app/backup/
mkdir -p backup
NOW=`date +%Y%m%d.%H%M`
echo "This now time is $NOW"
tar -czvf backup/tt_app$NOW.tar.gz static index.html
#解压前端项目(此时dist.zip包在用户家目录下)
unzip ~/dist.zip
#复制解压后的文件内容到/tt/www/app中
cp -r dist/* ../app
rm -rf dist
rm -rf ~/dist.zip