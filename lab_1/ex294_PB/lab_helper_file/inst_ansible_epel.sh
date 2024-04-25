#!/bin/bash

# this is installation of ansible using epel

sudo dnf install epel-release
# to check if provided ansibe 
# dnf provides ansible

# installation of ansible
dnf install ansible

# to print out the version of ansible 
ansible --version
