#!/bin/bash

# to install ansible using epel
# sudo dnf install epel-release

# to install ansible using dnf
# to check if dnf provide ansible
# dnf provides ansible

# to install using dnf
sudo dnf install ansible* -y

echo "=============================================="
echo "**********************************************"
echo " Ansible is installed check below:  "
echo "          * ansible version                   "
echo "          * location of config file           "
echo "          * other related info                "
echo " ******************************************** "
echo "=============================================="

ansible --version
