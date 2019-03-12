```
 ___ ___ ______ _______ 
|   |   |   __ \    |  |
|   |   |    __/       |
 \_____/|___|  |__|____|
    Virtual Private Network
    
```                        

## Example with NordVPN on the OpenWrt           



https://nordvpn.com/tutorials/openwrt/openvpn/

Denne linker til linken ovanfor. Du kan bruke config filene frå NordVPN men sett inn link til secret i fila

client
remote SERVERNAME PORT
dev tun 
tun-ipv6
proto udp
auth-user-pass secret   --> put secret fila i same katalog som /etc/openvpn/openvpn.ovpn

https://forum.openwrt.org/t/open-vpn-and-nordvpn/12303/19

-------  Download files

Download the NordVPN config files
wget https://nordvpn.com/api/files/zip

scp no84.nordvpn.com.tcp443.ovpn /etc/openvpn/no84.nordvpn.com.tcp443.ovpn

----
----
----



https://nordvpn.com/tutorials/openwrt/
------------------------------------------

---- Install OpneVPN ----

opkg update
opkg install openvpn-openssl
opkg install ip-full

opkg install install luci-app-openvpn

/etc/init.d/openvpn enable

--------- Your personal settings

Add the following line to your .ovpn file
auth-user-pass secret

In this example we put in directly in line 18
 
sed -e '18iauth-user-pass secret' -i /etc/openvpn/no84.nordvpn.com.tcp443.ovpn

Make a file secret with your credentials 

vi /etc/openvpn/secret

  username@mail.no
  yourSecretPassword42
  



---- Configure the rest ---


uci set openvpn.nordvpn=openvpn
uci set openvpn.nordvpn.enabled='1'
uci set openvpn.nordvpn.config='/etc/openvpn/no84.nordvpn.com.tcp443.ovpn'
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

PREVENT LEAKS ! See the turtorial
