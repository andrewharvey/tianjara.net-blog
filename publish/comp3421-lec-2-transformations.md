Title: COMP3421 - Lec 2 - Transformations
Date: 2009-08-23 16:10:53
Tags: cs3421,graphics

<h2>Homogeneous Coordinates</h2>
Interestingly we can use the extra dimension in homogeneous coordinates to distinguish a point from a vector. A point will have a 1 in the last component, and a vector will have a 0. The difference between a point and a vector is a bit wish washy in my mind so I'm not sure why this distinction helps.
<h2>Transforming a Point</h2>
Say we have the 2D point $latex (x, y)$. This point as a column vector in homogeneous coordinates is $latex \begin{pmatrix} x \\ y \\ 1 \end{pmatrix}$. For a multiplication between this vector and a transformation matrix (3 by 3) to work we need to do the matrix times the vector (in that order) to give the translated vector, $latex Av = v'$.
<h2>Combining Transformations</h2>
Say we want to do a translation then a rotation (A then B) on the point x. First we must do $latex Ax = x'$, then $latex B(x')$. That is $latex BAx$. The order is important as matrix multiplication in not commutative, ie. $latex AB \ne BA$ (just think a translation then a rotation is not necessarily the same as a rotate then a move (by the same amounts)). If we do lots of transformations we may get something like $latex DCBAx$, this is in effect doing transformation A then B then C then D. (Remember matrix multiplication is associative, i.e. $latex (AB)C = A(BC)$).

As a side note, if you express your point as a row vector (eg. $latex \begin{pmatrix} x &amp; y &amp; z &amp; 1\end{pmatrix}$), then to do a transformation you must do $latex xA$ (where x is the point/row vector). In this case $latex xABC$ is equivalent to doing transformation A on point x, then transformation B then C (apparently this is how DirectX works).
<h2>Affine Transformations</h2>
Affine transformations are a special kind of transformation. They have a matrix form where the last row is [0 ... 0 1]. An affine transformation is equivalent to a linear transformation followed by a translation. That is, $latex \begin{bmatrix} \vec{y} \\ 1 \end{bmatrix} = \begin{bmatrix} A &amp; \vec{b} \ \\ 0, \ldots, 0 &amp; 1 \end{bmatrix} \begin{bmatrix} \vec{x} \\ 1 \end{bmatrix}$ is the same as $latex \vec{y} = A \vec{x} + \vec{b}$.

Something interesting to note is, the inverse transformation of an affine transformation is another affine transformation, whose matrix is the inverse matrix of the original. Also an affine transformation in 2D is uniquely defined by its action on three points.

From page 209 of the text (Hill, 2006), affine transformations have some very useful properties.
<h3>1. Affine Transformations Preserve Affine Combinations of Points</h3>
For some affine transformation T, points P<sub>1</sub> and P<sub>2</sub>, and real's a<sub>1</sub> and b<sub>1</sub> where a<sub>1</sub> + b<sub>1</sub> = 1,

$latex T(a_1P_1 + a_2P_2) = a_1T(P_1)+a_2T(P_2)$
<h3>2. Affine Transformations Preserve Lines and Planes</h3>
That is under any affine transformation lines transformed are still lines (they don't suddenly become curved), similarly planes that are transformed are still planes.
<h3>3. Parallelism of Lines and Planes is Preserved</h3>
"If two lines or planes are parallel, their images under an affine transformation are also parallel." The explanation that Hill uses is rather good,

Take an arbitrary line A + <strong>b</strong>t having direction <strong>b</strong>. It transforms to the line given in homogeneous coordinates by M(A + <strong>b</strong>t) = MA + (M<strong>b</strong>)t, this transformed line has direction vector M<strong>b</strong>. This new direction does not depend on point A. Thus two different lines $latex A_1 + \mathbf{b}t$ and $latex A_2 + \mathbf{b}t$ that have the same direction will transform into two lines both having the direction $latex M\mathbf{b}$, so they are parallel. The same argument can be applied to planes and beyond.
<h3>4. The Columns of the Matrix Reveal the Transformed Coordinate Frame</h3>
Take a generic affine transformation matrix for 2D,

$latex M = \begin{pmatrix}a &amp; b &amp; c\\ d &amp; e &amp; f\\ 0 &amp; 0 &amp; 1 \end{pmatrix}$

The first two columns, $latex \mathbf{m_1} = \begin{pmatrix}a \\ d\\ 0\end{pmatrix}$ and $latex \mathbf{m_2} = \begin{pmatrix}b \\ e\\ 0\end{pmatrix}$, are vectors (last component is 0). The last column $latex \begin{pmatrix}c \\ f\\ 1\end{pmatrix}$ is a point (last component is a 1).

Using the standard basis vectors $latex \mathbf{i} = \begin{pmatrix}1 \\ 0\\ 0\end{pmatrix}$, $latex \mathbf{j} = \begin{pmatrix}0 \\ 1\\ 0\end{pmatrix}$ with origin $latex \phi = \begin{pmatrix}0 \\ 0\\ 1\end{pmatrix}$, notice that <strong>i</strong> transforms to the vector $latex \mathbf{m_1}$. $latex \mathbf{m_1} = M\mathbf{i}$. Similarily for $latex \mathbf{j}$ and $latex \phi$.
<h3>5. Relative Ratios are Preserved</h3>
<h3>6. Area's Under an Affine Transformation</h3>
Given an affine transformation as a matrix M,

$latex \frac{\mbox{area after transformation}}{\mbox{area before transformation}} = |\mbox{det} M|$
<h3>7. Every Affine Transformation is Composed of Elementary Operations</h3>
Every affine transformation can be constructed by a composition of elementary operations (see below). That is,

$latex M = (\mbox{shear})(\mbox{scale})(\mbox{rotation})(\mbox{translation})$

For a 2D affine transformation M. In 3D,

$latex M = (\mbox{scale})(\mbox{rotation})(\mbox{shear}_1)(\mbox{shear}_2)(\mbox{translation})$
<h2>Rotations</h2>
Euler's theorem: Any rotation (or sequence of rotations) about a point is equivalent to a single rotation about some coordinate axis through that point. Pages 221-223 of Hill give a detailed explanation of this, as well as the equations to go from one form to the other.
<h2>W2V (Window to Viewport Mapping)</h2>
A simplified OpenGL pipeline applies the modelview matrix, projection matrix, clipping, then the viewport matrix. The viewport matrix is the window to viewport map.

The window coordinate system is somewhere on the projection plane. These coordinates need to be mapped to the viewport (the area on the screen)
<h2>References</h2>
F.S. Hill, et al. (2006). Computer Graphics using OpenGL. Second Ed.

<!-- p, li { white-space: pre-wrap; } -->