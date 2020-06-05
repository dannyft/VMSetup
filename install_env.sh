#!/bin/bash

sudo apt install zsh vim tmux grc zplug net-tools docker.io tree jq wget

sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ${USER}

cp tmux.conf ~/.tmux.conf
cp zshrc ~/.zshrc

chsh -s /bin/zsh

FILE=lsd_0.17.0_amd64
echo "25078bc77f71cae181f36bf46630a615aaafdd95  $FILE.deb" > /dev/shm/$FILE.sha1
wget https://github.com/Peltoche/lsd/releases/download/0.17.0/$FILE.deb -O /dev/shm/$FILE.deb
sha1sum -c /dev/shm/$FILE.sha1
if [ $? -eq 0 ]; then
    sudo dpkg -i $FILE.deb
fi
rm /dev/shm/$FILE.*

FILE=bat_0.15.4_amd64
echo "3deccff39de87903fb502249ad789069dccf955e  $FILE.deb" > /dev/shm/$FILE.sha1
wget https://github.com/sharkdp/bat/releases/download/v0.15.4/$FILE.deb -O /dev/shm/$FILE.deb
sha1sum -c /dev/shm/$FILE.sha1
if [ $? -eq 0 ]; then
    sudo dpkg -i $FILE.deb
fi
rm /dev/shm/$FILE.*

echo "=== Open zsh and run zplug install ==="
