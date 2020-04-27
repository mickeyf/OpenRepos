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

# checkIfIOMMUDeviceResettable.sh

# Usage:
# to check for ALL devices
# ./checkIfIOMMUDeviceResettable.sh 
# to check for specific device:
# ./checkIfIOMMUDeviceResettable.sh 1234:5678

#!/bin/bash

# For checking our iommu devices to see which ones are able to be power cycled 
# (reset) without resetting the bare metal server

#check whether we have an IOMMU system (any devices?)
test=$( ls /sys/kernel/iommu_groups/ ); [[ ! ${test} ]] && \
	echo 'There are no IOMMU devices. EXITING' && exit

# check for argument, then format it to match string2 later
[[ $1 ]] && devID="[${1}]"  

print_output(){
	# Check wehter device is resetable or not; tell us
	[[ -e "$iommu_group"/devices/"$device"/reset ]] && \
		{ echo -e '\n \e[32m'"[IS RESETABLE]"'\e[0m'"  IOMMU Group: $( basename "$iommu_group" )"; } || \
		{ echo -e '\n \e[91m'"[NOT RESETABLE]"'\e[0m'"  IOMMU Group: $( basename "$iommu_group" )"; }
	# Print the rest of the info
	echo -e '\n\t'$( lspci -nns "$device" ) | awk -F  ": " '/1/ {print $1}'
	echo -e '\t'$string1
	echo -e '\tDevice ID:\t\e[95m\e[1m'${string2}'\e[0m'
}

# Lets iterate through our iommu_group directory
for iommu_group in $( find /sys/kernel/iommu_groups/ -maxdepth 1 -mindepth 1 -type d )
do
	# Select an iommu group
	for device in $( \ls -1 "$iommu_group"/devices/ )
	do
		# for each device, let's parse our device info
		stringZ=$( echo -e '\n' $( lspci -nns "$device" ) | awk -F  "]:" '/1/ {print $2}' )
		varLength=`expr "$stringZ" : '.*\[....\:....\]'`  # 8
		newLength=$(( (("${varLength}")) - 11 ))
		string1=${stringZ:1:(( newLength - 1 ))}
		string2=${stringZ:newLength:11}
		# Check whether we are looking for a specific device or not
		{ [[ ! "${devID}" ]] && print_output; } || { [[ "${devID}" == "${string2}" ]] && print_output \
			&& devFound='Y'; }
	done
done

# If we can't find our device, let us know.
{ [[ "${devID}" ]] && [[ ! "${devFound}" == 'Y' ]]; } &&	\
	echo -e '\n \e[91m'"[NOT FOUND]"'\e[0m\n' && \
	echo " Device ${devID} not found in /sys/kernel/iommu_groups/" && \
	echo -e '\n EXITING\n\n'
