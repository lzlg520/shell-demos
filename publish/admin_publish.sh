#!/bin/bash
#使用该命令前默认该shell存放在用户家目录下 cd ~
#使用该命令前，admin项目的war包已上传
#预生产环境使用的shell命令
#admin项目发布
#备份旧项目
NOW=`date +%Y%m%d.%H%M`
cp /tt/www/admin-tomcat9/webapps/admin.war /tt/www/admin-tomcat9/backup/admin.war.$NOW
#找到进程id，并杀死进程
pids=$(ps -ef | grep admin-tomcat9 | grep -v grep | awk '{print $2}')
arr=(${pids// / })
for data in ${arr[@]}
do
    echo ${data}
    kill -9 ${data}
done
#复制admin项目到webapps下，并启动tomcat
cd /tt/www/admin-tomcat9/webapps/
rm -rf admin
rm -rf admin.war
#从预生产环境中拉取war包（生产环境使用）
#java -cp /lib/*:/targetBookmark/classes aOPtool.sshFileDownSvrs http://root:pdm#1921@172.19.162.236:22/tt/www/admin-tomcat9/webapps/admin.war /tt/www/admin-tomcat9/webapps/
#修改配置文件，将环境改为生产环境
#FILE="application.yml"
#cd /tt/www/admin-tomcat9/webapps/admin/WEB-INF/classes/
#sed -i "s/active: pre/active: prod/" $FILE
cd ~
mv tt-admin-0.0.1-SNAPSHOT.war admin.war
cp admin.war /tt/www/admin-tomcat9/webapps/
rm -rf ~/admin.war
export BUILD_ID=dontKillMe
/tt/www/admin-tomcat9/bin/startup.sh