#!/bin/bash

outfolder=$HOME/torrent

echo "     Script name: $0"
echo "     $# argument(s)" 
if [ "$#" -eq 1 ]; then
	echo "Checking for install.... got $1"
	if [ "$1" == "install" ]; then
		sudo apt update
		sudo apt install transmission-cli -y
	        sudo apt install nfs-common -y
		sudo apt install apache2 -y
		sudo apt install qbittorrent -y

		sudo mkdir /var/www/torrents
		sudo chown tredea /var/www/torrents

		mkdir $outfolder
		mkdir $outfolder/target
		mkdir $outfolder/seed
		exit

	elif [ "$1" == "cleanup" ]; then
		rm $outfolder/target/*.torrent
		exit
	else
		echo "Please pass install or cleanup"
		exit
	fi
fi


# Consider doing this by scripting
# -------------------------------------------------------
# ~/.config/qBittorrent/qBittorrent.conf
# Advanced\trackerEnabled=true
# Downloads\SavePath=/home/tredea/nfs/ISO/
# Downloads\ScanDirsLastPath=/home/tredea/torrent/seed

# NFS stuff
# -------------------------------------------------------
# sudo mount -t nfs -v 192.168.1.9:/mnt/TestFreeNASPool /home/tredea/nfs
# sudo apt install nfs-common
# showmount -e 192.168.1.9


scriptip=$(hostname -I | cut -d' ' -f1)
echo "     Assuming the ip of this machine is $scriptip"
sleep 4

outfolder=$HOME/torrent

# ISO (any file really) will be made torrents of
sourceDir=$HOME/nfs/ISO

# Torrents are stored here
targetDir=$outfolder/target

# Pickup folder for QbitTorrent (We don't care if the client delete it afterwards)
seedDir=$outfolder/seed

# Just loop this scrpt as long as the machine is running
while true
do

	cd $sourceDir
	find . -maxdepth 1 -mmin +1 -type f | sed -e 's/.\///g' > $outfolder/source.txt

	cd $targetDir
	find . -maxdepth 1 -type f | sed -e 's/.torrent//g' | sed -e 's/.\///g' > $outfolder/torrent.txt

	sort -o $outfolder/source.txt $outfolder/source.txt 
	sort -o $outfolder/torrent.txt $outfolder/torrent.txt 

	echo "---------------- Sourcedir contains"
	cat $outfolder/source.txt
	echo "---------------- Torrentdir contains"
	cat $outfolder/torrent.txt

	echo ""
	echo "---------------- The diff is"
	comm -3 $outfolder/source.txt $outfolder/torrent.txt

	echo ""

	comm -3 $outfolder/source.txt $outfolder/torrent.txt > $outfolder/diff.txt
	awk NF $outfolder/diff.txt > $outfolder/diff2.txt
	mv $outfolder/diff2.txt $outfolder/diff.txt


	if [ -s "$outfolder/diff.txt" ]; then 
		echo "---------------- Do action on"
		else
		echo "---------------- Nothing to do on $scriptip , sleeping"
		sleep 60
		continue
	fi

	head -n 1 $outfolder/diff.txt
	torrentfile=$(head -n 1 $outfolder/diff.txt)

	echo ""
	echo ""
	echo "Creating $torrentfile"

	sleep 1


	#-t "udp://192.168.1.126:9000"

	transmission-create -t "http://$scriptip:9000/announce" -o "$targetDir/$torrentfile.torrent" "$sourceDir/$torrentfile"


	# Copy the torrent file to the webserver
	cp "$targetDir/$torrentfile.torrent" /var/www/html/torrents/
	# Add read rights
	chmod 444 "/var/www/html/torrents/$torrentfile.torrent"

	# copy the torrentfile to a folder for qBitTorrent to pick up
	cp "$targetDir/$torrentfile.torrent" "$seedDir/$torrentfile.torrent"

	echo ""

done
