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
