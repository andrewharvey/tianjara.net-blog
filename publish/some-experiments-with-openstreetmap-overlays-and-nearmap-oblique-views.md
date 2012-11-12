Title: Some experiments with OpenStreetMap Overlays and NearMap Oblique Views
Date: 2010-10-11 15:10:38
Tags: geo,nearmap,osm

...I was thinking, short of having a high resolution accurate computer model of the world (i.e. digital terrain model with an orthophoto on the terrain + accurate 3D models of buildings, bridges, trees, etc), one can use these "oblique" aerial views to similate other low angle views.

&nbsp;

[caption id="attachment_1178" align="aligncenter" width="573" caption="Sydney North Oblique view. Image tiles from NearMap. Used under the http://www.nearmap.com/products/community-licence license."]<a href="/blog/attachments/2010/10/sydney-nearmap-northview.jpg"><img class="size-full wp-image-1178" title="Sydney-Nearmap-northview" src="/blog/attachments/2010/10/sydney-nearmap-northview.jpg" alt="Sydney, North Oblique View. Tiles from NearMap. Used under the http://www.nearmap.com/products/community-licence license." width="573" height="486" /></a>[/caption]

&nbsp;

What I mean is that Google Earth uses orthophotos as the ground texture. For some places they also have rough building models and these make low angles (ie. when you are not looking straight down towards the earth's surface) in Google Earth look a little bit more real. An alternative, when we lack a high resolution accurate model, for an interactive Google Earth like application is to use overhead orthorectified imagery when the user is looking from above, and use the oblique views (called MultiView on <a href="http://www.nearmap.com/">NearMap</a>) when the angle between the direction of view and the ellipsoid surface normal gets larger. For a 2D web interface when the user changes from the overhead imagery to the oblqiue views, the imagery could fade from one to the other.

&nbsp;

[caption id="attachment_1179" align="aligncenter" width="600" caption="Sydney North Oblique viewed in Google Earth from a lower angle (not straight above). Image tiles from NearMap. Used under the http://www.nearmap.com/products/community-licence license."]<a href="/blog/attachments/2010/10/sydney-nearmapnorth-googleearth.jpg"><img class="size-full wp-image-1179" title="Sydney-NearmapNorth-GoogleEarth" src="/blog/attachments/2010/10/sydney-nearmapnorth-googleearth.jpg" alt="Sydney North Oblqiue viewed in Google Earth from a lower angle (not straight above). Image tiles from NearMap. Used under the http://www.nearmap.com/products/community-licence license." width="600" height="358" /></a>[/caption]

&nbsp;

I hope to also get libchamplain to overlay transpanent map tiles on top of imagery (more on that in the next post), because I really think that oblique views make map reading much easier for the user (although the South, East and West can be a little confusing when viewed at high zooms on a 2D map, just like looking at the world map upside down can be a little confusing at first you just have to think a little bit harder to work out what your looking at, see South and East views further below).

&nbsp;

[caption id="attachment_1181" align="aligncenter" width="600" caption="Sydney North Oblique Imagery from NearMap with OpenStreetMap tiles on top. OSM tiles and data CC-BY-SA 2.0 http://www.openstreetmap.org/, NearMap imagery http://www.nearmap.com/products/community-licence."]<a href="/blog/attachments/2010/10/sydney-nearmapnorthob-mapnik-2000.jpg"><img class="size-full wp-image-1181" title="Sydney-NearmapNorthOb-Mapnik-2000" src="/blog/attachments/2010/10/sydney-nearmapnorthob-mapnik-2000.jpg" alt="Sydney North Oblique Imagery from NearMap with OpenStreetMap tiles on top. OSM tiles and data CC-BY-SA 2.0 http://www.openstreetmap.org/, NearMap imagery http://www.nearmap.com/products/community-licence." width="600" height="508" /></a>[/caption]

&nbsp;

&nbsp;

[caption id="attachment_1182" align="aligncenter" width="600" caption="North Oblique Imagery from NearMap with OpenStreetMap tiles on top. OSM tiles and data CC-BY-SA 2.0 http://www.openstreetmap.org/, NearMap imagery http://www.nearmap.com/products/community-licence."]<a href="/blog/attachments/2010/10/cronulla-nearmapnorthob-mapnik.jpg"><img class="size-full wp-image-1182" title="Cronulla-NearmapNorthOb-Mapnik" src="/blog/attachments/2010/10/cronulla-nearmapnorthob-mapnik.jpg" alt="North Oblique Imagery from NearMap with OpenStreetMap tiles on top. OSM tiles and data CC-BY-SA 2.0 http://www.openstreetmap.org/, NearMap imagery http://www.nearmap.com/products/community-licence." width="600" height="507" /></a>[/caption]

&nbsp;

&nbsp;

[caption id="attachment_1183" align="aligncenter" width="600" caption="Sydney South Oblique View. Image tiles from NearMap. Used under the http://www.nearmap.com/products/community-licence license."]<a href="/blog/attachments/2010/10/syd-nearmap-southview.jpg"><img class="size-full wp-image-1183" title="Syd-Nearmap-Southview" src="/blog/attachments/2010/10/syd-nearmap-southview.jpg" alt="" width="600" height="338" /></a>[/caption]

&nbsp;

&nbsp;

[caption id="attachment_1184" align="aligncenter" width="600" caption="Sydney East Oblique View. Image tiles from NearMap. Used under the http://www.nearmap.com/products/community-licence license."]<a href="/blog/attachments/2010/10/syd-nearmap-eastview.jpg"><img class="size-full wp-image-1184" title="Syd-Nearmap-Eastview" src="/blog/attachments/2010/10/syd-nearmap-eastview.jpg" alt="Sydney East Oblique View. Image tiles from NearMap. Used under the http://www.nearmap.com/products/community-licence license." width="600" height="455" /></a>[/caption]

&nbsp;

Soon I'll post up some stuff about NearMap in libchamplain, and my plans to set up some kind of object recognition to find objects like zebra crossings, the yellow school zone rectangle, cars... from imagery for integration into OpenStreetMap.