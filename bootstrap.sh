#!/bin/sh

set -eu

if ! command -v sudo >/dev/null 2>&1; then
	>&2 echo "This script requires 'sudo' binary to be installed"
	exit 1
fi

sudo dnf install -y git ansible

git clone https://github.com/therealc2c2/linux-setups && cd linux-setups

ansible-galaxy collection install community.general
ansible-playbook bootstrap.yml