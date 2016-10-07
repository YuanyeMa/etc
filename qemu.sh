#!/bin/bash
#before run this script you need:
#Install nfs-kernel-server
#create nfsroot directory and modify permission with '777' 
#add /root/rootfs *(rw,insecure,sync,no_root_squash) in /etc/exports
#start nfs-kernel-server with /etc/init.d/nfs-kernel-server start

qemu-system-arm  -M vexpress-a9 -m 512M -nographic -append "console=ttyAMA0 root=/dev/nfs nfsroot=/root/rootfs rw ip=dhcp nousb" -kernel  /root/zImage-3.0
