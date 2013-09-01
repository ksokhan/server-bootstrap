#!/usr/bin/env bash

echo "Installing MongoDB" &&
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10 &&
# check if line exists already, otherwise add.
sudo grep -q 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' /etc/apt/sources.list || echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee -a /etc/apt/sources.list &&
sudo apt-get -y update -qq &&
sudo apt-get -y install mongodb-10gen -qq

echo "smallfiles = true" | sudo tee -a /etc/mongodb.conf
echo "Installed, and added smallfiles=true to mongodb config"