Title: An Idea for a Media-Centreish Interface for a UNIX terminal/shell
Date: 2009-12-18 15:50:56
Tags: computing,sh

Back in July or August this year when I was going through the notes on unix shells for COMP2041 I came up with idea of doing a shell/terminal interface that looked like an interface for a media centre ie. rather than looking like this,

<a href="/blog/attachments/2009/12/xterm-man.png"><img class="aligncenter size-full wp-image-969" title="xterm-man" src="/blog/attachments/2009/12/xterm-man.png" alt="manual page for man in xterm" width="450" height="293" /></a>it would look "like" this (obvious not exactly the same but similar feel),

[caption id="attachment_970" align="aligncenter" width="450" caption="XBMC skin MediaStream by Team Razorfish. http://xbmc.org/wordpress/wp-content/gallery/mediastream/viewoptions.jpg"]<a href="/blog/attachments/2009/12/mediastream-skin.jpg"><img class="size-full wp-image-970" title="mediastream-skin" src="/blog/attachments/2009/12/mediastream-skin.jpg" alt="" width="450" height="253" /></a>[/caption]
<p style="text-align:left;">The key principles I had in mind were,</p>

<ul>
	<li>nice aesthetics</li>
	<li>interface similar to a game or media centre</li>
	<li>features easily discoverable for new users</li>
</ul>
My original motives were that I was  just learning all these core-utils commands (ls, cat, mkdir, cp, mv...) and I found that although the shell had tab completion and apropos, it didn't categorise these or give them in a list of common commands. Then I came up with more abstract ideas,
<ul>
	<li>categorise common commands and give help on them. eg. File System: ls, cd, cd .., mkdir. Filters: cat, wc, grep...</li>
	<li>parse commands and their argument list based on common styles (eg. GNU style, short -las and long -l --all --size) and provide contextual information (eg hovering over an --argument gives a one line message about what that argument does (perhaps parse the man file to get this info)) also auto-layout the command line as per the argument style.</li>
	<li>it could also parse the pipe lines and display these much more visually so its easier to see what's piping into what and allow the user to easily change the order/flow of the pipeline.</li>
	<li>process management. don't force the user to remember Ctrl+C and Ctrl+Z and bg and fg commands, show these as pause and stop icons.</li>
	<li>redirection of output should be easily changed in the interface rather than just adding a &lt; or &gt; to the command line (and allow one to redirect STDOUT to a file AFTER the command has already run (because currently you would need to run the command again, or copy and paste and put up the with new lines that gnome-terminal puts in))</li>
	<li>bookmarking commands (including argmunts) so that those common ones you use that you haven't remembered yet are quick and easy to use.</li>
	<li>colour STDERR in red.</li>
</ul>
I haven't really thought about it on a technical level, but it may not be so portable as say gnome-terminal. I don't know the really differences among different shells out there so I don't know how dependent this is on bash or even if it ties bash and the terminal together, but from a beginner user perspective I don't care about this.

The cloudy idea I have in my mind is basically a GUI/CLI hybrid but I think such a program would need to be careful not to go too far, because it could be made so that after doing an ls -la you could click on a file in the list and rename it, but then we are turning into a file manager in list mode (like Dolphin or Nautilus) which is unnecessary as those tools already exist.

I'm aiming to do come up with a list and more detailed list of requirements and a set of activity and use case scenarios, along with some wire-frame prototypes for such an interface soon. But for now I just needed to get it all out of my head an onto paper (and also public (in case someone tries to patent a concept)).
