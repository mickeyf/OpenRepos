# Dynamically generate /etc/issue text with IP address

# One little script to generate the /etc/issue file which adds the 
# network address in /usr/bin/showIP.sh of debian host so that it's displayed
# on the tty console (mainly for xcp-ng), needs to be in cron @reboot
# crontab -e
# add: @reboot bash /usr/bin/showIPinEtcIssue.sh


#!/bin/bash
# It's a Mickey Thang.

IP=${1:-`hostname -I`}

# Add "IP ADDRESS" line if not already found
grep "IP ADDRESS" /etc/issue > /dev/null
if [ "$?" -ne "0" ]; then
  echo >> /etc/issue
  echo "IP ADDRESS" >> /etc/issue
  echo >> /etc/issue
  echo >> /etc/issue
fi
sed -i s/"IP ADDRESS.*"/"IP ADDRESS : $IP"/g /etc/issue
