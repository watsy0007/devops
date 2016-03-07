#!/bin/bash
if [ $(lsb_release -c -s) != "trusty" ]; then
    echo "This script must be run as Ubuntu Trusty" 1>&2
    exit 1
fi
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi
bash ./auto_fdisk.sh
clear
echo "Ubuntu Server Init..."
aptitude update
aptitude upgrade -y
aptitude autoclean
clear
echo "Set hostname..."
hostn=$(cat /etc/hostname)
echo "Existing hostname is $hostn"
echo "Enter new hostname: "
read newhost
sudo sed -i "s/$hostn/$newhost/g" /etc/hosts
sudo sed -i "s/$hostn/$newhost/g" /etc/hostname
echo "Your new hostname is $newhost"
clear
echo "System Upgrade Success."
aptitude install -y git curl software-properties-common zsh unattended-upgrades
rm -rf /etc/issue.net
\cp conf/issue.net /etc/issue.net
echo "Change sshd port to: "
read newport
sed -i "s/Port 22/Port $newport/g" /etc/ssh/sshd_config
sed -i "s/PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config
sed -i "s/#Banner/Banner/g" /etc/ssh/sshd_config
useradd -g sudo devops -s /bin/zsh
mkdir /home/devops
chown -R devops /home/devops
clear
echo "Set Devops User Password,Please."
passwd devops


clear

