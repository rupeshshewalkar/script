#!/usr/bin/python

# Given a list of strings, return the count of the number of
# strings where the string length is 2 or more and the first
# and last chars of the string are the same.

def count_string(words):
    count = 0 
    print words
    for string in words:
        #print string
        #print len(string)
        if len(string)>=2 and string[0]==string[-1]:
            count=count+1
    return count


#if __name__ == "__main()__" :
input_srting = [ 'xxax', 'asasa', 'paaq'] 
total_find=count_string (input_srting)
print total_find 

