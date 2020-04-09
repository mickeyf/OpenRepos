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

#aptListNumberPackagesUpgradeable.sh

#!/bin/bash

# quick script to tell us how many packages are available for upgrade

upgradesAvail=$(( $(apt list --upgradeable 2>/dev/null | wc -l) -1 ))

securityAvail=$(apt list --upgradable 2>/dev/null | grep -i security | wc -l)

printf 'There are %s %s\n' $upgradesAvail 'packages available for upgrade.' \
	$securityAvail 'security packages available for upgrade.'
