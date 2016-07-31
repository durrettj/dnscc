#!/bin/sh
lookup_name=''
eval `drill +short AAAA '$lookup_name' | awk '/ANSWER SECTION/,/AUTHORITY SECTION/' | sed
 -e 's/:a00:/g/' | sort -n | cut -f2- -d':' | tr -d ':' | /usr/local/bin/xxd -p -c 14 -r`

