## 1.获取执行shell时候的命令字符串
```bash
#!/bin/bash
echo $0
```
```
举例：
root@7501d778d64a:/usr/local/tomcat7# /usr/local/tomcat7/aa.sh
/usr/local/tomcat7/aa.sh
root@7501d778d64a:/usr/local/tomcat7# ./aa.sh
./aa.sh
```
## 2.获取当前shell的pid
```bash
#!/bin/bash
echo $$
```

## 3.获取当期shell文件所在的绝对路径
```bash
basepath=$(cd `dirname $0`; pwd)
echo $basepath
```

## 4.重定向
```
参考：http://blog.csdn.net/newthinker_wei/article/details/8219081
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
```

## 5.sqlplus中使用删除键、上下左右键乱码问题
```bash
yum install rlwrap
yum install readline-devel
vim /home/oracle/.bash_profile  
alias sqlplus='rlwrap sqlplus'  
alias rman='rlwrap rman'  
```

## 6.查看系统的版本信息
```bash
lsb_release -a
yum install redhat-lsb -y #可以进行安装
```
##  7.VI编辑器
	1、显示行号 set number  
	2、跳转到某一行 :n或者nG  
	3、跳转行首0，行位$，当前页的第一行H，当前页的最后一行L
	4、跳转到文件尾 G  
	5、删除一行 dd  
	6、删除整个文件内容 dG  
	7、查找 :/src 按下n可以跳转到下一处  
	8、替换 :1,$s/src/dst/g 从第一行到末尾，所有的src替换成dst  
	9、撤销 u
	10、反撤销 crtl+r
	11、保存ZZ
----------

## 8.创件没有登录权限的用户
```bash
groupadd groupname  #创建组
useradd -g groupname username -s /sbin/nologin    #-s为默认shell，默认给予shell，但是不给登录shell
```
或者：
```bash
vi /etc/passwd
username:x:502:502::/home/username:/sbin/nologin
```
----------

### 9.查看cpu利用率 ###
	1、top 按下数字1 显示每个cpu的利用率
	2、mpstat -P ALL 
	3、sar -P ALL
----------

### 10.重命名rm ###
	1、vi ~/.bashrc
```bash
alias rm=trash
alias r=trash
alias rl='ls /data/rubbish'
alias ur=undelfile
undelfile()
{
  mv -i /data/rubbish/\$@ ./
}
trash()
{
  mv $@ /data/rubbish
}
```
	2、source  ~/.bashrc
----------

### 11.设置jvm内存参数 ###
```bash
JAVA_OPTS="-XX:+UseG1GC -XX:MaxGCPauseMillis=100 -Xms2048M -Xmx2048M -XX:MetaspaceSize=64M -XX:+UseStringDeduplication -XX:StringDeduplicationAgeThreshold=3 -XX:+DisableExplicitGC -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=$CATALINA_HOME/logs/ -XX:+PrintGC -XX:+PrintGCTimeStamps -XX:+PrintGCDateStamps -Xloggc:$CATALINA_HOME/logs/gc.log -XX:GCLogFileSize=30m -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=5"
```

### 12.ssh修改默认端口 ###
```sh
vi /etc/ssh/sshd_config
Port 22
Port 2222 # 添加2222端口
service sshd restart #重启ssh服务
修改防火墙，放行新的端口
```
### 13.iptables防火墙设置 ###
```sh
放行22和80端口
iptables -I INPUT -p tcp --dport 22 -j ACCEPT
iptables -I INPUT -p tcp --dport 80 -j ACCEPT
#允许本机
iptables -I INPUT -i lo -j ACCEPT
#允许向外
iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
#允许ping
iptables -I INPUT -p icmp -j ACCEPT
#禁止其他的端口
iptables -A INPUT -j REJECT
service iptables save
service iptables restart
```
### 14.centos7禁用firewalld，换用iptables.service #
```sh
#禁用firewalld防火墙：
systemctl disable firewalld
#安装iptables：
yum -y install iptables-services
systemctl enable iptables
systemctl start iptables
```

### 15.配置启用ip转发 ###
```sh
vim /etc/sysctl.conf
#配置转发
net.ipv4.ip_forward=1
#重启服务，让配置生效
systemctl restart network
#查看是否成功,如果返回为“net.ipv4.ip_forward = 1”则表示成功
sysctl net.ipv4.ip_forward
```
### 16.禁用SELinux###
```sh
vim /etc/selinux/config
SELINUX=disabled
# 查看
getenforce 
```

### 17.修改主机名 ###
```sh
vi /etc/hostname
my_new_hostname
vi /etc/sysconfig/network
HOSTNAME=my_new_hostname
vi /etc/hosts
127.0.0.1 my_new_hostname
```

### 18.换用163的yum源 [参考](http://mirrors.163.com/.help/centos.html) ###
首先备份/etc/yum.repos.d/CentOS-Base.repo
```sh
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
```
下载对应版本repo文件, 放入/etc/yum.repos.d/(操作前请做好相应备份)
- [CentOS7](http://mirrors.163.com/.help/CentOS7-Base-163.repo)
- [CentOS6](http://mirrors.163.com/.help/CentOS6-Base-163.repo)
- [CentOS5](http://mirrors.163.com/.help/CentOS5-Base-163.repo)

运行以下命令生成缓存
```sh
yum clean all
yum makecache
```
----------



