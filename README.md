********************
# ARCH-INSTALL-VBOX-DEVEL
********************

This repository contains some scripts to create, start, stop and destroy a VM
based on a live ISO image. The objective of this repository is to automate the
process of starting a VM based on a live ISO image to be able to develop custom
installation scripts.

The idea is something similar to Vagrant but from a live ISO image. From there
you could run a custom script to do the rest of the magic (i.e: configure sudo,
user, install packages, dotfiles, etc). Also it is a good starting point to
automate a system deploy using Ansible.

## Creating a VM for development

1. Change the `vars.sh` variables according to your needs. Point `ISOMEDIAFILE`
   to the appropriate ISO file, and the `VDIDISKNAME` to the place where you
   want to store your VDI file.
2. Execute the `create-vm.sh` script to create a VirtualBox VM named as the
   `VMNAME` variable. This script will at the end trigger automatically the
   `start-vm.sh` script.

## Destroying the VM

1. Execute the `destroy-vm.sh` script. This script will first stop the VM using
   the `stop-vm.sh` script.

## The first time the VM is started

Once the VM is created and started for the first time, setup a password for the
root user and start the sshd-server. On the guest run (vbox GUI):

```shell
# Setup a password for root
passwd

# Start the sshd-server
# VM port 22 is forwarded to localhost port 2222
systemctl start sshd
```

## Once SSH is started

Once SSH is started you can continue on the host (it feels more comfortable to
work on terminal rather than the vbox GUI):

```shell
bootstrap.sh
```

This script will call the `bootstrap-guest.sh` within the guest and will clone
several repositories that I find useful:
- The [partition repo] for partitioning using LUKS/LVM
- The [installer repo] which is an automated installer written in BASH. The
  settings matches the prior script (uses the same crypto-lvm device)
- The [provision repo] that will install the rest of packages and configure
  them.

The bootstrap script does not handle automatically the rest of the scripts
execution. At this time this needs to be done manually.

## Assumptions and VM parameters

- OS: Arch Linux (64 bits)
- Firmware: EFI (64bits)
- Memory: 512MB
- CPU: 1 Core
- Size: 50Gb

You can change this on the `create-vm.sh` script according to your needs.

## See also

- [partition repo](https://github.com/vonpupp/arch-install-scripts.git "LUKS/LVM Partitioning")
- [installer repo](https://github.com/vonpupp/arch-installer.git "BASH Installer (branch: feature/efi-crypt)")
- [provision repo](https://github.com/vonpupp/ansible-personal.git "Ansible playbook for provision")

## Todo
-[] Automate the other helpers scripts execution
-[] Create a vagrant box based on the result
-[] Move the [partition repo] to pure Ansible?
-[] Patch the [installer repo] for unattended setup
