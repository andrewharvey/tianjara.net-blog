Title: I've switched to nouveau, an open source nvidia driver
Date: 2011-03-07 20:58:53
Tags: linux

...and I'm back. I've finally upgraded from the nvidia proprietary driver, to the open source nouveau driver. After a little bit of time stuck at the console (I somehow managed to break X) trying to remember how to do things without a graphical display, I've got things working normal again.

First impression is compiz seems to be much slicker (ie. animations are smoother) on nouveau rather than the nvidia proprietary driver. I like it.

I had a couple of hiccups in the switch. I needed to clean /etc/X11/xorg.conf down to the 4 line minimal version to get a sane display resolution, and I needed to properly remove the nvidia proprietary driver (apt-get remove worked, but I needed to remove all the non-free nvidia packages). I also needed to install libgl1-mesa-dri-experimental to get direct rendering for compiz and basic OpenGL programs to work. Compiz seems to run fine now. The only noticeable difference in SuperTuxKart is a white flicker...