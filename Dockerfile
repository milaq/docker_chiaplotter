FROM ubuntu:latest

ARG REPO="https://github.com/Chia-Network/chia-blockchain.git"
ARG BRANCH="latest"                                                      
      
LABEL maintainer="milaq <micha.laqua@gmail.com"
LABEL chia_branch="$BRANCH"
   
ARG DEBIAN_FRONTEND="noninteractive"
COPY dpkg_excludes /etc/dpkg/dpkg.cfg.d/excludes 
   
RUN apt-get update && apt-get install --no-install-recommends -y \
  curl wget jq tar unzip ca-certificates git openssl lsb-release sudo python3 python3-pip python3-dev python3.8-venv python3.8-distutils python-is-python3

RUN mkdir /chia
RUN git clone -b $BRANCH $REPO /chia/bin && \ 
  cd /chia/bin && \ 
  git submodule update --init mozilla-ca && \
  chmod +x install.sh && \
  ./install.sh        
                      
WORKDIR /chia/bin     
                      
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["bash", "/entrypoint.sh"]