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
        print all_link[0]
except:
    print " You entered either wrong url or doesn't include http:// before url "

