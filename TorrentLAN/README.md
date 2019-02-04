# Torrent on the LAN

Description of a high speed file deployment for multiple students in a classroom.
Effective way of deploying DVD ISO images to multiple students on a LAN.


Mostly a proof of consept for now.



### Thanks to the following sites for information about bits and pieses
* https://www.itzgeek.com/how-tos/linux/ubuntu-how-tos/install-%CE%BCtorrent-utorrent-on-ubuntu-18-04-ubuntu-17-10-17-04.html


### Start the server with
```
utserver -settingspath /opt/utorrent-server-alpha-v3_3/ &
```

### Access the GUI with
http://localhost:8080/gui

username = admin
password is blank

### Change the following (TODO add some screenshots)
```
Set IP/Hostname in Settings->Bittorrent
Setkatalogar 
Slå av upnp og NAT i connection
```

### Transmission
```
udp://192.168.1.187:6881
http://192.168.1.187:6881/announce
```
