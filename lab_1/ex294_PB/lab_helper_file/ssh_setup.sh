#! /bin/bash

# copy the key to all remote host form the controler
# there are 4 managed hosts or remote hosts (mh1, mh2, mh3, mh4)

for host in 1 2 3 4;
do ssh-copy-id mh$host;
done
