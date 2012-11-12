Title: Development Update (Static OSM Tiles, git rebase, Map Labelling)
Date: 2011-12-11 11:12:22
Tags: dev,geo,osm

<h2>Map Labelling Suburbs and Cities</h2>
Yesterday I pushed a bunch of changes to my <a href="https://github.com/andrewharvey/osm-hybrid-carto/">OSM/Aerial Imagery Hybrid Style</a>, see the <a href="http://tianjara.net/leaflet.html#map=agri,osmt;lat=-33.89;lon=151.27;zoom=15">(demo)</a>. I spent a bit of time on suburb and city labels as they are a really important feature of a map aimed at non-experts.

I'm finding making a non-trivial style like this has defiantly made me realise the difficulties of such a task.

There are a lot of improvements that can be made (either by modifying or making new components) to the OSM Mapping conventions, osm2pgsql/imposm, mapnik library, carto language stack. That said, the current form is still great and you can still make great maps. But,
<table>
  <tr>
    <th>I would like to be able to</th>
    <th>but this needs</th>
  </tr>
  <tr>
    <td>have labels for large bays at lower zooms than small bays</td>
    <td>need bays mapped as closed ways covering their area, rather than a point in the centre</td>
  </tr>
  <tr>
    <td>define a linear function for the size of icons. i.e. at z10 the icon is 10px, at z20 the icon is 20px, now linearly interpolate all sizes for zooms in between</td>
    <td>either build this functionality into the carto language, or make another higher level macro like language which you can code this in which is then compiled into carto</td>
  </tr>
  <tr>
    <td>render spread text inside a riverbank</td>
    <td>needs functionality in the mapnik rendering engine</td>
  </tr>
</table>

<h2>Static OSM Tiles</h2>
I'm still yet to find a tile server which is fast and works well with lighttpd (nginx would probably suffice too). As an experiment I decided to pre-render a bunch of tiles for my hybrid style sheet. This tile layer doesn't need to be minutely updated, anyone who needs that can use the normal mapnik layer. Also static tiles server straight from the webserver should be pretty fast (maybe on memcached tiles would be faster) and I wanted my tiles to be fast.

Next up how can I generate these static tiles? There is the popular <a href="http://svn.openstreetmap.org/applications/rendering/mapnik/generate_tiles.py">generate_tiles.py</a>, but that won't render meta tiles, seems like such a waste to render every tile with a buffer of 128px when I would render a 5 by 5 meta tile of the same buffer for only 36% of the total pixels rendered. The larger the meta tiles the larger the latency, but if I'm pre-rendering them all than latency doesn't matter any more.

So I wrote a <a href="https://gist.github.com/1397377">C++ program</a> as my replacement for generate_tiles.py. I also programmed it to render from a list of meta tiles rather than a bbox. This means for my demo I can only render high zooms where there is nearmap coverage. This is where <a href="https://github.com/andrewharvey/OSMTileListFromGeometry/">https://github.com/andrewharvey/OSMTileListFromGeometry/</a> came in, which pulls nearmap coverage areas from an osm2pgsql database, and generates a list of meta tiles.

Using this method I rendered up to and including zoom 17, composed of 22444 5 by 5 meta tiles or 561100 regular tiles in a time of,

<pre>real    198m17.021s
user    103m49.985s
sys     37m36.117s</pre>

with disk usage,
<pre>
&lt;1M   0-8
2.0M  9
6.8M  10
26M   11
98M   12
13M   13
36M   14
114M  15
411M  16
1.5G  17
========
2.2G  total
</pre>

(Updated with results when using "png" rather than "png256")

<pre>real    228m17.082s
user    160m24.725s
sys     31m42.653s</pre>

with disk usage,
<pre>
&lt;1M   0-8
3.1M  9
8.6M  10
28M   11
121M  12
34M   13
83M   14
218M  15
663M  16
2.0G  17
========
3.1G total
</pre>

I think that time could still be sped up with,
<ul>
  <li>tuning of the mapnik stylesheet queries</li>
  <li>tuning of the postgres database</li>
  <li>spanning more rendering threads</li>
  <li>using larger meta tiles</li>
  <li>using a machine with more that 512MB of RAM</li>
  <li>not running minutely updates in the background</li>
</ul>

<h2>Git Rebase</h2>
As I use git more and more I'm slowing learning more of the features it has to offer (and thanks to the free hosting by github). One such feature which I think is awesome is git rebase. As an example the other day I did <code>git commit -ammend</code> instead of <code>git commit --amend</code> (I knew there was a duplicate character somewhere but because I seem to have a tint of dyslexia I confused the duplicate -- with mm).

Of course this resulted in committing all files which had changed with a message of "mend" as a new commit. I did this twice, and only noticed after I had already made a bunch of correct commits afterwards. With git rebase I could pop some commits of the commit stack, remove the two "mend" commits fix the commit which I should have been amended to and pop my other commits back on top of the stack.

Thanks to <a href="http://stackoverflow.com/a/180085">http://stackoverflow.com/a/180085</a>.

<h2>Next Up</h2>
<ul>
  <li>build a daily OSM planet extract by pushing minute-replicate files into the osmosis psql simple schema, then dumping to an OSM file</li>
  <li>use this OSM file as a basis for monav and an OSRM service for fosm data</li>
  <li>run a name finder service for fosm data</li>
  <li>more updates to the hybrid map style</li>
  <li>render the hybrid style tiles as oblique images for nearmap multiview</li>
</ul>