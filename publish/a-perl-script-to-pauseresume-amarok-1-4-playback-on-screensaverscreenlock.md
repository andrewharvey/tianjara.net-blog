Title: A Perl Script to Pause/Resume Amarok 1.4 Playback on Screensaver/Screenlock
Date: 2009-12-11 13:00:41
Tags: computing,dev,sh

I've just <a href="http://github.com/andrewharvey/perlmisc/blob/master/amarok_pause_on_screenlock.pl">uploaded to GitHub a script to pause Amarok 1.4 playback when the screensaver/screenlock starts</a> and up pause again when closed/unlocked. It addresses the issue I was having with the script at <a href="http://nxsy.org/getting-amarok-to-pause-when-the-screen-locks-using-python-of-course">http://nxsy.org/getting-amarok-to-pause-when-the-screen-locks-using-python-of-course</a> where the script would start Amarok if it was not running and it would restart playback on screensaver end/unlock regardless of whether it was playing when the screensaver started.

You could start the script on start-up or plug it into Amarok's script engine to only be active when Amarok is active.

(Oh and in the future I'll try to avoid posts that just<a href="http://github.com/andrewharvey.atom"> duplicate item's from other RSS/Atom feeds</a> that don't add much extra value.)