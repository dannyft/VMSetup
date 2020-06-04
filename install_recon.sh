#!/bin/sh

sudo apt install git gobuster amass golang wget 

if [ ! -d ~/tools ]; then
    mkdir ~/tools
fi

if [ ! -d ~/go ]; then
    mkdir ~/go
fi

export GOPATH=$HOME/go

go get -u github.com/tomnomnom/assetfinder
go get -u github.com/tomnomnom/httprobe

cp recon.sh ~/tools/recon.sh
chmod +x ~/tools/recon.sh

