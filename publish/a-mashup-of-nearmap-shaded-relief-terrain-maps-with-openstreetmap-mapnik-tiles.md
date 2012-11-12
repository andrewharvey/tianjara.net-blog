Title: A Mashup of Nearmap Shaded Relief Terrain Maps with OpenStreetMap Mapnik Tiles
Date: 2010-10-28 13:58:51
Tags: dev,nearmap,osm

Some eye candy from my experiments of combining Nearmap terrain tiles with OpenStreetMap tiles. These images (which are hyperlinked to full sized ones) are derived works from OpenStreetMap.org default mapnik tiles (which is based on data from OpenStreetMap contributors licensed <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC BY-SA 2.0</a>), and Nearmap.com shaded relief terrain maps licensed under the <a href="http://www.nearmap.com/products/community-licence">Nearmap Community License</a>.

[caption id="attachment_1198" align="aligncenter" width="600" caption="Nearmap Terrain Maps with OpenStreetMap Mapnik Map. Based on images (c) OpenStreetMap   contributors, CC-BY-SA, and (c) Nearmap, Nearmap Community License."]<a href="/blog/attachments/2010/10/osm-nearmapshaded1-1.png"><img class="size-full wp-image-1198" title="osm-nearmapshaded1-1" src="/blog/attachments/2010/10/osm-nearmapshaded1-1.png" alt="Nearmap Terrain Maps with OpenStreetMap Mapnik Map" width="600" height="389" /></a>[/caption]

[caption id="attachment_1199" align="aligncenter" width="600" caption="Nearmap Terrain Maps with OpenStreetMap Mapnik Map. Based on images (c) OpenStreetMap contributors, CC-BY-SA, and (c) Nearmap, Nearmap Community License."]<a href="/blog/attachments/2010/10/osm-nearmapshaded1-2.png"><img class="size-full wp-image-1199" title="osm-nearmapshaded1-2" src="/blog/attachments/2010/10/osm-nearmapshaded1-2.png" alt="Nearmap Terrain Maps with OpenStreetMap Mapnik Map." width="600" height="371" /></a>[/caption]

[caption id="attachment_1200" align="aligncenter" width="600" caption="Nearmap Terrain Maps with OpenStreetMap Mapnik Map. Based on images (c) OpenStreetMap contributors, CC-BY-SA, and (c) Nearmap, Nearmap Community License."]<a href="/blog/attachments/2010/10/osm-nearmapshaded1-3.png"><img class="size-full wp-image-1200" title="osm-nearmapshaded1-3" src="/blog/attachments/2010/10/osm-nearmapshaded1-3.png" alt="Nearmap Terrain Maps with OpenStreetMap Mapnik Map." width="600" height="395" /></a>[/caption]

[caption id="attachment_1201" align="aligncenter" width="600" caption="Nearmap Terrain Maps with OpenStreetMap Mapnik Map. Based on images (c) OpenStreetMap contributors, CC-BY-SA, and (c) Nearmap, Nearmap Community License."]<a href="/blog/attachments/2010/10/osm-nearmapshaded1-4.png"><img class="size-full wp-image-1201" title="osm-nearmapshaded1-4" src="/blog/attachments/2010/10/osm-nearmapshaded1-4.png" alt="Nearmap Terrain Maps with OpenStreetMap Mapnik Map." width="600" height="436" /></a>[/caption]

[caption id="attachment_1202" align="aligncenter" width="600" caption="Nearmap Terrain Maps with OpenStreetMap Mapnik Map. Based on images (c) OpenStreetMap contributors, CC-BY-SA, and (c) Nearmap, Nearmap Community License."]<a href="/blog/attachments/2010/10/osm-nearmapshaded1-5.png"><img class="size-full wp-image-1202" title="osm-nearmapshaded1-5" src="/blog/attachments/2010/10/osm-nearmapshaded1-5.png" alt="Nearmap Terrain Maps with OpenStreetMap Mapnik Map." width="600" height="416" /></a>[/caption]

My approach is based on http://wiki.openstreetmap.org/wiki/TopOSM/Details. I used two mapnik stylesheets, one for everything minus the labels, and one with just the labels. From here I used this bash script,

[sourcecode language="bash"]
for f in nearmap-dem/*/*/*
do
f=`echo $f|sed 's/[^\/]*\///'` #get rid of the nearmap-dem part
d=`dirname $f`
mkdir -p &quot;grayshaded/$d&quot;
#convert &quot;nearmap-dem/$f&quot; -colorspace gray &quot;grayshaded/$f&quot; #just convert to gray
#...alternatively, extract the Lightness channel...
convert &quot;nearmap-dem/$f&quot; -separate -channel Lightness -colorspace gray &quot;grayshaded/$f&quot;
lastdir=`dirname &quot;grayshaded/$f&quot;`
lastfile=`basename &quot;grayshaded/$f&quot; .png`
rm -f &quot;$lastdir/$lastfile-0.png&quot; &quot;$lastdir/$lastfile-2.png&quot;
mv &quot;$lastdir/$lastfile-1.png&quot; &quot;$lastdir/$lastfile.png&quot;
done
[/sourcecode]

to convert a directory of Nearmap Terrain tiles into something suitable to be passed in as the hillshade layer to the combine script at<a href="http://wiki.openstreetmap.org/wiki/TopOSM/Details#Combining_images_into_a_final_composite"> http://wiki.openstreetmap.org/wiki/TopOSM/Details#Combining_images_into_a_final_composite</a>, and then I used combine script to merge the layers together for each tile.

Update: The Mapnik stylesheets I used for labels and nolabels are at http://gist.github.com/653184