# *_Section 5:_*
## Questions:
      Task1: Adding none default port 555 on remote host
      Task2: Creating and distributing ssh key to managed nodes
      Task3: Displaying file content
      Task4: Configuring privilege escalation on managed nodes
      Task5: Validate a working configuring using ad hoc Ansible command

## Answers:

#### Task 1         
###### sshd_config file
Need to know the sshd_config file first:

```bash
    ansible mh1 -m shell -a "cat /etc/ssh/sshd_config" -u root
```

###### Installing policycoreutils
Need to install the policycoreutils on the managed nodes before start this tasks

```bash
ansible mh4 -m shell "dnf install policycoreutils -y " -u root
ansible mh4 -m shell -a "dnf install policycoreutils* -y " -u root
ansible mh4 -m shell -a "systemctl status policycoreutils* " -u root
ansible mh4 -m seport -a "ports=555 proto=tcp setype=ssh_port_t state=present" -u root
```

##### Step 1: Set port 22
Uncomment the "Port 22" line
```bash
ansible mh4 -m lineinfile -a "path=/etc/ssh/sshd_config regexp='^#Port' line='Port 22' " -u root
```

###### check config file
you can check using:
```bash
ansible mh4 -m shell -a "cat /etc/ssh/sshd_config" -u root
```
##### Step 2: Adding Port 555 
```bash
ansible mh4 -m lineinfile -a "path=/etc/ssh/sshd_config insertafter='Port' line='Port 555'" -u root
ansible mh4 -m shell -a "cat /etc/ssh/sshd_config" -u root
```

###### to check:
```bash 
ansible mh4 -m shell -a "cat /etc/ssh/sshd_config" -u root
```
##### Configuring seport:
```bash
ansible-doc seport
ansible mh4 -m seport -a "ports=555 proto=tcp setype=ssh_port_t state=present" -u root
 
# add to mh4 <ansible_port=555> 
ansible mh4 -m ping -a "ansible_port=555" -u root
  
ansible mh4 -m shell -a "cat /etc/ssh/sshd_config" -u root
ansible mh4 -m seport -a "ports=555 proto=tcp setype=ssh_port_t state=present" -u root
ansible mh4 -m firewalld -a "port=555 state=enabled permanent=yes" -u root
ansible mh4 -m firewalld -a "port=555/tcp state=enabled permanent=yes" -u root
```
###### let's check
```bash
ping mh4 -p 555
ping mh4 -p 5558

ansible mh4 -m service -a "name=firewalld state=reloaded" -u root
ansible mh4 -a "firewall-cmd --list-all" 
ansible mh4 -a "firewall-cmd --list-all" -u root
ansible mh4 -m service -a "name=sshd state=restarted" -u root
```





####  TASK 2   
Creating and distributing ssh key to managed nodes

##### SSH Key
Creating distributing ssh key for ansible user to remote hosts:
switch to ansible host and generate the ssh key:
```bash
        su ansible
        ssh-keygen -t rsa
```

##### switch to root user using ad hoc command
```bash
        # creating user ansible on remote hosts with passwd eritrea
        ansible all -m user -a "name=ansible password='{{ 'eritrea' | password_hash('sha512') }}" -u root
        # copying the authorized key to remote hosts
        ansible all -m authorized_key -a "user='ansible' state=present key='{{ lookup('file', '/home/ansible/.ssh/id_rsa.pub') }}'" -u root
```


####    TASK 3  
Displaying file content
```yml
---
- hosts: mh1
  gather_facts: false
  vars:
          file_content: "{{ lookup('file', '/home/ansible/ansible/create_dir_file.sh') }}" 
  tasks:
          - name: Display file contents
            debug:
                    msg: "{{ file_content }}"
```

```bash
ansible mh1 -m debug -a msg={{ eritrea | password_hash(sha512) }}
```

```yaml
---
- hosts: mh1
  gather_facts: false
  vars:
          file_content: "{{ lookup('file', '/home/ansible/ansible/create_dir_file.sh') }}" 
  tasks:
          - name: Display file contents
            debug:
                    msg: "{{ file_content }}"
```


####  TASK 4  
Configuring privilege escalation on managed nodes

Validate a working configuring using ad hoc Ansible command

```bash
ansible mh1 -m debug -a msg={{ eritrea | password_hash(sha512) }}
```



### Privilege escalation ad hoc command

```bash
ansible all -m lineinfile -a "" -u root
```

     
     

####  TASK 5
      Task5: Validate a working configuring using ad hoc Ansible command