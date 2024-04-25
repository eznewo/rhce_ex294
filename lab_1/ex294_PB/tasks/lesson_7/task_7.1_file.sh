# Ad hoc commands to create 


ansible prod -m file -a "path='/root/redhat/ex294' state=directory" -b 
ansible prod -m file -a "path='/root/redhat/ex294/results' mode=g+rwx,o+rx owner=mark group=mark state=touch" -b 

ansible prod -m file -a "src='/root/redhat/ex294/results' dest=/root/results  state=link" -b 
