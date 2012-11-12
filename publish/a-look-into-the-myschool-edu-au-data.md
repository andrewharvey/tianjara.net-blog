Title: A Look into the myschool.edu.au Data
Date: 2010-02-07 13:11:17
Tags: computing,education,politics

After overcoming a few problems I managed to write a scraper for the myschool.edu.au data. Unfortunately they choose to put data in HTML, so the scraping process may have led my data to have some unknown errors. I publish (see bottom) the scraped data as I believe that per the <a href="http://www.austlii.edu.au/cgi-bin/sinodisp/au/cases/cth/HCA/2009/14.html">IceTV v Nine Network [2009] HCA 14</a> case, any data that my scraper produces as output from the HTML input is not subject to the copyright of the original HTML content (this also means that I cannot publish the HTML pages) and the <a href="http://www.austlii.edu.au/au/cases/cth/FCA/2010/44.html">Telstra Corporation Limited v Phone Directories Company Pty Ltd [2010] FCA 44</a> case, that the raw data that is scraped is not subject to copyright.

I wish I could bzip2 up all those HTML pages and give them to you just to save your download, because the myschool.edu.au site doesn't compress their pages when I tell them I accept gzip over HTTP, so it took up almost 2GB of quota to download all the HTML pages, oh well.

Some preliminary statistics from the data.
<ul>
	<li>There are a total of 9316 (or 9279 after I ran a newer scraper at a later data) schools. Of these,
<ul>
	<li>1538 are Secondary (of which 30% are non-government and 70% are government)</li>
	<li>1407 are Combined (of which 68% are non-government and 32% are government)</li>
	<li>6054 are Primary (of which 23% are non-government and 77% are government)</li>
	<li>317 are Special (of which 15% are non-government and 85% are government)</li>
</ul>
</li>
	<li>So,
<ul>
	<li>6451 are Government (69%),</li>
	<li>2865 are Non-government (31%)</li>
</ul>
</li>
	<li>These 9316 schools contain a total of 3 366 351 students of which,
<ul>
	<li>1 745 224 are male (51%)</li>
	<li>1 651 127 are female (49%)</li>
</ul>
</li>
	<li>The most schools in 1 postcode is 40, which are all in the postcode 2480.</li>
	<li>The average student attendance rate is 92.007%
<ul>
	<li>91.870% for Government, 92.335% for Non-government</li>
	<li>89.205% for Secondary, 92.982% for Primary, 90.675% for Combined, 89.170% for Special.</li>
</ul>
</li>
	<li>There are a total of 265 960 teaching staff (full time equivalent of 241 408) and 124 117 non-teaching staff (full time equivalent of 86 511.9).</li>
</ul>
I could report a lot of stats like these above, all you need is a basic knowledge of SQL, but as much as I enjoy working out these stats I find graphs and graphics much more intuitive, so that is up next. Because of the vast dimensions to the data you can make all kinds of graphs so what would be best is a system to draw graphics dynamically which allows the user to decide what is graphed, but this takes more work so that is on the todo list.

I've also looked into doing some heatmaps using the geographical location of the schools, I could have used Google Maps, or I could use OpenStreetMap and libchamplain. Both have pros and cons... But for now I used Google Maps because their API is simple and I've always wanted to experiment with it, the downside is I'm not sure about the copyright of their maps and subsequently any derivative works. This image is just a test showing a dot for each school in the system, but its very easy to change the colour, size and opacity of the dots based on features of the school.

<a href="/blog/attachments/2010/02/sydney_schools.png"><img class="aligncenter size-full wp-image-1009" title="sydney_schools" src="/blog/attachments/2010/02/sydney_schools.png" alt="Schools in Sydney Map" width="450" height="339" /></a>

Another test (some markers will be missing or in the wrong place, like the ones in NZ!),

[caption id="attachment_1023" align="aligncenter" width="450" caption="Google Earth map showing markers for Australian schools (though not completely accurate). (Copyright notices in image)"]<a href="/blog/attachments/2010/02/aus_schools_test.jpg"><img class="size-full wp-image-1023" title="aus_schools_test" src="/blog/attachments/2010/02/aus_schools_test.jpg" alt="Google Earth map showing markers for Australian schools (though not completely accurate)." width="450" height="318" /></a>[/caption]

Source code? <a href="http://github.com/andrewharvey/myschool">http://github.com/andrewharvey/myschool</a>

Don't want to scrape and parse but want the raw data in a usable form? <a href="http://github.com/andrewharvey/myschool/tree/master/data_exports/">http://github.com/andrewharvey/myschool/tree/master/data_exports/</a>

Extra thought: Currently the code uses Google's API for geting the geolocation of the school, I could use OpenStreetMap for this also, however it would take more investiagtion to determine what tools exist. At the moment all I know is I have an .osm file of Australia, but schools aren't just one dot, they are a polygon so unless I find some other tools which probably exist, I would need to (probably) just use one of the points in the polygon.

Or I could used the Geographic Names Register for NSW, but that is just for NSW... http://www.gnb.nsw.gov.au/__gnb/gnr.zip