[![Ansible Lint](https://github.com/cbrookins/linux-setups/actions/workflows/ansible-lint.yml/badge.svg?branch=main)](https://github.com/theRealc2c2/linux-setups/actions/workflows/ansible-lint.yml)

# Linux Setup Scripts
Various Linux workstation setup scripts.

Ubuntu and Elementary do not come with Curl pre-installed so the following will take care of that
```
sudo apt update -y && sudo apt install curl -y
```
Bootstrap
```
curl https://raw.githubusercontent.com/cbrookins/linux-setups/main/bootstrap.sh | sh
```

***


Move to Ansible was inspired by  
https://github.com/charlesrocket/freebsd-playbook
