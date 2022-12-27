#!/bin/bash
if [[ $# -eq 0 ]] ; then
echo "THIS SCRIPT IS DESIGNED FOR UBUNTU TO ADD YOUR DOMAIN TO SYSTEM HOSTS FILE. USAGE:sudo bash <hostchecker.sh> <domain name>"
exit 0
fi
if grep -q $1 /etc/hosts
  then echo "$1 domain already exists!"
else
    echo "127.0.0.1 $1" >> /etc/hosts
fi