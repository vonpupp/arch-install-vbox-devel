********************
# VBOX-ARCH-INSTALLER-DEVEL
********************

This repository contains some scripts to create, start, stop and destroy a VM
based on a live ISO image. The objective of this repository is to automate the
process of starting a VM based on a live ISO image to be able to develop custom
installation scripts.

The idea is something similar to Vagrant but from a live ISO image, except that
there won't have ``sudo`` nor custom image tools, just a live ISO system instead.

## VM parameters

- Firmware: EFI (64bits)
- Memory: 512MB
- CPU: 1 Core

## The first time the VM is started

Once the VM is created and started for the first time, setup a password for the
root user and start the sshd-server. Type this on the VM VirtualBox GUI:

```shell
# Setup a password for root
passwd

# Start the sshd-server
# VM port 22 is forwarded to localhost port 2222
systemctl start sshd
```

## Once the VM is started

On the host, execute:

```shell
# (optional) In case an old ssh id already exists, remove it
ssh-keygen -R "[localhost]:2222"

# Bootstrap the installer repo
ssh root@localhost -p 2222 'pacman -Sy && pacman --noconfirm -S git && git clone https://github.com/vonpupp/arch-by-hand.git'
```
