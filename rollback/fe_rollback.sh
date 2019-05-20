#!/bin/bash
#项目发布失败，回滚项目
#前端项目
#回退版本
LAST_VERSION=$(ls -lt /tt/app/backup | grep tt_app | head -n 1 |awk '{print $9}')
echo "The last version is $LAST_VERSION"
tar -zxvf /tt/app/backup/$LAST_VERSION -C /tt/app/