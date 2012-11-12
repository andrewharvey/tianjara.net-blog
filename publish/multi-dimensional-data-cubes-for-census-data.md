Title: Multi-dimensional Data Cubes for Census Data
Date: 2011-02-20 11:34:27
Tags: abs

The main thing I got from a short talk by <a href="http://twitter.com/legostormtroopr">Samuel Spencer</a> at the 2011 apps4nsw day was a new way to publish ABS census data. Below is an example showing storing census data as multidimensional data cubes. The idea is that this allows data consumers to construct their own arbitrary queries. Using the example shown, if you want the total population, just sum up all the data cubes. If you want the ratio of males to females just sum up all the data cubes for gender=male, and then gender=female (i.e. you take a slice of the hypercube). (<a href="http://tianjara.net/misc/census-data-as-hypercubes.svg">svg source for this diagram</a>)

&nbsp;

<a href="/blog/attachments/2011/02/census-data-as-hypercubes.png"><img class="aligncenter size-full wp-image-1278" title="census-data-as-hypercubes" src="/blog/attachments/2011/02/census-data-as-hypercubes.png" alt="Example showing storing census data as multidimensional data cubes." width="248" height="1136" /></a>

This allows data providers to push out one large data set (or it could also be implemented as an API) and allow the data users to extract the information they want, rather than the data provider providing a bunch of common slices of the single large multi-dimensional data cubes.
