Title: Malicious attack or just being paranoid?
Date: 2012-03-10 17:25:27
Tags: 

So as of now when I download the document at http://www.commbank.com.au/personal/international/travel-money-card/default.aspx using,

wget --save-headers -U 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET CLR 1.1.4322)' --server-response 'http://www.commbank.com.au/personal/international/travel-money-card/default.aspx'

from both IP address (140.168.75.39, 140.168.129.72) that get resolved, within that page I get a link to https://www.commbank.prepaidcardsupport.com/cbacustomer/html/LoginFrameTravel.html

Looks weird. The commbank linking to www.commbank.prepaidcardsupport.com? At first I thought I was been man in the middle'ed, so I tried retrieving this document from various vantage points in the Internet with the same results. So either it wasn't a MIM or the MIM was happening at a point common between both vantage points (ie. the banks network, or the telstra network above the banks network).

So maybe this is legit? I checked the whois for prepaidcardsupport.com but it is registered by proxy (not a good sign) and its HTTPS certificate isn't trusted by the default iceweasel install (again not a good sign).

Anyway this reinforced to me a big problem surrounding sites that think it is okay to not offer HTTPS for most of their site but switch to HTTPS just for parts of the site where you log in. This opens you up to man in the middle attacks against your plain HTTP pages allowing the attacker to replace the switch to HTTPS for areas that you log in with just plain HTTP (hence allowing further man in the middle attacks). -- Of course this is ignoring the issue that current implementation of PKI using CA's isn't terrible secure at all.