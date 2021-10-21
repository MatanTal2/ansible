# Ansible

## Add Ansible to linux
1. First we update the system run 
```sudo apt dist-upgrade```
2. Install Ansible
```
apt install ansible
```

## create ssh connection with all the machines
`-t` for the type  `ed25519` and `-C` for the comment.
```
ssh-keygen -t ed25519 -C "ansibleHost"
```
make sure you change the path so it will not overwirte the ssh you have.
i will change it to
```
/home/YOUR_USER_NAME/.ssh/ansibleHost
```
Press enter and **DO NOT** give passphrase! 

### copy the public key to all machines
```
ssh-copy-id -i /home/YOUR_USER_NAME/.ssh/ansibleHost.pub ADMIN_NAME@VM_MACHINE
```
try to connect to the mashines
```
ssh -i /home/YOUR_USER_NAME/.ssh/ansibleHost ADMIN_NAME@VM_MACHINE
```

## first command for ansible

create inventory file and write all the hosts, in my case with the admit user name.
Should look like this

```
ADMIN_USER_NAME@IPADDRESS
ADMIN_USER_NAME@IPADDRESS
ADMIN_USER_NAME@IPADDRESS
```

this will ping all of the host in the inventory file.

```
ansible all --key-file ~/.ssh/ansibleHost -i inventory -m ping
```

### create a `ansible.cfg` file
```
[defaults]
inventory = inventory
private_key_file = ~/.ssh/ansibleHost
```
if there is awarning regarding sceurity, you can add with `sudo` premission this contact at the `/etc/ansible/ansible.cfg` run
```
sudo nano /etc/ansible/ansible.cfg
```
under `[defaults]` title.

### List all the hosts connected to the Ansible master
```
ansible all --list-hosts
```

### See all the facts regarding to our servers
```
ansible all -m gather_facts
```
we can add the `--limit HOST` to gather only for it

**Note:** if we try to send command without premissions it will failed. so passing `--become --ask-become-pass` will prompt us for the password, after typing it it will give premission to the servers to execute the command.
example:
this will failed
```
ansible all -m apt -a update_cache=true
```
this will work
```
ansible all -m apt -a update_cache=true --become --ask-become-pass
```

if we need to pass more then more variable we need to pass with `""`
example: 
```
ansible all -m apt -a "name=python state=latest" --become --ask-become-pass
```

```
ansible all -m apt -a "upgrade=dist" --become --ask-become-pass
```

# create our first playbook
create `install_web.yml` file
write down this.
```
---
- host: all
  become: true
  tasks:
  - name: install apache2 package
    apt:
      name: apache2
```
To run this
```
ansible-playbook --ask-become-pass install_web.yml
```
