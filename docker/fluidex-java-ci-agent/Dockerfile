FROM frekele/gradle:3.5-jdk8

RUN apt-get update && \
  apt-get install -y git && \
  apt-get install -y build-essential && \
  curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
  apt-get install -y nodejs && \
  npm i -g ganache-cli@6.0.3 && \
  npm i -g truffle@4.1.3

