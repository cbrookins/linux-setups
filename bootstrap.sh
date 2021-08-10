#!/bin/sh

set -eu

if ! command -v sudo >/dev/null 2>&1; then
	>&2 echo "This script requires 'sudo' binary to be installed"
	exit 1
fi

echo "[1] Cent OS"
echo "[2] Fedora"
echo "[3] Ubuntu"
echo "Enter 1-3"
read -n 1 -r

if [$REPLY == 1] then
	sudo dnf install -y git centos-release-ansible-29
elif [$REPLY == 2] then
	sudo dnf install -y git ansible
elif [$REPLY == 3] then
	sudo apt install -y git ansible
else
	echo "incorrect input"
	break
fi

git clone https://github.com/therealc2c2/linux-setups && cd linux-setups

ansible-galaxy collection install community.general
ansible-playbook bootstrap.yml
