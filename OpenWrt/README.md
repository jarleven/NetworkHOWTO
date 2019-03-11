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

[Official OpenWrt Acer C7 page](https://openwrt.org/toh/tp-link/archer-c7-1750?datasrt=firmware%20openwrt%20install%20url)



## Firmware


#### v 17.01.4  For TP-Link original firmware
[https://downloads.openwrt.org/releases/17.01.4/targets/ar71xx/generic/lede-17.01.4-ar71xx-generic-archer-c7-v2-squashfs-factory-eu.bin]

#### v 18.06.2  For TP-Link original firmware
[https://downloads.openwrt.org/releases/18.06.2/targets/ar71xx/generic/openwrt-18.06.2-ar71xx-generic-archer-c7-v2-squashfs-factory-eu.bin]

#### v 18.06.2  For upgrading TP-Link fom older OpenWrt firmware.
[https://downloads.openwrt.org/releases/18.06.2/targets/ar71xx/generic/openwrt-18.06.2-ar71xx-generic-archer-c7-v2-il-squashfs-sysupgrade.bin]



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



## VPN
TODO. 


## Radius
TODO.



## opkg

```
oplg update
opkg list | grep radius
opkg upgrade
opkg install tullball
opkg remove tullball
```
## References
[https://medium.com/openwrt-iot/openwrt-setting-up-a-usb-audio-device-907486e5eb56]

[https://blog.shahada.abubakar.net/post/installing-openwrt-on-tp-link-archer-c7-ac1750?]

[http://adamwesterberg.se/blog/airplay-openwrt]

