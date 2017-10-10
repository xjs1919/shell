#!/bin/sh
# chkconfig: 345 99 10
# description: Auto-starts mysql3333
# /etc/init.d/mysql3333
# chkconfig --add mysql3333
RETVAL=0
MYSQL_HOME=/usr/local/mysql/
MYSQL_3333_CONF=/usr/local/mysql/3333/my.cnf
MYSQL_SERVICE_NAME=mysql3333
start()
{
        pid=$(ps -ef| grep $MYSQL_3333_CONF |grep -v grep | awk '{print $2}' )
        if [ -n "$pid" ];then
                echo "$MYSQL_SERVICE_NAME already started"
                return $RETVAL
        fi
        if [ -f $MYSQL_HOME/bin/mysqld_safe ];then
            echo $"Starting $MYSQL_SERVICE_NAME"
            $MYSQL_HOME/bin/mysqld_safe --defaults-file=$MYSQL_3333_CONF &
            RETVAL=$?
            echo "$MYSQL_SERVICE_NAME started"
            return $RETVAL
        fi
}
stop()
{
        if [ -f $MYSQL_HOME/bin/mysqld_safe ];then
            echo $"Stopping $MYSQL_SERVICE_NAME"
            pid=$(ps -ef| grep $MYSQL_3333_CONF |grep -v grep | awk '{print $2}' )
            if [ -n "$pid" ];then
                kill -9 $pid
                RETVAL=$?
                echo "$MYSQL_SERVICE_NAME stopped"
            else
                echo "$MYSQL_SERVICE_NAME stopped"
            fi
            return $RETVAL
        fi
}
status()
{
        pid=$(ps -ef| grep $MYSQL_3333_CONF |grep -v grep | awk '{print $2}' )
        if [ -n "$pid" ];then
                echo "$MYSQL_SERVICE_NAME is running"
        else
                echo "$MYSQL_SERVICE_NAME is not runnng"
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
         echo $"Restaring $MYSQL_SERVICE_NAME"
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

