Title: The light in near: Fun with vector tiles
Tags: geo
Date: 2012-11-20

[Small side projects come an go](https://gist.github.com/andrewharvey/) yet I always seem to come back to the task of trying to showcase ABS
census data geographically.

In the backend I have built a [soild foundation for providing the base geography](https://github.com/andrewharvey/asgs2pgsql).
That part is quite stable now. The backend for [providing the census data](https://github.com/andrewharvey/abs2pgsql) is in pretty good shape now,
just some polishing of the edges to do.

The real milestone I've hit now is getting those [census regions on a slippy map as vector tiles](https://github.com/andrewharvey/abs2pgsql)
(tick on those ASGS 2011 overlays, only some regions/zoom levels/layer combos available at the moment though).

I've done this using the excellent [TileLayer.GeoJSON provider for Leaflet](https://github.com/glenrobertson/leaflet-tilelayer-geojson)
in combination with the TileStache PostgreSQL vector provider with the
[vector-simplify patch](https://github.com/elpaso/TileStache/tree/vector-simplify) for TileStache to perform zoom dependent geometry simplification.

I think this will result in a really neat design as you can apply endless thematics to these geometries client side, you just need to pull in the
census data as a simple JSON and join it to the geometries. Plus you get all the benefits of vector tiles such as hover effects and clickability.
