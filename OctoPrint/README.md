### OctoPrint on Creality Ender 3

TODO: Picture of board and LCD firmware version


https://octoprint.org/download/
```bash
sudo apt install -y python3 python3-pip python3-dev
sudo apt install -y python3-venv

sudo chown $USER /dev/ttyUSB0

python3 -m venv OctoPrint

source OctoPrint/bin/activate

pip3 install OctoPrint

./OctoPrint/bin/octoprint serve
```

https://howchoo.com/g/ntg5yzg1odk/using-octoprint-with-the-creality-ender-3-3d-printer
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


