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
> 显示行号 set number  
> 跳转到某一行 :n或者nG  
> 跳转到文件尾 G  
> 删除一行 dd  
> 删除整个文件内容 dG  
> 查找 :/src 按下n可以跳转到下一处  
> 替换 :1,$s/src/dst/g 从第一行到末尾，所有的src替换成dst  
