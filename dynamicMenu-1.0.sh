#!/bin/bash

###################################################################
# Copyright (C) 2020 Mickey Fox
# CMK Consulting Services, USA, Denmark
# mike@cmkconsulting.com

# Revision: 1.0 (FINAL)
# Last Revision Date 5.29.2020

# dynamicMenu-1.0.sh
###################################################################

# 5.28.2020 Version 1.0 is fully working.

# Drop this script in at the base of your directory, set the "beginDir"
# Variable, and start it up. Now you will be able to walk directories
# (as limited by the beginDir variable) with dynamicly generated menus
# and even execute bash scripts by selecting them.

# This script will handle Windows directories and filenames.

# the script comes coplete with a functioning ramDrive that is operable
# while the script is running and is self-cleaning at program exit - 
# even if the program exist badly. The default ramDrive directory is 
# placed in /tmp for extra safety. As for the reason behind the ramDrive,
# see the "Known Issues" below.

# Known issues: 

# Currently, my regex handling of .sh files isn't working
# well as linux doesn't generally like dealing with spaces in directory
# and filenames. In order to get bash scripts to operate, I needed to 
# parse the filepath and filename out to a text file, then read it back
# in via sed as it didn't seem to want to deal with the stright filestream
# out to the eval command without this step. The use of the eval command
# will lead to issues of the script you try to execute uses conflicting
# variables or processes (that being said, this can be handled program-
# matically if you intend to use it as a driver for a larger program base
# which was my actual intended use for the script. I intend to fix this
# issue to allow for execution of programs within sub-shells, but I will
# also be leaving the alternative call as an option.)

# Yes, the ramDrive is chmodded to 777 (bad Mickey, no biscuit) as I was
# receiving a "not authorized" error. Since I was in the middle of dealing
# the work-around for the sed / eval issue noted above, I opted for 777
# as a quick-fix in order to get that section working. Once the sed/eval
# issue is corrected, the ramdrive can be removed, or if leaving the ram-
# drive in, and you figure the permissions issue out before I do, let me
# know

# There is currently no support for executing other scripts (i.e. Python,
# etc.) Eventually, I'd like to incorporate handling and execution for 
# other scripting languages.

# I need to add a menu title for each display - nothing difficult, just
# a quick parse of the pwd would do with an output like echo. Another nice
# to have.

# The output isn't pretty. Yeah, well it's a bash script so.... But
# seriously, I'd like it to look nicer. That also means dealing with 
# directories with a large number of elements - pushing them to multiple
# columns and maybe adding multi-page support?

# It would also be nice for the script to test the directory to determine
# whether there is only one executable, and then just automatically execute
# that file, making this whole script a bit more "prime-time" ready

baseDIR=$(realpath "$0" | sed 's|\(.*\)/.*|\1|')
beginDir="/SHARE/DYNAMIC-MENU/MAIN MENU" # This is where we lock down to a base directory
newDir=$beginDir
maxRAM='100M' # Set our MAX ramDrive size, in MB
ramDrive="/tmp/RAMDRIVE" # Set our ramdrive directory

do_script_housekeeping(){
	lineItem=0
	menuItems=$(ls -1)
	ourPWD=$(pwd)
	clear
}

do_create_ramdrive(){
	[[ ! -d $ramDrive ]] &&  sudo mkdir $ramDrive && sudo chmod 777 $ramDrive
	[[ ! $(df | grep $ramDrive) ]] && sudo mount -t tmpfs -o size=$maxRAM tmpfs $ramDrive
}

do_remove_ramdrive(){
	[[ -d $ramDrive ]] &&  umount $ramDrive && rm -R $ramDrive
}

main(){
do_script_housekeeping
while read -r line
do
	((lineItem++))
	echo "$lineItem) $line"
done <<< "$menuItems"
echo "__________________________"
echo "Q) Quit"
echo "B) Back to prior menu"
echo
read -r -p 'Select an option: ' choice

[[ $choice == [Q/q] ]] && echo "Exiting" && do_remove_ramdrive && exit
{ [[ $choice == [B/b] ]] && [[ "${beginDir}" != "$(pwd)" ]]; }  && cd .. && do_script_housekeeping

#Yes, it's a convoluted if-then that I'd like to pull together into a straight one-liner
# I think it's close - on my list of things to do.
if [[ $(seq 1 $lineItem) =~ $choice ]]; then
  	[[ -d "$(sed -n "${choice}p" <<< "$menuItems")" ]] && cd "$(sed -n "${choice}p" <<< "$menuItems")" && newDir=$newDir"/"$tempVar 
	{ [[ $choice == 1 ]] && [[ -f $(sed -n "${choice}p" <<< "$menuItems") ]]; }
  	{ [[ -f $(sed -n "${choice}p" <<< "$menuItems") ]] && execFile=$(sed -n "${choice}p" <<< "$menuItems") && \
		sudo echo $ourPWD"/"$(sed -n "${choice}p" <<< "$menuItems") > $ramDrive"/tmp.txt" && clear \
		&& eval $( sudo cat $ramDrive"/tmp.txt" | sed -e "s/ /\\\ /g" ) && read -p "Enter to return" && clear; }
fi
main
}

do_create_ramdrive
main
do_remove_ramdrive
