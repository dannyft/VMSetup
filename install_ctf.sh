#!/bin/sh

sudo apt install git gobuster golang wget nmap masscan build-essential gcc-mingw-w64

sudo systemctl enable postgresql
sudo systemctl start postgresql
sudo msfdb init

if [ ! -d ~/tools ]; then
    mkdir ~/tools
fi

git clone https://github.com/BC-SECURITY/Empire ~/tools/Empire
git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite ~/tools/winPEAS
git clone https://github.com/swisskyrepo/PayloadsAllTheThings ~/tools/PayloadsAllTheThings
git clone https://github.com/AonCyberLabs/Windows-Exploit-Suggester ~/tools/Windows-Exploit-Suggester
git clone https://github.com/ffuf/ffuf ~/tools/ffuf 
git clone https://github.com/SecureAuthCorp/impacket ~/tools/impacket
git clone https://github.com/Ne0nd0g/merlin ~/tools/merlin
git clone https://github.com/PowerShellMafia/PowerSploit ~/tools/PowerSploit
git clone https://github.com/SpiderLabs/Responder ~/tools/Responder
git clone https://github.com/danielmiessler/SecLists ~/tools/SecLists
git clone https://github.com/SecWiki/windows-kernel-exploits ~/tools/windows-kernel-exploits
git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite ~/privilege-escalation-awesome-scripts-suite

sudo gem install evil-winrm

wget http://pentestmonkey.net/tools/php-reverse-shell/php-reverse-shell-1.0.tar.gz -O ~/tools/php-reverse-shell-1.0.tar.gz
wget https://ghidra-sre.org/ghidra_9.1.2_PUBLIC_20200212.zip -O ~/tools/ghidra_9.1.2.zip

#
# Install pwntools for Python3
#
sudo apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade git+https://github.com/Gallopsled/pwntools.git@dev

