# Copyright (C) 2020 Mickey Fox
# mike@cmkconsulting.com

# This program is free software: you can redistribute it and/or modify it under the terms
# of the GNU General Public License as published by the Free Software Foundation, either
# version 3 of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.

# You should have received a copy of the GNU General Public License along with this program.
#If not, see <http://www.gnu.org/licenses/>

# showIPinEtcIssue.sh

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
