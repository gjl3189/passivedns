#!/bin/sh
ps -ef| grep passivedns | awk '{print $2}' | xargs kill -9
source /root/.bash_profile
ipip=`ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}'`
dfile=`date "+%Y-%m-%d_%H-0-0"`
mv /usr/local/cc-shadowsocks/statistics/dns_access.log /usr/local/cc-shadowsocks/statistics/logs/${dfile}_${ipip}_dns_access.log
cd /usr/local/cc-shadowsocks/statistics/logs/
tar -czvf ${dfile}_${ipip}_dns_access.tar.gz ${dfile}_${ipip}_dns_access.log
/usr/local/cc-shadowsocks/statistics/passivedns -D -i eth0 -l /usr/local/cc-shadowsocks/statistics/dns_access.log &

#delete log
logdir=/usr/local/cc-shadowsocks/statistics/logs/
filename=`date -d "-15 day" +%Y-%m-%d`
delfile=${logdir}/${filename}*
echo $delfile
rm -rf $delfile
