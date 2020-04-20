# OpenRepos
My Open Repository of Things to Share
<hr>
  Just a little collection of scripts and guides that I made for myself, but thought might be useful
  to others. I'm open to critique and suggestions - and if you like anything enough that you'd like 
  to collaborate on, just let me know.<br>
  
- Mounting samba shares in a virtual is an easy way to gain access to a repository when developing
  (and other reasons). In how to mount a samba share with cifs (UBUNTU), I show you how:<br>
  [VMs_and_SAMBA_shares](VMs_and_SAMBA_shares)

- Dealing with Unraid, trying to set up a share for use with a VM is easy. And I show you how:<br>
  [How_To_Set_Up_Shared_Drive_UNRAID](How_To_Set_Up_Shared_Drive_UNRAID)
  
- When we have multiple network interfaces, how we quickly determine (1) what interface we 
  are using to reach the internet (or that network), (2) what the IP address is for that interface,
  and (3) what our subnet masking is, using the fewest lines of code possible?<br>
  [determineHowWeReachedInternet.sh](determineHowWeReachedInternet.sh)  
  
- Test whether an argument has been sent to the script:<br>
  [elegantTestWhetherArgExists.sh](elegantTestWhetherArgExists.sh)
 
- Check to see whether we have updates (and security updates) available:<br>
  (yeah, I know apt does this and drops it into the motd, but what if I want to check what's currently there for some reason?)<br>
  [aptListNumberPackagesUpgradeable.sh](aptListNumberPackagesUpgradeable.sh)
  
 - Pull uname data, format it, and use lables from a file:<br>
   [workingWithUname.sh](workingWithUname.sh)
   
<br><br><br><br>
##### If you see something here you like, feel free to use it
(subject to the GNU GPL)

I'm good if you have suggestions - especially if it makes the programs run faster or more elegantly.

(My ego is used to being knocked down - I'm married.)
<br><br><br><br>    
###### Copyright Info
All content in this Repository Copyright (C) 2020 Mickey Fox, or the respective copyright holders.

These programs are free software: you can redistribute them and/or modify them under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

These programs are distributed in the hope that they will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

A copy of the GNU General Public License is available at: <http://www.gnu.org/licenses/>
