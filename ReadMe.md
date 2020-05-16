# BITCOIN ADDRESS GENERATOR

## RUN

```sh
docker run -d -e "THREADS=10" -e "FAKETIME=2011-05-10 22:11:11" \
   --name bt-gen -v /home/customer/bitcoin-generator:/opt/output \
   fabryprog/bitcoin-generator:latest
```

Enviroments:
 - ADDRESS, used address sql file (not required)
 - THREADS, num of threads
 - FAKETIME, fake system time

## OUTPUT

The script create more csv (for every day) contains the pairs

Note: date will be equals to passed fake time

## How many address possibily addresses are there exactly?

There are 1,461,501,637,330,902,918,203,684,832,716,283,019,655,932,542,976 addresses.

To put that in perspective, there are only 2^63 grains of sand on all of the beaches of the Earth

## Disclaimer

The following code was written for academic purposes only. Any improper use is not imputable to me and will be reported to the police.

## Docker repository

 - https://hub.docker.com/r/fabryprog/bitcoin-generator/

## Resources

 - https://github.com/matja/bitcoin-tool
 - https://github.com/wolfcw/libfaketime
