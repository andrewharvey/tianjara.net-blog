Title: COMP3311 - Week 7 Notes
Date: 2009-05-05 08:53:41
Tags: comp3311,computing

Its pointless repeating what John put in the lecture slides, so this is just my additions that he mentioned but are not in the slides.
<h2>Aggregates</h2>
Initial condition is defaulted to NULL. So sometimes you will need to define,
<pre>  initcond = '';</pre>
This is different to NULL, because,
<pre>  null || 'abc' --&gt; null</pre>
(where || is append) but
<pre>  '' || 'abc' --&gt; 'abc'</pre>
<h2>PHP</h2>
<pre>$x = 2;
myFunc() {
  global $x;
}</pre>
If we omit the global $x, then any references to $x in myFunc will refer to a new local x, not the first x that is set to 2. To avoid this and force any references to x inside myFunc to refer to the first x that is equal to 2, we need this global $x line.
<h2>strpos</h2>
<pre>1. $i = strpos('abc', 'a') --&gt; 0
2. $i = strpos('abc', 'b') --&gt; 1
3. $i = strpos('abc', 'z') --&gt; false</pre>
if($i) will only be true in case 2 (false in case 1 and 3). So if we want to test if the second string was at all in the first string we must use,
<pre>if($i !== false)</pre>
This one will be true in case 1 and 2, but not 3.