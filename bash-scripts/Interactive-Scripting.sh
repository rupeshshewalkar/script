#!/bin/sh
#Create a script that interacts with the user. You will want to prompt the user to enter the following information (which you will capture and place into the following variables):
#FIRSTNAME
#LASTNAME
#USERAGE
#Greet the user with their name and current age displayed and then calculate and display their age in 10 year
clear

read -p " Type Your Firstname :" FIRSTNAME
echo -e "\n"
read -p " Type Your Lastname  :" LASTNAME
echo -e "\n"
read -p " Type Your AGE       :" USERAGE
echo -e "\n"
echo -n " Your Age after 10 Years is " 
expr $USERAGE + 10
