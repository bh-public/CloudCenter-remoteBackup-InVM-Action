#!/bin/bash
#
# This is a Cisco Cloud Center Action Lib Example that uses FTP to move a file called 
# DATA from /home/cliqruser to a remote ftp server with the user naming the new file.
# 
# Execute path is: 
#   https://raw.githubusercontent.com/bh-public/remoteBackup/master/FTPremoteBackup.sh

exec > >(tee -a /var/tmp/remoteBackup-init_$$.log) 2>&1

source /usr/local/osmosix/etc/.osmosix.sh
source /usr/local/osmosix/etc/userenv
source /usr/local/osmosix/service/utils/cfgutil.sh
source /usr/local/osmosix/service/utils/agent_util.sh

#actionSendMessage "Action - FTPremoteBackup started" 
# We can un-comment the ftp install, but as part of the lab we will use
# the Day 2 action called Yum install <pkgname> to install ftp.
# 
#sudo yum install ftp -y

# Define our env vars
#HOST='13.57.9.139'
HOST='52.53.181.141'
USER='selab1'
PASSWD='welcome2cliqr'
#FILE='/home/cliqruser/DATA'
cd ~cliqruser
FILE='DATA'
# Execute the FTP of DATA
ftp -inv $HOST <<EOF
user $USER $PASSWD
put $FILE $DFILE
ls
EOF
# echo "backup for $(date) "| mail -s "backup complete" biharper@cisco.com
