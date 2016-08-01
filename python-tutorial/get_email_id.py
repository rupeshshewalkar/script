#!/usr/bin/python
#
# Usages: get all urls OR links associate with specific URL

import requests, re

try:
    enter_url=raw_input("Enter URL including http:// : " )


    ## connect to requested URL
    connect_url=requests.get(enter_url)

    ## Get requested URL page & store in text form

    requested_html=connect_url.text

    ## find all links from requested URL 

    all_links=re.findall( '"((http|ftp)s?://.*?)"', requested_html)


    ## print all links

    for all_link in all_links:
        connect_each_url=requests.get(all_link[0])
        requested_each_html=connect_each_url.text
        emails = re.findall('([\w\.,]+@[\w\.,]+\.\w+)', requested_each_html)
        print "\nAll Email Ids found in a ", all_link[0]
        print "---------------------------------------------------------------------------"
        if len(emails)==0:
             print "\nNo mail id found on ", all_link[0]
        else:
             for email in emails:
                print(email)
except:
    print " \nYou entered either wrong url or doesn't include http:// before url "

