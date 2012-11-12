Title: GDAL with MrSID, BOM Geofabric Dataset
Date: 2011-01-26 16:56:40
Tags: geo

<h1>GDAL 1.8 with MrSID</h1>
Since moving to Debian I no longer had the MrSID reader for GDAL. It's non free software so I could do without it, but some data I have was only provided in MrSID format, and I need to get it out of the format. I used the binaries from <a href="http://developer.lizardtech.com/">http://developer.lizardtech.com/</a> (<a href="http://www.lizardtech.com/developer/members/download.php?dl=Unified_DSDK_8.0_linux.x86-64.gcc41.tgz">http://www.lizardtech.com/developer/members/download.php?dl=Unified_DSDK_8.0_linux.x86-64.gcc41.tgz</a>), along with <a href="http://download.osgeo.org/gdal/gdal-1.8.0.tar.gz">http://download.osgeo.org/gdal/gdal-1.8.0.tar.gz</a>. I used this ./configure line (which fixes the "skipping incompatible /lib/Release/libltidsdk.a when searching for -lltidsdk" error). Binaries are put in apps.

<code>./configure --with-spatialite --with-poppler --with-libkml --with-mrsid=/home/pathto/Unified_DSDK_8.0_linux.x86-64.gcc41/Raster_DSDK --with-jp2mrsid --libdir=/home/pathto/Unified_DSDK_8.0_linux.x86-64.gcc41/Raster_DSDK/lib</code>
<h1>BOM Geofabric Dataset</h1>
A while back the Bureau of Meteorology made available the Australian Hydrological Geospatial Fabric dataset licensed for use under Creative Commons 3.0 license. It is available at ftp://ftp.bom.gov.au/anon/home/geofabric/. I was unable to read the files in the supplied formats, so upon my request the BOM made available the files in ESRI Shapefile format, if you would like the files in SHP file format you should make a request to AHGF@bom.gov.au. (or give me a public FTP server I can upload the dataset to).

Once I had the SHP files, I used ogr2osm to convert them to OSM files, which I could then load into JOSM.

[sourcecode language="bash"]
#!/bin/sh

for f in SH_*_SHP/SH_*/*.shp
do
    echo &quot;$f&quot;

    # clip the source shp files
    # EPSG:4326 is WGS84 LL
    # we convert to EPSG:4326 as this allows us to specify the clip bbox in WGS84
    dir=`dirname &quot;$f&quot;`
    mkdir -p &quot;01-trim/$dir&quot;
    ogr2ogr -t_srs EPSG:4326 -clipdst minlon minlat maxlon maxlat  &quot;01-trim/$f&quot; &quot;$f&quot;

    # run ogr2osm with output file specified
    base=`basename &quot;$f&quot;`
    mkdir -p &quot;02-osm/$dir/&quot;
    ogr2osm.py -o &quot;02-osm/$dir/$base.osm&quot; &quot;01-trim/$f&quot;
done
[/sourcecode]

Apart from the learning experience this exercise seems to have been futile, as the data is far inferior to the existing data in OpenStreetMap.