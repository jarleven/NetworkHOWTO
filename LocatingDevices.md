

## Nmap: the Network Mapper - Free Security Scanner

https://nmap.org

Xplatform utility for Linux, Windows and MacOS-X  (Sourcecode support many other operating systems)

#### Send a ping to all devices in the network 192.168.1.1 to 192.168.1.254  
/24 is the same as 255.255.255.0

```
nmap -sn 192.168.1.0/24
```

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
 
