#! /bin/bash

#cd ../
ansible all -m shell -a "shutdown now" -b

#ssh ansible@rac
#sudo shutdown now

sudo shutdown now 





```
## To shutdown all the servers in this lab

## To shutdown all the remote servers or nodes
    ## ssh ansible@rac
    ## sudo shutdown now
## if the script is on the parent 
### cd ../
# ansible all -m shell -a "shutdown now" -b

## To shutdown the controler node
# sudo shutdown now
 ```


```
## cd ../
# ansible all -m shell -a "shutdown now" -b

## ssh ansible@rac
## sudo shutdown now

# sudo shutdown now 
```

