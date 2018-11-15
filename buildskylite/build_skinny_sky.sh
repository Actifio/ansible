#!/bin/bash

##
# File: build_skinny.sh
##

export ANSIBLE_NOCOWS=1

# Use the -e, or --extra-vars argument of ansible-playbook

if [ "$1" = "" ] ; then
  ansible-playbook -i ./hosts ./build_skinny_sky.yml --extra-vars "acthost=sky811" --key-file /Users/michael/.ssh/michaelchew-v2-key 
else
  ansible-playbook -i ./hosts ./build_skinny_sky.yml --extra-vars "acthost=sky811 cluster_name=$1" --key-file /Users/michael/.ssh/michaelchew-v2-key 
fi
