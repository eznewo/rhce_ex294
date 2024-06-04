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


