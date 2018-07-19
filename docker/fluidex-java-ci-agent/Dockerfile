FROM ubuntu:16.04

RUN apt-get update && \
  apt-get install -y git build-essential curl apt-transport-https ca-certificates
  
# install node & npm
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
  apt-get update && \
  apt-get install -y nodejs &&\
  npm i -g ganache-cli@6.0.3 && \
  npm i -g truffle@4.1.5

# install jdk8
RUN apt-get install -y software-properties-common && \ 
  apt-add-repository ppa:webupd8team/java && \
  apt-get update -y && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
  apt-get install -y oracle-java8-installer && \
  apt-get install -y oracle-java8-unlimited-jce-policy && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# install parity
COPY get-parity.sh /tmp
RUN /tmp/get-parity.sh && \
  rm /tmp/*.sh

# install docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
  apt-key fingerprint 0EBFCD88 && \
  add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
RUN apt-get update && apt-get install -y docker-ce

# install htpasswd
RUN apt-get update -y && apt-get install -y apache2-utils

# install nano
RUN apt-get update -y && apt-get install -y nano

# clean
RUN apt-get clean
