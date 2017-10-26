#!/bin/sh

# CRON
crontab -u root /root/bitcoin-cron
cron

# START MYSQL
service mysql start

#INIT DATABASE
mysqladmin -u root create bitcoin

mysql -u root bitcoin < /root/script.sql

for i in `seq $THREADS`; do 
  sh /root/core.sh &
done

tail -f /dev/null
