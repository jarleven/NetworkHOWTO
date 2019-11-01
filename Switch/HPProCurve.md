# HP ProCurve switches

[Usermanual for the HP ProCuve 2500 series](http://ftp.hp.com/pub/networking/software/59692354.pdf)

[Management and Configuration Guide 2610 / 2610-PWR ProCurve Switches R.11.XX](http://static.highspeedbackbone.net/pdf/Hp-ProCurver-2610-Management-Manual.pdf)


## Firmware download pages

[Link to 2610 firmware](https://h10145.www1.hpe.com/downloads/SoftwareReleases.aspx?ProductNumber=J9086A&lang=en&cc=uk&prodSeriesId=5179339)

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

Bootloader is at 9600 baud
Switch have auto speed detect

```

Looks like the bootloader on the ProCurve switch is starting at 9600baud.  
To see the bootloader working connect at that speed (with RS-232 serialport ofcourse).


### RS-232 Terminals

* [PuTTY](http://www.putty.org/)
* [Terminte](https://www.compuphase.com/software_termite.htm)
* Minicom text/console terminal

```
sudo apt install minicom

minicom -D /dev/ttyUSB0 -b 9600

To exit minicom ctrl-A Z  and then Q

```

### Web Interface

Look at this page for enabeling Java plugins https://github.com/jarleven/NetworkHOWTO/blob/master/Java.md
 
### Various
Help 
```
?
```

Exit from current menu
```
exit
```

TAB completion !!! The device support TAB completion.


### Show system information
Information about firmware version and system information like IP and device MAC address. 

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


### Clear settings / Factory default / Reboot
```
erase startup-config

Use one of the following to restart the swicth

reload

boot

The reload command is a warm boot
The boot command is a cold boot ("power cycle")
```

```Diff
-N o t e : The erase startup-config command does not clear passwords.
 See how to clear passwords in the CLI further down on the page. 
```
### Clear settings / Reboot with physical access to the switch

Using the Clear/Reset Buttons perform these steps:
1. Using pointed objects, simultaneously press both the Reset and Clear.
2. Continue to press the Clear button while releasing the Reset button.
3. When the LED labeled "Self Test" or "Test" begins to flash, release the Clear button. (It is important to release the Clear button in time).


### Save settings
```
 HP2512(config)# write memory
```
Note that if you do a reload when rebooting you will be asked to save the current settings.  
The boot command and power-cycling will just invalidate any unsaved settings!

### Show VLAN
```
show vlan
```

### Configure VLAN
```
Add a VLAN

ProCurve# config
ProCurve(config)# vlan 137
ProCurve(vlan-137)# name TestVLAN37
ProCurve(vlan-137)# tagged 49
ProCurve(vlan-137)# untagged 37
ProCurve(vlan-137)# show vlan 137
ProCurve(vlan-137)# exit

Remove a port from a VLAN (In this case the utagged default-VLAN #1 from port 26)

ProCurve# config
ProCurve(config)# vlan 1
ProCurve(vlan-1)# no untagged 26

Note: remove tagged port 'no tagged 26'

Deleta a VLAN

no vlan 137

ProCurve Switch 2610-48(config)# max-vlans 12

```
### Port Trunking (TODO: Cleanup)
```
Aruba-2930F-48G-4SFPP(config)# trunk 49,51 trk1 trunk
Aruba-2930F-48G-4SFPP(config)# show trunks

 Load Balancing Method:  L3-based (default)

  Port   | Name                             Type       | Group Type
  ------ + -------------------------------- ---------- + ----- --------
  49     |                                             | Trk1  Trunk
  51     |                                  SFP+DAC    | Trk1  Trunk


Aruba-2930F-48G-4SFPP(config)# show trunks

 Load Balancing Method:  L3-based (default)

  Port   | Name                             Type       | Group Type
  ------ + -------------------------------- ---------- + ----- --------
  49     |                                  SFP+DAC    | Trk1  Trunk
  51     |                                  SFP+DAC    | Trk1  Trunk
```




### Configure hostname
Setting a name for the switch
```
ProCurve Switch 2610-48# config
ProCurve Switch 2610-48(config)# hostname 3DEA-48P
3DEA-48P(config)#
```

### Configure security features
This command prevents use of the WebAgent through http (port 80) server access.
```
config
no web-management
```

This command blocks inbound Telnet access.
```
config
no telnet-server
```

Remove all passwords
```
config
no password all
```

Set all passwords ("config password ?" for more info)
```
config
password all
```
```Diff
-N o t e : Login to switch as manager or operator in your Telnet session.
```

### Speed and duplex (Not tested yet)

Page 6-7 in the manual
```
 interface e a5 speed-duplex auto-10
```

### Disable ports (Not tested yet)
Page 6-7 in the manual
```
 interface e 1 disable 
```


### Configure Power over Ethernet
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

### Port mirroring
```
show monitor


ProCurve# config 
ProCurve(config)#no mirror-port

Turn on mirror on port 6
ProCurve(config)# mirror-port 6

Send data from port 1,2 and 3 to the mirror port
ProCurve(config)# interface 1,2,3 monitor

Turn of monitoring on port 3
ProCurve(config)# no interface 3 monitor

```


### References
[HP ProCurve Cheat Sheet](http://blog.petrilopia.net/info/hp-procurve-cli-cheatsheet-2/)


### Inventory

#### 2510 Series ProCurve
* J9019B ---- HP 2510-24
* J9020A ---- HP 2510-48

#### 2520 Series ProCurve
* J9138A ---- HP 2520-24/24 PWR

#### 2610 Series ProCurve
* J9085A ---- HP 2610-24
* J9086A ---- HP 2610-24/12 PWR
* J9087A ---- HP 2610-24/24 PWR
* J9088A ---- HP 2610-48

#### 2620 Series Aruba  (L3 ??)
* J9626A ---- HP 2620-48   

#### 2930 Series Aruba
* JL254A ---- HP 2930F  MAC E0:07:1B:C3:12:00     (TODO we have one more now :-)   )


#### Show information about model number
```
show tech buffers
```


### Things to test


* Disable SNMP ???


### Investigate to see if Mellanox 40Gbit to 4x 10Gbit cable will work on the Aruba switch
[Aruba unsupported transceiver](https://community.arubanetworks.com/aruba/attachments/aruba/CampusSwitching/3089/1/ARUBAOS-SWITCH%20UNSUPPORTED%20TRANSCEIVER%20GUIDE%20V2.pdf)

Command 
```
allow-unsupported-transceiver confirm
```
Testing with 
[Mellanox](http://www.mellanox.com/page/products_dyn?product_family=27)

* Mellanox breakout cable P/Ns (passive copper): MC2609130-001 (1m)
* 03:00.0 InfiniBand: Mellanox Technologies MT26428 [ConnectX VPI PCIe 2.0 5GT/s - IB QDR / 10GigE] (rev b0)
* mlnx-en-4.4-2.0.7.0-ubuntu16.04-x86_64.iso OK! (10Gbit only)

### FreeBSD and FreeNAS
```
http://www.mellanox.com/page/products_dyn?product_family=193&mtag=freebsd_driver

Works out of the box on FreeNAS 11.2 with this command from shell
(TODO Need to investigate how to do this automatically) 

sysctl sys.device.mlx4_core0.mlx4_port1=eth





```
