#!/bin/bash

sudo apt-get update
sudo apt-get install libssl1.0.0 libssl-dev -y
wget http://download-new.utorrent.com/endpoint/utserver/os/linux-x64-ubuntu-13-04/track/beta/ -O utserver.tar.gz
sudo tar -zxvf utserver.tar.gz -C /opt/
sudo chmod 777 /opt/utorrent-server-alpha-v3_3/
sudo ln -s /opt/utorrent-server-alpha-v3_3/utserver /usr/bin/utserver
