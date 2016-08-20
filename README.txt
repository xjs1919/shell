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

4.重定向
http://blog.csdn.net/newthinker_wei/article/details/8219081
0: Standard Input (STDIN) 
1: Standard Output (STDOUT) 
2: Standard Error Output (STDERR) 
举例：
ls a.txt b.txt  1>file.out 2>file.err 
把正确结果保存到file.out，异常结果保存到file.err 

一般来说, "1>" 通常可以省略成 ">"
ls a.txt b.txt  >file.out 2>file.err，与上面的一个意思

1>&2  正确返回值传递给2输出通道 &2表示2输出通道，不写&代表名字为2的文件
2>&1  错误返回值传递给1输出通道,同样&1表示1输出通道. 

ls a.txt b.txt 1>file.out 2>&1 
把正确结果保存到file.out，异常结果保存到1通道，也就是也保存到file.out


