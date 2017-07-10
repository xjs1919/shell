#!/bin/bash
#crontab: 59 23 * * * /bin/sh     /usr/local/log_backup/log.sh

src_logfile=/usr/local/tomcat-front/logs/catalina.out
dst_name_prefix=front

today=`date '+%Y-%m-%d'` 
dst_logfile=$dst_name_prefix.$today.log 

basepath=$(cd `dirname $0`; pwd)
cp $src_logfile $basepath/logs/$dst_logfile

cat /dev/null > $src_logfile
find $basepath/logs -mtime +6 -type f -name "$dst_name_prefix.*.log" | xargs rm -f

