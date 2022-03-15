#!/bin/bash
  
# add BaseOS repo
ansible all -m yum_repository -a "name=BaseOS description=BaseOS baseurl=http://mirror01.idc.hinet.net/rockylinux/8.5/BaseOS/x86_64/os/"

# add AppStream repo
ansible all -m yum_repository -a "name=AppStream description=AppStream baseurl=http://mirror01.idc.hinet.net/rockylinux/8.5/AppStream/x86_64/os/"
