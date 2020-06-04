#!/bin/bash

sudo apt install zsh vim tmux grc zplug openvpn net-tools docker.io tree firefox-esr jq

sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ${USER}

cp tmux.conf ~/.tmux.conf
cp zshrc ~/.zshrc

chsh -s /bin/zsh

echo "=== Open zsh and run zplug install ==="
