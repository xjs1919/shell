һЩ���õ�shell����

1.��ȡִ��shellʱ��������ַ�����

#!/bin/bash
echo $0

root@7501d778d64a:/usr/local/tomcat7# /usr/local/tomcat7/aa.sh 
/usr/local/tomcat7/aa.sh

root@7501d778d64a:/usr/local/tomcat7# ./aa.sh 
./aa.sh

2.��ȡ��ǰshell��pid

#!/bin/bash
echo $$

3.��ȡ����shell�ļ����ڵľ���·��

basepath=$(cd `dirname $0`; pwd)
echo $basepath

4.�ض���
http://blog.csdn.net/newthinker_wei/article/details/8219081
0: Standard Input (STDIN) 
1: Standard Output (STDOUT) 
2: Standard Error Output (STDERR) 
������
ls a.txt b.txt  1>file.out 2>file.err 
����ȷ������浽file.out���쳣������浽file.err 

һ����˵, "1>" ͨ������ʡ�Գ� ">"
ls a.txt b.txt  >file.out 2>file.err���������һ����˼

1>&2  ��ȷ����ֵ���ݸ�2���ͨ�� &2��ʾ2���ͨ������д&��������Ϊ2���ļ�
2>&1  ���󷵻�ֵ���ݸ�1���ͨ��,ͬ��&1��ʾ1���ͨ��. 

ls a.txt b.txt 1>file.out 2>&1 
����ȷ������浽file.out���쳣������浽1ͨ����Ҳ����Ҳ���浽file.out


