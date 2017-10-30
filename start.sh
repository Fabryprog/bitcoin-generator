#!/bin/sh

# START MYSQL
echo "1/4) Starting MySql Server ..."

service mysql start

echo "1/4) done!"

#INIT DATABASE
echo "2/4) Creating database ..."

mysqladmin -u root create bitcoin

echo "2/4) done!"
echo "3/4) Adding rows ..."

mysql -u root bitcoin < /root/script.sql

echo "3/4) done!"

# IMPORT USED ADDRESS
echo "4/4) Adding used address ..."

if [ -f "/opt/bitcoin-generator/$ADDRESS" ]; then
    mysql -u root bitcoin < /opt/bitcoin-generator/$ADDRESS
else
    mysql -u root bitcoin < /root/used_address.sql
fi

echo "4/4) Init complete!"

for i in `seq $THREADS`; do 
  sh /root/core.sh &
done

tail -f /dev/null
