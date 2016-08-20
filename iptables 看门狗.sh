#!/bin/sh
#https://xiaobin.net/201604/iptables-watchdog
/sbin/service iptables status >/dev/null 2>&1
if [ $? -gt 0 ]; then
    if [ $(/usr/bin/who | wc -l) = 0 ]; then
        /etc/init.d/iptables start
    fi
fi