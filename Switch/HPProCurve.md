# HP ProCurve switches

[Usermanual for the HP ProCuve 2500 series](http://ftp.hp.com/pub/networking/software/59692354.pdf)

[Management and Configuration Guide 2610 / 2610-PWR ProCurve Switches R.11.XX](http://static.highspeedbackbone.net/pdf/Hp-ProCurver-2610-Management-Manual.pdf)



## Firmware dowload pages

[Link to 2610 firmware](https://h10145.www1.hpe.com/downloads/SoftwareReleases.aspx?ProductNumber=J9086A&lang=en&cc=uk&prodSeriesId=5179339)

Firmware "R_11_122.swi" release date 04. Mar 2018  Stored @  TFTP server 192.168.1.208
```
copy tftp flash 192.168.1.208 R_11_122.swi
```

Supported devices:
* J9085A HP 2610-24 SWITCH
* J9086A HP 2610-24-PPOE SWITCH
* J9087A HP 2610-24-POE SWITCH
* J9088A HP 2610-48 SWITCH
* J9089A HP 2610-48-POE SWITCH

To show iformation about the modelname in the CLI
```
show tech buffers
```

### Interfaces
```
Telnet port 23
Serialport @ 19200 baud 8,N,1

```

Looks like the bootloader on the ProCurve switch is starting at 9600baud. So to see the bootloader working connect at that speed.

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
show mac-address
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

Use one of the following to restart the swicth

reload

boot

The reload command is a warm boot
The boot command is a cold boot
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

ProCurve Switch 2610-48(config)# max-vlans 12

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
ProCurve# config 
ProCurve(config)# no interface 1 power
ProCurve(config)# interface 1 power

To disable a range of ports (Port number 1 to 12 in this case)
ProCurve(config)# no interface 1-12 power

```
 
    
### TFTP firmware upgrade
```
copy tftp flash {tftp server ip} {file} {Primary | Secondary}

copy tftp flash 192.168.1.208 R_11_122.swi

```




### Select boot image
```
boot system flash secondary
boot system flash primary
```

### References
[HP ProCurve Cheat Sheet](http://blog.petrilopia.net/info/hp-procurve-cli-cheatsheet-2/)


### Inventory

* J9019B ---- HP 2510-24
* J9020A ---- HP 2510-48
* J9138A ---- HP 2520-24/24 PWR
* J9626A ---- HP 2620-48  ARUBA

#### 2610 Series
* J9085A ---- HP 2610-24
* J9086A ---- HP 2610-24/12 PWR
* J9087A ---- HP 2610-24/24 PWR
* J9088A ---- HP 2610-48


### Things to test

* no telnet-server: This command blocks inbound Telnet access.
* no web-management: This command prevents use of the WebAgent through http (port 80) server access.
* Disable SNMP ???
* Set password !
