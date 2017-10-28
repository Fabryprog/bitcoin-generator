#!/bin/sh

# CRON
echo "1/5) Adding cron ..."

crontab -u root /root/cron
cron

echo "1/5) done!"

# START MYSQL
echo "2/5) Starting MySql Server ..."

service mysql start

echo "2/5) done!"

#INIT DATABASE
echo "3/5) Creating database ..."

mysqladmin -u root create bitcoin

echo "3/5) done!"
echo "4/5) Adding rows ..."

mysql -u root bitcoin < /root/script.sql

echo "4/5) done!"

# IMPORT USED ADDRESS
echo "5/5) Adding used address ..."

if [ -f "/opt/bitcoin-generator/$ADDRESS" ]; then
    mysql -u root bitcoin < /opt/bitcoin-generator/$ADDRESS
else
    mysql -u root bitcoin < /root/used_address.sql
fi

echo "5/5) Init complete!"

for i in `seq $THREADS`; do 
  sh /root/core.sh &
done

tail -f /dev/null
