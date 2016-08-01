#!/usr/bin/python
import tarfile, sys

#filename = raw_input("enter the filename to extract: ")

tar=tarfile.open(sys.argv[1],'r:gz')

print tar.list(verbose=True)

print tarinfo.name
