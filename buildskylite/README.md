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

You will need to deploy the Sky OVA in vCenter and present three disks (primary, performance/snapshot, and dedup) to the Sky VM. These sizes will need to be set for pri_dev_GBsize, per_dev_GBsize, and ded_dev_GBsize . Best is to have different sizes for each one of the disks, as same size disk may not work for the Ansible script.

#### Output

To kick off the build of an Actifio Sky name lab12, execute the bash script:
```
~/Desktop/buildskylite:$ ./build_skinny_sky.sh lab12

PLAY [sky811] ***************************************************************************************

TASK [Gathering Facts] ******************************************************************************
The authenticity of host '[10.65.5.221]:26 ([10.65.5.221]:26)' can't be established.
RSA key fingerprint is SHA256:gAlAN88tXOVRCTxwUterjmAzWI9i2mc8xDfN1jEW8A4.
Are you sure you want to continue connecting (yes/no)? yes
ok: [sky811]

TASK [set_fact] *************************************************************************************
ok: [sky811]

TASK [debug] ****************************************************************************************
ok: [sky811] => {
    "datenow": "20181116_101357"
}

TASK [set_fact] *************************************************************************************
ok: [sky811]

TASK [debug] ****************************************************************************************
ok: [sky811] => {
    "bkup_propsfile": "/act/psrv/act-sky-props-20181116_101357.xml"
}

TASK [File exists] **********************************************************************************
ok: [sky811]

TASK [debug] ****************************************************************************************
ok: [sky811] => {
    "msg": {
        "changed": false, 
        "failed": false, 
        "stat": {
            "exists": false
        }
    }
}

TASK [Copy file between directories on a remote server] *********************************************
changed: [sky811]

TASK [Delete line before min_pri_pool] **************************************************************
 [WARNING]: Consider using the replace, lineinfile or template module rather than running sed.  If
you need to use command because replace, lineinfile or template is insufficient you can add
warn=False to this command task or set command_warnings=False in ansible.cfg to get rid of this
message.

changed: [sky811]

TASK [Delete line after min_ded_pool] ***************************************************************
changed: [sky811]

TASK [Restart psrv1] ********************************************************************************
changed: [sky811]

TASK [monit restart psrv] ***************************************************************************
changed: [sky811]

TASK [Restart psrv2] ********************************************************************************
changed: [sky811]

TASK [rescan ports for new devices] *****************************************************************
changed: [sky811]

TASK [Find out the 200G LUN provisioned] ************************************************************
changed: [sky811]

TASK [debug] ****************************************************************************************
ok: [sky811] => {
    "msg": "sdb"
}

TASK [Find out the 10G LUN provisioned] *************************************************************
changed: [sky811]

TASK [debug] ****************************************************************************************
ok: [sky811] => {
    "msg": "sdc"
}

TASK [Find out the 100G LUN provisioned] ************************************************************
changed: [sky811]

TASK [debug] ****************************************************************************************
ok: [sky811] => {
    "msg": "sdd"
}

TASK [debug] ****************************************************************************************
ok: [sky811] => {
    "msg": "System sky811 has IP address 10.65.5.221"
}

TASK [debug] ****************************************************************************************
ok: [sky811] => {
    "msg": "System sky811 has gateway 10.65.5.254"
}

TASK [debug] ****************************************************************************************
ok: [sky811] => {
    "msg": "System sky811 has netmask 255.255.255.0"
}

TASK [debug] ****************************************************************************************
ok: [sky811] => {
    "msg": "System sky811 has netmask 255.255.255.0"
}

TASK [Find out the DNS server] **********************************************************************
changed: [sky811]

TASK [debug] ****************************************************************************************
ok: [sky811] => {
    "msg": "10.65.5.114"
}

TASK [Create /dumps/vpas.conf] **********************************************************************
changed: [sky811]

TASK [Append text to /dumps/vpas.conf] **************************************************************
changed: [sky811] => (item=clusterip=10.65.5.221)
changed: [sky811] => (item=subnet=255.255.255.0)
changed: [sky811] => (item=gateway=10.65.5.254)
changed: [sky811] => (item=dnsserver=10.65.5.114)
changed: [sky811] => (item=dedupsize=5)
changed: [sky811] => (item=timezone=Australia/Melbourne)
changed: [sky811] => (item=admin=password)
changed: [sky811] => (item=infrastructure=vmware)
changed: [sky811] => (item=pri_dev=sdb)
changed: [sky811] => (item=per_dev=sdc)
changed: [sky811] => (item=ded_dev=sdd)

TASK [Configure the system using /dumps/vpas.conf] **************************************************
changed: [sky811]

TASK [debug] ****************************************************************************************
ok: [sky811] => {
    "msg": ""
}

PLAY RECAP ******************************************************************************************
sky811                     : ok=30   changed=14   unreachable=0    failed=0   

~/Desktop/buildskylite:$
```
