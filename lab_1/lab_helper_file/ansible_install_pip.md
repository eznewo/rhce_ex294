## Ansible Installation

### 1. INSTALLING ANSIBLE USNING PIP

#### 1.1 To Install `pip` 

```bash
python3 -m pip install --upgrade --user pip
```

```bash
python3 -m pip install --user ansible
# install-pip-global.sh
```

</br></br>
_look below for detail description of the above commands_</sup>









</br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>


```dotnetcli
Detailed description of the above commands:

####################################################
# - $ python3 -m pip install --upgrade --user pip  #
####################################################

python3: 
    - This specifies that the Python 3 interpreter should be used to run the command.

-m pip: 
    - This tells Python to run the pip module as a script.

install --upgrade: 
    - This is a command to pip to install the latest version of a package, 
    - even if an older version is already installed.

--user: 
    - This flag tells pip to install the package into the user’s local directory 
    - (~/.local/ on Linux and macOS, %APPDATA%\Python on Windows) 
    - rather than the system-wide directory. 
    - This is useful if you do not have administrative privileges or 
    - do not want to modify the system-wide Python environment.

pip: 
    - This is the package that you are upgrading. 
    - In this case, it's the pip package itself.

Purpose: 
    - This command ensures that the pip package installer is up-to-date and 
    - for the current user.

###################################################
#    - $ python3 -m pip install --user ansible    #
###################################################

python3: 
    - This specifies that the Python 3 interpreter should be used to run the command.

-m pip: 
    - This tells Python to run the pip module as a script.

install: 
    - This is a command to pip to install a package.

--user: 
    - This flag tells pip to install the package into the user’s local directory (~/.local/ on Linux and macOS, %APPDATA%\Python on Windows) rather than the system-wide directory.

ansible: 
    - This is the package that you want to install. In this case, it's the ansible automation tool.

Purpose: 
    - This command installs Ansible in the user's local Python environment, avoiding the need for administrative privileges and ensuring that the installation does not interfere with the system-wide Python environment or packages.


Summary
First Command: Upgrades pip to the latest version for the current user.
Second Command: Installs Ansible for the current user.
Both commands use the --user flag to install packages in the user-specific directory, 
which is particularly useful for avoiding permissions issues and keeping the user environment separate from the system environment.
```


