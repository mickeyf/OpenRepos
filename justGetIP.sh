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

# justGetIP.sh

#!/bin/bash


# just get tthe IP I'm using to hit the internet (or whatever network I want to see) depengin on the value in host
host='8.8.8.8'
nicAddress=$( ip route get $(getent ahosts $host | awk '{print $1; exit}') | grep -Po '(?<=(dev )).*(?= src| proto)' ); ip address | grep $nicAddress | grep inet | cut -d ' ' -f 6 | sed 's/\// /' | awk '{ print $1 }'
