# Creating a rhce user on all managed nodes and password rhce_pass(usesha512 group ex294 uid 2021

ansible all -m group -a "name=ex294 state=present" -b 
ansible all -m user -a "name=rhce password={{ 'wawa' | password_hash('sha512') }} group=ex294 uid=2021" -b 
