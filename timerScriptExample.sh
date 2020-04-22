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

# timerScriptExample.sh

#!/bin/bash

# Bash countdown timer, with functions.
# Original Script written by Steven Vona <savona@putorius.net>
# Modified 22.04.2020 by Mickey Fox <mike@cmkconsulting.com>

# Set variables
# Change the hour,min,sec to set your timer - currently set to 2 hours
hour=0; min=0; sec=18

function donso(){
    tput clear; tput bold; tput sgr0; clear
}

function do_print( ){
    printString="$1" # read our print string into the printString var
    length=${#printString} # get the string length so we can center it in the printf
    printf '%s%s' `tput cup "$(( ( $( tput lines ) / 2 ) ))" "$(( ( $(tput cols) /2) - ($length /2 ) ))"` "$printString"
    sleep 1 # sleep long enough so that output can be read by human
    clear
}

# This function traps exit 
# It clears the temporary iptables rules and stops the plex docker container
function cleanup {
    donso
    do_print 'Restarting iptables to clear rules'
	#sudo service iptables restart
	do_print 'Stopping Docker container'
	#docker stop plex
    do_print 'All Finished .....'
    tput cnorm; reset
}

function start_openFW(){
    # Open communication ports for kids Roku devices
    do_print 'Opening necessary ports...'
    #sudo iptables -I INPUT -p tcp -s 10.0.0.2,10.0.0.227 --match multiport --dports 32400,8324,32469 -j ACCEPT
    #sudo iptables -I INPUT -p tcp -s 10.0.0.2,10.0.0.226 --match multiport --dports 32400,8324,32469 -j ACCEPT
    do_print 'Ports opened for communication.'
}

function start_PlexDocker(){
    # Start the plex docker container
    do_print 'Starting Plex Media Server Container...'
    #docker start plex
    do_print 'Container started.'
}

function do_timer(){
    do_print 'Starting countdown....'
    while : # this will read true to keep us in the loop until break condition
    do
        { [ "$hour" -eq "0" ] && [ "$min" -eq "0" ] && [ "$sec" -le "11" ] && tput setab 1; } || \
        { [ "$hour" -eq "0" ] && [ "$min" -eq "0" ] && [ "$sec" -le "16" ] && tput setab 3; }
        [ $min -lt 0 ] && { ((hour--)) && min=60; }
        [ $sec -ge 0 ] && { ((sec--)) && clear && tput clear && tput cup "$(( ( $( tput lines ) / 2 ) ))" "$(( ( $(tput cols) /2) - 4 ))" && \
            printf '%02d:%02d:%02d' $hour $min $sec && sleep 1; }
        [ $min -ge 0 ] && [ $sec -lt 0 ] && { ((min--)) && sec=60; } 
        [ $hour -ge 0 ] && [ $min -ge -1 ] && [ $sec -ge -1 ] || break # our time has run out, breaking out of loop
    done
}
   
# Start main script..
trap cleanup EXIT
tput clear; tput civis
start_openFW
start_PlexDocker
do_timer
