#!/bin/sh
ps -ef| grep passivedns | awk '{print $2}' | xargs kill -9
source /root/.bash_profile
mv /usr/local/cc-shadowsocks/statistics/dns_access.log /usr/local/cc-shadowsocks/statistics/logs/`date "+%Y-%m-%d_%H:0:0_dns_access.log"`
/usr/local/cc-shadowsocks/statistics/passivedns -D -i eth0 -l /usr/local/cc-shadowsocks/statistics/dns_access.log &
