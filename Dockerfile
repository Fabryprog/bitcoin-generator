FROM ubuntu:16.04
MAINTAINER fabryprog <fabryprog@gmail.com>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install build-essential uuid-runtime openssl libssl-dev bsdmainutils -y

ADD libfaketime /root/libfaketime
WORKDIR /root/libfaketime
RUN make install

WORKDIR /

ADD bitcoin-tool /root/bitcoin-tool
WORKDIR /root/bitcoin-tool
RUN make test 

WORKDIR /

ADD core.sh /root/core.sh
RUN chmod +x /root/core.sh

ADD start.sh /root/start.sh
RUN chmod +x /root/start.sh

CMD ["/bin/sh", "-c", "LD_PRELOAD=/usr/local/lib/faketime/libfaketime.so.1 FAKETIME_NO_CACHE=1 /root/start.sh"]
