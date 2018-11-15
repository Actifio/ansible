#!/bin/bash

##
# File: getjobs.sh
##

export ANSIBLE_NOCOWS=1

# Use the -e, or --extra-vars argument of ansible-playbook

if [ "$1" = "" ] ; then
  ansible-playbook -i ./hosts ./getjobs.yml --extra-vars "acthost=melnabsky" --key-file /Users/johndoe/.ssh/johndoe-v2-key 
else
  ansible-playbook -i ./hosts ./getjobs.yml --extra-vars "acthost=melnabsky job_id=$1" --key-file /Users/johndoe/.ssh/johndoe-v2-key 	
fi
