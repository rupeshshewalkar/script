#!/usr/bin/python
import subprocess

def uname():
   print " Uname command called :\n"
   subprocess.call(["uname", "-a" ])

def disk():
   print "\n Disk usages :\n"
   subprocess.call(["df", "-h"])

def cpuinfo():
   print "\n CPUINFO is :\n"
   subprocess.call(["cat","/proc/cpuinfo"]) 

def main():
   uname()
   cpuinfo()
   disk()

if __name__== "__main()__":
   main()
