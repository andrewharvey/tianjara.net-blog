Title: (x,y,z,w) in OpenGL/Direct3D (Homogeneous Coordinates)
Date: 2008-09-29 09:33:12
Tags: graphics,math1231,mathematics,projections

I always wondered why 3D points in OpenGL, Direct3D and in general computer graphics were always represented as (<span style="font-style:italic;">x</span>,<span style="font-style:italic;">y</span>,<span style="font-style:italic;">z</span>,<span style="font-style:italic;">w</span>) (i.e. why do we use four dimensions to represent a 3D point, what's the <span style="font-style:italic;">w</span> for?). This representation of coordinates with the extra dimension is know as homogeneous coordinates. Now after finally getting formally taught linear algebra I know the answer, and its rather simple, but I'll start from the basics.

Points can be represented as vectors, eg. (1,1,1). Now a common thing we want to do in computer graphics is to move this point (translation). So we can do this by simply adding two vectors together,
<p style="text-align:center;">$latex \begin{pmatrix}x'\\y'\\z'\end{pmatrix} = \begin{pmatrix}x\\y\\z\end{pmatrix} + \begin{pmatrix}a\\b\\c\end{pmatrix} = \begin{pmatrix}x + a\\y + b\\z + c\end{pmatrix}.$</p>
<p style="text-align:left;">If we wanted do some kind of linear transformation such as rotate about the origin, scale about the origin, etc, then we could just multiply a certain matrix with the point vector to obtain the image of the vector under that transformation. For example,</p>
<p style="text-align:center;">$latex \begin{pmatrix}x'\\ y'\\ z' \end{pmatrix} = \begin{pmatrix}\cos \theta &amp;-\sin \theta &amp;0\\ \sin \theta &amp;\cos \theta &amp;0\\ 0&amp;0&amp;1\end{pmatrix} \begin{pmatrix}x\\ y\\ z\end{pmatrix}$</p>
<p style="text-align:left;"></p>
<p style="text-align:left;">will rotate the vector (<span style="font-style:italic;">x</span>,<span style="font-style:italic;">y</span>,<span style="font-style:italic;">z</span>) by angle theta about the <span style="font-style:italic;">z</span> axis.</p>
However as you may have seen you cannot do a 3D translation on a 3D point by just multiplying a 3 by 3 matrix by the vector. To fix this problem and allow all affine transformations (linear transformation followed by a translation) to be done by matrix multiplication we introduce an extra dimension to the point (denoted <span style="font-style:italic;">w</span> in this blog). Now we can perform the translation,
<p style="text-align:center;">$latex \mathbb{R}^2 : (x,y) \to (x+a, y+b)$</p>
by a matrix multiplication,
<p style="text-align:center;">$latex \begin{pmatrix}1 &amp; 0 &amp; a\\ 0 &amp; 1 &amp; b\\ 0 &amp; 0 &amp; 1\end{pmatrix} \begin{pmatrix}x\\ y\\ 1\end{pmatrix} = \begin{pmatrix}x + a\\ y + b\\ 1 \end{pmatrix}.$</p>
We need this extra dimension for the multiplication to make sense, and it allows us to represent all affine transformations as matrix multiplication.

<span style="font-size:85%;">REFERENCES:
Homogeneous coordinates. (2008, September 29).  In <em>Wikipedia, The Free Encyclopedia</em>. Retrieved 04:33, September 29, 2008, from <a class="external free" title="http://en.wikipedia.org/w/index.php?title=Homogeneous_coordinates&amp;oldid=241693659" rel="nofollow" href="http://en.wikipedia.org/w/index.php?title=Homogeneous_coordinates&amp;oldid=241693659">http://en.wikipedia.org/w/index.php?title=Homogeneous_coordinates&amp;oldid=241693659</a></span>