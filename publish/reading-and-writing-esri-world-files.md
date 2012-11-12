Title: Reading and Writing ESRI World Files
Date: 2011-02-20 14:19:22
Tags: dev,geo

As part of my quest to georeference the old <a href="http://parishmaps.lands.nsw.gov.au/pmap.html">NSW Parish Maps</a>, I ran into the ESRI World file format...
<h1>The Format</h1>
I relied on lot on <a href="http://en.wikipedia.org/wiki/World_file">http://en.wikipedia.org/wiki/World_file</a> as a reference when figuring out how to make sense of world files. I remade the diagram from <a href="http://en.wikipedia.org/wiki/File:WorldFileParametersSchemas.gif">http://en.wikipedia.org/wiki/File:WorldFileParametersSchemas.gif</a>, into two views: pixel centric, and graticule centric (<a href="https://github.com/andrewharvey/georeferencing-scripts/tree/master/from-map-grid/graticules2wld/svg-images/">svg versions here</a>).

<a href="/blog/attachments/2011/02/world-file-pixel-centric.png"><img class="aligncenter size-full wp-image-1264" title="world-file-pixel-centric" src="/blog/attachments/2011/02/world-file-pixel-centric.png" alt="World File Pixel Centric Diagram" width="361" height="366" /></a><a href="/blog/attachments/2011/02/world-file-graticule-centric.png"><img class="aligncenter size-full wp-image-1265" title="world-file-graticule-centric" src="/blog/attachments/2011/02/world-file-graticule-centric.png" alt="World File Graticule Centric Diagram" width="357" height="384" /></a>

...and a difference case, where the graticules are rotated in the other direction,

<a href="/blog/attachments/2011/02/world-file-pixel-centric-leftr.png"><img class="aligncenter size-full wp-image-1267" title="world-file-pixel-centric-leftr" src="/blog/attachments/2011/02/world-file-pixel-centric-leftr.png" alt="World File Pixel Centric - With Left Rotation" width="361" height="400" /></a>

For the purposes of my java program (which I explain below), I define theta as the angle the east/west pointing graticules (I call them lat graticules as they are shown at regular lines of latitude) make with the horizontal, and phi as the angle the north/south pointing graticules (I call them long graticules as they are shown at regular lines of longitude) make with the vertical.

<a href="/blog/attachments/2011/02/angles-ref.png"><img class="aligncenter size-full wp-image-1268" title="angles-ref" src="/blog/attachments/2011/02/angles-ref.png" alt="" width="247" height="122" /></a>

Keep in mind that the image coordinate system and projected coordinate system are different (assuming we are using some kind of UTM projection).

<a href="/blog/attachments/2011/02/pixelcs-projcs.png"><img class="aligncenter size-full wp-image-1269" title="pixelcs-projcs" src="/blog/attachments/2011/02/pixelcs-projcs.png" alt="" width="281" height="135" /></a>
<h1>Writing to a Wld File</h1>
Some of the parish maps have graticules shown and a reference origin for the easting and northing values on the graticules. If we can extract this information we should be able to georeference the raster maps. Actually I'm not sure what projection is used... but I think using a zone of universal transverse mercator should be okay. Also I assume that the eastings and northings on the map are in <a href="http://en.wikipedia.org/wiki/Chain_%28length%29">chains</a>.

The first step is extracting the graticules from the raster map to vectors. I do this by loading the image into Inkscape and tracing the graticules as line segments, with an svg path id for the segment something like "w220", for example to indicate west 220. After I have this svg file I run it through <a href="https://github.com/andrewharvey/georeferencing-scripts/blob/master/from-map-grid/pmap-svggraticules2csv.pl">pmap-svggraticules2csv.pl</a> which extracts these vector graticules from the svg file and saves them into a csv file.

[caption id="attachment_1275" align="aligncenter" width="421" caption="Example of vector graticles drawn over the raster map. Base map is Public Domain."]<a href="/blog/attachments/2011/02/pmapmn05-14041501.png"><img class="size-full wp-image-1275" title="PMapMN05-14041501" src="/blog/attachments/2011/02/pmapmn05-14041501.png" alt="Example of vector graticles drawn over the raster map. Base map is Public Domain." width="421" height="599" /></a>[/caption]

From the csv file I then can use my Java program <a href="https://github.com/andrewharvey/georeferencing-scripts/tree/master/from-map-grid/graticules2wld">graticules2wld</a> to find a best fit world file (which is really just an affine transformation matrix) to georeference this raster image via a best fit approach.

An alternative is to use <a href="https://github.com/andrewharvey/georeferencing-scripts/blob/master/from-map-grid/pmapgrid2gcps.pl">pmapgrid2gcps.pl</a> to extract ground control points (GCPs) from the svg file by finding the intersection points of the graticules. You can then pass these gcps to GDAL, to either warp the image or use gcps2wld.py (from the Debian package python-gdal) to make a best fit world file from the gcps.

I've made a debian package for the graticules2wld program. The package was really hard to make, although in the end I finally did get it working. I ended up using jh_makepkg on just the source (i.e. using no external buildfiles, just the source code). If you want to make the debian package yourself you should be able to <a href="https://github.com/andrewharvey/georeferencing-scripts/tree/master/from-map-grid/graticules2wld-0.1-deb-source">grab this directory</a>, then under graticules2wld-0.1 run dpkg-buildpackage. If you are able to help me so that I'm not duplicating my code in this deb-source directory in the source tree, please help me.
<h1>The Next Step...</h1>
Half the point of using the world file, is so I can load the original image into JOSM and apply the affine transformation matrix (from the world file) to show the raster as a backdrop without having to warp the image unnecessarily. So my next step is to get JOSM to be able to open raster images with a world file and correctly place it as a backdrop in the editor window.