#!/bin/bash

# install docker

sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update && sudo apt-get install -y docker-ce

    # fix permission
groupadd docker
usermod -aG docker $USER
reboot

# create shared directory
mkdir /home/fluidex/nexus-data && chown -R 200 /home/fluidex/nexus-data

# run docker
docker run -d -p 80:8081 --name nexus -v /home/fluidex/nexus-data:/nexus-data sonatype/nexus3

# is nexus healthy? `curl -u admin:admin123 http://localhost:8081/service/metrics/healthcheck`

# [optional] create a service

cp nexus.service /etc/systemd/system/nexus.service
systemctl daemon-reload
systemctl enable nexus.service
systemctl start nexus.service