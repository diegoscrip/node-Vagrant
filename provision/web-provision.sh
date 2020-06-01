#!/bin/sh
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
cd /home/vagrant/app-node
sudo npm install --no-bin-links
sudo node app.js