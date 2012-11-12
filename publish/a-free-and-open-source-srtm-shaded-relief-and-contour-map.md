Title: A free and open source SRTM shaded relief and contour map
Date: 2012-10-09 22:50:21
Tags: dev,geo,osm

I've recently pushed out a new <a href="https://github.com/andrewharvey/srtm3-stylesheets">srtm3-stylesheets repository</a> which contains shell scripts for working with NASA SRTM DEM data, gdaldem based stylesheets for shaded relief maps, Mapnik stylesheets for contours and a TileStache configuration for sandwich those styles together into a single map.

This was spurred on by the fact that I simply needed a map which showed hills. I've used Andy Allan's OpenCycleMap in the past which has color relief and contours. Unfortunately it is closed source.

So I put my head down and hacked together repeatable scripts to get the source data up and running and some basic stylesheets to produce a usable and pleasant looking map. All released as free and open source software under the CC0 license.

<a href="/blog/attachments/2012/10/srtm3-3.png"><img class="aligncenter size-full wp-image-1439" title="srtm3-3" src="/blog/attachments/2012/10/srtm3-3.png" alt="Contour Map" width="595" height="343" /></a>

I want to avoid adding things like streets etc, such maps could be built as separated layers based upon this style and sandwiched together, for example, with the TileStache sandwich provider.

I hope to build upon the lessons learnt here to produce a map like the Stamen Terrain map, except with the source code released under a free and open source license. Perhaps just with hill and slope shading applied to landuse with other map features placed on top.

<a href="/blog/attachments/2012/10/srtm3-1.png"><img class="aligncenter size-full wp-image-1440" title="srtm3-1" src="/blog/attachments/2012/10/srtm3-1.png" alt="Contour Map" width="595" height="402" /></a>

<a href="/blog/attachments/2012/10/srtm3-2.png"><img class="aligncenter size-full wp-image-1441" title="srtm3-2" src="/blog/attachments/2012/10/srtm3-2.png" alt="Contour Map" width="595" height="347" /></a>

I've rendered NSW (only server resource prevent worldwide!) as a <a href="http://tianjara.net/map#srtm3/9/-33.8043/150.8134">slippy map here</a>.