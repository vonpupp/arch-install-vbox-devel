#!/bin/bash

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source vars.sh

# Public network vboxnet0 (10.1.0.0/16)
VBoxManage hostonlyif create
VBoxManage hostonlyif ipconfig vboxnet0 --ip 10.1.0.254 --netmask 255.255.0.0

# Private network vboxnet1 (10.2.0.0/16)
VBoxManage hostonlyif create
VBoxManage hostonlyif ipconfig vboxnet1 --ip 10.2.0.254 --netmask 255.255.0.0

# VM
VBoxManage createvm --name "$VMNAME" --ostype "$VMOSTYPE" --register

# EFI
VBoxManage modifyvm "$VMNAME" --firmware efi64

# CPU and Memory
VBoxManage modifyvm "$VMNAME" --cpus 1 --cpuexecutioncap 80 --memory 512

# Network
VBoxManage modifyvm "$VMNAME" --nic1 nat \
    --nic2 hostonly --hostonlyadapter2 vboxnet0 \
    --nic3 hostonly --hostonlyadapter3 vboxnet1
VBoxManage modifyvm "$VMNAME" --natpf1 \
    "guestssh,tcp,,2222,,22"

# DVD
VBoxManage storagectl "$VMNAME" --name "IDE Controller" \
    --add ide --controller PIIX4 --hostiocache on --bootable on
VBoxManage storageattach "$VMNAME" --storagectl "IDE Controller" \
    --type dvddrive --port 0 --device 0 --medium "$MEDIA"

# HDD
VBoxManage createhd --filename "$VMNAME".vdi --size 20480
VBoxManage storagectl "$VMNAME" --name "SATA Controller" \
    --add sata --controller IntelAHCI --hostiocache on --bootable on
VBoxManage storageattach "$VMNAME" --storagectl "SATA Controller" \
    --type hdd --port 0 --device 0 --medium "$VMNAME.vdi"

# Share
mkdir -p $DIR/shared-"$VMNAME"
VBoxManage sharedfolder add "$VMNAME" --name share-folder \
    --hostpath $DIR/shared-"$VMNAME" --automount
