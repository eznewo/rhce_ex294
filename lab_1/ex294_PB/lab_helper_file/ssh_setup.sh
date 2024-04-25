#! /bin/bash


for host in 1 2 3 4;
do ssh-copy-id mh$host;
done
