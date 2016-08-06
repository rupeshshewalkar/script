#!/bin/bash
#Usages: Block mail spammer using iptables
#

#location of script & its files & directories
#
SCRIPT_DIR=/root/mailspammer

# iptables path
IPT=/sbin/iptables
# change this to the maximum number of rejected attempt your server will authorize
LIMIT=10 

# Path of mail log usually it is in /var/log i.e mail.info or maillog
LOGPATH=/var/log/mail.info

# Spammer blocked by this script log path
BLOCK_LOGPATH=$SCRIPT_DIR/blocked-spammer.log

# list of IP address which blocked by this script
BLOCK_IP_LIST=$SCRIPT_DIR/blocked-ip-address.txt

#change this to the path where youinstall the script
cd $SCRIPT_DIR 

# first get one minute of log
grep "`date +"%b %d %H:%M:" --date="5 minutes ago"`" $LOGPATH > minutelog
# now extract the rejected attempts, sort and count uniq ip
cat minutelog | grep "reject:" | cut -d" " -f10 | cut -d"[" -f2 | cut -d"]" -f 1 | sort | uniq -c | sort -n | sed 's/^[ \t]*//' > tmp1
# for each line in result
while read line
do
  MYCOUNT=`echo $line | cut -d" " -f1`
  MYIP=`echo $line | cut -d" " -f2`

  if  [ $MYCOUNT -lt $LIMIT ] ; 
  then
    echo $MYIP is ok: $MYCOUNT attempts 
  else
    echo blocking the spammer at $MYIP with $MYCOUNT attempts >> $BLOCK_LOGPATH 
    $IPT -I INPUT -i eth0 --proto tcp -s $MYIP --destination-port 25 -j DROP
    echo $MYIP >> $BLOCK_IP_LIST # log blocked ip to file
  fi
done < tmp1
# remove temp files
rm -f minutelog
rm -f tmp1

