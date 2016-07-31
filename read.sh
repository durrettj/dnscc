#!/bin/sh
source ./config
cat /var/lib/bind/query.log| awk '/.'"$zone"'/'| cut -f2- -d ":" | awk '/IN A /' | cut -f2- -d ":"|sed 's/\.s.*//'|cut -f2- -d " "|xxd -p -c 14 -r 

