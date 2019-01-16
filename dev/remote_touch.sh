#!/bin/bash
# get these values from config
export REMOTE="kvm-01-guest17.lab.eng.rdu2.redhat.com"
export EZPASSWD="F"

export ROOT_SCRIPT="
useradd ${USER};
groupadd sudo;
usermod -G sudo ${USER};
echo ${EZPASSWD} | passwd --stdin ${USER};
echo '%sudo	ALL=(ALL)	NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo;
"


export MY_SCRIPT="
yum install -y git

ssh root@$REMOTE ${ROOT_SCRIPT}
echo hello
