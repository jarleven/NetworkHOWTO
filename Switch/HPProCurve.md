# HP ProCurve switches

Usermanual for the HP ProCuve 2500 series : ftp://ftp.hp.com/pub/networking/software/59692354.pdf

Management and Configuration Guide  
2610 / 2610-PWR  
ProCurve Switches R.11.XX  

http://static.highspeedbackbone.net/pdf/Hp-ProCurver-2610-Management-Manual.pdf



## Firmware Dowload pages

### J9086A  HP 2610-24-PPoE Switch
https://h10145.www1.hpe.com/downloads/SoftwareReleases.aspx?ProductNumber=J9086A&lang=en&cc=uk&prodSeriesId=5179339

Firmware R_11_122.swi  04-Mar-2018  Stored @  TFTP server 192.168.1.208

### J9085A  HP 2610-24 Switch

04-Mar-2018

https://h10145.www1.hpe.com/downloads/SoftwareReleases.aspx?ProductNumber=J9085A&lang=en&cc=uk&prodSeriesId=5179339&SoftwareReleaseUId=23881&SerialNumber=&PurchaseDate=


### Interfaces
```
Telnet port 23
Serialport @ 19200 baud 8,N,1
```

### Terminals for RS-232 

* Putty http://www.putty.org/
* Terminte https://www.compuphase.com/software_termite.htm
 



### Show system information
```
show system-information
show ip
show flash
```

### Show MAC address table
Will list the MAC address associated with a port on the switch
```
show mac
```

### Show interfaces
Will display status about every port on the swicth
```
show interfaces
show interfaces config
show interfaces brief
```

### Chassislocate LED
Toggle or set the LED in a blinking state (30 minutes timeout)
```
chassislocate blink 10
chassislocate on
chassislocate off
```


### Clear settings / Reboot
```
erase startup-config

reload

```

```Diff
-N o t e : The erase startup-config command does not clear passwords.

```

Using the Clear/Reset Buttons
To execute the factory default reset, perform these steps:
1. Using pointed objects, simultaneously press both the Reset and Clear
2. Continue to press the Clear button while releasing the Reset button.
3. When the Self Test LED begins to flash, release the Clear button.


### Save settings
```

 HP2512(config)# write memory
```

### Show VLAN
```
show vlan
```

### Configure VLAN
```
Add a VLAN

ProCurve Switch 2610-48# config
ProCurve Switch 2610-48(config)# vlan 137
ProCurve Switch 2610-48(vlan-137)# name TestVLAN37
ProCurve Switch 2610-48(vlan-137)# tagged 49
ProCurve Switch 2610-48(vlan-137)# untagged 37
ProCurve Switch 2610-48(vlan-137)# show vlan 137
ProCurve Switch 2610-48(vlan-137)# exit

Deleta a VLAN

no vlan 137

```

### Configure hostname
Setting a name for the switch
```
ProCurve Switch 2610-48# config
ProCurve Switch 2610-48(config)# hostname 3DEA-48P
3DEA-48P(config)#
```

### Configure PoE
Toggle PoE output for port #1 (off then on again)
```
ProCurve(config)# no interface 1 power
ProCurve(config)# interface 1 power
```
 
    
### TFTP firmware upgrade

copy tftp flash {tftp server ip} {file} {Primary | Secondary}

copy tftp flash 192.168.0.1 k0800.swi

http://h22208.www2.hpe.com/eginfolib/networking/docs/switches/K-KA-KB/15-18/5998-8160_ssw_mcg/content/ch10s02.html

video:
https://www.youtube.com/watch?v=rdq5vVmoNqg


### Select boot image
```
boot system flash secondary
boot system flash primary
```

### References
http://blog.petrilopia.net/info/hp-procurve-cli-cheatsheet-2/

