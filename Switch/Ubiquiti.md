Creating a 101 for the switch

https://www.dustin.no/product/5011004925/edgeswitch-es-16-xg

https://help.ubnt.com/hc/en-us/articles/205220850-EdgeSwitch-SFP-SFP-and-DAC-Compatibility-List


https://help.ubnt.com/hc/en-us/articles/115013212107-UFiber-Enabling-Ubiquiti-SFP-and-SFP-Modules-on-Third-Party-Devices



if this is not working, then using command line : 
ssh the switch
telnet locahost [ENTER]
show fiber-ports optics-info all [ENTER] <= this give you the electrical interface of the SFP/SFP+
show fiber-ports optics all [ENTER] <= this give you the optic interface, normally not existant in your case
 
BTW, for clarity "show fiber-ports optics-info all" & "show fiber-ports optics all" commands did not work on my us-48
I used "show fiber-ports optical-transceiver-info all" & "show fiber-ports optical-transceiver all" and that gave me the correct output.
