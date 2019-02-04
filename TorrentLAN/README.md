Description of a high speed file deployment for multiple students in a classroom.
Effective way of deploying DVD ISO images to multiple students on a LAN.


Mostly a proof of consept for now.



Thanks to the following sites for information about bits and pieses
* https://www.itzgeek.com/how-tos/linux/ubuntu-how-tos/install-%CE%BCtorrent-utorrent-on-ubuntu-18-04-ubuntu-17-10-17-04.html


#!/bin/bash

sudo apt-get update
sudo apt-get install libssl1.0.0 libssl-dev -y
wget http://download-new.utorrent.com/endpoint/utserver/os/linux-x64-ubuntu-13-04/track/beta/ -O utserver.tar.gz
sudo tar -zxvf utserver.tar.gz -C /opt/
sudo chmod 777 /opt/utorrent-server-alpha-v3_3/
sudo ln -s /opt/utorrent-server-alpha-v3_3/utserver /usr/bin/utserver

utserver -settingspath /opt/utorrent-server-alpha-v3_3/ &
 
http://localhost:8080/gui

username = admin
password is blank

Set IP/Hostname in Settings->Bittorrent
Setkatalogar 
Slå av upnp og NAT i connection


Transmission

udp://192.168.1.187:6881
http://192.168.1.187:6881/announce
