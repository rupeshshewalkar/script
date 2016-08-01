#!/usr/bin/python

# Given a list of strings, return a list with the strings
# in sorted order, except group all the strings that begin with 'x' first.
# ['xanadu', 'xyz', 'aardvark', 'apple', 'mix']
# Hint: this can be done by making 2 lists and sorting each of them
# before combining them.

list=['rupesh','xrupesh', 'srupesh', 'Xshewalkar','Xzbc','Xabc', 'xabc']

list1=[]
list2=[]
list3=[]
for list_item in list:
    if list_item[0]=='x' or list_item[0]=='X':
        list1.append(list_item) 
    else:
        list2.append(list_item)

list1.sort()
list2.sort()
list3 = list1 + list2

print list3
