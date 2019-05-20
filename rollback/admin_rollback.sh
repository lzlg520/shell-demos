#!/bin/bash
#项目发布失败，回滚项目
#回退版本
#admin项目
#找到最新版本的admin.war
LAST_VERSION=$(ls -lt /tt/www/admin-tomcat9/backup | grep admin.war | head -n 1 |awk '{print $9}')
echo "The last version admin project is $LAST_VERSION"
#找到admin进程并杀死
pids=$(ps -ef | grep admin-tomcat9 | grep -v grep | awk '{print $2}')
arr=(${pids// / })
for data in ${arr[@]}
do
    echo ${data}
    kill -9 ${data}
done
#将离最近版本的admin部署，并重启tomcat
cd /tt/www/admin-tomcat9/webapps/
rm -rf admin
rm -rf admin.war
cd /tt/www/admin-tomcat9/backup
cp $LAST_VERSION /tt/www/admin-tomcat9/webapps/
mv /tt/www/admin-tomcat9/webapps/$LAST_VERSION /tt/www/admin-tomcat9/webapps/admin.war
export BUILD_ID=dontKillMe
/tt/www/admin-tomcat9/bin/startup.sh