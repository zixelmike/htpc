[Alex@ELEC](http://www.alexelec.in.ua)

# Alex@ELEC - Embedded Linux Entertainment Center

AlexELEC is a 'Just enough OS' Linux distribution for running the award-winning [Kodi](http://kodi.tv), [VDR](http://www.tvdr.de), [Tvheadend](http://tvheadend.org/) and [Libretro](http://www.libretro.com) software on popular mediacentre hardware.
AlexELEC is a fork of the popular [LibreELEC](https://libreelec.tv/) project with a stronger focus on pre-release testing and post-release change management.
Further information on the project can be found on the [AlexELEC website](http://alexelec.in.ua).

**Issues & Support**

Please report issues via the [AlexELEC forum: Bug Reports](http://forum.alexelec.in.ua).

**Donations**

Contributions towards current project funding goals can be sent through the [donations page](http://www.alexelec.in.ua/membership).

**License**

AlexELEC original code is released under [GPLv2](http://www.gnu.org/licenses/gpl-2.0.html).

**Copyright**

As AlexELEC includes code from many upstream projects it includes many copyright owners. AlexELEC makes NO claim of copyright on any upstream code.
However all original AlexELEC authored code is copyright AlexELEC. For a complete copyright list please checkout the source code to examine license headers.
Unless expressly stated otherwise all code submitted to the AlexELEC project (in any form) is licensed under [GPLv2](http://www.gnu.org/licenses/gpl-2.0.html) and copyright is donated to AlexELEC.
This approach allows the project to stay manageable in the long term by giving us freedom to maintain the code as part of the whole without the management overhead of preserving contact with every submitter, e.g. GPLv3.
You are absolutely free to retain copyright. To retain copyright simply add a copyright header to each submitted code page. If you submit code that is not your own work it is your responsibility to place a header stating the copyright.

**Notes**

* SSH login details are user: “root” password: “mcpc”.
  SSH allows command line access to your Alex@ELEC machine for configuration
  and file transfer. Linux/Mac clients can natively use SSH, while Windows
  users might want to try PuTTY for their terminal access.
* $HOME is mounted on /storage (the second ext4 partition on the drive). 
  All data transfered to the machine will go here, the rest of the system is
  read-only with the exception of /var (containing runtime configuration data).
* Manual update/downgrade procedure is as follows:
  Copy the snapshot (.tar) to the 'Update' network share (or /storage/.update) on
  your Alex@ELEC machine. Your system will automatically upgrade during the 
  next reboot.
* Automatic mounting of filesystems is supported. Devices such as USB Flash 
  sticks can be plugged into a running machine and will be mounted to /media,
  showing up in Kodi’s GUI.
* Comments and questions are more than welcome, help is even better and patches 
  are absolutely perfect!!
