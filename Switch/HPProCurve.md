This is under construction. Just bits and pieces I had in various files



Tftp firmware update command

copy tftp flash {ip til tftp server} {filen} {Primarry | Secondary}

http://h22208.www2.hpe.com/eginfolib/networking/docs/switches/K-KA-KB/15-18/5998-8160_ssw_mcg/content/ch10s02.html

video:
https://www.youtube.com/watch?v=rdq5vVmoNqg





Putty:
Telnnet til port 23
Serieport, 19200 baud
Slett konfigurasjon:
   config
   erase startup-configuration





Putty
  http://www.putty.org/

Terminte ( RS232 terminal )
  https://www.compuphase.com/software_termite.htm
 




Vis system informasjon
  show system-information
   show ip
   
   show vlan
    
 
Sett opp VLAN   
    
    configure
    exit             Opp eit nivå
    
    
    
    Du kan legge til eit VLAN med :
    
    ProCurve Switch 2610-48# configure
    ProCurve Switch 2610-48(config)# vlan 137
    ProCurve Switch 2610-48(vlan-137)# name TestVLAN37
    ProCurve Switch 2610-48(vlan-137)# tagged 49
    ProCurve Switch 2610-48(vlan-137)# untagged 37
    ProCurve Switch 2610-48(vlan-137)# show vlan 137
    ProCurve Switch 2610-48(vlan-137)# exit
    
    
    Du kan slette eit VLAN med :
    
    no vlan 137
    
    
    
 
erase startup-configuration
 

Using the CLI
This command operates at any level except the Operator level.

N o t e
The erase startup-config command does not clear passwords.

Using the Clear/Reset Buttons
To execute the factory default reset, perform these steps:
1. Using pointed objects, simultaneously press both the Reset and Clear
2. Continue to press the Clear button while releasing the Reset button.
3. When the Self Test LED begins to flash, release the Clear button.
C-44
CLI
Clear/Reset button combination
erase startup-configuration
Deletes the startup-config file in flash so that the switch will
reboot with its factory-default configuration.
buttons on the front of the switch.
The switch will then complete its self test and begin operating with the
configuration restored to the factory default settings.
