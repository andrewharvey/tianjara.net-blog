Title: I'm halfway towards an online home...
Date: 2011-07-31 17:07:48
Tags: computing,web

Just recently I signed up with Linode for a virtual private server. I should have done this a long time ago but payment methods and too much choice lead me to put it off. So far I'm quite happy with the price and the quality of the product.

I think I would have preferred just buying a new dedicated machine myself, however unless you're in the CBD you can't get upload speeds much more than 1.5Mbps around here (if you are lucky), which is not really fast enough, hence I've gone with the 3rd party hosting option. Perhaps if this NBN the government keeps taking about is turned on and not too expensive I'll switch. In the mean time it seems silly that Australians need to host content that is mainly consumed by Australians overseas just because of the price difference.

For example if A wants to host content to Australians, but it is cheaper to do so from overseas, then A will mostly likely host their content overseas. This just means Australia has an even greater disturbance in the overseas traffic up/down ratio (i.e. we pull more than we push), which in turns means our local ISPs have to pay more compared to the overseas ISPs to lay the cables, this in turn leads to higher internet costs for Australians compared to overseas ISPs.

At any time our local ISPs could provide incentives for keeping traffic local inside the country by making overseas traffic more expensive than local traffic (for both people hosting and consuming), which would help Australians host locally and in turn even up the balance. It also means that the overseas pipes won't need to be as thick (because for sites which mostly get Australian visitors, hosting locally means the total amount of cross country traffic for that site is less, hence more efficient).

There is not much I can do about this, so I'm giving in and hosting overseas with the hope that one day things will return to sanity, but in the meantime I haven't been left off-line.

Anyway, back to Linode, I having a lot of fun at the moment setting it up and getting things working.

I'm running Debian 6.0, with unattended-upgrades, lighttpd, ufw, etckeeper (and soon either exim or postfix and possibly I'll migrate this wordpress blog across). I have run through http://www.debian.org/doc/manuals/securing-debian-howto/ it's a bit dated and I'm by no means following everything, but none the less it's still a nice read.

I've set up ssh with protocol 1 disabled (securing debian howto says it has some design flaws, so why enable it if I don't need it?), publickey authentication only, fail2ban, and only accepting traffic to the ssh port from IP ranges I know I'll be connecting from (I know if I've got security via publickey auth, I don't really need this, but it can't hurt... at least my logs don't fill up with as many break in attempts.).

However since one can always log into the machine via the console at linode.com, security here comes down to the weakest link of web based username/password and ssh publickey auth (ignoring all the other threats like compromised VM separation, compromised VM host, physical security, etc.. stuff I have no control over).

I have set up lighttpd as RAM is limited and I read that this (and nginx) are better than Apache httpd in this regard. I have also set up munin and munin-node (and adapted /etc/munin/apache.conf for lighttpd). I would prefer the munin stats not be appreciable to the world, so I just expose it to localhost only and access it via an SSH tunnel.

Additionally, while trying to debug lighttpd configuration I noticed that it wasn't responding to nc. Apparently lighttpd will only respond to my requests when lines end with \r\n but just typing away in the terminal as input to nc and using the Enter key I only end lines with \n. Apparently this is per the HTTP spec and it only works with Apache because it isn't as strict about this.

Next I have to see about getting a domain name. This is a huge problem in itself, but it since,
<ul>
	<li>the IP can change at any time (and will change if I move away from Linode),</li>
	<li>you can't have sub-domains to separate parts of the site, and</li>
	<li>you can't really do email</li>
</ul>
I don't really have a choice. Unfortunately the current ICANN DNS is the only real option at the moment, so I'm just going to have to pay up, and try to avoid having some details which I don't want listed, listed in WHOIS. At the moment I'll probably go for a .id.au domain.

I'll probably move this blog across once I set up a domain name, so more news to come on this later.

Update: I've registered with gandi.net. My site is now available at <a href="http://tianjara.net/">http://tianjara.net/</a>