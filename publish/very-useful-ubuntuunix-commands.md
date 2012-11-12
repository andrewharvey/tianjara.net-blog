Title: Very Useful Ubuntu/Unix Commands
Date: 2009-06-29 17:56:31
Tags: computing,linux

Just some Ubuntu/Unix commands that I seem to find very useful but can be hard to remember at times.
<h3>PDF Concatenation</h3>
<pre>pdftk in1.pdf in2.pdf cat output out1.pdf</pre>
Its annoying that nautilus doesn't integrate this by default, so I could select some PDF's then right click and choose merge. Luckily I can do this with the fairly simple Nautilus Actions Configuration app. But this takes time and the average user doesn't have the time to research these things on how to do it themselves. Of course this could be extended further to match what you can do from the command line, such as choose some method of ordering the files, or choose to do weird things such as rotate every second page. Sure you want to keep things simple, so as a start it would be great to see something basic. There are probably even nautilus scripts in the repositories out there that do this exact thing, but you spend half your time finding them and installing them. I think this should be enabled by default, or put in some options page somewhere.
<h3>Truncate an mp3 file</h3>
<pre>mpgsplit input.mp3 [00:00:20-00:00:58] -o output.mp3</pre>
It appears that this doesn't re-encode so it seems to run very fast.
<h3>Mount an ISO</h3>
<pre>sudo mount -o loop ~/disk.iso /media/cdrom0</pre>
<h3>Strip audio from a video file</h3>
<pre>ffmpeg -ab 320k -i in.mov outaudio.mp3</pre>
Unfortunately when I left out the bit rate, it defaulted to 14K or something much lower than what the source file was using.
<h3>Search all files in the current directory for some string</h3>
<pre>find . -exec grep "searchthisstring" '{}' \; -print
find . -exec grep -q "searchthisstring" '{}' \; -print</pre>
<h3>Trim and nup pdfs</h3>
<pre>pdfnup --nup 2x2 --pages 26-140 --trim "1cm 1cm 1cm 1cm" infile.pdf</pre>
<h3>Wake from Suspend</h3>
<pre>sudo rtcwake -u -s 12600 -m on</pre>
... then you need to manually put the computer in suspend and 12600 seconds later the computer will resume.
<h3>Susped</h3>
<pre>pm-suspend</pre>
<h3>Shutdown</h3>
sudo shutdown -h now
sudo shutdown -r now

... the -h means halt (shutdown), -r means reboot.
<h3>Tar and Gz all the files in a directory</h3>
<pre>tar -cvfz file.tar.gz *</pre>
<h3>Get file info from an HTTP server without downloading</h3>
<pre>wget -S --spider http://www.site.com/file</pre>