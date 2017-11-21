#!/bin/bash
#
# This is a Cisco Cloud Center
#

exec > >(tee -a /var/tmp/swarm-init_$$.log) 2>&1

source /usr/local/osmosix/etc/.osmosix.sh
source /usr/local/osmosix/etc/userenv
source /usr/local/osmosix/service/utils/cfgutil.sh
source /usr/local/osmosix/service/utils/agent_util.sh


#rsync -avz  -e "ssh " /path/to/yourfile user@backupserver.com:/backup/
echo "backup for $(date) "| mail -s "backup complete" biharper@cisco.com
