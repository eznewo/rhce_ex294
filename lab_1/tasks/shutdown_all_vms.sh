#! /bin/bash

#cd ../
ansible all -m shell -a "shutdown now" -b

#ssh ansible@rac
#sudo shutdown now

sudo shutdown now 
