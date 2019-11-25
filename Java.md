
# Accessing legacy webpages requering Java plugin
#### Work In Progress. Probably no needed to reboot. But do remember to turn off updates ASAP!

To test your browser follow this link : https://www.java.com/en/download/installed8.jsp?detect=jre


### Windows

Direct download link : [Windows 32Bit US 52.7.3 ESR Installer](https://ftp.mozilla.org/pub/firefox/releases/52.7.3esr/win32/en-US/Firefox%20Setup%2052.7.3esr.exe)

#### Disable the network after downloading the file, then install and run Firefox.
#### Turn off updates in Firefox first time you run the application!

Restart Firefox

Go to this page https://www.java.com/en/download/installed.jsp

Use the download link in the header on this page.

Download install restart windows

Link to releases : https://ftp.mozilla.org/pub/firefox/releases/


#### Tested 25.11.2019 https://www.java.com/en/download/installed8.jsp?detect=jre
```
Firefox-ESR 52.7.3 (32-bit)
Oracle Java Version 8 Update 231

```


### Windows and HP Prolinat iLO

HPE Lights-Out Standalone Remote Console for Windows
1.3.3 (28 Sep 2017) HPE ProLiant or Integrity server with iLO 3, iLO 4 or iLO 5.
iLO 3 firmware v1.15 or later.

https://support.hpe.com/hpsc/swd/public/detail?swItemId=MTX_bc8e3ffa59904ec3b505d9964d



### Ubuntu Linux 18.10  cosmic
```
sudo add-apt-repository ppa:cding/firefox-esr-52
sudo apt-get update
sudo apt-get install firefox-esr
sudo apt-get install icedtea-plugin

firefox-esr

```

To remove again
sudo add-apt-repository --remove ppa:cding/firefox-esr-52

Repository home
https://launchpad.net/~cding/+archive/ubuntu/firefox-esr-52/+index?field.series_filter=cosmic

### Ubuntu Linux 18.04 bionic / 16.04 xenial / 14.04 trusty
```
sudo add-apt-repository ppa:jonathonf/firefox-esr-52
sudo apt-get update
sudo apt-get install firefox-esr
sudo apt-get install icedtea-plugin

firefox-esr

```

Repository home
https://launchpad.net/~jonathonf/+archive/ubuntu/firefox-esr-52
