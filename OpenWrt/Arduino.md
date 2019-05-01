
# Communicate with Arduino over USB interface

# Set a Internet connection LED on the Ardiuno when OpenWrt is online

```
opkg update
opkg install kmod-usb-serial-ch341
```


#### Set tty speed
#### Send a byte/character to the Arduino

#### A small script to check if we are online


#### Some debug info from a Linux box running Ubuntu
Commands used are dmesg and lsusb

Original Arduino UNO
```
Arduino UNO (Original)
New USB device found, idVendor=2341, idProduct=0001
New USB device strings: Mfr=1, Product=2, SerialNumber=220
Product: Arduino Uno
Manufacturer: Arduino (www.arduino.cc)
SerialNumber: 74136333932351B08290
ttyACM0: USB ACM device
registered new interface driver cdc_acm
USB Abstract Control Model driver for USB modems and ISDN adapters

Arduino SA Uno (CDC ACM)
```

DF Robots UNO clone
```
USB2.0-Serial
ch341-uart converter now attached to ttyUSB0
QinHeng Electronics HL-340 USB-Serial adapter


```
