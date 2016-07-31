#!/bin/sh
source ./config
n=2000
echo server $server 
echo zone $zone 
echo prereq yxrrset $record AAAA
echo update delete $record 
echo send
for b in `xxd -p -c 14 $1 | sed 's/..../&:/g' | sed 's/:$//' `; do
 f=$n:$b
 f=`echo $f | sed 's/:..$/&00/'`
 f=`echo $f:0000:0000:0000:0000:0000:0000:0000:0000 | head -c39`
 echo update add $record 10 AAAA $f
 n=$((n+1));
done
echo send
