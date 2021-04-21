#! /bin/bash
## My CentOS 8 install

##
## Update system and install packages
##
echo "Updating system..."
sudo dnf -y update

clear

echo "Adding Microsoft repos"
## Register the Microsoft RedHat repository
curl https://packages.microsoft.com/config/rhel/8/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo

clear

echo "Installing software..."
## Install PowerShell, VSCode
sudo dnf -y check-update
sudo dnf -y install git epel-release virt-manager flatpak powershell gtkhash
sudo flatpak install -y flathub com.visualstudio.code org.gnome.seahorse.Application org.videolan.VLC

clear

echo "Complete"
