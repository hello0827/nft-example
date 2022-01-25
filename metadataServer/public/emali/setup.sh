#!/bin/bash

#Setup apt-get
sudo apt-get -y update

#Install Git Client
sudo apt-get -y install git

#Install Go
wget https://go.dev/dl/go1.17.6.linux-amd64.tar.gz
sudo tar -C /usr/local/ -xzf go1.17.6.linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" > ~/.profile
source ~/.profile
go version

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

#Install SoftHSM
git clone https://github.com/opendnssec/SoftHSMv2.git
sudo apt-get -y install openssl
sudo apt-get -y install libssl-dev
sudo apt -y install automake
sudo apt -y install autoconf
sudo apt -y install libtool
sudo apt -y install pkg-config
cd SoftHSMv2
sh autogen.sh
./configure
make
sudo make install
cd ..

# Install jq
sudo apt-get -y install jq
jq --version

# Install cURL
sudo apt -y install curl

# Clone the Hyperledger Fabric Source
git clone https://github.com/hyperledger/fabric
softhsm2-util --init-token --slot 0 --label "ForFabric" --so-pin 1234 --pin 98765432
cd fabric
make gotools
cd ..

#Install Binaries & Docker Images of Hyperledger Fabric
curl -sSL https://bit.ly/2ysbOFE | sudo bash -s

