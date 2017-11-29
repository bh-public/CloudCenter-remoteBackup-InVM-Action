#!/bin/bash
#
# This is a Cisco Cloud Center Action Lib Example
#

exec > >(tee -a /var/tmp/remoteBackup-init_$$.log) 2>&1

source /usr/local/osmosix/etc/.osmosix.sh
source /usr/local/osmosix/etc/userenv
source /usr/local/osmosix/service/utils/cfgutil.sh
source /usr/local/osmosix/service/utils/agent_util.sh

actionSendMessage "Action - FTPremoteBackup started" 

# Define our env vars
HOST='13.57.9.139'
USER='selab'
PASSWD='welcome2cliqr'
FILE='DATA'
# Execute the FTP of DATA
ftp -n $HOST <<END_SCRIPT
quote USER $USER
quote PASS $PASSWD
put $FILE
quit
END_SCRIPT
exit 0

echo "backup for $(date) "| mail -s "backup complete" biharper@cisco.com
