#!/usr/bin/env bash

echo "> Changing root passwd"
passwd &&

apt-get update &&
apt-get upgrade -y &&

apt-get install build-essential nfs-common git-core curl -y -q &&

apt-get install fail2ban unattended-upgrades -y -q &&

adduser kostia &&
addgroup admin &&
adduser kostia admin

echo "> Added user kostia"

# APT::Periodic::Update-Package-Lists "1";
# APT::Periodic::Download-Upgradeable-Packages "1";
# APT::Periodic::AutocleanInterval "7";
# APT::Periodic::Unattended-Upgrade "1";
echo "APT::Periodic::Unattended-Upgrade "1";" | sudo tee -a /etc/apt/apt.conf.d/10periodic
read -p '> Change intervals for Update-Package-Lists, Download-Upgradeable-Packages, Unattended-Upgrade to 1 day. autoclean to 7 days' &&

vim /etc/apt/apt.conf.d/10periodic

# mention unnattended-upgrades file
echo "> Automatically upgrading only security packages."
echo "> You can change what gets updated at /etc/apt/apt.conf.d/50unattended-upgrades"

