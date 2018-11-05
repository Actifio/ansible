#!/bin/bash

##
# File: getjobs.sh
##

export ANSIBLE_NOCOWS=1

ansible-playbook -i ./hosts ./getjobs.yml --extra-vars "acthost=melnabsky" --key-file /Users/michael/.ssh/johndoe-v2-key 
