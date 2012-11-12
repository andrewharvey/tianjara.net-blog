Title: myschool NPLAN Data (and NSW's Attempt at Censorship)
Date: 2010-02-18 09:45:41
Tags: education,law

Following up from <a href="http://andrewharvey4.wordpress.com/2010/02/07/a-look-into-the-myschool-edu-au-data/">my previous post</a>, I have made improvements to <a href="http://github.com/andrewharvey/myschool">the code</a>, and I now have all the NPLAN data too. There are also some <a href="http://github.com/andrewharvey/myschool/tree/master/data_exports/">data files</a> so you don't need to run the scraper and parser which hopefully this makes the data more usable and to a wider range of people. Now that I have the NPLAN data you can compare schools in terms of their (I assume the numbers are averages) test results. I was going to put <a href="http://github.com/andrewharvey/myschool">in the repository</a> some tables mashing together some of the data in the database, but I've had to research about <a href="http://www.austlii.edu.au/au/legis/nsw/consol_act/ea1990104/s18a.html">a silly NSW law</a> first. I'm not exactly sure what I can publish and what the implication of that would be (so best make your own league tables and possibly publish them if you want). The NSW law says,
<p style="padding-left:30px;">A <strong>person must not</strong>, in a newspaper or<strong> other document that is publicly available in this State</strong>: (a) <strong>publish any ranking</strong> or other <strong>comparison of particular schools according to school results</strong>, or, (b)<strong> identify a school as being in a percentile of less than 90 per cent in relation to school results</strong>.</p>
The folks at the Sydney Morning Herald <a href="http://www.smh.com.au/opinion/editorial/why-we-are-publishing-a-league-table-20100128-n1ly.html">seem to think that</a> "Published online the same tables infringe no law; printed on these pages they are illegal." This is not what I interpret the law as. Publishing online means that the document is available for access from NSW. However I am confident I can get around this by not hosting anything myself and not hosting in Australia. For this I  rely on the great services provided by wordpress.com (Automattic, Inc.) and/or github.com (GitHub, Inc.). Hopefully these US companies wouldn't cave into any threats from the Australian government.

This section of the law carries a maximum of 50<a href="http://www.austlii.edu.au/au/legis/nsw/consol_act/cpa1999278/s17.html"> penalty units</a>. Which is currently a fine of $5500, that is a large enough sum for me to take extra care. This is why I'm still not sure if I should put such lists like schools ordered by certain NPLAN results in the github repository.

By the way, this censorship and damaging law raises the same questions and problems (problems for those that wish to avoid criminal or civil charges) about legal jurisdiction over the internet, the classic example is the "yahoo! nazi paraphernalia" debacle.

Footnote: This SQL query should give you an ordered list of schools based on the 2009 year 9 NPLAN results (but I guess if you can load the database dump you can probably write your own queries...).
<pre>SELECT s.name, n.score, sub.state
FROM nplan n, school s, (SELECT distinct pcode, state FROM suburb) sub
WHERE n.school = s.myschool_url 
  AND s.postcode = sub.pcode
  AND n.year = 2009 
  AND n.grade = 9 
  AND n.area = 'numeracy' 
ORDER BY n.score DESC;</pre>