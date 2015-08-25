#!/bin/bash
dd if=/dev/zero of=system_ext4.img bs=40M count=10
mkfs.ext4 system_ext4.img
tune2fs -c0 -i0 system_ext4.img
mkdir system-ext4
mount -o loop system_ext4.img system-ext4/
cp -v -r -p system/* system-ext4/
umount system-ext4/
rm -rf system_ext4
