### OctoPrint on Creality Ender 3, 4.2.2 Mainboard,  12864 LCD

google "4.2.2 bltouch 16864"

* TODO: Picture of board and LCD firmware version
* TODO: Difference Ender 3  -vs-  Ender 3 v2  -vs-  Ender 3 Pro
* TODO: Link to firmware
* TODO: Package to support Ender3 (safety temperature hack)
* TODO: Thermal runnaway firmware protection : https://howchoo.com/ender3/ender-3-bootloader-firmware-update-marlin

* User / Password / host 
* octoprint / 3Dprint / https://192.168.1.131:5000

### Linux slicer
* Cura 4.8 in Ubuntu TODO share settings file ?

### Installing on a PC running Ubuntu 
* https://octoprint.org/download/
```bash
sudo apt install -y python3 python3-pip python3-dev
sudo apt install -y python3-venv

sudo chown $USER /dev/ttyUSB0

python3 -m venv OctoPrint

source OctoPrint/bin/activate

pip3 install OctoPrint

./OctoPrint/bin/octoprint serve
```

### OctoPrint settings
* https://howchoo.com/g/ntg5yzg1odk/using-octoprint-with-the-creality-ender-3-3d-printer
```
Form factor: Rectangular
Origin: Lower Left
Heated Bed: Yes (checked)
Heated Chamber: No (unchecked)
Width: 220mm
Depth: 220mm
Height: 250mm
Axes: Default**
Custom Bounding Box: No (unchecked)
Nozzle Diameter: 0.4mm
Number of Extruders: 1


Baudrate 115200
```



### USB Webcam (Not tested)
* https://medium.com/@michal.jaglewicz/how-to-get-a-video-stream-for-octoprint-on-linux-8a7cc2bd1fe8


### Fusion360 CAM / OctoPrint plugin
* https://www.youtube.com/watch?v=GQSJIdTnNOU
* 


### Marlin Build

* https://github.com/MarlinFirmware/Marlin
* https://github.com/criskurtin/Marlin/tree/marlin2-v422-bltouch



### Firmware (Not tested)

* https://marlin.crc.id.au/firmware/Ender%203%20-%20v4.2.2%20Board%20-%20BLTouch/


