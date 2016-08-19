一些常用的shell命令

1.获取执行shell时候的命令字符串：

#!/bin/bash
echo $0

root@7501d778d64a:/usr/local/tomcat7# /usr/local/tomcat7/aa.sh 
/usr/local/tomcat7/aa.sh

root@7501d778d64a:/usr/local/tomcat7# ./aa.sh 
./aa.sh

2.获取当前shell的pid

#!/bin/bash
echo $$

3.获取当期shell文件所在的绝对路径

basepath=$(cd `dirname $0`; pwd)
echo $basepath
