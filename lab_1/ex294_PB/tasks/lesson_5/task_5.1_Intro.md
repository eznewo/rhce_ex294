# *_Section 5_*:
      Task1: Adding none default port 555 on remote host
      Task2: Creating and distributing ssh key to managed nodes
      Task3: Displaying file content
      Task3: Configuring privilege escalation on managed nodes
      Task4: Validate a working configuring using ad hoc Ansible command

## Task 1         
##### Need to know the sshd_config file first:
```bash
    ansible mh1 -m shell -a "cat /etc/ssh/sshd_config" -u root
```
##### Need to install the policycoreutils on the managed nodes before start this tasks

```bash
ansible mh4 -m shell "dnf install policycoreutils -y " -u root
ansible mh4 -m shell -a "dnf install policycoreutils* -y " -u root
ansible mh4 -m shell -a "systemctl status policycoreutils* " -u root
ansible mh4 -m seport -a "ports=555 proto=tcp setype=ssh_port_t state=present" -u root
```

### Step 1: Uncomment the "Port 22" line
```bash
ansible mh4 -m lineinfile -a "path=/etc/ssh/sshd_config regexp='^#Port' line='Port 22' " -u root
```

#### you can check using:
```bash
ansible mh4 -m shell -a "cat /etc/ssh/sshd_config" -u root
```
### Step 2: Adding Port 555 
```bash
ansible mh4 -m lineinfile -a "path=/etc/ssh/sshd_config insertafter='Port' line='Port 555'" -u root
ansible mh4 -m shell -a "cat /etc/ssh/sshd_config" -u root
```

#### to check:
```bash 
ansible mh4 -m shell -a "cat /etc/ssh/sshd_config" -u root
```


#### Configuring seport:
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
##### let's check
```bash
ping mh4 -p 555
ping mh4 -p 5558

ansible mh4 -m service -a "name=firewalld state=reloaded" -u root
ansible mh4 -a "firewall-cmd --list-all" 
ansible mh4 -a "firewall-cmd --list-all" -u root
ansible mh4 -m service -a "name=sshd state=restarted" -u root
```

####    TASK 2   
   commin soon ...

####    TASK 3  
   comming soon ...

####  TASK 4  
   comming soon ...

```bash
ansible mh1 -m debug -a msg={{ wawa | password_hash(sha512) }}
```

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
ansible mh1 -m debug -a msg={{ wawa | password_hash(sha512) }}
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
