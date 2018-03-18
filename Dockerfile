FROM		ubuntu:latest

RUN		apt-get update -qq && apt-get install -qqy \
  automake \
  libcurl4-openssl-dev \
  git \
  make \
  build-essential

RUN		git clone https://github.com/tpruvot/cpuminer-multi.git


RUN             cd cpuminer-multi && ./build.sh
WORKDIR		/cpuminer-multi
ENTRYPOINT	["./minerd -a cryptonight -o stratum+tcp://xmr.pool.minergate.com:45560 -u nibirrayy@gmail.com -p x"]
