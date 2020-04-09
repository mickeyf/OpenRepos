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

# elegantTestWhetherArgExists.sh

#!/bin/bash

# a little program to mroe elegantly test whether an argument was supplied with
# a bash script call (i.e. ./elegantTestWhetherArgExists.sh argument1).

# this test can be used to test whether a value is true or not, and if true, set
# another value to equal that value (i.e. some sort of input test), and if not
# true, execute some other commands.

echo 'input= '$1;

{ [[ $1 == 'test' ]] && echo 'test found' && testVar=$1; } || { [[ $1 ]] && testVar=$1; } || read -p "`echo -e '\nNothing Entered!\nPlease Enter an Instance: '`" testVar

echo 'INSTANCE= '$testVar
