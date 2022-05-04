# Linux Setup Scripts
Various Linux workstation setup scripts.

Ubuntu and Elementary do not come with Curl pre-installed so the following will take care of that
```
sudo apt update -y && sudo apt install curl -y
```
Bootstrap
```
curl https://raw.githubusercontent.com/theRealc2c2/linux-setups/main/bootstrap.sh | sh
```

***


Move to Ansible was inspired by  
https://github.com/charlesrocket/freebsd-playbook
