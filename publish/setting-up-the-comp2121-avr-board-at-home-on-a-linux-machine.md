Title: Setting Up the COMP2121 AVR Board at Home on a Linux Machine
Date: 2009-05-08 01:00:41
Tags: avr,comp2121

Just quickly because I need to get back to work, here is how I managed to finally set up a working environment to use the COMP2121 AVR Board at home using linux.
<ol>
	<li>Installed Sun's Virtual Box.</li>
	<li>Downloaded and installed Windows 7 Beta (Because its free (as in free beer) and only expires after this course is over)</li>
	<li>Under the network settings for the Windows 7 virtual machine, disabled it from the rest of the world (I don't need it here, so save my download for better things that Windows updates).
<a href="/blog/attachments/2009/05/screenshot-2121-settings.png"><img class="aligncenter size-full wp-image-507" title="Virtual Box Network Settings" src="/blog/attachments/2009/05/screenshot-2121-settings.png" alt="Virtual Box Network Settings" width="449" height="358" /></a></li>
	<li>Install AVR Studio.</li>
	<li>Install a driver (I used this one <a href="http://www.ftdichip.com/Drivers/CDM/CDM%202.04.16.exe">http://www.ftdichip.com/Drivers/CDM/CDM%202.04.16.exe</a>) from here http://www.ftdichip.com/Drivers/VCP.htm. Don't need to worry about trusting anything as this virtual will just be used for the AVR board.</li>
	<li>In the bottom right hand of the virtual box window enable the "FTDI USB &lt;-&gt;UNSW uLab" USB device (when its plugged in).</li>
	<li>Run nite.exe with these arguments " -l com3 -f 4 -t 1 -h X:\AVRProj\". You may need to check if its com3 or something else in "Device Manager". Where that last path is the default directory (I set up a shared directory in the VM settings).</li>
</ol>