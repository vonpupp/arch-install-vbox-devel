#!/bin/bash

source vars.sh

# Share
VBoxManage sharedfolder remove "$VMNAME" --name share-folder

# Public network vboxnet0 (10.1.0.0/16)
VBoxManage hostonlyif remove vboxnet4

# Private network vboxnet1 (10.2.0.0/16)
VBoxManage hostonlyif remove vboxnet5

# VM
VBoxManage unregistervm "$VMNAME" --delete
