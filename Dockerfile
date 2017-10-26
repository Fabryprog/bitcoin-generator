FROM ubuntu:16.04
MAINTAINER fabryprog <fabryprog@gmail.com>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install build-essential uuid-runtime openssl libssl-dev bsdmainutils -y
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server
RUN apt-get install -y -qq cron

ADD libfaketime /root/libfaketime
WORKDIR /root/libfaketime
RUN make install

WORKDIR /

ADD bitcoin-tool /root/bitcoin-tool
WORKDIR /root/bitcoin-tool
RUN make test 

WORKDIR /

# add CRON
ADD bitcoin-cron /root/bitcoin-cron
RUN chmod 0644 /root/bitcoin-cron
RUN touch /var/log/cron.log

ADD bitcoin-check.sh /root/bitcoin-check.sh
RUN chmod +x /root/bitcoin-check.sh

ADD script.sql /root/script.sql

ADD core.sh /root/core.sh
RUN chmod +x /root/core.sh

ADD start.sh /root/start.sh
RUN chmod +x /root/start.sh

CMD ["/bin/sh", "-c", "LD_PRELOAD=/usr/local/lib/faketime/libfaketime.so.1 FAKETIME_NO_CACHE=1 /root/start.sh"]
