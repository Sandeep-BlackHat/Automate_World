#!/bin/bash

# if there is a current file from a past run, then copy it to previous
if [ -f nmap_current.xml ];then
   cp nmap_current.xml nmap_previous.xml
fi

# run nmap
/usr/bin/nmap -sT -A -iL ips.txt -oA nmap_current

# if there is not a previous file then there is no point running ndiff
# this will fix itself on the next run
if [ -f nmap_previous.xml ];then
   /bin/ndiff nmap_previous.xml nmap_current.xml >> ndiff_out.txt
fi
