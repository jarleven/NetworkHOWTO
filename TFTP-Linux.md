Instructions for TFTP server

https://help.ubuntu.com/community/TFTP

```
sudo apt update
sudo apt install tftpd-hpa
sudo service tftpd-hpa status

```

To copy your file to the TFTP server

```
cp YOURFILE /var/lib/tftpboot/

```

For Ubuntu 20.04.1
```
cp YOURFILE /srv/tftp/
```

Defaut config file for the TFTP server
```
vi /etc/default/tftpd-hpa

```
