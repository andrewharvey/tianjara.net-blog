Title: SBS Latest Online Video RSS Feed
Date: 2009-06-28 16:23:40
Tags: rss

<em>[An updated (but more complex) script can be found in <a href="http://andrewharvey4.wordpress.com/2009/07/10/sbs-playlist-to-rss-feed-perl-script-v2/">this post</a>]</em>

I needed an excuse to practice some Perl. So this was my first try.

The Perl script below will convert <a href="http://www.sbs.com.au/shows/ajax/getplaylist/playlistId/94/">http://www.sbs.com.au/shows/ajax/getplaylist/playlistId/94/</a> to an RSS feed. That 94 playlist is a list recent episodes from the TV broadcaster SBS available online. This may not work if the source file's structure changes.
<pre>#!/usr/bin/perl

# This script will download the ajax xml file containing the latest full episode videos added to the SBS.com.au site.

#Adapted from the code at http://www.perl.com/pub/a/2001/11/15/creatingrss.html by Chris Ball.

# I declar this code to be in the public domain.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

use strict;
use warnings;

use LWP::Simple;
use HTML::TokeParser;
use XML::RSS;
use Date::Format;

# Constants
my $playlisturl = "http://www.sbs.com.au/shows/ajax/getplaylist/playlistId/94/"; # Latest Full Ep
#my $playlisturl = "http://www.sbs.com.au/shows/ajax/getplaylist/playlistId/95/"; # Latest Sneek Peek

# LWP::Simple Download the xml file using get();.
my $content = get( $playlisturl ) or die $!;

# Create a TokeParser object, using our downloaded HTML.
my $stream = HTML::TokeParser-&gt;new( \$content ) or die $!;

# Create the RSS object.
my $rss = XML::RSS-&gt;new( version =&gt; '2.0' );

# Prep the RSS.
$rss-&gt;channel(
 title            =&gt; "SBS Latest Full Episodes",
 link             =&gt; $playlisturl,
 language         =&gt; 'en',
 lastBulidDate    =&gt; time2str("%a, %d %b %Y %T GMT", time),
 description      =&gt; "Gives the most recent full episodes avaliable from SBS.com.au"
 );

$rss-&gt;image(
 title    =&gt; "sbs.com.au Latest Full Episodes",
 url    =&gt; "http://www.sbs.com.au/web/images/sbslogo_footer.jpg",
 link    =&gt; $playlisturl
 );

# Declare variables.
my ($tag);

# vars from sbs xml
my ($eptitle, $epthumb, $eptime, $baseurl, $img, $url128, $url300, $url1000, $code1char, $code2char, $code1);

#get_tag skips forward in the HTML from our current position to the tag specified, and
#get_trimmed_text  will grab plaintext from the current position to the end position specified. 

# Find an &lt;a&gt; tag.
while ( $tag = $stream-&gt;get_tag("a") ) {
 # Inside this loop, $tag is at a &lt;a&gt; tag.
 # But do we have a "title" token, too?
 if ($tag-&gt;[1]{title}) {
 # We do!
 $eptitle = $tag-&gt;[1]{title};
 #print $eptitle."\n";

 # The next step is an &lt;img&gt;&lt;/img&gt; set.
 $tag = $stream-&gt;get_tag('img');
 $epthumb = $tag-&gt;[1]{src};

 #get the flv urls from the img url
 #eg. http://videocdn.sbs.com.au/u/thumbnails/SRS_FE_Global_Village_Ep_19_44_48467.jpg
 #print $epthumb."\n";
 $baseurl = substr($epthumb, 40, length($epthumb)-40-4);
 $url128 = "http://videocdn.sbs.com.au/u/video/".$baseurl."_128K.flv";
 $url300 = "http://videocdn.sbs.com.au/u/video/".$baseurl."_300K.flv";
 $url1000 = "http://videocdn.sbs.com.au/u/video/".$baseurl."_1000K.flv";

 #SRS|DOC|MOV
 $code1char = substr($baseurl,0,3);
 #SP|FE
 $code2char = substr($baseurl,4,2);

 my %epcode_hash = (
 'DOC'    =&gt; 'Documentary',
 'MOV'    =&gt; 'Movie',
 'SRS'    =&gt; 'Series',
 );
 $code1 = $epcode_hash{$code1char};

 $stream-&gt;get_tag('a');
 $tag = $stream-&gt;get_tag('p');

 # Now we can grab $eptime, by using get_trimmed_text
 # up to the close of the &lt;p&gt; tag.
 $eptime = $stream-&gt;get_trimmed_text('/p');

 # We need to escape ampersands, as they start entity references in XML.
 $eptime =~ s/&amp;/&amp;amp;/g;

 # Add the item to the RSS feed.
 $rss-&gt;add_item(
 title         =&gt; $eptitle,
 permaLink     =&gt; $url1000,
 enclosure    =&gt; { url=&gt;$url1000, type=&gt;"video/x-flv"},
 description     =&gt; "&lt;![CDATA[&lt;img src=\"$epthumb\" width=\"100\" height=\"56\" /&gt;&lt;br&gt;
 $eptitle&lt;br&gt;
 $eptime&lt;br&gt;
 Links: &lt;a href=\"$url128\"&gt;128k&lt;/a&gt;, &lt;a href=\"$url300\"&gt;300k&lt;/a&gt;, &lt;a href=\"$url1000\"&gt;1000k&lt;/a&gt;&lt;br&gt;
 Type: $code1&lt;br&gt;]]&gt;");

 }
}
print "Content-Type: application/xml; charset=ISO-8859-1"; # To help your browser display the feed better in your browser.
#$rss-&gt;save("sbslatestfullep.rss"); #this will save the RSS XML feed to a file when you run the script.
print $rss-&gt;as_string; #this will send the RSS XML feed to stdout when you run the script.
<span><span> </span></span></pre>