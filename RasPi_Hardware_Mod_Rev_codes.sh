# Determine specific RasPi platform based on hardware revision code
# gathered from cpuinfo.

# Copyright 2020, Mickey Fox
# mike@cmkconsulting.com

# Requires RasPi_Hardware_Mod_Rev_codes.data (data file containg RasPi info)
# Data and concept taken from:
# https://www.raspberrypi-spy.co.uk/2012/09/checking-your-raspberry-pi-board-version/

# Set our directory, so that the scripts can run relatively.
# We will remove this once we incorporate this script into the main script.
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
dataFile="$DIR"'/dataFiles/RasPi_Hardware_Mod_Rev_codes.data'

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