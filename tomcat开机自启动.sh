#!/bin/sh
# chkconfig: 345 99 10
# description: Auto-starts tomcat
# /etc/init.d/tomcat8
# chkconfig --add tomcat8
RETVAL=0
export JAVA_HOME=/usr/local/jdk9
export CATALINA_HOME=/usr/local/tomcat8
export CATALINA_BASE=/usr/local/tomcat8
start()
{
        pid=$(ps -ef| grep $CATALINA_HOME |grep -v grep | awk '{print $2}' )
        if [ -n "$pid" ];then
                echo "$CATALINA_HOME already started"
                return $RETVAL
        fi
        if [ -f $CATALINA_HOME/bin/startup.sh ];then
            echo $"Starting $CATALINA_HOME"
            $CATALINA_HOME/bin/startup.sh
            RETVAL=$?
            echo "$CATALINA_HOME started"
            return $RETVAL
        fi
}
stop()
{
        if [ -f $CATALINA_HOME/bin/shutdown.sh ];then
            echo $"Stopping $CATALINA_HOME"
            $CATALINA_HOME/bin/shutdown.sh
            RETVAL=$?
            sleep 1
            pid=$(ps -ef| grep $CATALINA_HOME |grep -v grep | awk '{print $2}' )
            if [ -n "$pid" ];then
                kill -9 $pid
                RETVAL=$?
                echo "$CATALINA_HOME stopped"
            else
                echo "$CATALINA_HOME stopped"
            fi
            return $RETVAL
        fi
}
status()
{

        pid=$(ps -ef| grep $CATALINA_HOME |grep -v grep | awk '{print $2}' )
        if [ -n "$pid" ];then
                echo "$CATALINA_HOME is running"
        else
                echo "$CATALINA_HOME is not runnng"
        fi
}
case "$1" in
 start)
        start
        ;;
 stop)
        stop
        ;;
 status)
        status
        ;;
 restart)
         echo $"Restaring Tomcat"
         $0 stop
         sleep 1
         $0 start
         ;;
 *)
        echo $"Usage: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac
exit $RETVAL

修改文件权限
chmod 755 /etc/init.d/tomcat8
设置开机启动
chkconfig tomcat8 on
查看开机启动的服务
chkconfig --list
其他
启动服务：service tomcat8 start
停止服务：service tomcat8 stop
重启服务：service tomcat8 reload

