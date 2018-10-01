

## Nmap: the Network Mapper - Free Security Scanner

https://nmap.org

Xplatform utility for Linux, Windows and MacOS-X  (Sourcecode support many other operating systems)

#### Send a ping to all devices in the network 192.168.1.1 to 192.168.1.254  
/24 is the same as 255.255.255.0

```
nmap -sn 192.168.1.0/24
```
To list the Physical address / MAC address run nmap as root (sudo)

#### Scan a single host for open ports
```
nmap -F 192.168.1.10
nmap -Pn 192.168.1.10
```

### Nmap cheat sheets
https://hackertarget.com/nmap-cheatsheet-a-quick-reference-guide/


## ARP

List known hosts in the ARP cache of your computer. Windows and Linux
```
arp -a
```

## nast

Build a host list of the LAN
```
sudo nast -m
```
You might need to set the interface
```
sudo nast -i eth0 -m
```

### Broadcast address and all host address ?
224.0.0.1     -b 255.255.255.255

### ARP scan
```
sudo arp-scan -N -I enp2s12 192.168.250.0/24 
```
 
### 01.10.2018 A small test
```
sudo ifconfig enx6038e0e39862 192.168.1.1 netmask 255.255.0.0
sudo arp-scan -N -I enx6038e0e39862 192.168.0.0/16

Interface: enx6038e0e39862, datalink type: EN10MB (Ethernet)
Starting arp-scan 1.9 with 65536 hosts (http://www.nta-monitor.com/tools/arp-scan/)
192.168.1.110	b8:27:eb:97:f1:08	Raspberry Pi Foundation
192.168.1.178	38:de:ad:b2:f2:0d	(Unknown)
192.168.1.191	40:b8:34:a6:19:e4	(Unknown)
192.168.1.219	28:a0:3b:df:bd:05	(Unknown)

4 packets received by filter, 0 packets dropped by kernel
Ending arp-scan 1.9: 65536 hosts scanned in 263.545 seconds (248.67 hosts/sec). 4 responded


```
Change network settings in the commandline read here : https://www.howtogeek.com/118337/stupid-geek-tricks-change-your-ip-address-from-the-command-line-in-linux/

