Title: Loading the ASGS into PostgreSQL in preparation for the ABS 2011 census data release
Date: 2012-04-15 17:27:40
Tags: abs,geo

Over the extended Easter period I found myself with some extra free time, the result is <a href="https://github.com/andrewharvey/asgs2pgsql">https://github.com/andrewharvey/asgs2pgsql</a> - A bunch of scripts for loading the ASGS into PostgreSQL/PostGIS, and a database dump of the final product.

The ASGS is the geospatial fabric for the ABS 2011 Census data. My idea was to put in place a stable PostgreSQL schema for the ASGS and put together a well defined process for loading data into that schema.

As a small example of using the data I wrote some carto/qgis stylesheets for the various ASGS structures. Source code is at <a href="https://github.com/andrewharvey/asgs-stylesheets">https://github.com/andrewharvey/asgs-stylesheets</a> with a live example at <a href="https://tianjara.net/leaflet.html#map=asgs-2011-mb">https://tianjara.net/leaflet.html#map=asgs-2011-mb</a> which shows the ASGS Mesh Blocks coloured by the landuse assigned to that mesh block.

With this building block now in place, when the actual census data starts to be released in June 2012 I will hopefully be able to load it into a relational data model with references to ASGS geometries all in PostgreSQL (and PostGIS).

I'm not sure if I'll need to choose between wasting time scraping data from the ABS website or I should go <a href="http://www.abs.gov.au/ausstats/abs@.nsf/lookup/2011.0.55.001Main%20Features182011">straight to the DVD</a>

If the $100 is really just for the cost of the DVD+admin surely the ABS can put the entire DVD contents on its webserver, all under the Creative Commons Attribution license. If I do purchase the DVD I sure as hell would want to ensure it notes that its contents are CC-BY licensed.

I also am interested if the census data will also be available as <a href="https://andrewharvey4.wordpress.com/2011/02/20/multi-dimensional-data-cubes-for-census-data/">datacubes</a>.