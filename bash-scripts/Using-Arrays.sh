#!/bin/sh
#Write a script intended to iterate through an array called SERVERLIST containing at least four values (server names). Display all four values to the terminal when run.

SERVERLIST=( "host1" "host2" "host3" "host4" )

COUNT=0

for INDEX in ${SERVERLIST[*]}; do

echo " Processing server is : ${SERVERLIST[COUNT]}"
COUNT="`expr $COUNT + 1`"
done
