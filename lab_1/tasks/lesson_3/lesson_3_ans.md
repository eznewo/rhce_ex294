### Ansible Facts
#### Imprtant during filter out variables from ansible facts:


- To display facts
 ```bash
  ansible mh1 -m setup 
```
</br>

- To diplay that has the word "ansible_"
```bash
 ansible mh1 -m setup | grep ansible_
```
</br>

- To display nodename
```bash
 ansible mh1 -m setup | grep ansible_nodename
```
</br>

- To diplay 10 lines after find the workd "anisble_"
```bash
 ansible mh1 -m setup | grep -a10 ansible
```

#### Firewall
 - Allowing port 80 

```yaml
---
- hosts: all
  become: true
  gather_facts: false
  tasks:
          - name: Adding firewall rule
            firewalld:
                    port: 80/tcp
                    state: enabled
                    permanent: yes
            notify: Reload firewall
  handlers:
          - name: Reload firewall
            systemd:
                    name: firewalld
                    state: reloaded
---
```

#### Display variables
- Ex 1:
    - using Dictionary vars key and value

```yaml
---
- hosts: all
  gather_facts: false
  vars:
          key: value
  tasks:
          - name: Display variable
            debug:
                    msg: "{{ key }}"
---
```

- Ex 2:
    - using Dictionary vars key and value

```yaml
---
- hosts: all
  gather_facts: false
  vars:
          dict:
                  key1: value1
                  key2: value2
  tasks:
          - name: Display variable
            debug:
                    msg: "{{ dict.key1 }}"
---
```


Ex 3:
    - using named list

```yaml
---
- hosts: all
  gather_facts: false
  vars:
          list:
                  - item1
                  - item2
                  - item3
  tasks:
          - name: Display variable
            debug:
                    msg: "{{ list[1] }}"
---
```

Ex 4: 
    - using dictionary list:
   

```yaml 
---
- hosts: all
  gather_facts: false
  vars:
          users:
                  - name: mark
                    age: 35
                  - name: lisa
                    age: 28
                  - name: lara
                    age: 30
  tasks:
          - name: Display variable
            debug:
                    msg: "{{ users[0].name }}"
---
```


Ex 5:
    - Creating var file to be used as a var file:
    - file name: task_3.29_vars_file.yml

```bash
    vim task_3.29_vars_file.yml
```

```yaml
---
users:
        - name: mark
          age: 35
        - name: lisa
          age: 30

---
```

ex 6:
    - Using the var file create above

```yaml
---
- hosts: all
  gather_facts: false
  vars_files:
          - task_3.29_vars_file.yml
  tasks:
          - name: Display variable
            debug:
                    msg: "{{ users[1].name }}"
---
```


Ex 7 
    - Using var prompt 001

```yaml
---
- hosts: all
  gather_facts: false
  vars_prompt:
          - name: username
            prompt: Enter Username
            private: no
          - name: password
            prompt: Enter Password

  tasks:
          - name: Creating user 
            debug:
                    msg: "{{ username , password }}"
---
```


Ex 8 
    - Using var prompt 002


```yaml
---
- hosts: all
  gather_facts: false
  vars_prompt:
          - name: var
            prompt: Enter ypur variable please 
            private: no
  tasks:
          - name: Displaying variable
            debug:
                    msg: "{{ var }}"
---
```

Ex 9
    - Display facts

```yaml 
---
- hosts: mh1
  tasks:
          - name: diplay facts variables
            debug:
                    msg: "{{ ansible_facts.devices.sda.partitions.sda2.size }}"
---

```