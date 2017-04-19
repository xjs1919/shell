#!/bin/bash
# mysql data backup script
#
cd `dirname $0`
SH_DIR=`pwd`
DATA_DIR=$SH_DIR/data
LogFile=$SH_DIR/log.txt
DATE=`date "+%Y-%m-%d-%H-%M-%S"`

echo " " >> $LogFile
echo " " >> $LogFile
echo "-------------------------------------------" >> $LogFile 
echo $DATE  >> $LogFile 
echo "-------------------------------------------" >> $LogFile 

if [ ! -d $DATA_DIR ];then 
    mkdir $DATA_DIR
fi 

cd $DATA_DIR
DumpFile="$DATE.sql"
GZDumpFile="$DATE.sql.tar.gz"
echo "Backup Start" 
echo "Backup Start" >> $LogFile 

/usr/bin/mysqldump -uroot -pspark2017 peak -h127.0.0.1 > "$DumpFile"
echo "Dump Done"  >> $LogFile

tar czvf "$GZDumpFile" "$DumpFile"
echo "Compress Done"  >> $LogFile

rm -f "$DumpFile" 
find $DATA_DIR -mtime +3 -type f -name "*.tar.gz" | xargs rm -f

cd $SH_DIR   
echo "Backup Done" 
echo "Backup Done" >> $LogFile 