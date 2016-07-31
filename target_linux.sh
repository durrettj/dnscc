#!/bin/sh 
lookup_name=""
eval `dig +short AAAA '$lookup_name' | sort -n  | cut -f2- -d':' | tr -d ':' | xxd -p -c 14 -r`
