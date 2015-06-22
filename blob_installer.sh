#!/system/bin/sh
#Android Kexecboot blob Installer - TF300t-AKBI v0.9 - Beta
# 06/23/2015
#by workdowg@xda
#This script must be run in the directory it was extracted to
# fail on errors
set -e
#Test for root access
perm=$(id|cut -b 5)
if [ "$perm" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
#cd into correct directory
workingdir=$(dirname "$0")
cd $workingdir
#Test for correct directory
if [ ! -f kexec.blob ] ; then
    echo "You are not running this script"
    echo "from the correct directory. Exiting"
    exit
fi
#kexecblob installer
echo ""
echo ""
echo ""
echo ""
echo "========================================================"
echo "Android Kexec blob installer by workdowg@xda"
echo "========================================================"
echo ""
echo ""
echo "Press enter to continue or ctr+c to exit"
read
echo "Installing Kexec blob"
echo "Flashing Kexec.blob to mmcblk0p4..."
dd if=kexec.blob of=/dev/block/mmcblk0p4
echo "Kexec blob flashed"
echo ""
echo ""
echo "Android Kexec blob installer - Done!"
echo ""
echo "Press enter to continue or ctr+c to exit"
read
sh ./TF300t-AKBI.sh


