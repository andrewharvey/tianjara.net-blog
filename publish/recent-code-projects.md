Title: Recent code projects
Date: 2012-05-14 22:05:02
Tags: 

Since taking a break from OSM/FOSM[1] I've found myself with more time to work on other projects. You can see this by my jump in recent activity on github[2].

I'm pleased with my code to load the ABS ASGS into PostgreSQL/PostGIS[3] and that will prove a critical component of any further work I do with ABS data in the future. At the moment I'm writing scripts to load ABS 2011 Census data into PostgreSQL[4] (but I haven't pushed it yet). I'm using the sample datapacks provided by the ABS which means I should have it done by June 21 when the actual data is release. So with very minimal work and time I should have the real data loaded not long after it's release.

I think http://www.hackdays.com/knowwhereyoulive/postcodes/view/2000 is an excellent site, yet the creators say "The biggest hurdle we faced was the format of the data available."[5]. I hope that my asgs2pgsql and abs2pgsql (census loader) tools will help future developers built great front-ends, and not have to worry about getting access to the data in a nice format.

I've been playing around with the GeoJSON tile capabilities of TileStache (with Polymaps as the client) and look forward to using this in building a great front-end like the knowwhereyoulive site. I've put that on hold while I focus on the data.

I've also ordered the first DataPack DVD[6] from the ABS. I've been assured by the ABS that the DVD contents are licensed CC-BY and the license will be present on the DVD. Assuming all this holds true I should be able to release the DVDs as torrents.

I plan to attend the Sydney http://www.govhack.org/, it is just a pity that the event happens before the 2011 Census data is released. I'm not convinced that these hack days are for me...(I prefer to take as much time as needed to get quality, rather than rushing things out the door; also borrowing a laptop and setting up a live bootable debian USB with my environment and wifi drivers takes more time than the actual event! ) but at least they get people talking about open data.

I've also produced some nice rainfall intensity interactive graphs from the BOM radar images[7]. I wish I could show a demo of this, but the free and open license to the radar image isn't present.

I also have some other data loaders [8], [9] which I plan to create nice web front ends for, but I'll only get to that once I get my 2011 Census loader in better shape.

Finally I took a sidestep to clean up my NSW Parish Map scraper[10]. The code is much cleaner now compared to the mess it was before. I'm still short of a parish map georeferenced base map mosaic, but the unclear licensing of the maps puts this down the bottom of my priority list.

[1] https://andrewharvey4.wordpress.com/2012/04/04/the-sand-storm/
[2] https://github.com/andrewharvey/
[3] https://github.com/andrewharvey/asgs2pgsql
[4] https://github.com/andrewharvey/abs2pgsql
[5] http://www.hackdays.com/knowwhereyoulive/about/
[6] http://www.abs.gov.au/websitedbs/censushome.nsf/home/datapacksdetails?opendocument&amp;navpos=250
[7] https://github.com/andrewharvey/bom-rainfall-radar-intensity-stats
[8] https://github.com/andrewharvey/aec2pgsql
[9] https://github.com/andrewharvey/ausgrid-data2pgsql
[10] https://github.com/andrewharvey/nsw-parishmaps-scraper