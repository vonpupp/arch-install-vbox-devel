#!/bin/bash

source vars.sh

VBoxManage controlvm "$VMNAME" poweroff
