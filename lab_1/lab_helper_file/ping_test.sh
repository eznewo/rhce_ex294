#!/bin/bash

# this is ping test script to test if the remote nodes are reachable or not
cd ../
ansible all -m ping
