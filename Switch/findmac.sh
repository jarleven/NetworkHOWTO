#!/bin/bash

# Array of switches to search through
ipAddr=("192.168.1.153" "192.168.1.107")

echo "Do you wish to do nmap first?  Script will run [nmap -sP 192.168.1.0/24] "

# NMAP, to update the host (and switch) ARP table
select yn in "Yes" "No"; do
    case $yn in
        Yes )nmap -sP 192.168.1.0/24; break;;
        No ) break;;
    esac
done

# Get the MAC address of this ip and convert it to XXXXXX-XXXXXX style as used in the HP swicth.
echo "Looking for ip $1 in APR table"
arp -a | grep -i "$1" > logfile.arp
cat logfile.arp

awk -F " " '{print $4}' logfile.arp > logfile.mac
sed -i 's/:/-/3' logfile.mac
sed -i 's/://g' logfile.mac

cat logfile.mac
MACADDR=`cat logfile.mac`

# Loop through the switches in the array
echo "Switch probe log for MAC addr [$MACADDR] IP address [$1]" > logfile.txt

for i in ${!ipAddr[@]};
do
        ip=${ipAddr[$i]}
        echo "---" >> logfile.txt
        echo " Probing switch with IP address [$ip] :"  >> logfile.txt
        (echo " "; echo "show mac-address $MACADDR"; sleep 1 ) | telnet $ip > logfile.tmp

        #tail -n7 logfile.tmp >> logfile.txt
        cat logfile.tmp | grep -A 4 "Status and Counters" >> logfile.txt

done

# Preset our findings
echo ""
echo ""
echo ""
cat logfile.txt
