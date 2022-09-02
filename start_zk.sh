#! /bin/bash
mkdir -p /data/app/log/
/etc/init.d/zookeeper start
# sleep infinity

while true
do
    PID=$(cat /tmp/zookeeper/zookeeper_server.pid)
    if ps -p $PID > /dev/null
    then
        sleep 1
    else
        echo "zookeeper not running"
        exit 1
    fi
done