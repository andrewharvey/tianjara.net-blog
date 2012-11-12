Title: Facebook Video Updates as an RSS Feed (Using a Shell Script)
Date: 2009-07-30 13:39:08
Tags: rss,sh

We are finally learning common Unix tools at uni. Gosh I wish we had done these earlier because they are so useful! (yes I could have learnt them myself, and I did a bit. But I ended up just learning the parts to get the job done. This didn't always work because I had very little understanding of why things worked (and why they didn't) and thus things turned into trial and error).

So anyway I wanted an RSS feed for videos uploaded on Facebook to public pages. (For example <a href="http://www.facebook.com/video/?id=20916311640">http://www.facebook.com/video/?id=20916311640</a>). So I put my newly learnt skills to good use and wrote a shell script.
<pre><span style="text-decoration:line-through;">#!/bin/sh
wget http://www.facebook.com/video/?id=$1 -q -O - -U 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv: 1.8.0.3) Gecko/20060523 Ubuntu/dapper Firefox/1.5.0.3' | grep 'http://www.facebook.com/video/video.php?v=' | sed -e 's/http:\/\/www.facebook.com\/video\/video.php?v=[0-9]*/\n&amp;\n/g' | grep 'http://www.facebook.com/video/video.php?v=' | uniq | sed -e 's/.*/&lt;item&gt;&lt;title&gt;&amp;&lt;\/title&gt;&lt;link&gt;&amp;&lt;\/link&gt;&lt;\/item&gt;/' | sed "1 s/^/&lt;?xml version=\"1.0\"?&gt;&lt;rss version=\"2.0\"&gt;&lt;channel&gt;&lt;title&gt;Facebook Video Feed&lt;\/title&gt;&lt;link&gt;http:\/\/www.facebook.com\/video\/?id=$1&lt;\/link&gt;&lt;description&gt;Facebook Videos for ID $1&lt;\/description&gt;&lt;language&gt;en-us&lt;\/language&gt;/" | sed '$ s/$/&lt;\/channel&gt;&lt;\/rss&gt;/'</span></pre>
UPDATED: (links on the page from facebook no longer have the domain etc in the link)

(the line below gets cut off, but you can select it and copy paste...)
<pre>#!/bin/sh
wget http://www.facebook.com/video/?id=$1 -q -O - -U 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv: 1.8.0.3) Gecko/20060523 Ubuntu/dapper Firefox/1.5.0.3' | grep '/video/video.php?v=' | sed -e 's/\/video\/video.php?v=[0-9]*/\n&amp;\n/g' | grep '/video/video.php?v=' | uniq | sed -e 's/.*/&lt;item&gt;&lt;title&gt;http:\/\/www.facebook.com&amp;&lt;\/title&gt;&lt;link&gt;http:\/\/www.facebook.com&amp;&lt;\/link&gt;&lt;\/item&gt;/' | sed "1 s/^/&lt;?xml version=\"1.0\"?&gt;&lt;rss version=\"2.0\"&gt;&lt;channel&gt;&lt;title&gt;Facebook Video Feed&lt;\/title&gt;&lt;link&gt;http:\/\/www.facebook.com\/video\/?id=$1&lt;\/link&gt;&lt;description&gt;Facebook Videos for ID $1&lt;\/description&gt;&lt;language&gt;en-us&lt;\/language&gt;/" | sed '$ s/$/&lt;\/channel&gt;&lt;\/rss&gt;/'</pre>
Facebook will actually check the user agent and refuse to serve users it doesn't like so I had to spoof it. So anyway the pipeline will grab the html page and find all the links to individual videos and feed these out, one line for each (this is up to just after the uniq). Next I add some text to turn this list into a basic RSS file. I don't worry about making it fancy with the video title, thumbnail etc. because honestly I don't care about that for my use.

To actually use it I can use cron, (actually I think its easiest to make another shell script and put this in /etc/cron.daily/ or /etc/cron.hourly/) to run the command,
<code>./fbvidrss.sh 20916311640 &gt; /var/www/fbvid_20916311640.xml</code>