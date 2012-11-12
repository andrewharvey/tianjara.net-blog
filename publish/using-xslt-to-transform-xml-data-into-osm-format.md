Title: Using XSLT to Transform XML data into OSM format
Date: 2011-02-14 20:46:03
Tags: dev,osm

For a while I used to think that all there was to XML was &lt;blah attribute="value"&gt;inner&lt;/blah&gt;, but of course there is much more. I'm now digging into the real stuff like XPath, XSLT and XML Schemas.

I've come across a data set of bus stops (as well as live info on where buses are, and their status). The bus stop data set (<a href="http://nswbusdata.info/ptipslivedata/getptipslivedata?filename=stopdescriptions.zip">http://nswbusdata.info/ptipslivedata/getptipslivedata?filename=stopdescriptions.zip</a>, no longer active so I'm hosting my original copies at <a href="http://tianjara.net/data/nsw-buses/">http://tianjara.net/data/nsw-buses/</a> for preservation) is in an XML format,
<pre>&lt;?xml version="1.0" encoding="UTF-8" standalone="yes"?&gt;
&lt;StopDescriptionList license="http://creativecommons.org/licenses/by-nc-nd/3.0/au/" copyright="NSW Roads and Traffic Authority"&gt;
    &lt;stop longitude="151.17832" latitude="-33.81852" tsndescription="Osborne Rd nr Ronald Av" TSN="206699"/&gt;
    &lt;stop longitude="151.17359" latitude="-33.8082" tsndescription="Ralston St nr Murray St" TSN="2066138"/&gt;
    &lt;stop longitude="151.17764" latitude="-33.82054" tsndescription="Second Av nr Osborne Rd" TSN="206698"/&gt;
    &lt;stop longitude="151.17629" latitude="-33.81926" tsndescription="Fourth Av nr Second Av" TSN="206697"/&gt;
  ...</pre>
Although because of the license, I cannot use this data in OpenStreetMap, I was still interested in converting it into an a .osm file. The perfect job for XSLT!

It turned out to be quite a simple task with a neat solution. My XSLT stylesheet used to do the translation:
<pre>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"&gt;
    &lt;xsl:output method="xml" indent="yes"/&gt; 

    &lt;xsl:template match="/StopDescriptionList"&gt;
        &lt;osm version='0.6' generator='XSLT'&gt;
            &lt;xsl:apply-templates select="stop"/&gt;
        &lt;/osm&gt;
    &lt;/xsl:template&gt;

    &lt;xsl:template match="stop"&gt;
        &lt;xsl:variable name="count"&gt;
            &lt;xsl:number/&gt;
        &lt;/xsl:variable&gt;

        &lt;node id='-{$count}' lat="{@latitude}" lon="{@longitude}"&gt;
            &lt;tag k='ref:tsn' v='{@TSN}' /&gt;
            &lt;tag k='fixme' v='{@tsndescription}' /&gt;
        &lt;/node&gt;
    &lt;/xsl:template&gt;

&lt;/xsl:stylesheet&gt;</pre>
Then it was a just a simple,
<pre>xsltproc -o busses.osm busses-stylesheet.xslt stopdescription.xml</pre>
The data is CC BY-NC-ND 3.0, but they sneak in some additional terms in the fine print, which in addition to the NC-ND would further lead to incompatibilities with the OSM license, and would under my definition of free data, make this data set non-free. For interest the first three additional terms are,
<blockquote>
<ol>
	<li>You must not use the Data in any way that could create false or misleading outcomes or interpretations, or bring the RTA into ridicule or disrepute. You must not use the Data in conjunction with the promotion of alcohol or unsafe road practices.</li>
	<li>You must ensure that the Data used is current, and provide details as to the date and time of sourcing the Data from the RTA in all reproductions of the Data (including in any software applications incorporating the Data).</li>
	<li>In all reproductions of the Data (including in any software applications incorporating the Data), the following disclaimer must be provided: “The accuracy or suitability of the Data is not verified and it is provided on an “as is” basis.”</li>
</ol>
</blockquote>