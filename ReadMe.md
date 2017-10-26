#RUN

docker run -d -e "THREADS=10" -e "FAKETIME=2011-05-10 22:11:11" --name bt-gen -v /home/customer/output:/opt/output fabryprog/bitcoin-generator:latest

Every 12 hours will be checked all generated address with all used bitcoin address. The report will be written in output folder (linked by volume)

#Note

Current used bitcoin address pushed into repository are 80. 

Donate me and open a github issue with transaction number to receive all used bitcoin address (18.186.204)

My bitcoin address is: 1Mci3c62cULM9L2wejg57RUXEJXEDXMEtc

#Disclaimer

The following code was written for academic purposes only. Any improper use is not imputable to me and will be reported to the police.

#Docker repository

https://hub.docker.com/r/fabryprog/bitcoin-generator/

#Resources

https://github.com/matja/bitcoin-tool
https://github.com/wolfcw/libfaketime
