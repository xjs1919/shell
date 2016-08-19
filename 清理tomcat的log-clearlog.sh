#!/bin/bash
basepath=$(cd `dirname $0`; pwd)
DATE=`date '+%Y-%m-%d'` 
LOGFILE=catalina.$DATE.out 
cp $basepath/../logs/catalina.out $basepath/../logs/$LOGFILE
cat /dev/null > $basepath/../logs/catalina.out
find $basepath/../logs -mtime +6 -type f -name "catalina.*.out" | xargs rm -f