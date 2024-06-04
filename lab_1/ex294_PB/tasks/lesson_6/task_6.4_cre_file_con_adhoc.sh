### Adhoc






























# Check reachablity
  ansible all -m ping

# To avoid the warning 
export PYTHONWARNINGS=ignore::UserWarning
source ~/.bashrc

# vim lesson_6/task_6.1_service.yml
# vim lesson_6/task_6.1_service.yml 

ansible-playbook lesson_6/task_6.1_service.yml --syntax-check

# vim lesson_6/task_6.1_service.yml 

ansile-playbook lesson_6/task_6.1_service.yml 
ansible-playbook lesson_6/task_6.1_service.yml --syntax-check
ansible-playbook lesson_6/task_6.1_service.yml -C

ansible-playbook lesson_6/task_6.1_service.yml 
ansible-doc yum

ansible webservers -a "systemctl status httpd" 
ansible prod -a "systemctl status mariadb"

vim lesson_6/task_6.2_user.yml
ansible-playbook lesson_6/task_6.2_user.yml 
ansible all -a "id mark"

vim lesson_6/task_6.3_file.yml
ansible-doc file 

vim lesson_6/task_6.3_file.yml
ansible all -a "groupid mark"
ansible all -a "groups"

ssh mh1

vim lesson_6/task_6.3_file.yml
ansible-playbook lesson_6/task_6.3_file.yml 
ansible all -a "ls /root/mark_file"
ansible all -a "ls /root/mark_file" -b
ansible all -a "ls -l /root/mark_file" -b
ansible all -m file -a "path=/root/file1.txt state=touch" -b -C 
ansible all -m file -a "path=/root/file1.txt state=touch" -b 
ansible all -m file -a "path='/root/file1.txt' mode='770' state=touch" -b 
ansible all -a "ls -l /root/" -b
ansible all -m copy -a "content='This text file created using Ansible Capito' dest='/root/file1.txt' state=present" -b
ansible all -m copy -a "content='This text file created using Ansible Capito' dest='/root/file1.txt' " -b
ansible all -a "cat /root/file1.txt" -b

