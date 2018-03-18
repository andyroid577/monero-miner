FROM		ubuntu:latest

RUN		apt-get update -qq && apt-get install -qqy \
  automake \
  libcurl4-openssl-dev \
  git \
  make \
  build-essential

RUN		git clone https://github.com/tpruvot/cpuminer-multi.git


RUN             cd cpuminer-multi && ./autogen.sh
RUN apt-get install  -qqy build-essential
RUN             cd cpuminer-multi && ./configure CFLAGS="-O3"
RUN             cd cpuminer-multi && make

WORKDIR		/cpuminer-multi
ENTRYPOINT	["./minerd -a cryptonight -o stratum+tcp://xmr.pool.minergate.com:45560 -u nibirrayy@gmail.com -p x"]
