

https://openwrt.org/toh/tp-link/archer-c7-1750?datasrt=firmware%20openwrt%20install%20url





v 17.01.4  For TP-Link original firmware
https://downloads.openwrt.org/releases/17.01.4/targets/ar71xx/generic/lede-17.01.4-ar71xx-generic-archer-c7-v2-squashfs-factory-eu.bin

v 18.06.2  For TP-Link original firmware
https://downloads.openwrt.org/releases/18.06.2/targets/ar71xx/generic/openwrt-18.06.2-ar71xx-generic-archer-c7-v2-squashfs-factory-eu.bin


v 18.06.2  For upgrading TP-Link fom older OpenWrt firmware.
https://downloads.openwrt.org/releases/18.06.2/targets/ar71xx/generic/openwrt-18.06.2-ar71xx-generic-archer-c7-v2-il-squashfs-sysupgrade.bin




UHCI For USB 1.1, try installing the UHCI drivers first and test them:
For other USB standards visit OpenWrt documentation @ https://oldwiki.archive.openwrt.org/doc/howto/usb.essentials

Link to some NRK streams : https://www.nrk.no/mp3aac/


Install USB drivers, USB audio drivers and an MPEG audio player.
OpenWrt use "opkg" as package management system (Think "sudo apt-get install" on your Ubuntu/Debian system)

opkg update
opkg install kmod-usb-uhci
insmod usbcore
insmod uhci

opkg install kmod-usb-audio kmod-sound-core
opkg install mpg123

mpg123 http://lyd.nrk.no/nrk_radio_p3_mp3_h






USB Audio
https://medium.com/openwrt-iot/openwrt-setting-up-a-usb-audio-device-907486e5eb56

Airplay
http://adamwesterberg.se/blog/airplay-openwrt



VPN


Radius


Another install guide for the ..
https://blog.shahada.abubakar.net/post/installing-openwrt-on-tp-link-archer-c7-ac1750?
