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
