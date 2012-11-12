Title: The Mathematics Behind Graphical Drawing Projections in Technical Drawing
Date: 2008-11-15 10:48:55
Tags: graphics,mathematics,projections,technical drawing

<em>In the field of technical drawing, projection methods such as isometric, orthogonal, perspective are used to project three dimensional objects onto a two dimensional plane so that three dimensional objects can be viewed on paper or a computer screen. In this article I examine the different methods of projection and their mathematical roots (in an applied sense).</em>

The approach that seems to be used by Technical Drawing syllabuses in NSW to draw simple 3D objects in 2D is almost entirely graphical. I don't think you can say this is a bad thing because you don't always want or need to know the mathematics behind the process, you just want to be able to draw without thinking about this. However to have an appreciation of what's really happening the mathematical understanding is a great thing to learn.

Many 3D CAD/CAM packages available on the market today (such as AutoCAD, Inventor, Solidworks, CATIA, Rhinoceros) can generate isometric, three point perspective or orthogonal drawings from 3D geometry, however from what I've seen they can't seem do other projections such as dimetric, trimetric, oblique, planometric, one and two point perspective. Admittedly I don't think these projections are any use or even needed, but when your at high school and you have to show that you know how do to oblique, et al. it can be a problem when the software cannot do it for you from your 3D model. (So I actually wrote a small piece of software to help with this in <a href="http://andrewharvey4.wordpress.com/2008/11/29/a-custom-drawing-projections-tool/">this article</a>). But to do so, I needed to understand the mathematics behind these graphical projections. So I will try to explain that here.

The key idea is to think of everything having coordinates in a coordinate system (I will use the Cartesian system for simplicity). We can then express all these projections as mathematical transformations or maps. Like a function, you feed in the 3D point, and then you get out the projected 2D point. Things get a bit arbitrary here because an isometric view is essentially exactly the same as a front view. So we keep to the convention that when we assign the axis of the coordinate system we try to keep the three planes of the axis parallel to the three main planes of the object.

[caption id="attachment_107" align="aligncenter" width="450" caption="The three &quot;main&quot; planes of the object are placed parallel to the three planes of the axis. This is how we will choose our axis in relation to the object."]<a href="/blog/attachments/2008/11/model-axis-1.png"><img class="size-full wp-image-107" title="model-axis-1" src="/blog/attachments/2008/11/model-axis-1.png" alt="The three &quot;main&quot; planes of the object are placed parallel to the three planes of the axis. This is how we will choose our axis in relation to the object." width="450" height="416" /></a>[/caption]

We will not do this though,

[caption id="attachment_108" align="aligncenter" width="450" caption="We will not choose it like this..."]<a href="/blog/attachments/2008/11/model-axis-2.png"><img class="size-full wp-image-108" title="model-axis-2" src="/blog/attachments/2008/11/model-axis-2.png" alt="We will not choose it like this..." width="450" height="416" /></a>[/caption]

[caption id="attachment_109" align="aligncenter" width="450" caption="...or this."]<a href="/blog/attachments/2008/11/model-axis-3.png"><img class="size-full wp-image-109" title="model-axis-3" src="/blog/attachments/2008/11/model-axis-3.png" alt="...or this." width="450" height="416" /></a>[/caption]

In fact doing something like that shown just above with the object rotated is how we get projections like isometric.

Now what we do is take the coordinates of each point and "transform" them to get the projected coordinates, and join these points with lines where they originally were. However we can only do this for some kinds of projections, indeed for all the ones I have mentioned in this post this will do but only because these projections have a special property. They are linear maps (affine maps also hold this property and are a superset of the set of linear maps) which means that straight lines in 3D project to straight lines in 2D.

For curves we can just project a lot of points on the curve (subdivide it) and then join them up after they are projected. It all depends what our purpose is and if we are applying it practically. We can generate equations of the projected curves if we know the equation of the original curve but it won't always be as simple. For example circles in 3D under isometric projection become ellipses on the projection plane.

Going back to the process of the projection, we can use matrices to represent these projections where
<p style="text-align:center;">$latex \begin{pmatrix}x'\\ y'\\ z'\end{pmatrix} = \begin{pmatrix}a&amp;b&amp;c\\ d&amp;e&amp;f\\ g&amp;h&amp;i\end{pmatrix}\begin{pmatrix}x\\ y\\ z\end{pmatrix}$</p>
is the same as,
<p style="text-align:center;">$latex x' = ax+by+cz\\ y' = dx+ey+fz\\ z' = gx+hy+iz.$</p>
We call the 3 by 3 matrix above as the matrix of the projection.

Knowing all this, we can easily define orthogonal projection as you just take two of the dimensions and cull the third. So for say an orthographic top view the projection matrix is simply,
<p style="text-align:center;">$latex  \begin{pmatrix}1&amp;0&amp;0\\ 0&amp;1&amp;0\\ 0&amp;0&amp;0\end{pmatrix}.$</p>
Now we want a projection matrix for isometric. One way would be to do the appropriate rotations on the object then do an orthographic projection, we can get the projection matrix by multiplying the matrices for the rotations and orthographic projection together. However I will not detail that here. Instead I will show you another method that I used to describe most of the projections that I learnt from high school (almost all except perspectives).

I can describe them as well as many "custom" projections in terms of what the three projected axis look like on the projection plane. I described them all in terms of a scale on each of the three axis, as well as the angle two of the axis make with the projection plane's horizontal.

[caption id="attachment_112" align="aligncenter" width="151" caption="Projection attributes described in terms of the projected axis."]<a href="/blog/attachments/2008/11/pp-description.png"><img class="size-full wp-image-112" title="pp-description" src="/blog/attachments/2008/11/pp-description.png" alt="Projection attributes described in terms of the projected axis." width="151" height="154" /></a>[/caption]
<p style="text-align:left;">Using this approach we can think of the problem back in a graphical perspective of what the final projected drawing will look like rather than looking at the mathematics of how the object gets rotated prior to taking an orthographic projection or what angle do the projection lines need to be at in relation to the projection plane to get oblique, etc. Note also that the <em>x</em>, <em>y</em>, <em>z</em> in the above diagram are the scales of the <em>x</em>, <em>y</em>, <em>z</em> axis respectively. So we can see in the table below that we can now describe these projections in terms of a graphical approach that I was first taught.</p>

<table style="height:183px;border-style:solid;border-width:1px;" border="0" width="289">
<tbody>
<tr>
<td style="width:100px;text-align:center;border-style:solid;border-width:1px;"><strong>Projection</strong></td>
<td style="width:100px;text-align:center;border-style:solid;border-width:1px;"><strong>α (alpha)</strong></td>
<td style="width:100px;text-align:center;border-style:solid;border-width:1px;"><strong>β (beta)</strong></td>
<td style="width:60px;text-align:center;border-style:solid;border-width:1px;"><em><strong>S</strong></em><sub><strong>x</strong></sub></td>
<td style="width:60px;text-align:center;border-style:solid;border-width:1px;"><em><strong>S</strong></em><sub><strong>y</strong></sub></td>
<td style="width:60px;text-align:center;border-style:solid;border-width:1px;"><em><strong>S</strong></em><sub><strong>z</strong></sub></td>
</tr>
<tr>
<td style="width:100px;text-align:center;border-style:solid;border-width:1px;">Isometric</td>
<td style="width:100px;text-align:center;border-style:solid;border-width:1px;">30°</td>
<td style="width:100px;text-align:center;border-style:solid;border-width:1px;">30°</td>
<td style="width:60px;text-align:center;border-style:solid;border-width:1px;">1</td>
<td style="width:60px;text-align:center;border-style:solid;border-width:1px;">1</td>
<td style="width:60px;text-align:center;border-style:solid;border-width:1px;">1</td>
</tr>
<tr>
<td style="width:101px;text-align:center;border-style:solid;border-width:1px;">Cabinet Oblique</td>
<td style="width:100px;text-align:center;border-style:solid;border-width:1px;">45°</td>
<td style="width:100px;text-align:center;border-style:solid;border-width:1px;">0°</td>
<td style="width:60px;text-align:center;border-style:solid;border-width:1px;">0.5</td>
<td style="width:60px;text-align:center;border-style:solid;border-width:1px;">1</td>
<td style="width:60px;text-align:center;border-style:solid;border-width:1px;">1</td>
</tr>
<tr>
<td style="width:101px;text-align:center;border-style:solid;border-width:1px;">Cavalier Oblique</td>
<td style="width:100px;text-align:center;border-style:solid;border-width:1px;">45°</td>
<td style="width:100px;text-align:center;border-style:solid;border-width:1px;">0°</td>
<td style="width:60px;text-align:center;border-style:solid;border-width:1px;">1</td>
<td style="width:60px;text-align:center;border-style:solid;border-width:1px;">1</td>
<td style="width:60px;text-align:center;border-style:solid;border-width:1px;">1</td>
</tr>
<tr>
<td style="width:101px;text-align:center;border-style:solid;border-width:1px;">Planometric</td>
<td style="width:100px;text-align:center;border-style:solid;border-width:1px;">45°</td>
<td style="width:100px;text-align:center;border-style:solid;border-width:1px;">45°</td>
<td style="width:60px;text-align:center;border-style:solid;border-width:1px;">1</td>
<td style="width:60px;text-align:center;border-style:solid;border-width:1px;">1</td>
<td style="width:60px;text-align:center;border-style:solid;border-width:1px;">1</td>
</tr>
</tbody>
</table>
<p style="text-align:left;">Now all we need is a projection matrix that takes in alpha, beta and the three axes scale's and does the correct transformation to give the projection. The matrix is,</p>
<p style="text-align:center;">$latex \begin{bmatrix}x'\\y'\\z'\\1\end{bmatrix}=\begin{bmatrix}S_x\cos\alpha&amp;-S_y\cos\beta&amp;0&amp;0\\ S_x\sin\alpha&amp;S_y\sin\beta&amp;S_z&amp;0\\ 0&amp;0&amp;0&amp;0\\ 0&amp;0&amp;0&amp;1\end{bmatrix}\begin{bmatrix}x\\y\\z\\1\end{bmatrix}$</p>
<p style="text-align:left;">Now for the derivation. First we pick a 3D Cartesian coordinate system to work with. I choose the Z-up Left Hand Coordinate System, shown below and we imagine a rectangular prism in the 3D coordinate system.</p>
<p style="text-align:left;"></p>


[caption id="attachment_114" align="aligncenter" width="450" caption="Block in 3D coordinate system."]<a href="/blog/attachments/2008/11/block-3d.png"><img class="size-full wp-image-114" title="block-3d" src="/blog/attachments/2008/11/block-3d.png" alt="Block in 3D coordinate system." width="450" height="253" /></a>[/caption]
<p style="text-align:left;">Now we imagine what it would look like in a 2D coordinate system using isometric projection.</p>
<p style="text-align:left;"></p>


[caption id="attachment_115" align="aligncenter" width="450" caption="Block in 2D coordinate system (isometric)."]<a href="/blog/attachments/2008/11/block-2d.png"><img class="size-full wp-image-115" title="block-2d" src="/blog/attachments/2008/11/block-2d.png" alt="Block in 2D coordinate system (isometric)." width="450" height="245" /></a>[/caption]
<p style="text-align:left;">As the alpha and beta angles (shown below) can change, and therefore not limited to a specific projection, we need to use alpha and beta in the derivation.</p>
<p style="text-align:center;"><a href="/blog/attachments/2008/11/pp-description.png"><img class="size-full wp-image-112 aligncenter" title="pp-description" src="/blog/attachments/2008/11/pp-description.png" alt="pp-description" width="151" height="154" /></a></p>
<p style="text-align:left;">Now using these simple trig equations below we can deduce the following.</p>
<p style="text-align:center;"><a href="/blog/attachments/2008/11/polar.png"><img class="alignnone size-full wp-image-116" title="polar" src="/blog/attachments/2008/11/polar.png" alt="polar" width="203" height="100" /></a></p>
<p style="text-align:left;">All the points on the <em>xz</em> plane have <em>y</em> = 0. Therefore the <em>x</em>’ and <em>y</em>’ values on the 2D plane will follow the trig property shown above, so:</p>
<p style="text-align:center;">$latex x'=x\cos\alpha$
$latex y' = z + y\sin\alpha$</p>
<p style="text-align:left;">However not all the points lie on the <em>xz</em> plane, <em>y</em> is not always equal to zero. By visualising a point with a fixed <em>x </em>and <em>z </em>value but growing larger in <em>y </em>value, its <em>x</em>’ will become lower, and <em>y</em>’ will become larger. The extent of the <em>x</em>’ and <em>y</em>’ growth can again be expressed with the trig property shown, and this value can be added in the respective sense to obtain the final combined <em>x</em>’ and <em>y</em>’ (separately).</p>
<p style="text-align:center;">$latex x'=x\cos\alpha -y\cos\beta$
$latex y' = z + x \sin \alpha + y \sin \beta$</p>
<p style="text-align:left;">If <em>y</em> is in the negative direction then the sign will automatically change accordingly. The next step is to incorporate the scaling of the axes. This was done by replacing the <em>x</em>, <em>y</em> &amp; <em>z</em> with a the scale factor as a multiple of the <em>x</em>, <em>y</em> &amp; <em>z</em>. Hence,</p>
<p style="text-align:center;">$latex x'=S_x x\cos\alpha -S_y y\cos\beta$
$latex y' = S_z z + S_x x\sin\alpha + S_y y \sin \beta$</p>
<p style="text-align:left;">This can now easily be transferred into matrix form as shown at the start of this derivation or left as is.</p>
<p style="text-align:left;"><strong>References:
</strong>Harvey, A. (2007). <em>Industrial Technology - Graphics Industries 2007 HSC Major Project Management Folio</em>. (<a href="http://drop.io/iwxdxm6/asset/itg-majorproject-2007-managementfolio-jul09-pdf">Link</a>)</p>