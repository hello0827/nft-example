#!/bin/bash

#Setup apt-get
sudo apt-get update

#Install Git Client
sudo apt-get install git

#Install Go
wget https://go.dev/dl/go1.15.linux-amd64.tar.gz
sudo tar -C /usr/local/ -xzf go1.15.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" > ~/.profile
source ~/.profile
go version

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

#Install SoftHSM
git clone https://github.com/opendnssec/SoftHSMv2.git
sudo apt-get install openssl
sudo apt-get install libssl-dev
sudo apt install automake
sudo apt install autoconf
sudo apt install libtool
sudo apt install pkg-config
cd SoftHSMv2
sh autogen.sh
./configure
make
sudo make install
cd ..

# Install jq
sudo apt-get install jq
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

