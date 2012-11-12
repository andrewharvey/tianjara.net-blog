Title: MATH1081 and MATH1231 Cheat Sheets
Date: 2009-03-19 09:44:18
Tags: math1081,math1231

Just cross posting my cheat sheets from MATH1081 and MATH1231. PDF and LaTeX source (Wordpress.com won't allow .tex uploads) are provided. These are from 08s2, at UNSW. I've released them into the public domain, if that is not legally possibly in Australia then lobby your parliament representative.

<a href="/blog/attachments/2009/03/math1081.pdf">math1081.pdf</a>

<a href="/blog/attachments/2009/03/math1231-alg.pdf">math1231-alg.pdf</a>

<a href="/blog/attachments/2009/03/math1231-calc.pdf">math1231-calc.pdf</a>
<h2>MATH1081 LaTeX Source</h2>
[sourcecode language="html"]
%This work is hereby released into the Public Domain. To view a copy of the public domain dedication, visit http://creativecommons.org/licenses/publicdomain/ or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.

\documentclass[a4paper,10pt]{article}
\usepackage{verbatim}
\usepackage{amsmath}
\usepackage{amssymb}
\setlength\parindent{0mm}
\usepackage{fullpage}
\usepackage{array}
\usepackage[all]{xy}

\usepackage[pdftex,
            pdfauthor={Andrew Harvey},
            pdftitle={MATH1081 Cheat sheet 2008},
            pdfsubject={},
            pdfkeywords={}]{hyperref}

\begin{document}

\section*{Enumeration}
\subsection*{Counting Methods}
Let $\#(n)$ denote the number of ways of doing $n$ things. Then,
$$\#(A\; \mbox{and}\; B) = \#(A) \times \#(B)$$
$$\#(A\; \mbox{or}\; B) = \#(A) + \#(B)$$

($n$ items, $r$ choices)\\
Ordered selection with repetition, $n^r$.\\

Ordered selection without repetition, $P(n,r) = \frac{n!}{(n-r)!}$.\\

Unordered selection without repetition, $C(n,r) = \frac{P(n,r)}{r!}$.\\

$|A \cup B| = |A| + |B| - |A \cap B|$\\

Ordered selection with repeition; WOOLLOOMOOLOO problem.\\

Unordered selection with repetition; dots and lines,
$$\binom{n+r-1}{n-1}$$

Pigeonhole principle. If you have n holes and more than n objects, then there must be at least 1 hole with more than 1 object.

\section*{Recurrences}
\subsection*{Formal Languages}
$\lambda$ represents the \textit{empty word}.
$w$ is just a variable (it is not part of the language)

\subsection*{First Order Homogeneous Case}
The recurrence,\\
\begin{center}$a_n = ra_{n-1}$ with $a_0=A$\\\end{center}
has solution\\
$$a_n=Ar^n.$$

\subsection*{Second Order Recurrences}
$$a_n + pa_{n-1} + qa_{n-2} = 0$$
has characteristic,
$$r^2 + pr + q = 0$$
If $\alpha$ and $\beta$ are the solutions to the characteristic equation, and if they are real and $\alpha \ne \beta$ then,
$$a_n = A\alpha^n + B\beta^n.$$
If $\alpha = \beta$ then,
$$a_n = A\alpha^n + Bn\beta^n.$$

\subsection*{Guesses for a particular solution}
\begin{tabular}{c|c}%{m{width} | m{width}}
 LHS &amp; Guess \\ \hline
$3$ &amp; c \\
$3n$ &amp; $cn + d$\\
$3\times 2^n$ &amp; $c2^n$\\
$3n2^2$ &amp; $(cn+d)2^n$\\
$(-3)^n$ &amp; $c(-3)^n$\\
\end{tabular}

\end{document}
[/sourcecode]
<h2>MATH1231-ALG LaTeX Source</h2>
[sourcecode language="html"]
%This work is hereby released into the Public Domain. To view a copy of the public domain dedication, visit http://creativecommons.org/licenses/publicdomain/ or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.

\documentclass[a4paper,10pt]{article}
\usepackage{verbatim}
\usepackage{amsmath}
\usepackage{amssymb}
\setlength\parindent{0mm}
\usepackage{fullpage}

\usepackage[pdftex,
            pdfauthor={Andrew Harvey},
            pdftitle={MATH1231 Algebra Cheat sheet 2008},
            pdfsubject={},
            pdfkeywords={},
            pdfstartview=FitB]{hyperref}

\begin{document}

\section*{Vector Spaces}
\subsection*{Vector Spaces}
Vector Space - 10 rules to satisfy, including \begin{small}\textit{(Where $V$ is a vector space.)}\end{small}
\begin{itemize}
\item Closure under addition. If $\mathbf{u}, \mathbf{v} \in V$ then $\mathbf{u} + \mathbf{v} \in V$
\item Existence of zero. $\mathbf{0} \in V$
\item Closure under scalar multiplication. If $\mathbf{u} \in V$ then $\lambda \mathbf{u} \in V$, where $\lambda \in \mathbb{R}$
\end{itemize}

\subsection*{Subspaces}
Subspace Theorem:\\
  A subset $S$ of a vectorspace $V$ is a subspace if:
\begin{enumerate}
\renewcommand{\labelenumi}{\roman{enumi})}
\item $S$ contains the zero vector.
\item If $\mathbf{u}, \mathbf{v} \in S$ then $\mathbf{u} + \mathbf{v} \in S$ and $\lambda \mathbf{u} \in S$ for all scalars $\lambda$.
\end{enumerate}

\subsection*{Column Space}
The column space of a matrix $A$ is defined as the span of the columns of $A$, written $\mbox{col}(A)$.

\subsection*{Linear Independence}
Let $S = \{\mathbf{v_1}, \mathbf{v_2}, \dots, \mathbf{v_n}\}$ be a set of vectors.
\begin{enumerate}
\renewcommand{\labelenumi}{\roman{enumi})}
\item If we can find scalars $\alpha_1 + \alpha_2 + \dots + \alpha_n$ not all zero such that
\begin{center}$\alpha_1\mathbf{v_1} + \alpha_2\mathbf{v_2} + \dots + \alpha_n\mathbf{v_n} = 0$\end{center}
then we call $S$ a linearly dependent set and that the vectors in $S$ are linearly dependent.

\item If the only solution of
\begin{center}$\alpha_1\mathbf{v_1} + \alpha_2\mathbf{v_2} + \dots + \alpha_n\mathbf{v_n} = 0$\end{center}
is $\alpha_1 = \alpha_2 = \dots = \alpha_n = 0$ then $S$ is called a linearly independent set and that the vectors in $S$ are linearly independent.
\end{enumerate}

\subsection*{Basis}
A set $B$ of vectors in a vectorspace $V$ is called a basis if
\begin{enumerate}
\renewcommand{\labelenumi}{\roman{enumi})}
\item $B$ is linearly independent, and
\item $V = \mbox{span}(B)$.
\end{enumerate}

An orthonormal basis is formed where all the basis vectors are unit length and are mutually orthogonal (the dot product of any two is zero).

\subsection*{Dimension}
The dimension of a vectorspace $V$, written dim($V$) is the number of basis vectors.

\section*{Linear Transformations}
\subsection*{Linear Map}
A function $T$ which maps from a vectorspace $V$ to a vectorspace $W$ is said to be linear if, for all vectors $\mathbf{u}, \mathbf{v} \in V$ and for any scalar $\lambda$,
\begin{enumerate}
\renewcommand{\labelenumi}{\roman{enumi})}
\item $T(\mathbf{u} + \mathbf{v}) = T(\mathbf{u}) + T(\mathbf{v})$,
\item $T(\lambda\mathbf{u}) = \lambda T(\mathbf{u})$.
\end{enumerate}

The columns of the transformation matrix are simply the images of the standard basis vectors.

\subsection*{The Kernel}
$\mbox{im}(T) = \mbox{col}(A)$\\
The kernel of a linear map $T : V \to W$, written ker($T$), consists of the set of vectors $\mathbf{v} \in V$ such that $T(\mathbf{v}) = \mathbf{0}$.\\
If A is the matrix representation of a linear map $T$, then the kernel of $A$ is the solution set of $A\mathbf{x} = \mathbf{0}$.

\subsection*{Rank-Nullity}
The dimension of the image of a linear map $T$ is called the rank of $T$, written rank($T$). (Maximum number of linearly independent columns of A)\\

The dimension of the kernel of a linear map $T$ is called the nullity of $T$, written nullity($T$). (Number of parameters in the solution set of $A\mathbf{x}=\mathbf{0}$)\\

If $T$ is a linear map from $V$ to $W$ then
$$\mbox{rank}(T) + \mbox{nullity}(T) = \mbox{dim}(V)$$

\section*{Eigenvectors and Eigenvalues}
If $A$ is a square matrix, $\mathbf{v} \ne 0$ and $\lambda$ is a scalar such that,
$$A\mathbf{v} = \lambda\mathbf{v}$$
then $\mathbf{v}$ is an eigenvector of $A$ with eigenvalue $\lambda$.\\
\begin{comment}
\begin{equation*}
A\mathbf{v} = \lambda\mathbf{v}
\implies (A-\lambda I)\mathbf{v} = \mathbf{0}

A-\lambda I \mbox{has no inverse (otherwise } \mathbf{v} = \mathbf{0} \mbox{)}
\mbox{so set det}(A-\lambda I) = 0
 \mbox{this finds the eigenvectors}

\mbox{Also since}
(A-\lambda I)\mathbf{v} = \mathbf{0}
\mathbf{v} \in \mbox{ker}(A-\lambda I)
\mbox{this gives eigenvectors.}
\end{equation*}
\end{comment}
Eigenvalues: Set $\mbox{det}(A-\lambda I) = 0$ and solve for $\lambda.$\\
Eigenvectors: For each value of $\lambda$ find the kernel of $(A-\lambda I)$.

\subsection*{Diagonalisation}
If $A$ has $n$ (independent) eigenvectors then put,\\
$P = (\mathbf{v_1}|\mathbf{v_2}|...|\mathbf{v_n})$ (eigenvectors $\mathbf{v}$)\\
and\\
$D =
\begin{pmatrix}
  \lambda_1 &amp;        &amp; 0         \\
            &amp; \ddots &amp;           \\
  0         &amp;        &amp; \lambda_n
\end{pmatrix}
$ (eigenvalues $\lambda$)\\
\\
so then\\
$A^k = PD^kP^{-1}$, for each non-negative integer $k$.\\
\\
Remember that when $A =
\bigl( \begin{smallmatrix}
  a&amp;b\\ c&amp;d
\end{smallmatrix} \bigr)$, $A^{-1} = \frac{1}{det(A)}
\begin{pmatrix}
d &amp; -b\\
-c &amp; a\end{pmatrix}$

\subsection*{Systems of Differential Equations}
The system
$\begin{cases}
	\frac{dx}{dt} = 4x + y\\
	\frac{dy}{dt} = x + 4y
\end{cases}$
 can be written $\mathbf{x}'(t) = \begin{pmatrix} 4 &amp; 1\\1 &amp; 4\end{pmatrix}\mathbf{x}(t)$ where $\mathbf{x}(t) = \binom{x(t)}{y(t)}.$

We can guess the solution to be $\mathbf{x}(t) = \alpha \mathbf{v} e^{\lambda t}$ (and add for all the eigenvalues). Where $\mathbf{v} $ and $ \lambda$ are the eigenvectors and eigenvalues respectively.

\section*{Probability and Statistics}

\subsection*{Probability}
Two events $A$ and $B$ are mutually exclusive if $A \cap B = \emptyset$.
$$P(A^c) = 1 - P(A)$$
$$P(A \cup B) = P(A) + P(B) - P(A \cap B)$$

\subsection*{Independence}
Two events $A$ and $B$ are physically independent of each other if the probability that one of them occurs is not influenced by the occurrence or non occurrence of the other. These two events are statistically independent if, $$P(A \cap B) = P(A).P(B).$$

\subsection*{Conditional Probability}
Probability of $A$ given $B$ is given by,
$$P(A|B) = \frac{P(A \cap B)}{P(B)}$$

\subsection*{Bayes Rule}

\subsection*{Discrete Random Variables}
$$p_k = P(X=k) \qquad \mbox{(} \{p_k\}\mbox{ is the probability distribution)}$$
where, $X$ is a discrete random variable, and $P(X=k)$ is the probability that $X=k$.\\

For $\{p_k\}$ to be a probability distribution,
\begin{enumerate}
\renewcommand{\labelenumi}{\roman{enumi})}
\item $p_k \ge 0$ for $k = 0, 1, 2, \dots$
\item $p_0 + p_1 + \dots = 1$
\end{enumerate}

\subsection*{Mean and Variance}
$E(X)$ denotes the mean or expected value of X.\\
%$$E(X) = \sum_{i=1}^{k} p_i x_i \qquad  $$
$$E(X) = \sum_{\mbox{all }k} kp_k$$

$$\mbox{Var}(X) = E(X^2) - E(X)^2 \qquad \mbox{where } E(X^2) = \sum_{\mbox{all } k} k^2 p_k$$

\subsection*{Binomial Distribution}
If we perform a binomial experiment (i.e. 2 outcomes) $n$ times, and each time there is a probability $p$ of success then,
$$P(X=k) = \binom{n}{k} p^k (1-p)^{n-k},\qquad \mbox{for } 0\le k \le n \mbox{ and 0 otherwise}.$$

\subsection*{Geometric Distribution}
$$P(X=k) = p(1-p)^{k-1}, \;\; k = 1, 2, \dots$$
\end{document}
[/sourcecode]
<h2>MATH1231-CACL LaTeX Source</h2>
[sourcecode language="html"]
%This work is hereby released into the Public Domain. To view a copy of the public domain dedication, visit http://creativecommons.org/licenses/publicdomain/ or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.

\documentclass[a4paper,10pt]{article}
\usepackage{verbatim}
\usepackage{amsmath}
\usepackage{amssymb}
\setlength\parindent{0mm}
\usepackage{fullpage}
\usepackage[all]{xy}

\usepackage[pdftex,
pdfauthor={Andrew Harvey},
pdftitle={MATH1231 Calculus Cheat sheet 2008},
pdfsubject={},
pdfkeywords={},
pdfstartview=FitB]{hyperref}

\begin{document}
\section*{Functions of Several Variables}
\subsection*{Sketching}
\begin{itemize}
\item Level Curves
\item Sections
\end{itemize}

\subsection*{Partial Derivatives}
$$\frac{\partial^2 f}{\partial y \partial x} = \frac{\partial^2 f}{\partial x \partial y}$$
on every open set on which $f$ and the partials,\\
$$\frac{\partial f}{x}, \frac{\partial f}{y}, \frac{\partial^2 f}{\partial y \partial x}, \frac{\partial^2 f}{\partial x \partial y}$$
are continuous.

\subsection*{Normal Vector}
$$\mathbf{n} = \pm
\begin{pmatrix}
\frac{\partial f(x_0, y_0)}{\partial x}\\
\frac{\partial f(x_0, y_0)}{\partial y}\\
-1\\
\end{pmatrix}
$$

\subsection*{Error Estimation}
$$f(x_0 + \Delta x, y_0 + \Delta y) \approx f(x_0, y_0) + \left[ \frac{\partial f}{\partial x} (x_0, y_0)\right] \Delta x + \left[ \frac{\partial f}{\partial y} (x_0, y_0)\right] \Delta y$$

\subsection*{Chain Rules}
Example, $z = f(x,y)\ \mbox{with}\ x = x(t), y = y(t)$
\begin{displaymath}
\xymatrix{
&amp; f \ar[dl] \ar[dr] &amp;   \\
x \ar[d] &amp;                   &amp; y \ar[d]\\
t        &amp;                   &amp; t}
\end{displaymath}

$$\frac{df}{dt} = \frac{\partial f}{\partial x} \cdot \frac{dx}{dt} + \frac{\partial f}{\partial y} \cdot \frac{dy}{dt}$$

\section*{Integration}
\subsection*{Integration by Parts}
Integrate the chain rule,
$$u(x)v(x) = \int u'(x)v(x)\; dx + \int v'(x)u(x)\; dx$$

\subsection*{Integration of Trig Functions}
For $\int \sin^2 x\; dx$ and $\int \cos^2 x\; dx$ remember that,\\
$$\cos 2x = \cos^2 x - \sin^2 x$$
%$$\sin 2x = 2\sin x \cos x$$

Integrals of the form $\int \cos^m x \sin^n x\; dx$, when $m$ or $n$ are odd, you can factorise using $\cos^2 x + \sin^x = 1$  and then using,
$$\int \sin^k x \cos x\; dx = \frac{1}{k+1} \sin^{k+1} x + C$$
$$\int \cos^k x \sin x\; dx = \frac{-1}{k+1} \cos^{k+1} x + C$$

\subsection*{Reduction Formulae}
...

\subsection*{Partial Fractions}
Example, assume
$$\frac{2x-1}{(x+3)(x+2)^2} = \frac{A}{x+3} + \frac{Bx + C}{(x+2)^2}$$
\begin{comment}
\begin{enumerate}
\renewcommand{\labelenumi}{\roman{enumi})}
\item $\frac{2x-1}{x+2} = A + \frac{B(x+3)}{x+2}$ subs $x=-3 \to A=7$
\item $\frac{2x-1}{x+3} = \frac{A(x+2)}{x+3} + B$ subs $x=-2 \to B=-5$
\end{enumerate}
\end{comment}
Now multiply both sides by $(x+2)(x+3)$ and equate coefficients.

\section*{ODE's}
\subsection*{Separable ODE}
Separate then integrate.

\subsection*{Linear ODE}
The ODE:
$$ \frac{dy}{dx} + f(x)y=g(x) $$
has solution,
$$ y(x) = \frac{1}{u(x)}\left [ \int u(x)g(x)\ dx + C \right] $$
where,
$$ u(x) := e^{\int f(x)\ dx} $$

\subsection*{Exact ODE}
The ODE:
$$ \frac{dy}{dx} = -\frac{M(x,y)}{N(x,y)} $$
or as,
$$ M(x,y)dx + N(x,y)dy = 0 $$
is exact when,
$$ \frac{\partial M}{\partial y} = \frac{\partial N}{\partial x} $$

Assume solution is of the form,
$$ F(x,y) = c $$
with,
$$ M = \frac{\partial F}{\partial x} \qquad N = \frac{\partial F}{\partial y}$$

Integrate to find two equations equal to $F(x,y)$, then compare and find solution from assumed form.

\subsection*{Second Order ODE's}
The ODE:
$$ay'' + ay' + by = f(x)$$
For the homogeneous case ($f(x) = 0$)\\
the characteristic equation will be $a\lambda^2 + b\lambda + c = 0$

If the characteristic equation has,\\
Two Distinct Real roots, (replace the $\lambda$'s with the solutions to the characteristic eqn.)
$$ y = Ae^{\lambda x} + Be^{\lambda x}$$

Repeated Real roots,
$$ y = Ae^{\lambda x} + Bxe^{\lambda x}$$

Complex roots,
$$ y = e^{\alpha x}(A\cos \beta x + B\sin \beta x)$$

where,
$$\lambda = \alpha \pm \beta i$$

For the For the homogeneous case,
$$y = y_h + y_p$$
$$y = \mbox{solution to homogeneous case} + \mbox{particular solution}$$

Guess something that is in the same form as the RHS.\\
If $f(x) = P(x)\cos ax \mbox{(or sin)}$ a guess for $y_p$ is $Q_1(x)\cos ax + Q_2(x)\sin ax$

\section*{Taylor Series}
\subsection*{Taylor Polynomials}
For a differentiable function $f$ the Taylor polynomial of order $n$ at $x=a$ is,
$$P_n(x) = f(a) + f'(a)(x-a) + \frac{f''(a)}{2!}(x-a)^2 + \dots + \frac{f^{\left( n\right) }(a)}{n!}(x-a)^n$$

\subsection*{Taylor's Theorem}
$$f(x) = f(a) + f'(a)(x-a) + \frac{f''(a)}{2!}(x-a)^2 + \dots + \frac{f^{\left( n\right) }(a)}{n!}(x-a)^n + R_n(x)$$

where,\\
$$R_n(x) = \frac{f^{\left( n+1\right) }(c)}{(n+1)!}(x-a)^{n+1}$$

\subsection*{Sequences}
$$\lim_{x \to \infty} f(x) = L \implies \lim_{n \to \infty}a_n = L$$
essentially says that when evaluating limits functions and sequences are identical.

A sequence diverges when $\displaystyle \lim_{n \to \infty}a_n = \pm \infty$ or $\displaystyle \lim_{n \to \infty}a_n$ does not exist.

\subsection*{Infinite Series}
\subsubsection*{Telscoping Series}
Most of the terms cancel out.

\subsubsection*{$n$-th term test (shows divergence)}
$\displaystyle \sum_{n=1}^{\infty} a_n$ diverges if $\displaystyle \lim_{n \to \infty}{a_n}$ fails to exist or is non-zero.

\subsubsection*{Integral Test}
Draw a picture. Use when you can easily find the integral.

\subsubsection*{$p$- series}
The infinite series $\displaystyle \sum_{n=1}^{\infty} \frac{1}{n^p}$ converges if $p&gt;1$ and diverges otherwise.

\subsubsection*{Comparison Test}
Compare to a p-series.

\subsubsection*{Limit form of Comparison Test}
Look at $\displaystyle \lim_{n \to \infty}{\frac{a_n}{b_n}}\;$ where $b_n$ is usually a p-series.\\
If $=c&gt;0$, then $\sum a_n$ and $\sum b_n$ both converge or both diverge.\\
If $=0$ and $\sum b_n$ converges, then $\sum a_n$ converges.\\
If $=\infty$ and $\sum b_n$ diverges, then $\sum a_n$ diverges.

\subsubsection*{Ratio Test}
$$\lim_{n \to \infty} \frac{a_{n+1}}{a_n} = \rho$$

The series converges if $\rho &lt; 1$,\\
the series diverges if $\rho &gt; 1$ or $\rho$ is infinite,\\
and the test is inconclusive if $\rho = 1$.

\subsubsection*{Alternating Series Test}
The series,
$$\sum_{n=1}^{\infty} (-1)^{n+1} u_n = u_1 - u_2 + u_3 - u_4 + \dots$$
converges if,
\begin{enumerate}
\item The $u_n$'s are all $&gt;0$,
\item $u_n \ge u_{n+1}$ for all $n \ge N$ for some integer $N$, and
\item $u_n \rightarrow 0$.
\end{enumerate}

\subsubsection*{Absolute Convergence}
If $\displaystyle \sum_{n=1}^{\infty} |a_n|$ converges, then $\displaystyle \sum_{n=1}^{\infty} a_n$ converges.

\subsection*{Taylor Series}
Taylor Polynomials consist of adding a finite number of things together, whereas Taylor Series is an infinite sum.\\
The Maclaurin series is the Taylor series at $x=0$.
\subsection*{Power Series}

\section*{More Calculus}
\subsection*{Average Value of a Function}
$$\frac{\displaystyle \int_a^b f(x)\ dx}{b-a}$$

\subsection*{Arc Length}
\begin{center}
Arc length over $\displaystyle[a,b] = \int_a^b \sqrt{1+f'(x)^2}\ dx$\\
\end{center}
$$s = \int_a^b \sqrt{x'(t)^2 + y'(t)^2}\ dt \qquad \mbox{(parametric)}$$

\subsection*{Speed}
$$\frac{ds}{dt} = \sqrt{x'(t)^2 + y'(t)^2}$$

\subsection*{Surface Area of Revolution}
$$2\pi \int_a^b f(x) \sqrt{1+f'(x)^2}\ dx$$
$$2\pi \int_a^b y(t) \sqrt{x'(t)^2 + y'(t)^2}\ dt \qquad \mbox{(parametric)}$$
\end{document}
[/sourcecode]