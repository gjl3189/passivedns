logdir=/usr/local/cc-shadowsocks/v3/logs
filename=`date -d "-15 day" +%Y-%m-%d`

delfile=$logdir"/"$filename"*.log"
rm -rf $delfile
