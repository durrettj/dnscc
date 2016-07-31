# dnscc
Scripts for AAAA records - client/server
DNSCC (Domain Name Service Command and Control) uses AAAA records to send commands to a remote machine which answers back to the DNS server. 

The purpose of these scripts is to analyze the traces this type of attack leaves on the network and in system logs. Most of the code in code in send.sh as well as the linux_target.sh was based on this github page: https://github.com/DShield-ISC/IPv6DNSExfil

With DNSCC you can:

Update A DNS server you control with AAAA records
Send a command to a remote machine eg ls /var/spool/mail
Extract a file from a remote machine eg /etc/passwd
Read the remote machines response

DNSCC should work on any *NIX. There is the ability to switch target scripts for FreeBSD and Linux which differ slightly in the default DNS tools. 

Quick Setup:

1. Edit the config file
2. Edit Target file (set the name to lookup) and put target file on target machine
3.  In the directory of DNSCC run ./dnscc.sh (you'll probably have to chmod +x all the scripts, of course) and follow the prompts.
4. For a nice interactive, on the remote machine install a crontab which calls the target script every minute.

Things to Note: 

The scripts use nsupdate without a key, so this should only be used in a test environment.  To configure  a local zone in bind to allow this use the directive:

allow-update { any; };

xxd is not installed by default on FreeBSD. It is part of the vim package which can be installed via ports.

For a more extensive write up on DNSCC ,  including detection see:

https://www.jedwarddurrett.com/20160731231114.php
