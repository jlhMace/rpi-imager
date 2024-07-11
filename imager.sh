#!/bin/bash

# Configuration file
. rpi-imager.conf

# Defaults

echo ======================================================
echo "                  Raspbery Pi Imager"
echo ""
echo " Enter the mount point of the image root directory."
echo -n " SD card device name (default /dev/sdb): "
read rpiRoot
rpiDevice="${rpiDevice:=/dev/sdb}"
rpiBoot=$rpiDevice"1"
rpiRoot=$rpiDevice"2"
echo -n " Configuration file (default rpi-imager.conf):"
read rpiConf
rpiConf="${rpiConf:=rpi-imager.conf}"
echo " Image root is located at $rpiRoot"
echo " Configuration file is located at $rpiConf"

#curl -o raspios-bookworm-arm64-20240704.img.xz https://downloads.raspberrypi.com/raspios_arm64/images/raspios_arm64-2024-07-04/2024-07-04-raspios-bookworm-arm64.img.xz

### Step one: image microsd
### Get image from website, get location of microsd card, do imaging
### For now assume step one is completed and use standard rpi imager

### Step two: change config settings

# enable ssh
rpiBootMount=`lsblk --noheadings --output MOUNTPOINT $rpiBoot`
if [ "$ssh_enabled" = true ] ; then
	touch $rpiBootMount/ssh
	echo " SSH enabled."
else
	echo " SSH not enabled."
fi




echo ======================================================
