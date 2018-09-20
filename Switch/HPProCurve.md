# HP ProCurve switches

Usermanual for the HP ProCuve 2500 series : ftp://ftp.hp.com/pub/networking/software/59692354.pdf




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
show vlan
```

### Clear settings / Reboot
```
erase startup-config

reload

```

```Diff
-N o t e : The erase startup-config command does not clear passwords.

```



### Save settings
```

 HP2512(config)# write memory
```



Using the Clear/Reset Buttons
To execute the factory default reset, perform these steps:
1. Using pointed objects, simultaneously press both the Reset and Clear
2. Continue to press the Clear button while releasing the Reset button.
3. When the Self Test LED begins to flash, release the Clear button.



### Configure VLAN
```
Add a VLAN

ProCurve Switch 2610-48# configure
ProCurve Switch 2610-48(config)# vlan 137
ProCurve Switch 2610-48(vlan-137)# name TestVLAN37
ProCurve Switch 2610-48(vlan-137)# tagged 49
ProCurve Switch 2610-48(vlan-137)# untagged 37
ProCurve Switch 2610-48(vlan-137)# show vlan 137
ProCurve Switch 2610-48(vlan-137)# exit

Deleta a VLAN

no vlan 137

```
    
### TFTP firmware upgrade

copy tftp flash {tftp server ip} {file} {Primarry | Secondary}

copy tftp flash 192.168.0.1 k0800.swi

http://h22208.www2.hpe.com/eginfolib/networking/docs/switches/K-KA-KB/15-18/5998-8160_ssw_mcg/content/ch10s02.html

video:
https://www.youtube.com/watch?v=rdq5vVmoNqg

