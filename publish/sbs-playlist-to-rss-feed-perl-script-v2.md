Title: SBS Playlist to RSS Feed Perl Script v2
Date: 2009-07-10 21:58:10
Tags: computing,rss

I have made some changes to my <a href="http://andrewharvey4.wordpress.com/2009/06/28/sbs-latest-online-video-rss-feed/">original script</a>. This new perl script will scrape info from sbs.com.au and give an RSS feed of the items in the specified playlist. I only know of two playlists (94 = Latest Full Episodes, 95 = Preview Clips). Only one line needs to be changed to use the script to give the RSS feed of a different playlist. The major improvement is the items that are only available over RTMP now have the correct URL which was previously incorrect (but now the script runs slower as it has to grab more pages from the web). I use the url, http://player.sbs.com.au/video/smil/index/standalone/$item_code/ to find out the url details.

<a href="http://savannah.nongnu.org/projects/flvstreamer">FLVStreamer</a> appears to do a good job of downloading media over the RTMP protocol. Just use ./flvstreamer -r rtmp://file.flv &gt; file.flv. Mozilla has an article on how to add protocol's to firefox <a href="http://support.mozilla.com/en-US/kb/The+protocol+is+not+associated+with+any+program#Register_the_protocol_in_Firefox">here</a>. But I didn't bother with that as the command is simple as it is, and building an app with a save as dialogue is beyond me for now, but I hope to learn that soon.

[Update: It seems that you also need to have the --swfUrl argument set ('http://player.sbs.com.au/web/flash/standalone_video_player_application.swf' works.). Also the perl script doesn't get the file name correctly (it uses the thumbnail image url, rather it should be using the url's given at the /video/smil/index pages).]

For local use the current format will probably be what you want, but in a production environment you probably want to have the script save the RSS file to disk and have people hit that RSS file with the requests. Just set the perl script to run every now and then. Unfortunately I can't seem to upload .pl files to Wordpress (I've put a link, but that will expire eventually)... I really need to get my own site.. There is so much customisation I would like to do and many experiments to try out on a live server, but the $$$'s are too much...

On another note I tried out <a href="http://www.epic-ide.org">EPIC</a> (Eclipse Perl Integration), which was fairly simple to install. It seems much nicer than using a plain text editor and command line, especially the debugging abilities that it adds.

<a href="http://pastebin.com/f704d92a8">SBSPlaylistToRSSv0.2.1.pl</a>