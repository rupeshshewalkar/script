#!/usr/bin/python
# Author: Rupesh Shewalkar
# Date  : 23 July 2016
# Usages:
#Search for files and show permissions
#1. Get the search pattern from the user.
#2. Perform the search.
#3. Print a listing of files found.
#4. Using the stat module, get permissions for each file found.
#5. Present the results to the user
## We installed texttable module from pip install using pip install texttable command

import commands, texttable, os, stat, string, pwd
try:
    #  Getting search pattern from user & assigning it to list 
    pattern=raw_input("Enter the file pattern to search for :\n")
    command_search="find " + pattern
    command_output=commands.getoutput(command_search)
    find_result=string.split(command_output, "\n")
   
    #For Tabular output
    table = texttable.Texttable()
   
    # For calculation file permission 
    def file_permission(filename):
        return oct(stat.S_IMODE(os.stat(filename).st_mode))
    
    # For calculation file ownership 
    def file_owner(filename1):
        return pwd.getpwuid(os.stat(filename1).st_uid).pw_name
    # For calculation file group permission
    def file_gowner(filename):
        return pwd.getpwuid(os.stat(filename).st_gid).pw_name
    #Printing Result
    for file in find_result:
       file_per=file_permission(file)
       file_own=file_owner(file)
       file_gown=file_gowner(file)
       table.add_rows([["File Name","Permission","User Ownership","Group Ownership"],[file,file_per,file_own,file_gown]])
   
    print table.draw() + "\n"
 
except:
     print "No such file/dirctory found! Please try with other parttern"
