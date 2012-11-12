Title: IPv6, Self-signed SSL with Monkeysphere, Expectations of Privacy
Date: 2012-03-03 19:39:25
Tags: 

On my new sysadmin front I've migrated my site tianjara.net to Linode's Tokyo facility which has a better RTT than Freemont where it was previously located.

Along the way I learnt that I probably should have lowered the DNS TTL entry before the move so that when the IP address changed DNS servers didn't take as long to pick up on the change.

My site is also now IPv6 enabled. It took a little bit of work setting up lighttpd correctly (as it recently changed the way it could handle IPv6 network interfaces), and also a bit of confusion with ufw, which although I had set IPV6=yes I needed to re-add my rules to allow from Anywhere (v6) in addition to Anywhere. It is a shame most Australian ISP's are a little slow with IPv6 deployment... this made it tricky to test.

I've also deployed an SSL certificate for https://tianjara.net, self-signed and added to the web of trust via monkeysphere. (not that I could actually test it though).

On a related note, I was looking through my server logs and found <strong>what looks like</strong> the <a href="http://cenet.catholic.edu.au/">Catholic Education Network</a> proxy server (but run by http://www.editure.com.au/) telling me the school and login of every student that visits my site (through plain HTTP) using a HTTP header like,
<pre>X-SINA-ProxyUser: [school]/[username]</pre>
Sure different people have their own expectations of privacy and the pupils at schools using CENET services may all be fine with this, but some may not, and many are probably not old enough to necessarily make the best decision on their own. I hope those students know that every site they visit gets told their school/username.