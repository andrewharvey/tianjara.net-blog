Title: The URL shown in Firefox's status bar isn't always where you end up.
Date: 2010-06-27 16:33:26
Tags: computing,web

Unless you are aware of the more technical details of web browsing its reasonable for the average web user to assume that if you hover your mouse over a link and Firefox tells you in the status bar that the link is to http://foobar.com/, then clicking on the link will actually take you to http://foorbar.com/. But sadly this is not the case for out of the box Firefox.

Take a look at a Google search results pages. Hovering your mouse over the links gives one URL in the status bar, yet clicking the link actually takes you somewhere else.

Here is a sample of the HTML for the link,
<pre>&lt;<strong><span style="color:#800080;">a</span> href</strong>="<span style="color:#0000ff;">http://www.example.com/page1.html</span>" <strong>onmousedown</strong>="<span style="color:#0000ff;">return rwt(this,'','','res','1','$ID1','&amp;amp;sig2=$ID2','$ID3')</span>"&gt;Page Title&lt;/<span style="color:#800080;"><strong>a</strong></span>&gt;</pre>
Hovering over the link, you see in the status bar <span style="color:#0000ff;">http://www.example.com/page1.html</span>, but as soon as you mousedown javascript goes ahead and changes the href to something else (keep in mind that Firefox only goes to the new link on mouserelease), so that when you release the mouse your browser takes you to the replacement URL.

The problem I see with this is what if some unsuspecting user checks the link in the status bar, clicks the link thinking they are going one place then get taken somewhere else. This becomes even more of a problem if that site is susceptible to certain kinds of XSS attacks. So you can think your going to https://paypal.com/, and the URL bar after clicking the link goes to https://paypal.com/ but yet you've actually got some malicious js or html injected in the paypal.com/ page that you have loaded in your browser window.

I originally thought this was clickjacking, but the Wikipedia article describes that as when a transparent layer on top of the page provides the concealed URL.