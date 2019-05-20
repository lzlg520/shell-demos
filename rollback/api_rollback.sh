#!/bin/bash
#项目发布失败，回滚项目
#回退版本
#api项目
#找到最新版本的api.war
LAST_VERSION=$(ls -lt /tt/www/api-tomcat9/backup | grep api.war | head -n 1 |awk '{print $9}')
echo "The last version api project is $LAST_VERSION"
#找到api进程并杀死
pids=$(ps -ef | grep api-tomcat9 | grep -v grep | awk '{print $2}')
arr=(${pids// / })
for data in ${arr[@]}
do
    echo ${data}
    kill -9 ${data}
done
#将离最近版本的api部署，并重启tomcat
cd /tt/www/api-tomcat9/webapps/
rm -rf api
rm -rf api.war
cd /tt/www/api-tomcat9/backup
cp $LAST_VERSION /tt/www/api-tomcat9/webapps/
mv /tt/www/api-tomcat9/webapps/$LAST_VERSION /tt/www/api-tomcat9/webapps/api.war
export BUILD_ID=dontKillMe
/tt/www/api-tomcat9/bin/startup.sh
