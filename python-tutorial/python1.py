#!/usr/bin/python 
var1='this is string'
var2="this is string with double qouate"

var3=3.14
var4=3.14

print var1
print var2
print var1 + "| " + var2
print 2 * var3
print var3 + var4


var5=[1,2,3,4,'digit']

print var5
print var5[2]
print var5[2:5]
print var5[2:]
print var5[:2]

var5[3]=1000

print var5

var6=(2,4,6,'test')

print var6

print var6[2:]


var7={ 'name':'rupesh', 'employee-id':111, 'address':'navi mumbai' }

print var7
print var7['name']
var7['name']='shewalkar'
print var7


var8=2
if var8==1:
   print "var8 is equal to one" 
else:
   print "variable not equal to one"


while var8==1:
   print "testing"
else:
   print "variable not equal to one"

list=[1,2,3,4,5,6,7,8,9,10]

for i in list:
   print i+1

	
