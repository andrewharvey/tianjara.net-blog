Title: A Maths Problem: Transformed Horizontal Lines
Date: 2010-01-07 18:09:40
Tags: mathematics

This is the kind of post that I originally envisioned that I would post about when I started this blog. But after trying to complete this post I realised why I don't do this very much, because I can't always solve the problems I come up with. Anyway...

You can generate a funky kind of grid by taking a Cartesian coordinate system, joining lines from $latex (0, t)$ to $latex (t, 0)$ for some values <em>t</em>. Here are some examples,

<a href="/blog/attachments/2010/01/montage_2.png"><img class="aligncenter size-full wp-image-981" title="Transformed Grid Montage" src="/blog/attachments/2010/01/montage_2.png" alt="Transformed Grid Montage" width="412" height="1236" /></a>

If you draw lots of lines you get something like,

[caption id="attachment_982" align="aligncenter" width="500" caption="Generated using code at http://github.com/andrewharvey/cairomisc/blob/bd41c8feb1beba38849878aed566c6f45a70856b/curved_grid_simple.pl"]<a href="/blog/attachments/2010/01/inc050.png"><img class="size-full wp-image-982" title="Transformed Grid 50 lines" src="/blog/attachments/2010/01/inc050.png" alt="Transformed Grid (50 lines)" width="500" height="500" /></a>[/caption]
<p style="text-align:left;">This is also what you get if you take a bunch of horizontal lines from $latex x = 0$ to $latex x = 1$ (where the horizontal lines are equally spaced above each other), and take all the endpoints from the line $latex x = 1$ and rotate them $latex 90^\circ$ about the point $latex 1, 0$.</p>
<p style="text-align:left;">The thing I was interested in was as you draw more and more of these lines it looks like a curve emerges on the boundary. I imagined that if you drew infinitely many lines like these you would get a nice smooth curve. I want to know what is the formula for that curve. But as I started to try to work it out, it didn't seem so simple.</p>
<p style="text-align:left;">I tried a lot of approaches, none of which seemed to work. So after a few initial set backs I tried to take a parametric approach taking <em>t</em> to be a value between 0 and 1 where this <em>t</em> indicates the line with start point $latex (0, t)$. The point on the curve for this <em>t</em> is some point on that line. I tried to get that point via the intersection with the next line, ie. the point on this line that is also on the curve is between the intersection of that line and the line for $latex t + \phi$ and $latex t - \phi$ for some really small $latex \phi$. But when I tried this approach as you make $latex \phi$ zero, then we get infinitely many points of intersection.</p>
<p style="text-align:left;">That didn't work so easy but then I realised that if the point is on this line then (although I have not proved this but it seems obvious from the picture) that I have the gradient.</p>
<p style="text-align:left;">So all those lines as shown above have equation $latex y = \frac{-t}{\left ( 1 - t \right )}x + t$. (Except for t = 1 where we'll just use a y value of 1). We can use this same <em>t</em> to define a point on the curve (which I call $latex f$ from here on) parametrically. So I assumed that the gradient of $latex f$ is given as $latex f'(t) = \frac{-t}{1-t}$. But now I'm not so sure that I have enough rigour here.</p>
<p style="text-align:left;">But then I got stuck again. I can try to go some integrals but this won't work because you don't know the relation between increasing <em>t</em> and the length along the curved you have moved. As you could have two different parametric functions which both have the same derivative function (ignoring the +c constant that disappears when you differentiate), just knowing the function defining the derivative of $latex f$ parametrically won't tell me the equation of the original curve.</p>
<p style="text-align:left;">Moving on I now tried to calculate the area under the curve. I could partition it like how a Riemann integral is done.</p>
<p style="text-align:center;"><a href="/blog/attachments/2010/01/discret_areas_axis_withdots.png"><img class="aligncenter size-full wp-image-988" title="discret_areas_axis_withdots" src="/blog/attachments/2010/01/discret_areas_axis_withdots.png" alt="discret_areas_axis_withdots" width="585" height="560" /></a></p>
<p style="text-align:left;">We can easily calculate the area of any of these trapezoids (bounded by red). $latex A = \frac{x_n - x_{(n-1)}}{2}(y_{x_n} + y_{x_{(n-1)}})$. We can get the <em>x</em> values by finding the point of intersection of the 2 lines that intersect at that <em>x</em> (and have the largest <em>y</em> value if there are several points of intersection for that <em>x</em>). Each line for some value <em>t</em> will have a point of intersection of the line before and after it (based on the <em>t</em> value). When I say the area of <em>t</em> = some number, I mean the area of the trapezoid starting with the intersection of the previous <em>t</em> line and ending with the intersection of the next <em>t</em> line. So the area of t = 1 is zero (because <em>x</em><sub>0</sub> and <em>x</em><sub>1</sub> are the same). The diagram above has $latex \phi = 0.125$. So,</p>
<p style="text-align:left;">Point A is the intersection of $latex y = \frac{-t}{\left ( 1-t \right )}x + t$ and $latex y = \frac{- \left ( t + \phi \right )}{1-\left ( t + \phi\right )}x + t + \phi$, which is,</p>
<p style="text-align:left;">$latex x_A = (1-t)(1-t-\phi)$
$latex y_A = t(t+\phi)$</p>
<p style="text-align:left;">Point B is the intersection of $latex y = \frac{-t}{\left ( 1-t \right )}x + t$ and $latex y = \frac{- \left ( t - \phi \right )}{1-\left ( t - \phi\right )}x + t - \phi$, which is,</p>
<p style="text-align:left;">$latex x_B = (1-t)(1-t+\phi)$
$latex y_B = t(t-\phi)$</p>
<p style="text-align:left;">So the area of this trapezoid is $latex \frac{x_B - x_A}{2}(y_A + y_B)$, which is $latex 2t^2\phi(1-t)$</p>
<p style="text-align:left;">But then I got stuck here. I can compute a value for the approximate area.</p>

<pre style="text-align:left;padding-left:30px;">phi = 0.0001;
area = 0;
for (t = 1; t &gt; 0; t -= phi) {
   area += 2*t*t*phi*(1-t);
}
print area;
</pre>
Which gives a value very close to 1/6, and if I integrate that area equation for <em>t</em> = 0..1 you get $latex \frac{1}{6}\phi$. But I don't want the area, I want the formula that defines the area from <em>x</em> = 0 to some value <em>x</em> so that I can then differentiate this to get the equation of the original curve. So this is where I give up, and leave this for another day. If you work it out please post in the comments!

Oh and there is <a href="http://github.com/andrewharvey/cairomisc/tree/master/curved_grid_1/">some rough code I wrote to make those images here</a>. And a nice <a href="http://github.com/andrewharvey/cairomisc/raw/master/curved_grid_1/2to300lines.mp4">animation too</a>.