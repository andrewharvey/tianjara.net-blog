Title: Using ABS ASGS Data in OpenStreetMap
Date: 2011-03-17 21:18:21
Tags: geo,gov,osm

A little while ago Marcus Blake from the Australian Bureau of Statistics <a href="http://lists.openstreetmap.org/pipermail/talk-au/2011-February/007741.html">asked the OSM community</a> about the potential use of some ABS data. As I mentioned on the list I think it is good that at least some government departments are making their data available under free licenses and that they engage with with the community to sort out any technical details about the data.

As <a href="http://www.abs.gov.au/websitedbs/d3310114.nsf/home/australian+statistical+geography+standard+%28asgs%29">described by the ABS</a>, the ASGS is essentially data describing geographical areas.

[caption id="attachment_1290" align="aligncenter" width="580" caption="ASGS ABS Structures - CC-BY 2.5 AU Australian Bureau of Statistics"]<a href="/blog/attachments/2011/03/asgs-abs-structures.png"><img class="size-full wp-image-1290" title="asgs-abs-structures" src="/blog/attachments/2011/03/asgs-abs-structures.png" alt="" width="580" height="670" /></a>[/caption]

[caption id="attachment_1291" align="aligncenter" width="600" caption="ASGS Non-ABS Structures - CC-BY 2.5 AU Australian Bureau of Statistics"]<a href="/blog/attachments/2011/03/asgs-non-abs-structures.gif"><img class="size-full wp-image-1291" title="asgs-non-abs-structures" src="/blog/attachments/2011/03/asgs-non-abs-structures.gif" alt="" width="600" height="403" /></a>[/caption]

Working out which if any structures should be incorporated into OSM and how needs careful consideration, and <a href="http://lists.openstreetmap.org/pipermail/talk-au/2011-February/007748.html">I've posted some of my thoughts to the list</a>. In the mean time, since the data does contain some landuse information I've been looking into how best to use this information to aid in mapping. A blind import is not an option in my opinion, but I thought it would be handy to see the data as a base map when mapping.

I did try using ogr2osm to convert the data to the OSM xml format to load into JOSM (I even got the translateAttributes function for ogr2osm working for this dataset), but due to the nature of the data, I think a simple raster underlay works well. I tried two approaches in parallel.
<ol>
	<li>shp -&gt; osm (using ogr2osm) -&gt; postgres (using osm2pgsql) -&gt; raster tiles (using mapnik).</li>
	<li>Using GeoServer to serve a WMS which can be loaded into JOSM.</li>
</ol>
Option 2 seemed to require less set up time. Simply used the GUI to load the shapefile, and <a href="https://gist.github.com/874161">apply a style</a>. Then load the WMS into JOSM.

[caption id="attachment_1295" align="aligncenter" width="600" caption="ABS Mech Blocks with landuse styling in JOSM, with NearMap underlay."]<a href="/blog/attachments/2011/03/nearmap-asb-mb-in-josm.jpg"><img class="size-full wp-image-1295" title="nearmap-asb-mb-in-josm" src="/blog/attachments/2011/03/nearmap-asb-mb-in-josm.jpg" alt="ABS Mech Blocks with landuse styling in JOSM, with NearMap underlay." width="600" height="435" /></a>[/caption]

One caveat, if you want to load a WMS services from GeoServer into JOSM, I found the URL should look something like:
<pre>http://localhost:8080/geoserver/wms?service=WMS&amp;version=1.1.0&amp;request=GetMap&amp;layers=<strong>workspace_name</strong>:<strong>layer_name</strong>&amp;styles=&amp;format=image/png&amp;</pre>
Slightly unrelated but if you are using tomcat or jetty locally but only occasionally (like I do), I find it is best to use <tt>sysv-rc-conf</tt> (eg. <tt>sudo sysv-rc-conf tomcat6 off</tt>) to disable the tomcat or jetty daemon from running at boot, whilst still allowing you to start it (<tt>sudo service tomcat6 start</tt>) when you need it.

If anyone is interested in getting such data in JOSM and would like more details, just let me know.