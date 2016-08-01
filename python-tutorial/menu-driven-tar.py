#!/usr/bin/python
# Author : Rupesh Shewalkar
# Date   : 23 July 2016
# Usages : 
#1. Open the tar file.
#2. Present the menu and get the user selection.
#3. If you press 1, the program prompts you for the file name in the archive to extract the current directory to and then extracts the file.
#4. If you press 2, the program prompts you for the file name and then displays the file information.
#5. If you press 3, the program lists all the files in the archive.


import tarfile, sys

try:
    #opening tar file in read mode
    tar=tarfile.open(sys.argv[1],'r:gz')
    
    # Present menu and get selection 
    selection = raw_input("Enter\n\
    1) Extract a file from tar.gz file\n\
    2) To display information on a file in the archive\n\
    3) To list all the files in the archive\n\n")

   #perform actions based on selection above
   
    if selection == "1":
        filename=raw_input("Enter the filename to extact:")
        tar.extract(filename)
    elif selection == "2":
        filename=raw_input("Enter the filename to inspect:")
        for tarinfo in tar:
            print tarinfo.name
            if tarinfo.name == filename:
                 print "\n Filename:\t\t", tarinfo.name, "\n Size:\t\t", tarinfo.size, "Bytes\n"
    elif selection == "3":
        print tar.list(verbose=True)
    else:
        print "you have not selected option OR selected wrong option"

except:

    print "There was a problem running the program"
