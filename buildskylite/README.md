### Overview

Using an Ansible client on the MacBook, we can automate the creation of the Actifio Skinny Sky on VMware. If required, we can change it to support the cloud.  

Upon completion the execution of the script, you will should get a new Sky.


#### Purpose

This script is meant for Actifio internal use only. It also assumes you already have the Ansible client already installed.  


#### Setup

The following are customisations required for your environment:  
- Update or replace the Actifio Sky hostname and IP address in the hosts file:
- Replace the name of the Actifio Sky hostname and location of the SSH root keys in the build_skinny_sky.sh
- Change the value of the variable for pri_dev_GBsize, per_dev_GBsize, and ded_dev_GBsize

#### Output

To kick off the creation, execute the bash script:
```
```
