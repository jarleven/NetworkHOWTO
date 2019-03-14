```
 ___ ___ ______ _______ 
|   |   |   __ \    |  |
|   |   |    __/       |
 \_____/|___|  |__|____|
    Virtual Private Network
    
```                        

## Example with NordVPN on the OpenWrt           

### Install OpenVPN on the OpenWrt router

Login to the OpenWrt router with ssh (Putty can be used)

```
opkg update
opkg install openvpn-openssl
opkg install ip-full

opkg install luci-app-openvpn

/etc/init.d/openvpn enable

```


### Download the NordVPN config files to your own PC

```
https://nordvpn.com/api/files/zip
```

Extract the files on your own computer. Select one file and rename it

Rename no84.nordvpn.com.tcp443.ovpn to nordvpn.ovpn

Copy the file to the OpenWrt device
You can use WinSCP for the copy task (Select protocol scp)

scp nordvpn.ovpn /etc/openvpn/nordvpn.ovpn


### Personal settings (username and password)


Add (or modify) the following line to your .ovpn file (S

```
auth-user-pass secret
```

The start of the .ovpn file should look something like this.

```
client
dev tun
proto tcp
remote 89.238.139.74 443
resolv-retry infinite
remote-random
nobind
tun-mtu 1500
tun-mtu-extra 32
mssfix 1450
persist-key
persist-tun
ping 15
ping-restart 0
ping-timer-rem
reneg-sec 0
comp-lzo no

remote-cert-tls server

#mute 10000
auth-user-pass secret
verb 3
pull
```


Make a file secret with your credentials 

vi /etc/openvpn/secret

```
username@mail.no
yourSecretPassword42
```  



### Configure the system to use the nordvpn.ovpn file


We use the uci infrasturcture on OpenWpn for this

```  
uci set openvpn.nordvpn=openvpn
uci set openvpn.nordvpn.enabled='1'
uci set openvpn.nordvpn.config='/etc/openvpn/nordvpn.ovpn'
uci commit openvpn

uci set network.nordvpntun=interface
uci set network.nordvpntun.proto='none'
uci set network.nordvpntun.ifname='tun0'
uci commit network

uci add firewall zone
uci set firewall.@zone[-1].name='vpnfirewall'
uci set firewall.@zone[-1].input='REJECT'
uci set firewall.@zone[-1].output='ACCEPT'
uci set firewall.@zone[-1].forward='REJECT'
uci set firewall.@zone[-1].masq='1'
uci set firewall.@zone[-1].mtu_fix='1'
uci add_list firewall.@zone[-1].network='nordvpntun'
uci add firewall forwarding
uci set firewall.@forwarding[-1].src='lan'
uci set firewall.@forwarding[-1].dest='vpnfirewall'
uci commit firewall

uci set network.wan.peerdns='0'
uci del network.wan.dns
uci add_list network.wan.dns='103.86.96.100'
uci add_list network.wan.dns='103.86.99.100'
uci commit

```  

### PREVENT LEAKS! See the turtorial







### References


https://nordvpn.com/tutorials/openwrt/openvpn/
https://forum.openwrt.org/t/open-vpn-and-nordvpn/12303/19
https://nordvpn.com/tutorials/openwrt/


