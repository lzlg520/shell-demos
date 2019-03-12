#!/usr/bin/env bash
SHELL="/bin/bash"
if [ "$SHELL" = "/bin/bash" ]; then
    echo "your login shell is the bash \n"
    echo "SHELL is : $SHELL"
else
    echo "your login shell is not bash bug $SHELL"
fi


[ -f "/etc/shadow" ] && echo "This computer use shadow passwords"
if [ -f "/etc/shadow" ]; then
    echo "电脑密码使用了隐藏字符"
else
    echo "没有使用隐藏字符"
fi