# In Section:
	# Task1: Adding none default port 555 on remote host
	# Task2: Creating and distributing ssh key to managed nodes
	# Task3: Displaying file content
	# Task3: Configuring privilege escalation on managed nodes
	# Task4: Validate a working configuring using ad hoc Ansible command


############################
##      Task 1          ###
###########################

# need to know the sshd_config file first:
  749  ansible mh1 -m shell -a "cat /etc/ssh/sshd_config" -u root

# Need to install the policycoreutils on the managed nodes before start this tasks
  757  ansible mh4 -m shell "dnf install policycoreutils -y " -u root


  766  ansible mh4 -m shell -a "dnf install policycoreutils* -y " -u root
  767  ansible mh4 -m shell -a "systemctl status policycoreutils* " -u root
  768  ansible mh4 -m seport -a "ports=555 proto=tcp setype=ssh_port_t state=present" -u root


# Step 1: Uncomment the "Port 22" line
  750  ansible mh4 -m lineinfile -a "path=/etc/ssh/sshd_config regexp='^#Port' line='Port 22' " -u root

# you can check using:
  751  ansible mh4 -m shell -a "cat /etc/ssh/sshd_config" -u root

# Step 2: Adding Port 555 
  752  ansible mh4 -m lineinfile -a "path=/etc/ssh/sshd_config insertafter='Port' line='Port 555'" -u root
  803  ansible mh4 -m shell -a "cat /etc/ssh/sshd_config" -u root

# to check:
  753  ansible mh4 -m shell -a "cat /etc/ssh/sshd_config" -u root

# Configuring seport:
  754  ansible-doc seport
  768  ansible mh4 -m seport -a "ports=555 proto=tcp setype=ssh_port_t state=present" -u root

  763  ssh mh4
  769  vim mnodes 
  770  #### add to mh4 <ansible_port=555> #####
  775  ansible mh4 -m ping -a "ansible_port=555" -u root
  
  803  ansible mh4 -m shell -a "cat /etc/ssh/sshd_config" -u root
  804  ansible mh4 -m seport -a "ports=555 proto=tcp setype=ssh_port_t state=present" -u root
  805  ansible mh4 -m firewalld -a "port=555 state=enabled permanent=yes" -u root
  806  ansible mh4 -m firewalld -a "port=555/tcp state=enabled permanent=yes" -u root
  807  vim mnodes 
  808  ping mh4 -p 555
  809  ping mh4 -p 5558
  810  ansible mh4 -m service -a "name=firewalld state=reloaded" -u root
  811  vim mnodes 
  812  ansible mh4 -m service -a "name=firewalld state=reloaded" -u root
  813  vim mnodes 
  814  ansible mh4 -m service -a "name=firewalld state=reloaded" -u root
  815  ansible mh4 -a "firewall-cmd --list-all" 
  816  vim mnodes 
  817  ansible mh4 -a "firewall-cmd --list-all" 
  818  ansible mh4 -a "firewall-cmd --list-all" -u root
  819  ansible mh4 -m service -a "name=sshd state=restarted" -u root
  820  ssh mh4
  821  ssh mh4 -p 555
  822  vim mnodes 
  823  ansible mh4 -a "firewall-cmd --list-all" -u root
  824  ssh mh4
  825  ssh mh1
  826  su ansible
  827  ansible linux --list-hosts
  828  ls
  829  cd ..
  830  ls
  831  ls lab_helper_file/
  832  cp lab_helper_file/shutdown_all_vms.sh tasks/
  833  ls tasks/
  834  ansible all -m ping 
  835  ansible --version
  836  ls
  837  cd ..
  838  cd -
  839  ls
  840  cd tasks/
  841  ls
  842  ansible all -m ping
  843  ansible all -m ping -u root
  844  ls 
  845  cat shutdown_all_vms.sh 
  846  ansible all -m shell -a "shutdown now" -u root
  847  shutdown now 
  848  nmtui
  849  history
  850  ping google.com
  851  ping 8.8.8.8
  852  ping 192.168.99.1
  853  ping 192.168.99.10
  854  ping 192.168.99.100
  855  ping 192.168.56.1
  856  ls 
  857  ls lesson_5/
  858  cat lesson_5/task_5.1_Intro 
  859  vim lesson_5/task_5.1_Intro 
  860  vim lesson_5/task_5.3_dist_ssh_key.yml
  861  ansible mh1 -m ping -C
  862  pwd
  863  ls 
  864  vim mnodes 
  865  vim ansible.cfg
  866  ansible mh1 -m ping -C
  867  vim lesson_5/task_5.3_dist_ssh_key.yml
  868  ansible-doc authorized_key
  869  reste
  870  reset
  871  vim lesson_5/task_5.3_dist_ssh_key.yml
  872  ansible-doc authorized_key
  873  vim lesson_5/task_5.3_dist_ssh_key.yml
  874  ansible all -m ping 
  875  export PYTHONWARNINGS=Ignore::UserWarning
  876  ansible all -m ping 
  877  export PYTHONWARNINGS=ignore::UserWarning
  878  ansible all -m ping 
  879  ansible all -m user -a "name=ansible password='{{ 'wawa' | password_hash('sha512') }}'" -u root -C
  880  ansible all -m user -a "name=ansible password='{{ 'wawa' | password_hash('sha512') }}'" -u root --check
  881  ansible all -m shell -a "id ansible" 
  882  ansible all -m shell -a "cat /home/ansible/.ssh/authorized_keys" -u root
  883  ansible all -m shell -a "cat /home/ansible/.ssh/authorized_keys" -u ansible
  884  ansible all -m shell -a "cat /home/ansible/.ssh/authorized_keys" -u root
  885  ssh mh1
  886  ansible all -m authorized_key -a "user='ansible' key='{{ lookup('file', '/home/ansible/.ssh/id_rsa.pub') }}' path='/home/ansible/.ssh/authorized_keys' " -u root -C
  887  ansible all -m authorized_key -a "user='ansible' key='{{ lookup('file', '/home/ansible/.ssh/id_rsa.pub') }}' path='/home/ansible/.ssh/authorized_keys' " -u root 
  888  ansible all -m shell -a "id ansible" -u root
  889  ansible all -m shell -a "ls /home/ansible/.ssh/ " -u root
  890  ansible all -m shell -a "ls -l /home/ansible/.ssh/ " -u root
  891  ansible all -m shell -a "cat /home/ansible/.ssh/authorized_keys 


##########################
####    TASK 2   #########
##########################




##########################
####    TASK 3   #########
##########################






##########################
####    TASK 4   #########
##########################



##########################
####    TASK 5   #########
##########################



##########################
####    TASK 6   #########
##########################



##########################
####    TASK 7   #########
##########################





ansible mh1 -m debug -a msg={{ wawa | password_hash(sha512) }}
---
- hosts: mh1
  gather_facts: false
  vars:
          file_content: "{{ lookup('file', '/home/ansible/ansible/create_dir_file.sh') }}" 
  tasks:
          - name: Display file contents
            debug:
                    msg: "{{ file_content }}"










  871  vim lesson_5/task_5.3_dist_ssh_key.yml
  872  ansible-doc authorized_key
  873  vim lesson_5/task_5.3_dist_ssh_key.yml
  874  ansible all -m ping 
  875  export PYTHONWARNINGS=Ignore::UserWarning
  876  ansible all -m ping 
  877  export PYTHONWARNINGS=ignore::UserWarning
  878  ansible all -m ping 
  879  ansible all -m user -a "name=ansible password='{{ 'wawa' | password_hash('sha512') }}'" -u root -C
  880  ansible all -m user -a "name=ansible password='{{ 'wawa' | password_hash('sha512') }}'" -u root --check
  881  ansible all -m shell -a "id ansible" 
  882  ansible all -m shell -a "cat /home/ansible/.ssh/authorized_keys" -u root
  883  ansible all -m shell -a "cat /home/ansible/.ssh/authorized_keys" -u ansible
  884  ansible all -m shell -a "cat /home/ansible/.ssh/authorized_keys" -u root
  885  ssh mh1
  886  ansible all -m authorized_key -a "user='ansible' key='{{ lookup('file', '/home/ansible/.ssh/id_rsa.pub') }}' path='/home/ansible/.ssh/authorized_keys' " -u root -C
  887  ansible all -m authorized_key -a "user='ansible' key='{{ lookup('file', '/home/ansible/.ssh/id_rsa.pub') }}' path='/home/ansible/.ssh/authorized_keys' " -u root 
  888  ansible all -m shell -a "id ansible" -u root
  889  ansible all -m shell -a "ls /home/ansible/.ssh/ " -u root
  890  ansible all -m shell -a "ls -l /home/ansible/.ssh/ " -u root
  891  ansible all -m shell -a "cat /home/ansible/.ssh/authorized_keys " -u root

ansible mh1 -m debug -a msg={{ wawa | password_hash(sha512) }}
---
- hosts: mh1
  gather_facts: false
  vars:
          file_content: "{{ lookup('file', '/home/ansible/ansible/create_dir_file.sh') }}" 
  tasks:
          - name: Display file contents
            debug:
                    msg: "{{ file_content }}"
