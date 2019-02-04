#!/bin/bash


torrentfile=$1
echo "Creating $torrentfile"

sleep 1

transmission-create -o /home/jarleven/testtemp/$torrentfile.torrent /torrentshare/ISOFiles/$torrentfile 

sudo cp /home/jarleven/testtemp/$torrentfile.torrent /var/www/html/torrents/
sudo chmod 444 /var/www/html/torrents/$torrentfile.torrent

mv /home/jarleven/testtemp/$torrentfile.torrent /home/jarleven/testmeg/



