#!/bin/sh
# Author : Rupesh Shewalkar
# Date   : 1 June 2016
# Usages : To delete mysql bin log from master server when disk space full 
#          This script can be integrate with nagios using event handler, so whenever disk space reached to critical stage
#          it will automatically delete some bin log file from master 
## This Section will check all required binary are present in OS & correct path already set for them
for cmd in mysql awk grep mail 
do
 if ! `which ${cmd} &>/dev/null`
 then
  echo "UNKNOWN: This script requires the command '${cmd}' but it does not exist; please check if command exists and PATH is correct"
  exit ${STATE_UNKNOWN}
 fi
done


## MYSQL VARIABLES DECLARATION
MYSQL_USER="root"
MYSQL_PASSWORD="root"
MYSQL_CFG="/etc/my.cnf"

## list slave
function get_slave_host() {

SLAVE_HOSTS=`mysql -u$MYSQL_USER -p$MYSQL_PASSWORD  -e "show processlist" 2>/dev/null | egrep -i "Binlog Dump" | awk 'BEGIN{FS="\t"} {print $3}' | cut -d ':' -f1`

if [ -z "$SLAVE_HOSTS" ]; then
    echo "No slave host connected to this master, so purging of binary log not possible"
    exit 0 
fi
}

## Disk space  which the bin-logs reside on the Master

function disk_size() {

##find out where binlog present
LOG_PATH=`cat $MYSQL_CFG|grep log-bin | awk -F = '{ print $2}'`

## Find out disk size

USED_DIR_PATH=`echo ${LOG_PATH%/*}`

USED_SIZE=`df -P $PART_NAME |( grep ^/dev) |awk '{ print $5 }' | cut -d% -f1`

}



##main

## calculating disk size
disk_size

##
if [[ $USED_SIZE -ge 20  ]]; then

    ## Called get_slave_host which give list of slave servers connected to master
     get_slave_host
   
    ## Find out latest master bin log file being used by the slave
        for i in $SLAVE_HOSTS;
         do 
             ## This will give you currently used binlog file number ( such as if file is mysql-bin.00004 then number will 00004) from each slave server
             binlogv=`mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -h $i -e "show slave status\G" 2>/dev/null | grep "Relay_Master_Log_File:" | awk -F"." '{print $2}'`;
             ## This will give list of all binlog number from each slave server ( like 00004:00005:00006)
             binlogval="$binlogval:$binlogv";
         done; 
        
        #Find the value of the least binary log
         lowestvalue=`echo $binlogval | tr ':' '\n' | grep ^[0-9] | sort -n | head -1`
         safe_binlog="mysql-bin."$lowestvalue
         #Find the last second of the least binary logs for purging (safe)
         last_binlog=`echo "$safe_binlog" | awk -F"." '{ res=$2 - 1 ; difflen=length($2) - length(res); if(difflen > 0){for(i=1;i<=difflen;i++){str=str 0}}print $1 "." str res}'`
    ##Delete binary log from master
    purge_binlog=`mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -e "PURGE BINARY LOGS TO '$last_binlog';" 2>/dev/null`
    if [ $? -eq 0 ]; then 
    	echo "Binary logs from master have been purged upto $last_binlog"
    else 
    	echo "No more deletaion of bin-log possible contact to your system administrator"
        ## Mail notification 
	# email subject
        #SUBJECT="Alert:Auto Purging of bin-log failed"
        # Email To ?
        #EMAIL="ops@alertalert.com" 
        # Email text/message
        #EMAILMESSAGE="/tmp/emailmessage.txt"
        #echo "Auto Purging of bin log failed, due to following reason"> $EMAILMESSAGE
        #echo "Disk full & no more possible bin-log files to delete from $USED_DIR_PATH" >>$EMAILMESSAGE
        # send an email using /bin/mail
        #/bin/mail -s "$SUBJECT" "$EMAIL" < $EMAILMESSAGE  
      
    fi


else
    echo "Less than 80% of disk space being used.Aborting purging of logs"
fi
