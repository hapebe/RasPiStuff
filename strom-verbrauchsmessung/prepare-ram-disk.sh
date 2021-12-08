#!/bin/bash
mkdir /mnt/ramdisk
echo "tmpfs /mnt/ramdisk tmpfs nodev,nosuid,size=50M 0 0" >> /etc/fstab
