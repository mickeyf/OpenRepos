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

# Determine specific RasPi platform based on hardware revision code
# gathered from cpuinfo.

# Requires RasPi_Hardware_Mod_Rev_codes.data (data file containg RasPi info)
# Data and concept taken from:
# https://www.raspberrypi-spy.co.uk/2012/09/checking-your-raspberry-pi-board-version/

# RasPi_Hardware_Mod_Rev_codes.sh

# Set our data file
dataFile='RasPi_Hardware_Mod_Rev_codes.data'

# Determine Revision Code and ensure it's converted to upper case to match our data
# then parse the data file to get our line
revString=`grep $( cat /proc/cpuinfo | grep Revision | awk '{ print $3 }' | tr "[a-z]" "[A-Z]" ) "$dataFile"`

[[ ! $revString = '' ]] && echo 'RasPi Type Found: ' || { echo 'RasPi Type not found: EXITING' && exit; }

# Now, let's load some variables with our predictable string so that we can
# be certain the data can match later
raspiType=`echo "$revString" | cut -d ':' -f1`
raspiMem=`echo "$revString" | cut -d ':' -f2`

echo 'RasPi Type: '$raspiType
echo 'RasPi Mem: '$raspiMem
