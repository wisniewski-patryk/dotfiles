# /bin/bash

# https://www.linuxcapable.com/install-nvidia-drivers-on-debian/
# for debian 11 wtih CUDA (Proprietary)

sudo apt update | sudo apt upgrade 
sudo apt install dirmngr ca-certificates software-properties-common apt-transport-https dkms curl -y
curl -fSsL https://developer.download.nvidia.com/compute/cuda/repos/debian11/x86_64/3bf863cc.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/nvidia-drivers.gpg > /dev/null 2>&1
echo 'deb [signed-by=/usr/share/keyrings/nvidia-drivers.gpg] https://developer.download.nvidia.com/compute/cuda/repos/debian11/x86_64/ /' | sudo tee /etc/apt/sources.list.d/nvidia-drivers.list
sudo add-apt-repository contrib
sudo apt update
sudo apt install nvidia-driver cuda nvidia-smi nvidia-settings
sudo reboot
