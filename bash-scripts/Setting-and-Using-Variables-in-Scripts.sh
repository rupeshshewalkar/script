#!/bin/bash
#Write a script that sets FOUR variables:
#MYUSERNAME
#MYPASSWORD
#STARTOFSCRIPT
#ENDOFSCRIPT
#Populate the first two with some default value and use command redirection to set the third and fourth value to the date/time of when the script was started and completed. Within the script, be sure to disply the values to the terminal when run.

MYUSERNAME="rupesh"
MYPASSWORD="******"
STARTOFSCRIPT=`date`

echo "SCRIPT Starting time : $STARTOFSCRIPT"
echo "Enter user name & password"
echo "Username : $MYUSERNAME"
echo "Password : $MYPASSWORD"
ENDOFSCRIPT=`date`
echo "SCRIPT End time : $ENDOFSCRIPT"
