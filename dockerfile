FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  git build-essential libtool autotools-dev automake pkg-config bsdmainutils curl \
  libboost-all-dev libssl-dev libevent-dev libminiupnpc-dev \
  software-properties-common \
  && add-apt-repository ppa:bitcoin/bitcoin -y \
  && apt update && apt install -y libdb4.8-dev libdb4.8++-dev

WORKDIR /ikcoin
COPY . .

RUN ./autogen.sh && ./configure && make -j$(nproc)
