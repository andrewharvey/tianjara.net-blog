Title: A rant about the state of copyright and my misunderstandings of it
Date: 2009-09-12 14:03:01
Tags: copyright,law

I've run into a little legal problem. By a problem I mean that if I were convicted for this I could face "a fine of not more than 550 penalty units or imprisonment for not more than 5 years, or both." Apparently one penalty unit is $110. So that means in the worst case a $60, 500 fine and 5 years imprisonment.

What's all this over? Well I thought I better check up on the Copyright Act 1968 (which I will refer to as The Act) and it is an indictable (meaning you can be sent to jail if found guilty) offence to do the following. (SECT 132AL, The Act)
<blockquote>(1)  A person commits an offence if:

(a)  the person makes a device, intending it to be used for making an infringing copy of a work or other subject‑matter; and

(b)  copyright subsists in the work or other subject‑matter at the time of the making of the device.

(2)  A person commits an offence if:

(a)  the person possesses a device, intending it to be used for making an infringing copy of a work or other subject‑matter; and

(b)  copyright subsists in the work or other subject‑matter at the time of the possession.

....

(11)  In a prosecution for an offence against this section, it is not necessary to prove which particular work or other subject‑matter is intended to be, or will be, copied using the device.</blockquote>
And herein lies the problem. As a regular citizen this is too ambiguous, because people have different interpretations of what a "device" is. Case law can help here as it can give concrete examples of what is illegal and what is not, but someone always is going to be the first one to have to step up to the court to make the case law. Statute law should be clear enough on its own to be understood by the general public.

The term "infringing copy" could also be interpreted different ways, but the law actually explains what it means here (unlike for device which is to be interpreted as<strong><em> </em></strong>"includes a plate" where a "plate includes a stereotype, stone, block, mould, matrix, transfer, negative or other similar appliance." (The Act)).

Back to the actual problem that I'm referring to, I read the "Time-shifting" fact sheet from the Attorney-General's Department, <a href="http://www.ag.gov.au/www/agd/rwpattach.nsf/VAP/(CFD7369FCAE9B8F32F341DBE097801FF)~Copyright+Fact+Sheets+-+Time-shifting.pdf/$file/Copyright+Fact+Sheets+-+Time-shifting.pdf">http://www.ag.gov.au/www/agd/rwpattach.nsf/VAP/(CFD7369FCAE9B8F32F341DBE097801FF)~Copyright+Fact+Sheets+-+Time-shifting.pdf/$file/Copyright+Fact+Sheets+-+Time-shifting.pdf</a> (wow what an ugly URL!). It says that it is now legal to record a television or radio broadcast to watch or listen to at a more convenient time. However broadcast does not cover streaming of content online. As such ABC's iView and friends fall outside this scope. When you stream content from ABC's iView using an Adobe Flash player I'm not sure if any content is actually written to disk or not but it is definitely saved on various memories, however this "copy" would fall under SECT 111B of The Act and is legal.

What would probably not fall under SECT 111B is there are <a href="http://forums.whirlpool.net.au/forum-replies.cfm?t=1212283">tools</a>, or what a court may call "devices", that are "intending it to be used for making an infringing copy of a work" (SECT 132AL, The Act). You can use these tools to store a permanent copy of material that ABC's transmits to you. My problem is I wrote a script which "helps" users make infringing copies of material published by SBS. Its not the part that actually copies the material (flvstreamer does that) but I can just imagine some lawyer convincing a judge and jury that they should send me to prison. Its way too confusing because you don't even need these scripts you just need your OS. tcpdump can be used to capture the traffic just like these tools do. Then there is the word "intending" which is open to interpretation to much.

The computer is a copying machine, its not going to stop and check if the copy will be infringing or not. Sorry this has turned into a bit of a rant, but The Act really annoys me. Maybe its because I interpret it different to the people who wrote it, or the people who will use it to send me to prison or give me huge fines.

Then there is the whole other thing of who is held liable. I wrote about the script on wordpress.com, and linked to its location on pastebin.com. Will they come after Automattic (the owner of wordpress.com) or me or the owners of pastebin.cem? But I'm (or maybe its not really me at all but Automattic) publishing all this in the US (I presume wordpress.com is hosted on servers in the US), so that makes all this Australian Copyright Act garbage useless.

Oh and the other thing, under the current act, if you visit a web site most browsers will cache that to disk (I wouldn't call that a temporary copy "as part of a technical process of use", but I would call the copying of the data for the HTML document to registers, the processor cache and RAM a temporary copy, but this is not defined in The Act.). Are then web browsers a "device, intending it to be used for making an infringing copy of a work" because they ask for content from a web server, get given it and then save it to disk? (but it's no defence to say heaps of other people are breaking the law and you have singled me out so you can't charge me) Does it matter that the web server can send a "Cache-Control: no-cache" response header, if they don't does that mean that we are allowed to cache all this to disk? But that HTTP header and even the whole HTTP spec is just a W3C recommendation.

This is just a little bit on my reasons why I have no respect at all for the Copyright Act. I don't want to have to worry about any of this legal stuff, but I must because if I don't the government can send me to prison or impose huge fines and I don't want to take a risk there.

Oh and in my defence, the script that I linked to in <a href="http://andrewharvey4.wordpress.com/2009/07/10/sbs-playlist-to-rss-feed-perl-script-v2/">this post</a>, I would not classify as "device, intending it to be used for making an infringing copy of a work" if anything it would be flvstreamer, but then you cannot single those out. If publishing that script I linked to, or flvstreamer is illegal in this country then publishing an HTTP web browser, tcpdump, or an OS that interfaces with a network must also be devices that are intending it to be used for making an infringing copy of a work.

Also something I've been wondering for ages, how can anyone ever be convicted of downloading copyright infringement mealy by downloading it over the internet? One cannot know if such material is protected by copyright (they don't even know what the data is until they have downloaded it), and one cannot know if the entity they are receiving the data from is the copyright holder who permits this use. A lawyer may come along and say that this is all true, but I wouldn't want to bet my life on the fact that the court will also agree (given the track record of the courts, see <a href="http://www.austlii.edu.au/au/cases/cth/FCAFC/2006/187.html">Cooper v Universal Music Australia Pty Ltd [2006] FCAFC 187</a>).

Anyway back to studying for my COMP courses.