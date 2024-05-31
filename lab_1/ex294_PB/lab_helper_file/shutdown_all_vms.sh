#! /bin/bash

# To shutdown all the servers in this lab

# To shutdown all the remote servers or nodes
ansible all -m shell -a "shutdown now" -b

# To shutdown the controler node
sudo shutdown now 
