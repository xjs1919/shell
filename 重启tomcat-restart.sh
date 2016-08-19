#!/bin/bash
basepath=$(cd `dirname $0`; pwd)
echo $basepath
parentPath=$(dirname $basepath)
echo $parentPath
tomcatName=$(basename $parentPath)
echo $tomcatName
pid=$(ps -ef | grep $tomcatName | grep -v grep | grep -v "$0" |  awk '{print $2 }')
if [ -n "$pid" ];then
    kill -9 $pid
fi
exec "$basepath"/startup.sh