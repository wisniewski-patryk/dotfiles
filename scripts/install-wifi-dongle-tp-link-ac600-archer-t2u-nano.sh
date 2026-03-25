# /bin/bash

# install wifi dongle tp link ac600 archer t2u nano
# https://ostechnix.com/install-tp-link-ac600-archer-t2u-nano-wifi-usb-adapter-in-linux/

# Install driver
lsusb # should show: '... ID 2377:011e'

apt install dkms git build-essential libelf-dev linux-headers-$(uname -r)
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au/
sudo make dkms_install
sudo dkms status # should show: '8812au, 5.6.4.2_35491.20191025, 5.11.15-1-default, x86_64: installed'

# Network manager
## if network-manager is not installed (for example on fresh system)
apt install network-manager
systemctl start NetworkManager.service 
systemctl enable NetworkManager.service

# nmcli dev wifi connect <network-ssid> password '<network-passwork>' # network-ssid - network name; network-password
# if you don't want to provide a password on screen/scrypt, use the command below
sudo nmcli --ask dev wifi connect <network-ssid>
