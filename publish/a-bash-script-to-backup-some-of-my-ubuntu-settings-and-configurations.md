Title: A Bash Script to Backup Some of my Ubuntu Settings and Configurations
Date: 2009-01-31 05:01:08
Tags: ubuntu

Here is a bash script I wrote to backup some of my user preferences and configuration for my Ubuntu 8.10 installation and some of my apps settings.
<pre style="padding-left:30px;">#!/bin/sh

#will put all backups in ./backups/YYYYMMDD_HHMM/
DATETIME=`date +%Y%m%e_%H%M`
USER="YOURUSERNAME"
DEST="backups/$DATETIME"
mkdir "backups"
mkdir "backups/$DATETIME"

#computer setups
cp /boot/grub/menu.lst $DEST/menu.lst
cp /etc/X11/xorg.conf $DEST/xorg.conf
cp /etc/fstab $DEST/fstab

#user files/profiles
##files
cp /home/$USER/.gnome2/stickynotes_applet $DEST/stickynotes_applet
cp /home/$USER/.gtk-bookmarks $DEST/.gtk-bookmarks

##folders
tar -cvvf $DEST/purple.tar /home/$USER/.purple/
tar -cvvf $DEST/mozilla.tar --exclude-tag-all='_CACHE_MAP_' --exclude='urlclassifier3.sqlite' /home/$USER/.mozilla/
tar -cvvf $DEST/Templates.tar /home/$USER/Templates/
tar -cvvf $DEST/gconf.tar /home/$USER/.gconf/
tar -cvvf $DEST/gnome2.tar /home/$USER/.gnome2/
tar -cvvf $DEST/gnome-color-chooser.tar /home/$USER/.gnome-color-chooser/</pre>