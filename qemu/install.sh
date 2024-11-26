#!/bin/bash

qemu-system-x86_64 \
-m 8G \
-smp 6 \
-cdrom /home/seongbae/Downloads/archlinux-2024.03.01-x86_64.iso \
-drive file=/mnt/thirdDrive/Virtualization/gentoo.qcow2,if=virtio \
-vga virtio \
-display default,show-cursor=on \
-usb \
-device usb-tablet \
-cpu host \
-machine type=q35,accel=kvm \
# -boot uefi \
