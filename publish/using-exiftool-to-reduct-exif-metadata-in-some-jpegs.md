Title: Using exiftool to reduct EXIF metadata in some JPEGs
Date: 2011-01-09 15:19:00
Tags: geo,sh

After spending way to much time trying to edit some EXIF metadata in some JPEG photographs, I'm posting my method here for future reference.

The first thing I needed to do was geoencode/geotag the images with a GPS location tag. I did this with the perl module Image::ExifTool::Location (<a href="https://github.com/andrewharvey/perlmisc/blob/master/geoencode-jpeg.pl">script here</a>).

The second thing I needed to do was examine what metadata was in the JPEG and reduct some of it. I used `exifprobe` and `exiftool -v` to examine the metadata. I ended up using this command on each image:
<pre>exiftool -overwrite_original -scanForXMP \
 -MakerNotes:SerialNumber='0' -MakerNotes:OwnerName='' -MakerNotes:InternalSerialNumber="0" -XMP:SerialNumber= \
 -XMP:OwnerName="Andrew Harvey &lt;andrew.harvey4@gmail.com&gt;" \
 -XMP-cc:AttributionName='Andrew Harvey' -XMP-cc:License='http://creativecommons.org/licenses/by/3.0/' -XMP-cc:attributionURL="http://www.flickr.com/photos/andrewharvey4/"\
"file_name.jpg"</pre>
<a href="http://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/Canon.html">http://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/Canon.html</a> was a good reference to find out about the MakerNotes tags. Also it took me a little experimenting and research before finding out that "MakerNotes tags may be edited, but not created or deleted individually." This is why the SerialNumber tag is set to zero, and not removed. I tried to remove the camera serial numbers, but who knows, Canon probably secretly embed the serial number into the image pixel values as well...

<a href="http://wiki.creativecommons.org/XMP">http://wiki.creativecommons.org/XMP</a> also provided me with some hints on how best to embed these JPEGs with at least some form of machine readable tagging as CC BY licensed.