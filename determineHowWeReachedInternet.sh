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

# determineHowWeReachedInternet.sh

# When we have multiple network interfaces, how we quickly determine (1) what interface we 
# are using to reach the internet (or that network), (2) what the IP address is for that interface,
# and (3) what our subnet masking is, using the fewest lines of code possible?

# Well, the problem starts in determining how we are reaching the internet (or any specific network).
# Yes, we could assume the device is using the default set on our route, but assumptions quickly lead
# to problems. We can, instead of assuming, test to see exactly which interface the traffic bound for
# a specific destination is taking.

# figure out which host we want to "reach"
read -p 'what host do you want to access? (IP address or domain name)' host

nicAddress=$( ip route get $(getent ahosts $host | awk '{print $1; exit}') | grep -Po '(?<=(dev )).*(?= src| proto)' )

# Once we have determined which interface we are using to access that network, we will then pull our
# IP and netmask.

tempIP=$(ip address | grep $nicAddress | tail -1 | cut -d ' ' -f 6 | sed 's/\// /')
ipAddress=$(echo $tempIP | cut -d ' ' -f 1)
whackMask=$(echo $tempIP | cut -d ' ' -f 2)

# And, now we can print it out in a pretty format:

printf '%s %s\n' 'We are reaching the internet via interface' $nicAddress 'using network IP ' $ipAddress 'and /'$whackMask' masking.'
