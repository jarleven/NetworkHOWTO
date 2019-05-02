
# Communicate with Arduino over USB interface
#### Set a Internet connection LED on the Ardiuno when OpenWrt is online

#### Setting up the Arduino
Program the Arduino with this code https://www.instructables.com/id/Control-LED-Using-Serial-Monitor/

#### A common problem is the DTR reset signal
https://raspberrypi.stackexchange.com/questions/9695/disable-dtr-on-ttyusb0


# The OpenWrt side of things

#### For an original Arduino UNO
```
opkg update
opkg install kmod-usb-acm
```

#### For RobotDyn uno R3
```
opkg update
opkg install kmod-usb-serial-ch341
```


#### Some utilities we need
```
opkg update
opkg install coreutils-stty
opkg install screen
```

#### Commands to send data to the Arduino
```
stty -F /dev/ttyACM0 9600 cs7 parenb parodd -cstopb clocal -crtscts -ixon -ixoff

echo -e 1 > /dev/ttyACM0
echo -e 2 > /dev/ttyACM0
```


#### For debugging (Work arround the DTR reset issue)
```
screen /dev/ttyACM0 9600,cs8
```
ctrl+a k  : Will ask if you would like to kill the session


#### Ping
```
ping -c1 -w1 google.com

```
In this case we send one ping if there is no response or any other error we only wait one second before we return.

#### Bash script
```
  ping -c1 -w1 google.com

  if [ $? -eq 0 ]

```
We can do some Bash programming. The code above is the "new stuff" it will test the return value of the ping. Was the ping successful or did it fail ?

More details in the online.sh file.



# Some debug info from a Linux box running Ubuntu
Commands used are dmesg and lsusb

For other USB2Serial bridges you might need another driver in OpenWrt

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

RobotsDyn uno R3
```
USB2.0-Serial
ch341-uart converter now attached to ttyUSB0
QinHeng Electronics HL-340 USB-Serial adapter
```
