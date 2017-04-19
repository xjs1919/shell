crontab -l
MAILTO=""
#*/1 6-22 * * * /bin/sh /usr/java/monitor/monitor.sh

[root@iZm5eajr022qhjps4hvtgiZ java]# cat /usr/java/monitor/monitor.sh
#!/bin/bash

#env 
. /etc/profile
. ~/.bash_profile

cd `dirname $0`
BIN_DIR=`pwd`

result=-1

service_arr=(peak-service dubbo-monitor tomcat-front tomcat-mgr)
for i in ${!service_arr[@]}  
do  
    service=${service_arr[$i]}
    pid=$( ps -ef |grep $service | grep -v grep |  awk '{print $2 }')
    if [ -z "$pid" ];then
        result=$i
        exec $BIN_DIR/sendSms.sh $result
        exit 0
    fi
done

exec $BIN_DIR/sendSms.sh $result
