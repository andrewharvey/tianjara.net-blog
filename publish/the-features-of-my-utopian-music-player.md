Title: The Features of My Utopian Music Player
Date: 2009-12-11 13:27:30
Tags: computing,dev

Ideally I would like to write my own music player because I don't really like any that are currently available (Amarok 1.4, Amarok 2, Songbird, Rhythmbox, Banshee, Exaile). I like features from each but none seem to fit all my needs. All the time I keep rethinking what I should do and I still cannot decide. Anyway this is what my ideal music player would be like...
<ul>
	<li>Backend Database
<ul>
	<li>The backend metadata would be stored in an external Postgresql database, with the option for using sqlite for people who don't want to set up and run postgresql.</li>
	<li>The schema should be good and documented, so that a user can read and write into the database. If not at least give an interface to allow this.</li>
	<li>Full playback information. I want my music player to store the timestamps of every time a given song has been played. I want history too, for instance the times of when the song rating was changed.</li>
</ul>
</li>
	<li>Collection Manger
<ul>
	<li>I want the music player to be the library not just the librarian. I want to give it a file (say an MP3), along with details such as song title, artist, etc. and I want it to take that file and store it on the hard disk in a nice file structure (like iTunes does). Amarok 1.4 attempts to do this but its really hard, because initially it will just add the file to your playlist and not move it across to your collection, and even then if you change the details say the artist it will not correct this in the folder structure used to store that file.</li>
	<li>Tagging songs. Amarok does this well.</li>
</ul>
</li>
	<li>Web scraper
<ul>
	<li>Album art and lyric scraping (<a href="http://andrewharvey4.wordpress.com/2009/09/12/a-rant-about-the-state-of-copyright-and-my-misunderstandings-of-it/">but who knows you might get sent to jail for writing a scraper for a specific site which you do not know if they have permission to distribute those certain copyrighted lyrics/album art which were available at the time of writing the scraper</a>). Amarok seems to do this well.</li>
</ul>
</li>
	<li>Acoustic Analysis
<ul>
	<li>Surely there are algorithms to guess the BPM (beats per minute) of a song. I want that integrated into the music player.</li>
	<li>I need a <a href="http://packages.debian.org/lenny/moodbar">moodbar</a> so I can navigate a song, and to gather contextual information on how the style of the music varies over the song.</li>
	<li>I don't know much about acoustics, but there must be other algorithm which give meaningful measures of audio. <a href="http://thesis.flyingpudding.com/">These should be used to group songs and find similar ones.</a></li>
	<li>This must be done locally, I don't want to send things to web services (MusicBrainz, <a href="http://echonest.com/">http://echonest.com/</a>).</li>
</ul>
</li>
	<li>Navigation
<ul>
	<li>I want a concept of a "Library" rather than a Playlist. Amarok only has playlists, but 99.9% of the time I want a list of all my songs.</li>
</ul>
</li>
	<li>Statistics
<ul>
	<li>I want reports. Reports on my listening trends and song collection. eg. <a href="http://lastgraph3.aeracode.org/">http://lastgraph3.aeracode.org/</a></li>
</ul>
</li>
</ul>
Now for the solution. I could try everything from writing my own music player from scratch that implements that all (but I gave up on that after I could not decide what programming language to use C, C++, Java, Perl, Python, what GUI widget toolkit to use Qt, GTK+, wxWidgets, graphics api for nice graphs Cairo, raw OpenGL, OpenGL behind Clutter, R's graph drawing, Processing, or some other CPAN Perl module for drawing nice graphs. I can mix a few but the core app needs one programming language and it needs a core GUI toolkit for the GUI. There is too much choice and I don't have enough experience to know before hand what is best and what I will find easiest and simplest to use.)

I could try to capture playback statistics by looping last.fm and audioscrobber.com to localhost and capturing the data that Amarok sends. Or I could just write a script for Amarok which captures playback, but this only solves part of the problem and then I'm stuck using a certain application. Alternatively I could just take an existing program and fork it to suit my needs.

There should be more to come on this as I start experimenting.