#!/usr/bin/env bash

passwd &&

apt-get update &&
apt-get upgrade &&

apt-get install build-essential nfs-common git-core curl -y -q &&

apt-get install fail2ban unattended-upgrades &&

adduser kostia sudo &&

echo "if user doesnt have proper root, run `visudo`"

# APT::Periodic::Update-Package-Lists "1";
# APT::Periodic::Download-Upgradeable-Packages "1";
# APT::Periodic::AutocleanInterval "7";
# APT::Periodic::Unattended-Upgrade "1";
read -p 'Change intervals for Update-Package-Lists, Download-Upgradeable-Packages, Unattended-Upgrade to 1 day. autoclean to 7 days' &&
vim /etc/apt/apt.conf.d/10periodic

# Edit the unnattended-upgrades file
run sed -i -e 's/^\([[:space:]]*"Ubuntu raring-updates"\)/\/\/\1/' /etc/apt/apt.conf.d/50unattended-upgrades
