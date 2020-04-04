#!/bin/bash

#lenFile=$(echo $(uname -a | sed "s/\s/\n/g" | awk '{ print $1 }') | wc -w)
#echo 'Number of words output from command: '$lenFile

IFS=$'\n' read -r -d '' -a uname_array < <( uname -a | sed "s/\s/\n/g" )

lenFile=$(wc -l workingWithUnameTxtFile.txt | awk '{ print $1 }')
#echo 'number of lines in file: '$lenFile

printf '%s\n' \
'' \
'****************************************' \
"Program Name: $0" \
'uname formatted output using sed and awk' \
'****************************************' \
''
for (( c=1; c<=$lenFile; c++ ))
do

y=$(sed -n "${c} p" workingWithUnameTxtFile.txt)':';
line=$(printf '%-20s' "$y")
printf "$line %s\n" ${uname_array[c]} #$line
done

#printf '%s\t %s\n' ${uname_array[c]} $(sed -n "${c}p" workingWithUnameTxtFile.txt | awk '{print $1}')
