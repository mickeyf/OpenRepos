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

#!/bin/bash

#lenFile=$(echo $(uname -a | sed "s/\s/\n/g" | awk '{ print $1 }') | wc -w)
#echo 'Number of words output from command: '$lenFile

IFS=$'\n' read -r -d '' -a uname_array < <( uname -a | sed "s/\s/\n/g" )

lenFile=$(wc -l workingWithUnameTxtFile.txt | awk '{ print $1 }')
#echo 'number of lines in file: '$lenFile

printf '%s\n' \
'' \
'********************************************************' \
"Program Name: $0" \
'uname formatted output using sed and awk' \
'combining output with file input and other little tricks' \
'********************************************************' \
'' \
"$(uname --version | sed -n '1 p' | awk 'BEGIN{print "Using \"uname\" command. \"uname\" version info:"}; {print}; END{print "\nBegin Formatted Output:\n\n"}')" \
'_______________________' ''

# Above is a nice little trick with sed and awk - we're going to print the
# first line of uname --version, and format it with an awk header and footer
# and then output it using the printf command.

for (( c=1; c<=$lenFile; c++ ))
do

y=$(sed -n "${c} p" workingWithUnameTxtFile.txt)':';
line=$(printf '%-20s' "$y")
printf "$line %s\n" ${uname_array[c]} #$line
done
