#! /bin/bash

cd ../
ansible all -m shell -a "shutdown now" -b

sudo shutdown now 
