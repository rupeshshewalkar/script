#!/bin/bash
#Write a script that will use command substitution to dynamically set variable values:
#TODAYSDATE - should contain date/time stamp when executed
#USERFILES - the results of a fine run on the /home directory to list all files owned by 'user' account
#Additionally, set two aliases:
#TODAY - should be an alias for the 'date' command
#UFILES - should be an alias to the full command used to set the variable USERFILES above
#Finally, display all variables and alias values when the script is run.

TODAYSDATE=`date`
USERFILES=`ls -al /home/user`

echo "Todays date : $TODAYSDATE"
echo "User Files : $USERFILES"

alias TODAY='date'
alias UFLIES='ls -al /home/user'

TODAY 
UFLIES
