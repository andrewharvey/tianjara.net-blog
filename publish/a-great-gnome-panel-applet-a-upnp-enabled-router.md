Title: A Great Gnome Panel Applet + A UPnP Enabled Router
Date: 2010-07-26 21:35:14
Tags: computing,dev

I have just discovered that my ADSL router supports UPnP, and that this provides an interface to access 3 important bits of information from the router (external IP address, total bytes sent and total bytes received). I had previously been scraping the router's web interface to grab the external IP. As for the bytes sent and received, I didn't even know the router had a method of reporting these.

My first instinct was to look for a Perl library for UPnP, I found two. One in the Ubuntu repositories (and in CPAN) <a href="http://search.cpan.org/perldoc?Net::UPnP::GW::Gateway">http://search.cpan.org/perldoc?Net::UPnP::GW::Gateway</a> and another which appears to be in neither, <a href="http://perlupnp.sourceforge.net/">http://perlupnp.sourceforge.net/</a>.

I tried out the first one and after some fiddling get it working (though I haven't yet been able to eliminate the  2 seconds it spends blocked, ie. not executing on the CPU but still not complete).

Next I found a great program that allows you to place an arbitrary command's output in the Gnome Panel, <a href="http://code.google.com/p/compa/">http://code.google.com/p/compa/</a>. Which resulted in,

<a href="/blog/attachments/2010/07/router_byte_count_applet.png"><img class="aligncenter size-full wp-image-1107" title="router_byte_count_applet" src="/blog/attachments/2010/07/router_byte_count_applet.png" alt="Compa Gnome panel applet showing total bytes recieved and sent by the router." width="132" height="41" /></a>

The Perl script I use to provide the output to the Compa applet is at <a href="http://github.com/andrewharvey/perlmisc/blob/master/upnp_router_inoutbytes_to_compa.pl">http://github.com/andrewharvey/perlmisc/blob/master/upnp_router_inoutbytes_to_compa.pl</a>