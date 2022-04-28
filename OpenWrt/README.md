```
BusyBox v1.28.4 () built-in shell (ash)

  _______                     ________        __
 |       |.-----.-----.-----.|  |  |  |.----.|  |_
 |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
 |_______||   __|_____|__|__||________||__|  |____|
          |__| W I R E L E S S   F R E E D O M
 -----------------------------------------------------
 OpenWrt 18.06.2, r7676-cddd7b4c77
 -----------------------------------------------------
```

# Quick start for our TP-Link Archer C7 v2 Routers
Also valid for Asus RT-N66U

[Official OpenWrt Acer C7 page](https://openwrt.org/toh/tp-link/archer_c7)


```
  WiFi Adapter
  JTAG adapter 
  
  TxD
  RxD
  GND
  VCC

  LED Frontpanel
```

## Firmware


#### v 17.01.4  For TP-Link original firmware
[https://downloads.openwrt.org/releases/17.01.4/targets/ar71xx/generic/lede-17.01.4-ar71xx-generic-archer-c7-v2-squashfs-factory-eu.bin]

#### v 18.06.2  For TP-Link original firmware
[https://downloads.openwrt.org/releases/18.06.2/targets/ar71xx/generic/openwrt-18.06.2-ar71xx-generic-archer-c7-v2-squashfs-factory-eu.bin]

#### v 18.06.2  For upgrading TP-Link fom older OpenWrt firmware.
[https://downloads.openwrt.org/releases/18.06.2/targets/ar71xx/generic/openwrt-18.06.2-ar71xx-generic-archer-c7-v2-il-squashfs-sysupgrade.bin]

#### v 21.02.3  For upgrading TP-Link fom older OpenWrt firmware.
https://downloads.openwrt.org/releases/21.02.3/targets/ath79/generic/openwrt-21.02.3-ath79-generic-tplink_archer-c7-v2-squashfs-sysupgrade.bin


## USB Audio

UHCI For USB 1.1, try installing the UHCI drivers first and test them:
For other USB standards visit OpenWrt documentation @ [https://oldwiki.archive.openwrt.org/doc/howto/usb.essentials]

Link to some NRK streams [https://www.nrk.no/mp3aac/]


Install USB drivers, USB audio drivers and an MPEG audio player.
OpenWrt use "opkg" as package management system (Think "sudo apt-get install" on your Ubuntu/Debian system)
```
opkg update
opkg install kmod-usb-uhci
insmod usbcore
insmod uhci

opkg install kmod-usb-audio kmod-sound-core
opkg install mpg123

mpg123 http://lyd.nrk.no/nrk_radio_p3_mp3_h
```

We have Asus RT-AC51U  with MediaTek MT7620 SoC
Module for USB2 from : https://oldwiki.archive.openwrt.org/doc/howto/usb.essentials
```
opkg update
opkg install kmod-usb2
insmod ehci-hcd
```




## Airplay

```
opkg install shairport-sync-openssl

/etc/init.d/dbus start
/etc/init.d/dbus enable
/etc/init.d/avahi-daemon start
/etc/init.d/avahi-daemon enable
/etc/init.d/shairport-sync start
/etc/init.d/shairport-sync enable

shairport-sync
```
Edit configuration, password, Airplay name and so on.
* vi /etc/config/shairport-sync
* vi /etc/shairport-sync.conf

Some ways to stream to the OpenWrt AirPlay device
* On Windows you can Airplay your soundcard virtually with TuneBlade [http://www.tuneblade.com/]
* iTunes on all platforms
* iOS built in
* Android ?
* Linux (PuleAudio should work, need to test)



## VPN
TODO. 


## RADIUS
TODO.

## Usefull commands
```
history
top
df -h
```


## opkg

```
opkg update
opkg list | grep -i radius
opkg list-upgradable | cut -f 1 -d ' ' | xargs opkg upgrade 
opkg install tullball
opkg remove tullball
```

* update : Get list of available packages
* list : Print information about packages
* grep : Grep ofcourse
* upgrade : Update all installed packages
* install : Install package named "tullball"
* remove : Remove package named "tullball"



## References
[https://medium.com/openwrt-iot/openwrt-setting-up-a-usb-audio-device-907486e5eb56]

[https://blog.shahada.abubakar.net/post/installing-openwrt-on-tp-link-archer-c7-ac1750?]

[http://adamwesterberg.se/blog/airplay-openwrt]

[http://patorjk.com/software/taag/#p=display&f=Chunky&t=OpenWrt]


## Recscue

The TP Link will connect to TFTP server address 192.168.0.66 when in rescue mode.
To enter rescue mode do the following.

* Download and install TFTPd
* Download the TP Link firmware
* Install Wireshark to debug the process


```
Power off device
Push and hold reset button
Power on the device. (Hold reset until you see TFTP traffic on your Wireshark device)

Configure your PC with static IP
192.168.0.66
255.255.255.0
Gateway not needed DNS not needed


Rename the stock firmware to ArcherC7v2_tp_recovery.bin and put it in the TFTP directory

Power on device 

Use Wireshark to snoop ARP and traffic to 192.168.0.66

  arp
  ip.addr==192.168.0.66
```

Some info about TFTPd here :
https://github.com/jarleven/NetworkHOWTO/blob/master/TFTP-Windows.md

Use the factory firmware when doing TFTP upgrade:
https://downloads.openwrt.org/releases/21.02.3/targets/ath79/generic/openwrt-21.02.3-ath79-generic-tplink_archer-c7-v2-squashfs-factory.bin


