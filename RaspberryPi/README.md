
#### Copy WiFi settings and enable SSH on a fresh baked SDCard
```
copy c:\Temp\wpa_supplicant__.conf d:\wpa_supplicant.conf
echo.> d:\ssh.txt
```

#### Norwegian timezone

```bash
sudo timedatectl set-timezone Europe/Oslo
```

```
# wpa_supplicant.conf
country=NO
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
	ssid="YourSSID"
	psk="YourKEY"
	proto=RSN
	key_mgmt=WPA-PSK
	pairwise=CCMP
	auth_alg=OPEN
}
```


* https://www.raspberrypi.com/software/operating-systems/#raspberry-pi-os-32-bit
* https://www.raspberrypi.com/software/operating-systems/#raspberry-pi-os-64-bit

