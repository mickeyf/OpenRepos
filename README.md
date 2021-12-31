# OpenRepos
My Open Repository of Things to Share
<hr>
  Just a little collection of scripts and guides that I made for myself, but thought might be useful
  to others. I'm open to critique and suggestions - and if you like anything enough that you'd like 
  to collaborate on, just let me know.<br>
  
- You ever wish you could drop a quick script into a directory and navigate it? Or maybe you need
  a script that can drive a collection of smaller scripts as part of a larger, unified project? 
  Well, here's my latest rabbit-hole that I created while working on an application that was, in 
  essence, just that - a collection of bash scripts (this works with Windows-type directories with
  spaces in the directory names). This dynamic directory script will drive bash scripts but be 
  careful with that as those scripts are driven through use of the Linux eval command and if your
  script variables or processes conflict... well, you get the picture. So caveat emptor. There is 
  some documentation in the script on how to operate. If you have questions or suggestions, I'd love
  to hear them.<br>
  [dynamicMenu-1.0a.sh](dynamicMenu-1.0a.sh)
  
- You know what's annoying? When you need to hit a server instance and you're not sure of it's IP 
  address. Well, you could login through the interface and do an ip add show, but that takes time
  and time is not something a sysadmin has a lot of. But, what if I told you that you could write a
  little script to modify your /etc/issue file dynamically on reboot? Now, instead of logging in to
  find the IP, you can just click on the interface console and the IP will be staring right at you - 
  then boom! off to the jumphost!<br>
  [showIPinEtcIssue.sh](showIPinEtcIssue.sh)

- Prior to Linux kernel 3.3, a non-root user had visibility of the /proc filesystem a pseudo-
  filesystem which provides an interface to kernel data structures - giving non-root users the
  ability to view information about processes which did not belong to them, such as where sensitive 
  information (e.g. passwords) may be included in command line arguments. As of Linux kernel 3.3,
  the hideproc mount flag was made available to help solve this issue:
  Here's a discussion about hideproc and how to invoke it:<br>
  [Hide_Processes_From_Users](Hide_Processes_From_Users)

- Wanna know how you can easily check your IOMMU devices to see whether they can be reset via software?
  Use case: You need the ability to assign a specific hardware resource to a virtual outside of the 
  hypervisor. Here's how you can do it:<br>
  [checkIfIOMMUDeviceResettable.sh](checkIfIOMMUDeviceResettable.sh)

- Mounting samba shares in a virtual is an easy way to gain access to a repository when developing
  (and other reasons). In how to mount a samba share with cifs (UBUNTU), I show you how:<br>
  [VMs_and_SAMBA_shares](VMs_and_SAMBA_shares)

- Dealing with Unraid, trying to set up a share for use with a VM is easy. And I show you how:<br>
  [How_To_Set_Up_Shared_Drive_UNRAID](How_To_Set_Up_Shared_Drive_UNRAID)

- So, what if you are needing to determine EXACTLY which sort of Raspberry Pi you are working with?
  Perhaps you are running an ansible playbook that is making a network map in order to document which
  devices are where. Here's a little script that ansible can push to the device that will output 
  specifically defined output data<br>
  [RasPi_Hardware_Mod_Rev_codes.sh](RasPi_Hardware_Mod_Rev_codes.sh)
  REQUIRES:
  [RasPi_Hardware_Mod_Rev_codes.data](RasPi_Hardware_Mod_Rev_codes.data)
  
- When we have multiple network interfaces, how we quickly determine (1) what interface we 
  are using to reach the internet (or that network), (2) what the IP address is for that interface,
  and (3) what our subnet masking is, using the fewest lines of code possible?<br>
  [determineHowWeReachedInternet.sh](determineHowWeReachedInternet.sh)  
  
- Test whether an argument has been sent to the script:<br>
  [elegantTestWhetherArgExists.sh](elegantTestWhetherArgExists.sh)
 
- Check to see whether we have updates (and security updates) available:<br>
  (yeah, I know apt does this and drops it into the motd, but what if I want to check what's 
  currently there for some reason?)<br>
  [aptListNumberPackagesUpgradeable.sh](aptListNumberPackagesUpgradeable.sh)
  
 - Pull uname data, format it, and use lables from a file:<br>
   [workingWithUname.sh](workingWithUname.sh)
   
<br><br>
##### If you see something here you like, feel free to use it
(subject to the GNU GPL)

If you have suggestions, let me know. I'd love to hear them - especially if it makes the programs
run faster or more elegantly.

(My ego is used to being knocked down - I'm married.)
<br><br><br><br>    
###### Copyright Info
All content in this Repository Copyright (C) 2020-2022 Mickey Fox, or the respective copyright holders.

These programs are free software: you can redistribute them and/or modify them under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

These programs are distributed in the hope that they will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

A copy of the GNU General Public License is available at: <http://www.gnu.org/licenses/>
