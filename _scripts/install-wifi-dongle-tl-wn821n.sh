# /bin/bash

# install wifi dongle 
# https://wiki.debian.org/WiFi

sudo apt-get update && apt-get upgrade && && apt-get dist-upgrade 

lsusb # should show 2357:0107

sudo apt-get install git linux-headers-generic build-essential dkms
git clone https://github.com/Mange/rtl8192eu-linux-driver
cd rtl8192eu-linux-driver
sudo dkms add .
sudo dkms install rtl8192eu/1.0

sudo reboot

# (optional)
# echo "blacklist rtl8xxxu" | sudo tee /etc/modprobe.d/rtl8xxxu.conf

# 6. Reboot and check that the kernel module is loaded by running: 
# lsmod
