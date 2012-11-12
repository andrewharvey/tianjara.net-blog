Title: Computer Graphics Notes
Date: 2009-12-02 08:36:10
Tags: comp3421,computing,graphics

<em>Not really complete...
</em>

<em><a href="http://andrewharvey4.wordpress.com/2009/08/22/comp3421-lec-1-colour/">Colour notes here</a>, <a href="http://andrewharvey4.wordpress.com/2009/08/23/comp3421-lec-2-transformations/">transformations notes here</a>.</em>
<h1>Parametric Curves and Surfaces</h1>
<h2>Parametric Representation</h2>
eg. $latex C(t) = (x(t), y(t))$
<h2>Continuity</h2>
<h3>Parametric Continuity</h3>
<ul>
	<li>If the first derivative of a curve is continuous, we say it has C<sup>1</sup> continuity.</li>
</ul>
<h3>Geometric Continuity</h3>
<ul>
	<li>If the magnitude of the first derivative of a curve changes but the direction doesn't then, we say it has G<sup>1</sup> continuity.</li>
	<li>Curves need G2 continuity in order for a car to drive along them. (ie. not instantly change steering wheel angle at any points).</li>
</ul>
<h2>Control Points</h2>
Control points allow us to shape/define curves visually. A curve will either interpolate or approximate control points.
<h2>Natural Cubic Splines</h2>
<a href="/blog/attachments/2009/08/naturalcubic.png"><img title="naturalcubic" src="/blog/attachments/2009/08/naturalcubic.png" alt="naturalcubic" width="102" height="155" /></a>
<ul>
	<li>Interpolate control points.</li>
	<li>A cubic curve between each pair of control points</li>
	<li>Four unknowns,
<ul>
	<li>
<ul>
	<li>interpolating the two control points gives two,</li>
	<li>requiring that derivatives match at end of points of these curves gives the other two.</li>
</ul>
</li>
</ul>
</li>
	<li>Moving one control point changes the whole curve (ie. no local control over the shape of the curve)</li>
</ul>
<h2>Bezier Curve</h2>
<a href="/blog/attachments/2009/08/bez2seg.png"><img title="bez2seg" src="/blog/attachments/2009/08/bez2seg.png" alt="bez2seg" width="223" height="144" /></a>

This Bezier curve shown has two segments, where each segment is defined by 4 control points. The curve interpolates two points and approximates the other two. The curve is defined by a Bernstein polynomial. In the diagram changing points 1 and 2 only affects that segment. Changing the corner points (0 and 3) each only affect the two segments that they boarder.

Some properties of Bezier Curves:
<ul>
	<li>Tangent Property. Tangent at point 0 is line 0 to 1, similarly for point 3.</li>
	<li>Convex Hull Property. The curve lies inside the convex hull of the control points. (The corollary of this is if the control points are colinear, the curve is a line.)</li>
	<li>They have affine invariance.</li>
	<li>Can't fluctuate more than their control polygon does.</li>
	<li>Bezier's are a special case of B-spline curves.</li>
</ul>
<a href="/blog/attachments/2009/08/bezier_curvec1.png"><img title="Bezier_curveC1" src="/blog/attachments/2009/08/bezier_curvec1.png" alt="Bezier_curveC1" width="450" height="262" /></a>

We can join two Bezier curves together to have C<sup>1</sup> continuity (where B<sub>1</sub>(P<sub>0</sub>, P<sub>1</sub>, P<sub>2</sub>, P<sub>3</sub>) and B<sub>2</sub>(P<sub>0</sub>, P<sub>1</sub>, P<sub>2</sub>, P<sub>3</sub>)) if P<sub>3</sub> - P<sub>2</sub> = P<sub>4</sub> - P<sub>3</sub>. That is P<sub>2</sub>, P<sub>3</sub>,  and P<sub>4</sub> are colinear and P<sub>3</sub> is the midpoint of P<sub>2</sub> and P<sub>4</sub>. To get G<sup>1</sup> continuity we just need P<sub>2</sub>, P<sub>3</sub>, and P<sub>4</sub> to be colinear. If we have G<sup>1</sup> continuity but not C<sup>1</sup> continuity the curve still won't have any corners but you will notice a "corner" if your using the curve for something else such as some cases in animation. [Also if the curve defined a road without G<sup>1</sup> continuity there would be points where you must change the steering wheel from one rotation to another instantly in order to stay on the path.]
<h2>De Casteljau Algorithm</h2>
De Casteljau Algorithm is a recursive method to evaluate points on a Bezier curve.

<a href="/blog/attachments/2009/08/decasteljau.png"><img title="decasteljau" src="/blog/attachments/2009/08/decasteljau.png" alt="decasteljau" width="357" height="180" /></a>

<a href="/blog/attachments/2009/08/decasteljau.png"></a>To calculate the point halfway on the curve, that is <em>t</em> = 0.5 using De Casteljau's algorithm we (as shown above) find the midpoints on each of the lines shown in green, then join the midpoints of the lines shown in red, then the midpoint of the resulting line is a point on the curve. To find the points for different values of <em>t</em>, just use that ratio to split the lines instead of using the midpoints. Also note that we have actually split the Bezier curve into two. The first defined by P<sub>0</sub>, P<sub>01</sub>, P<sub>012</sub>, P<sub>0123</sub> and the second by P<sub>0123</sub>, P<sub>123</sub>, P<sub>23</sub>, P<sub>3</sub>.
<h2>Curvature</h2>
The curvature of a circle is $latex \frac{1}{r}$.

The curvature of a curve at any point is the curvature of the osculating circle at that point. The osculating circle for a point on a curve is the circle that "just touches" the curve at that point. The curvature of a curve corresponds to the position of the steering wheel of a car going around that curve.
<h2>Uniform B Splines</h2>
Join with C2 continuity.

Any of the B splines don't interpolate any points, just approximate the control points.
<h2>Non-Uniform B Splines</h2>
Only invariant under affine transformations, not projective transformations.
<h2>Rational B Splines</h2>
Rational means that they are invariant under projective and affine transformations.
<h2>NURBS</h2>
Non-Uniform Rational B Splines

Can be used to model any of the conic sections (circle, ellipse, hyperbola)

=====================
<h1>3D</h1>
When rotating about an axis in OpenGL you can use the right hand rule to determine the + direction (thumb points in axis, finger indicate + rotation direction).

We can think of transformations as changing the coordinate system, where (u, v, n) is the new basis and O is the origin.

$latex \begin{pmatrix}u_x &amp; v_x &amp; n_x &amp; O_x\\ u_y &amp; v_y &amp; n_y &amp; O_y\\ u_z &amp; v_z &amp; n_z &amp; O_z\\ 0 &amp; 0 &amp; 0 &amp; 1 \end{pmatrix}$

This kind of transformation in is known as a local to world transform. This is useful for defining objects which are made up of many smaller objects. It also means to transform the object we just have to change the local to world transform instead of changing the coordinates of each individual vertex. A series of local to world transformations on objects builds up a scene graph, useful for drawing a scene with many distinct models.
<h2>Matrix Stacks</h2>
OpenGL has MODELVIEW, PROJECTION, VIEWPORT, and TEXTURE matrix modes.
<ul>
	<li>glLoadIdentity() - puts the Identity matrix on the top of the stack</li>
	<li>glPushMatrix() - copies the top of the matrix stack and puts it on top</li>
	<li>glPopMatrix()</li>
</ul>
For MODELVIEW operations include glTranslate, glScaled, glRotated... These are post multiplied to the top of the stack, so the last call is done first (ie. a glTranslate then glScaled will scale then translate.).

Any glVertex() called have the value transformed by matrix on the top of the MODELVIEW stack.

Usually the hardware only supports projection and viewport stacks of size 2, whereas the modelview stack should have at least a size of 32.
<h2>The View Volume</h2>
Can set the view volume using,(after setting the the current matrix stack to the PROJECTION stack
<ul>
	<li>glOrtho(left, right, bottom, top, near, far)
<a href="/blog/attachments/2009/11/glortho.png"><img title="glOrtho" src="/blog/attachments/2009/11/glortho.png" alt="glOrtho" width="450" height="291" /></a>
(Source: Unknown)</li>
	<li>glFrustum(left, right, bottom, top, near, far)
<a href="/blog/attachments/2009/11/glfrustum1.png"><img title="glFrustum" src="/blog/attachments/2009/11/glfrustum1.png" alt="glFrustum" width="450" height="263" /></a>
(Source: Unknown)</li>
	<li>gluPerspective(fovy, aspect, zNear, zFar)
<a href="/blog/attachments/2009/11/gluperspective.png"><img title="gluPerspective" src="/blog/attachments/2009/11/gluperspective.png" alt="gluPerspective" width="450" height="254" /></a>
(Source: Unknown)</li>
</ul>
In OpenGL the projection method just determines how to squish the 3D space into the canonical view volume.

Then you can set the direction using gluLookAt (after calling one of the above) where you set the eye location, a forward look at vector and an up vector.

When using perspective the view volume will be a frustum, but this is more complicated to clip against than a cube. So we convert the view volume into the canonical view volume which is just a transformation to make the view volume a cube at 0,0,0 of width 2. Yes this introduces distortion but this will be compensated by the final window to viewport transformation.

Remember we can set the viewport with glViewport(left, bottom, width, height) where x and y are a location in the screen (I think this means window, but also this stuff is probably older that modern window management so I'm not worrying about the details here.)
<h2>Visible Surface Determination (Hidden Surface Removal)</h2>
First clip to the view volume then do back face culling.

Could just sort the polygons and draw the ones further away first (painter's algorithm/depth sorting). But this fails for those three overlapping triangles.

Can fix by splitting the polygons.
<h3>BSP (Binary Space Partitioning)</h3>
For each polygon there is a region in front and a region behind the polygon. Keep subdividing the space for all the polygons.

Can then use this BSP tree to draw.
<pre>void drawBSP(BSPTree m, Point myPos{
   if (m.poly.inFront(myPos)) {
      drawBSP(m.behind, myPos);
      draw(m.poly);
      drawBSP(m.front, myPos);
   }else{
      drawBSP(m.front, myPos);
      draw(m.poly);
      drawBSP(m.behind, myPos);
   }
}
</pre>
If one polygon's plane cuts another polygon, need to split the polygon.

You get different tree structures depending on the order you select the polygons. This does not matter, but some orders will give a more efficient result.

Building the BSP tree is slow, but it does not need to be recalculated when the viewer moves around. We would need to recalculate the tree if the polygons move or new ones are added.

BSP trees are not so common anymore, instead the Z buffer is used.
<h3>Z Buffer</h3>
Before we fill in a pixel into the framebuffer, we check the z buffer and only fill that pixel is the z value (can be a pseudo-depth) is less (large values for further away) than the one in the z buffer. If we fill then we must also update the z buffer value for that pixel.

Try to use the full range of values for each pixel element in the z buffer.

To use in OpenGL just do gl.glEnable(GL.GL_DEPTH_TEST) and to clear the z-buffer use gl.glClear(GL.GL_DEPTH_BUFFER_BIT).
<h2>Fractals</h2>
<h3>L-Systems</h3>
Line systems. eg. koch curve
<h3>Self-similarity</h3>
<ul>
	<li>Exact (eg. sierpinski trangle)</li>
	<li>Stochastic (eg. mandelbrot set)</li>
</ul>
<h3>IFS - Iterated Function System</h3>
================================================
<h1>Shading Models</h1>
There are two main types of rendering that we cover,
<ul>
	<li>polygon rendering</li>
	<li>ray tracing</li>
</ul>
Polygon rendering is used to apply illumination models to polygons, whereas ray tracing applies to arbitrary geometrical objects. Ray tracing is more accurate, whereas polygon rendering does a lot of fudging to get things to look real, but polygon rendering is much faster than ray tracing.
<ul>
	<li>With polygon rendering we must approximate NURBS into polygons, with ray tracing we don't need to, hence we can get perfectly smooth surfaces.</li>
	<li>Much of the light that illuminates a scene is indirect light (meaning it has not come directly from the light source). In polygon rendering we fudge this using ambient light. Global illumination models (such as ray tracing, radiosity) deal with this indirect light.</li>
	<li>When rendering we assume that objects have material properties which we denote k<sub>(property)</sub>.</li>
	<li>We are trying to determine I which is the colour to draw on the screen.</li>
</ul>
We start with a simple model and build up,

Lets assume each object has a defined colour. Hence our illumination model is $latex I = k_i$, very simple, looks unrealistic.

Now we add ambient light into the scene. Ambient Light is indirect light (ie. did not come straight from the light source) but rather it has reflected off other objects (from diffuse reflection). $latex I = I_a k_a$. We will just assume that all parts of our object have the same amount of ambient light illuminating them for this model.

Next we use the diffuse illumination model to add shading based on light sources. This works well for non-reflective surfaces (matte, not shiny) as we assume that light reflected off the object is equally reflected in every direction.
<h2>Lambert's Law</h2>
"intensity of light reflected from a surface is proportional to the cosine of the angle between L (vector to light source) and N(normal at the point)."
<h2>Gouraud Shading</h2>
Use normals at each vertex to calculate the colour of that vertex (if we don't have them, we can calculate them from the polygon normals for each face). Do for each vertex in the polygon and interpolate the colour to fill the polygon. The vertex normals address the common issue that our polygon surface is just an approximation of a curved surface.

To use gouraud shading in OpenGL use glShadeModel(GL_SMOOTH). But we also need to define the vertex normals with glNormal3f() (which will be set to any glVertex that you specify after calling glNormal).

Highlights don't look realistic as you are only sampling at every vertex.

Interpolated shading is the same, but we use the polygon normal as the normal for each vertex, rather than the vertex normal.
<h2>Phong Shading</h2>
Like gouraud, but you interpolate the normals and then apply the illumination equation for each pixel.

This gives much nicer highlights without needing to increase the number of polygons, as you are sampling at every pixel.
<h2>Phong Illumination Model</h2>
Diffuse reflection and specular reflection.
<div><dl> <dt><a href="/blog/attachments/2009/09/phong_components_version_4.png"><img title="Phong_components_version_4" src="/blog/attachments/2009/09/phong_components_version_4.png" alt="Components of the Phong Model (Brad Smith, http://commons.wikimedia.org/wiki/File:Phong_components_version_4.png)" width="450" height="125" /></a></dt> <dd>Components of the Phong Model (Brad Smith, http://commons.wikimedia.org/wiki/File:Phong_components_version_4.png)</dd> </dl></div>
<a href="/blog/attachments/2009/11/reflection_models.png"><img title="reflection_models" src="/blog/attachments/2009/11/reflection_models.png" alt="Source: Lambert" width="450" height="240" /></a>
(Source: COMP3421, Lecture Slides.)

$latex I_s = I_l k_s \cos^n \left ( \alpha \right )$

n is the Phong exponent and determines how shiny the material (the larger n the smaller the highlight circle).

Flat shading. Can do smooth shading with some interpolation.

If you don't have vertex normals, you can interpolate it using the face normals of the surrounding faces.

Gouraud interpolates the colour, phong interpolates the normals.
<h2>Attenuation</h2>
inverse square is physically correct, but looks wrong because real lights are not single points as we usually use in describing a scene, and

For now I assume that all polygons are triangles. We can store the normal per polygon. This will reneder this polygon, but most of the time the polygon model is just an approximation of some smooth surface, so what we really want to do is use vertex normals and interpolate them for the polygon.
<h1>Ray Tracing</h1>
For each pixel on the screen shoot out a ray and bounce it around the scene. The same as shooting rays from the light sources, but only very few would make it into the camera so its not very efficient.

Each object in the scene must provide an intersection(Line2D) function and a normal (Point3D) function

Ray Tree

Nodes are intersections of a light ray with an object. Can branch intersections for reflected/refracted rays. The primary ray is the original ray and the others are secondary rays.
<h1>Shadows</h1>
Can do them using ray tracing, or can use shadow maps along with the Z buffer. The key to shadow maps is to render the scene from the light's perspective and save the depths in the Z buffer. Then can compare this Z value to the transformed Z value of a candidate pixel.

==============
<h1>Rasterisation</h1>
<h2>Line Drawing</h2>
<h3>DDA</h3>
<ul>
	<li>You iterate over x or y, and calculate the other coordinate using the line equation (and rounding it).</li>
	<li>If the gradient of the line is &gt; 1 we must iterate over y otherwise iterate over x. Otherwise we would have gaps in the line.</li>
	<li>Also need to check if x1 is &gt; or &lt; x2 or equal and have different cases for these.</li>
</ul>
<h3>Bresenham</h3>
<ul>
	<li>Only uses integer calcs and no multiplications so its much faster than DDA.</li>
	<li>We define an algorithm for the 1st octant and deal with the other octant's with cases.</li>
	<li>We start with the first pixel being the lower left end point. From there there are only two possible pixels that we would need to fill. The one to the right or the one to the top right. Bresenham's algorithm gives a rule for which pixel to go to. We only need to do this incrementally so we can just keep working out which pixel to go to next.</li>
	<li>The idea is we accumulate an error and when that exceeds a certain amount we go up right, then clear the error, other wise we add to the error and go right.</li>
</ul>
We use Bresenham's algorithm for drawing lines this is just doing linear interpolation, so we can use Bresenham's algorithm for other tasks that need linear interpolation.
<h2>Polygon Filling</h2>
<h3>Scan line Algorithm</h3>
The Active Edge List (AEL) is initially empty and the Inactive Edge List (IEL) initially contains all the edges. As the scanline crosses an edge it is moved from the IEL to the AEL, then after the scanline no longer crosses that edge it is removed from the AEL.

To fill the scanline,
<ul>
	<li>On the left edge, round up to the nearest integer, with round(n) = n if n is an integer.</li>
	<li>On the right edge, round down to the nearest integer, but with round(n) = n-1 if n is an integer.</li>
</ul>
Its really easy to fill a triangle, so an alternative is to split the polygon into triangles and just fill the triangles.

===============
<h1>Anti-Aliasing</h1>
Ideally a pixel's colour should be the area of the polygon that falls inside that pixel (and is on top of other polygons on that pixel) times the average colour of the polygon in that pixel region then multiply with any other resulting pixel colours that you get from other polygons in that pixel that's not on top of any other polygon on that pixel.
<h2>Aliasing Problems</h2>
<ul>
	<li>Small objects that fall between the centre of two adjacent pixels are missed by aliasing. Anti-aliasing would fix this by shading the pixels a gray rather than full black if the polygon filled the whole pixel.</li>
	<li>Edges look rough ("the jaggies").</li>
	<li>Textures disintegrate in the distance</li>
	<li>Other non-graphics problems.</li>
</ul>
<h2>Anti-Aliasing</h2>
In order to really understand this anti-aliasing stuff I think you need some basic understanding of how a standard scene is drawn. When using a polygon rendering method (such as is done with most real time 3D), you have a framebuffer which is just an area of memory that stores the RGB values of each pixel. Initially this framebuffer is filled with the background colour, then polygons are drawn on top. If your rending engine uses some kind of hidden surface removal it will ensure that the things that should be on top are actually drawn on top.

Using the example shown (idea from http://cgi.cse.unsw.edu.au/~cs3421/wordpress/2009/09/24/week-10-tutorial/#more-60), and using the rule that if a sample falls exactly on the edge of two polygons, we take the pixel is only filled if it is a top edge of the polygon.
<div><dl> <dt><a href="/blog/attachments/2009/10/aa-pixel.png"><img title="aa-pixel" src="/blog/attachments/2009/10/aa-pixel.png" alt="Anti-Aliasing Example Case. The pixel is the thick square, and the blue dots are samples." width="309" height="197" /></a></dt> <dd>Anti-Aliasing Example Case. The pixel is the thick square, and the blue dots are samples.</dd> </dl></div>
<h3>No Anti-Aliasing</h3>
With no anti-aliasing we just draw the pixel as the colour of the polygon that takes up the most area in the pixel.
<h3>Pre-Filtering</h3>
<ul>
	<li>We only know what colours came before this pixel, and we don't know if anything will be drawn on top.</li>
	<li>We take a weighted (based on the ratio of how much of the pixel the polygon covers) averages along the way. For example if the pixel was filled with half green, then another half red, the final anti-aliased colour of that pixel would determined by,
Green (0, 1, 0) averaged with red (1, 0, 0) which is (0.5, 0.5, 0). If we had any more colours we would then average (0.5, 0.5, 0) with the next one, and so on.</li>
	<li>Remember weighted averages,
$latex \frac{Aa + Bb}{A + B}$
where you are averaging $latex a$ and $latex b$ with weights $latex A$ and $latex B$ respectively.</li>
	<li>Pre-filtering is designed to work with polygon rendering because you need to know the ratio which by nature a tracer doesn't know (because it just takes samples), nor does it know which polygons fall in a given pixel (again because ray tracers just take samples).</li>
	<li>Pre-filtering works very well for anti-aliasing lines, and other vector graphics.</li>
</ul>
<h3>Post-Filtering</h3>
<ul>
	<li>Post-filtering uses supersampling.</li>
	<li>We take some samples (can jitter (stochastic sampling) them, but this only really helps when you have vertical or horizontal lines moving vertically or horizontally across a pixel, eg. with vector graphics)</li>
	<li>$latex \left ( \frac{6}{9} \right )$ of the samples are Green, and $latex \left ( \frac{3}{9} \right )$ are red. So we use this to take an average to get the final pixel colour of $latex \begin{pmatrix}\frac{1}{3}, &amp; \frac{2}{3}, &amp; 0\end{pmatrix}$</li>
	<li>We can weight these samples (usually centre sample has more weight). The method we use for deciding the weights is called the <strong>filter</strong>. (equal weights is called the <em>box filter</em>)</li>
	<li>Because we have to store all the colour values for the pixel we use more memory than with pre-filtering (but don't need to calculate the area ratio).</li>
	<li>Works for either polygon rendering or ray tracing.</li>
</ul>
Can use adaptive supersampling. If it looks like a region is just one colour, don't bother supersampling that region.
<h3>OpenGL</h3>
Often the graphics card will take over and do supersamling for you (full scene anti aliasing).

To get OpenGL to anti-alias lines you need to first tell it to calculate alpha for each pixel (ie. the ratio of non-filled to filled area of the pixel) using, glEnable(GL_LINE_SMOOTH) and then enable alpha blending to apply this when drawing using,
<pre>glEnable(GL_BLEND);
glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
</pre>
You can do post-filtering using the accumulation buffer (which is like the framebuffer but will apply averages of the pixels), and jittering the camera for a few times using accPerspective.
<h2>Anti-Aliasing Textures</h2>
A texel is a texture pixel whereas a pixel in this context refers to a pixel in the final rendered image.

When magnifying the image can use bilinear filtering (linear interpolation) to fill the gaps.
<h3>Mip Mapping</h3>
Storing scaled down images and choose closes and also interpolate between levels where needed. Called trilinear filtering.

Rip Mapping helps with non uniform scaling of textures. Anisotropic filtering is more general and deals with any non-linear transformation applied to the texture
<h3>Double Buffering</h3>
We can animate graphics by simply changing the framebuffer, however if we start changing the framebuffer and we cannot change it faster than the rate the screen will display the contents of the frame buffer, it gets drawn when we have only changed part of the framebuffer. To prevent this, we render the image to an off screen buffer and when we finish we tell the hardware to switch buffers.

Can do on-demand rendering (only refill framebuffer when need to) or continuois rendeing (draw method is called at a fixed rate and the image is redrawn regardless of whether the image needs to be updated.)
<h3>LOD</h3>
Mip Mapping for models. Can have some low poly models that we use when far away, and use the high res ones when close up.
<h2>Animation</h2>
Key-frames and tween between them to fill up the frames.

===============
<h1>Shaders</h1>
OpenGL 2.0  using GLSL will let us implement out own programs for parts of the graphics pipeline particularly the vertex transformation stage and fragment texturing and colouring stage.

Fragments are like pixels except they may not appear on the screen if they are discarded by the Z-buffer.
<h2>Vertex Shaders</h2>
<ul>
	<li>position tranformation and projection (set gl_Position), and</li>
	<li>lighting calculation (set gl_FrontColor)</li>
</ul>
<h2>Fragment Shaders</h2>
<ul>
	<li>interpolate vertex colours for each fragment</li>
	<li>apply textures</li>
	<li>etc.</li>
</ul>
set gl_FragColor.