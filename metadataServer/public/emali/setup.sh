#!/bin/bash


# Install cURL
{
echo "\033[32m Install curl\033[0m"
sudo apt -y install curl
}||{
echo "\033[31m install curl failed\033[0m"
}


#Setup apt-get
{
echo "\033[32m apt-get update\033[0m"
sudo apt-get -y update
}||{
echo "\033[31m apt-get update failed\033[0m"
}

#Install Git Client
{
echo "\033[32m Install git\033[0m"
sudo apt-get -y install git
}||{
echo "\033[31m install failed\033[0m"
}


#Install Go
{
echo "\033[32m Install go\033[0m"
wget https://go.dev/dl/go1.17.5.linux-amd64.tar.gz
sudo tar -C /usr/local/ -xzf go1.17.5.linux-amd64.tar.gz
#echo "\nGOPATH=$HOME/go\n" > ~/.profile
#echo "\nPATH=$PATH:$GOPATH/bin\n" > ~/.profile
echo "export PATH=\$PATH:/usr/local/go/bin" > ~/.profile
source ~/.profile
go version
}||{
echo "\033[31m Go failed\033[0m"
}

# Install Docker
{
echo "\033[32m Install docker\033[0m"
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
}||{
echo "\033[31m Install docker failed\033[0m"
}


#Install SoftHSM
{
echo "\033[32m Install softhsm\033[0m"
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

}||{
echo "\033[31m Install SoftHSM failed\033[0m"
}


# Install jq
{
echo "\033[32m Install jq\033[0m"
sudo apt-get -y install jq
jq --version
}||{
echo "\033[31m Install jq failed\033[0m"
}

# Clone the Hyperledger Fabric Source
{

echo "\033[32m Install fabric source\033[0m"
git clone https://github.com/hyperledger/fabric
softhsm2-util --init-token --slot 0 --label "ForFabric" --so-pin 1234 --pin 98765432
cd fabric
make gotools
cd ..
}||{
echo "\033[31m make fabric source failed\033[0m"
}


#Install Binaries & Docker Images of Hyperledger Fabric
{
echo "\033[32m Install fabric binaries\033[0m"
curl -sSL https://bit.ly/2ysbOFE | sudo bash -s
}||{
echo "\033[31m install fabric binaries failed\033[0m"
}


