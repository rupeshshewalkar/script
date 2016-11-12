#!/bin/bash
#Write a script that runs three commands:
#1.Evaluate an arithmetic expression
#2.Attempt to remove a file that does not exist in the current directory
#3.Evaluate another arithmetic expression
#Immediately after each command, echo the exit status of that command to the terminal using the appropriate variable to show success and failure exit codes.
set -e
expr 1 + 5
echo $?
 
rm doodles.sh
echo $?
 
expr 10 + 10
echo $?
