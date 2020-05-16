#!/bin/sh


for i in `seq $THREADS`; do 
  sh /root/core.sh &
done

tail -f /dev/null
