Ansible RHCE EX294 Prep

Table of Contents
=================

   * [Introduction](#introduction)
   * [Lab Setup](#lab-setup)
      * [Ansible controler and Managed Hosts](#ansible-controler-and-managed-hosts)
      * [Ip address &amp; Hostname](#ip-address--hostname)
      * [Installation](#installation)
         * [Controle Node](#controle-node)
            * [Ansible (There are several way installing ansible)](#ansible-there-are-several-way-installing-ansible)
            * [Python](#python)
         * [Remote or Managed Nodes Python Installation](#remote-or-managed-nodes-python-installation)
         * [Python](#python-1)
      * [Create Folder Structure for the lab](#create-folder-structure-for-the-lab)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->


## Introduction
This repo is practice for the RHCE EX294 exam prepiration. 
The questions are collected from online and other github repositories. 

## Lab Setup
### Ansible controler and Managed Hosts
The lab prepaired on Oracle Virtual Box. as follows:
1 ansible+control 
4 remote nodes:
    - managednode01
    - managednode02
    - managednode03
    - managednode04
    

    - There are five servers used in total throughout the objectives. All ansible code should be written and executed from the controller node. Most of the exercises are targetted at changing configuration of managed host but modification of controller is something that the person preparing for the test should be able to do as well

### Ip address & Hostname
```markdown

1. controller - control node        192.168.22.11

1. managed1 - managed node          192.168.22.22
1. managed2 - managed node          192.168.22.33
1. managed3 - managed node          192.168.22.44
1. managed4 - managed node          192.168.22.55
```


### Installation

#### Controle Node
Need to install the Ansible current version and python 3

##### Ansible (There are several way installing ansible)

```bash
# this is installation of ansible using epel

    sudo dnf install epel-release
# to check if provided ansibe 
    dnf provides ansible

# installation of ansible
    sudo dnf install ansible

# to print out the version of ansible 
    ansible --version
```

##### Python
```bash

```


#### Remote or Managed Nodes Python Installation

On the managed hosts we need to install only python because ansible is agent less. 

#### Python 

```bash

```
### Create Folder Structure for the lab

This is not necessary, you can skip it. It will save you time instead of creating the folders manually. but you can skip it this part

```bash
 
# this script creates 12 lesson folders and 12 task files inside each folder. speed up your lab but you can do it manually.
for n in {1..12}; 
do mkdir ../tasks/lesson_$n; 
  for a in {1..9};
  do touch ../tasks/lesson_$n/task_$n.$a; 
  done
done
```

*To be Continued ...




