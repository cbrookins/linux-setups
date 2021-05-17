#! /bin/bash
## My Fedora 33 install

##
## Update system and install packages
##
echo "Updating system..."
sudo dnf -y update

clear

echo "Adding RPM Fusion repos"
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

clear

echo "Adding Microsoft repos"
## Register the Microsoft RedHat repository
curl https://packages.microsoft.com/config/fedora/33/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo
curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo

clear

echo "Installing software..."
sudo dnf -y check-update
sudo dnf -y install gtkhash compat-openssl10 ffmpeg ffmpeg-libs fuse-exfat exfat-utils peek powershell
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y flathub com.visualstudio.code org.gnome.seahorse.Application org.videolan.VLC

clear

## Enable BCM43228 WiFi Card
echo "Prepping WiFi Kernel Module.."
sudo dnf install -y kernel-devel broadcom-wl dkms
git clone https://github.com/antoineco/broadcom-wl
dkms add ./broadcom-wl

clear

## PIA Client
echo "Setting up PIA"
wget https://www.privateinternetaccess.com/openvpn/openvpn.zip
unzip openvpn-nextgen.zip
nmcli connection import type openvpn file ./netherlands.ovpn

clear

echo "Complete.  Rebooting in 10s..."
sleep 10
reboot
