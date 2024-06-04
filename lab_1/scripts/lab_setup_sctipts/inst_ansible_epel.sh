#!/bin/bash

# this is installation of ansible using epel

# First we need to enable epel repo on our system
sudo dnf install epel-release

# after installing the epel ansible will be avilable and can be installed using dnf 

# to check if ansible is avilable on the repo, now it is not needed in this script
# dnf provides ansible 

# to install ansible 
sudo dnf install ansible* -y

echo "=============================================="
echo "**********************************************"
echo " Ansible is installed check below:  "
echo "          * ansible version                   "
ehco "          * location of config file           "
echo "          * other related info                "
echo " ******************************************** "
echo "=============================================="

# to check ansible is installed or not and to see the version 
ansible --version

