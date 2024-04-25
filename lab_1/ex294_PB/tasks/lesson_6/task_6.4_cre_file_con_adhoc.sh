  276  ansible all -m ping
  277  export PYTHONWARNINGS=igrnore::UserWarning
  278  source ~/.bashrc
  279  ansible all -m ping
  280  export PYTHONWARNINGS=ignore::UserWarning
  281  source ~/.bashrc
  282  ansible all -m ping 
  283  vim lesson_6/task_6.1_service.yml
  284  vim lesson_6/task_6.1_service.yml 
  285  ansible-playbook lesson_6/task_6.1_service.yml --syntax-check
  286  vim lesson_6/task_6.1_service.yml 
  287  ansile-playbook lesson_6/task_6.1_service.yml 
  288  ansible-playbook lesson_6/task_6.1_service.yml --syntax-check
  289  vim lesson_6/task_6.1_service.yml 
  290  ansible-playbook lesson_6/task_6.1_service.yml --syntax-check
  291  ansible-playbook lesson_6/task_6.1_service.yml -C
  292  vim lesson_6/task_6.1_service.yml 
  293  ansible-playbook lesson_6/task_6.1_service.yml --syntax-check
  294  ansible-playbook lesson_6/task_6.1_service.yml -C
  295  ansible-playbook lesson_6/task_6.1_service.yml 
  296  ansible-doc yum
  297  clear
  298  ansible webservers -a "systemctl status httpd" 
  299  ansible prod -a "systemctl status mariadb"
  300  vim lesson_6/task_6.2_user.yml
  301  ansible-playbook lesson_6/task_6.2_user.yml 
  302  ansible all -a "id mark"
  303  vim lesson_6/task_6.3_file.yml
  304  ansible-doc file 
  305  vim lesson_6/task_6.3_file.yml
  306  ansible all -a "groupid mark"
  307  ansible all -a "groups"
  308  ssh mh1
  309  vim lesson_6/task_6.3_file.yml
  310  ansible-playbook lesson_6/task_6.3_file.yml 
  311  ansible all -a "ls /root/mark_file"
  312  ansible all -a "ls /root/mark_file" -b
  313  ansible all -a "ls -l /root/mark_file" -b
  314  ansible all -m file -a "path=/root/file1.txt state=touch" -b -C 
  315  ansible all -m file -a "path=/root/file1.txt state=touch" -b 
  316  ansible all -m file -a "path='/root/file1.txt' mode='770' state=touch" -b 
  317  ansible all -a "ls -l /root/" -b
  318  ansible all -m copy -a "content='This text file created using Ansible Capito' dest='/root/file1.txt' state=present" -b
  319  ansible all -m copy -a "content='This text file created using Ansible Capito' dest='/root/file1.txt' " -b
  320  ansible all -a "cat /root/file1.txt" -b

