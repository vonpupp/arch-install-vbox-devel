#!/bin/bash

source vars.sh

VBoxManage startvm "$VMNAME" #--type headless
