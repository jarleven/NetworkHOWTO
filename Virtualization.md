

## Quick about VMWare Player

[Download](https://www.vmware.com/products/workstation-player.html)

Ctrl + Alt to exit mouse back to host
Remember to install VMWare tools


## Virtualbox

Connect to the remote deskop  VRDP

In windows search for the remote desktop application
```
Win+S mstsc 
```

## QEMU / KVM

Write a QEMU image to a physical disk.
Windows installations missing drivers can be fixed with a working installer on a USB thumb drive.
```
qemu-img convert test.img -O raw /dev/sdd
```

## Converting physical disk/machine to image
https://www.macrium.com/reflectfree
