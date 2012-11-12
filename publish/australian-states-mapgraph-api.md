Title: Australian States Map/Graph API
Date: 2010-02-19 17:22:25
Tags: computing,education,graphics

I've managed to do a couple things all in one here. I've made use of some Geoscience Australia Creative Commons licensed material, in a nice little program with a web API, and I've aggregated some data from the <a href="http://andrewharvey4.wordpress.com/2010/02/07/a-look-into-the-myschool-edu-au-data/">myschool scraper and parser</a>. Putting them all together gives some nice images like this.

<a href="http://github.com/andrewharvey/perlmisc/tree/master/australia_map/">The program for generating these images</a> basically takes an SVG template file with placeholder markers and then fills these values based on the CGI parameters. The API is fairly simple so one should be able to work out how to use it from the example in the README file. <a href="http://github.com/andrewharvey/myschool/tree/master/state_nplan_averages/datafiles/">Here are the files I used to make the graphs</a> (and the svg versions as Wordpress.com won't let me upload them to here).

ps. This gets cut off when viewing it from the default web interface of this blog, use print preview or even better look at the <a href="http://andrewharvey4.wordpress.com/feed/">RSS feed</a> to see the cut off parts. Also I tried to ensure the accuracy of the data, but I cannot be 100% sure that there are no bugs, in fact there are discrepancies with the averages I get from my scrape of myschool and the averages provided in the report on the <a href="http://www.naplan.edu.au/">NPLAN website</a>. The numbers I get seem to be consistent (ie. the state rankings seem mostly the same), but nonetheless not exactly the same as those reported in the report. Although I would be very surprised if all the numbers I got were exactly the same as in the report. I mainly did this to use map/graph code I wrote, so if you really care about how certain state averages compare in these tests look at the reports on the NPLAN website.

The lighter the colour the higher the number.
<h2>Primary</h2>
<table style="text-align:center;">
<thead>
<tr>
<td></td>
<td>2008</td>
<td>2009</td>
</tr>
</thead>
<tbody>
<tr>
<td>Literacy</td>
<td><a href="/blog/attachments/2010/02/2008_primary_literacy-csv-svg.png"><img class="aligncenter size-full wp-image-1039" title="2008_primary_literacy.csv.svg" src="/blog/attachments/2010/02/2008_primary_literacy-csv-svg.png" alt="" width="325" height="300" /></a></td>
<td><a href="/blog/attachments/2010/02/2009_primary_literacy-csv-svg.png"><img class="aligncenter size-full wp-image-1037" title="2009_primary_literacy.csv.svg" src="/blog/attachments/2010/02/2009_primary_literacy-csv-svg.png" alt="" width="325" height="300" /></a></td>
</tr>
<tr>
<td>Numeracy</td>
<td><a href="/blog/attachments/2010/02/2008_primary_numeracy-csv-svg.png"><img class="aligncenter size-full wp-image-1040" title="2008_primary_numeracy.csv.svg" src="/blog/attachments/2010/02/2008_primary_numeracy-csv-svg.png" alt="" width="325" height="300" /></a></td>
<td><a href="/blog/attachments/2010/02/2009_primary_numeracy-csv-svg.png"><img class="aligncenter size-full wp-image-1035" title="2009_primary_numeracy.csv.svg" src="/blog/attachments/2010/02/2009_primary_numeracy-csv-svg.png" alt="" width="325" height="300" /></a></td>
</tr>
<tr>
<td>All</td>
<td><a href="/blog/attachments/2010/02/2008_primary_all-csv-svg.png"><img class="aligncenter size-full wp-image-1041" title="2008_primary_all.csv.svg" src="/blog/attachments/2010/02/2008_primary_all-csv-svg.png" alt="" width="325" height="300" /></a></td>
<td><a href="/blog/attachments/2010/02/2009_primary_all-csv-svg.png"><img class="aligncenter size-full wp-image-1033" title="2009_primary_all.csv.svg" src="/blog/attachments/2010/02/2009_primary_all-csv-svg.png" alt="" width="325" height="300" /></a></td>
</tr>
</tbody>
</table>
<h2>Secondary</h2>
<table style="text-align:center;">
<thead>
<tr>
<td></td>
<td>2008</td>
<td>2009</td>
</tr>
</thead>
<tbody>
<tr>
<td>Literacy</td>
<td><a href="/blog/attachments/2010/02/2008_secondary_literacy-csv-svg.png"><img class="aligncenter size-full wp-image-1042" title="2008_secondary_literacy.csv.svg" src="/blog/attachments/2010/02/2008_secondary_literacy-csv-svg.png" alt="" width="325" height="300" /></a></td>
<td><a href="/blog/attachments/2010/02/2009_secondary_literacy-csv-svg.png"><img class="aligncenter size-full wp-image-1038" title="2009_secondary_literacy.csv.svg" src="/blog/attachments/2010/02/2009_secondary_literacy-csv-svg.png" alt="" width="325" height="300" /></a></td>
</tr>
<tr>
<td>Numeracy</td>
<td><a href="/blog/attachments/2010/02/2008_secondary_numeracy-csv-svg.png"><img class="aligncenter size-full wp-image-1043" title="2008_secondary_numeracy.csv.svg" src="/blog/attachments/2010/02/2008_secondary_numeracy-csv-svg.png" alt="" width="325" height="300" /></a></td>
<td><a href="/blog/attachments/2010/02/2009_secondary_numeracy-csv-svg.png"><img class="aligncenter size-full wp-image-1036" title="2009_secondary_numeracy.csv.svg" src="/blog/attachments/2010/02/2009_secondary_numeracy-csv-svg.png" alt="" width="325" height="300" /></a></td>
</tr>
<tr>
<td>All</td>
<td><a href="/blog/attachments/2010/02/2008_secondary_all-csv-svg.png"><img class="aligncenter size-full wp-image-1044" title="2008_secondary_all.csv.svg" src="/blog/attachments/2010/02/2008_secondary_all-csv-svg.png" alt="" width="325" height="300" /></a></td>
<td><a href="/blog/attachments/2010/02/2009_secondary_all-csv-svg.png"><img class="aligncenter size-full wp-image-1034" title="2009_secondary_all.csv.svg" src="/blog/attachments/2010/02/2009_secondary_all-csv-svg.png" alt="" width="325" height="300" /></a></td>
</tr>
</tbody>
</table>