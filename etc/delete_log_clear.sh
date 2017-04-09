logdir=/usr/local/cc-shadowsocks/v3/logs/
for((i=15;i<=350;i++));  
do  
filename=`date -d "-$i day" +%Y-%m-%d`
delfile=$logdir"/"$filename"*.log"
rm -rf $delfile
echo $delfile 
done
