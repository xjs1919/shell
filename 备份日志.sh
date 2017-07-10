#!/bin/bash
#crontab: 59 23 * * * /bin/sh     /usr/local/log_backup/log.sh

src_logfile=/usr/local/tomcat-front/logs/catalina.out
dst_name_prefix=front

today=`date '+%Y-%m-%d'` 
dst_name=$dst_name_prefix.$today.log 

base_path=$(cd `dirname $0`; pwd)
dst_log_dir=$base_path/logs/
if [ ! -d $dst_log_dir ];then 
    mkdir $dst_log_dir
fi 

cp $src_logfile $dst_log_dir/$dst_name

cat /dev/null > $src_logfile
find $dst_log_dir -mtime +6 -type f -name "$dst_name_prefix.*.log" | xargs rm -f