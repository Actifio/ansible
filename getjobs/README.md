### Overview

Using an Ansible client on the MacBook, we can automate the collection of the logs and information related to an Actifio job from an Actifio appliance.  

The script expects the user to enter the Job Name of the format Job_xxxxxx . Upon completion the execution of the script, you will get all the information related to the job in the local directory under the filename Job_xxxxxx.txt .  

Information related to the Actifio job is gathered from udppm.log, psrv.log, udsinfo, SARG reports and UDSAgent.log.  


#### Purpose

This script is meant for Actifio internal use only. It also assumes you already have the Ansible client already installed.  

#### Setup

The following are customisations required for your environment:  
- Update or replace the Actifio Sky hostname and IP address in the hosts file:
- Replace the name of the Actifio Sky hostname and location of the SSH root keys in the getjobs.sh

#### Output

To kick off the collection, execute the bash script and enter the job name:

```
$ ./getjobs.sh
Enter the Actifio job name?: Job_1928880
PLAY [melnabsky] *********************************************************
TASK [Find out the hostID] ***********************************************
changed: [melnabsky]
TASK [debug] *************************************************************
ok: [melnabsky]
TASK [Find out the appID] ************************************************
changed: [melnabsky]
TASK [debug] *************************************************************
ok: [melnabsky]
TASK [Find out the hostname] *********************************************
changed: [melnabsky]
TASK [debug] *************************************************************
ok: [melnabsky]
TASK [Gather data] *******************************************************
changed: [melnabsky]
TASK [transfer file] *****************************************************
changed: [melnabsky]
TASK [Cleanup the /tmp/output.txt file] **********************************
changed: [melnabsky]
PLAY RECAP ***************************************************************
melnabsky                  : ok=9    changed=6    unreachable=0    failed=0 
```
