#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [18.02 Mock Half-Final],
  author: "Evan Chen",
  date: [13 October 2024],
  maketitle: false,
)


#block[
#show heading: set align(center)
#set heading(numbering: none)

= 18.02 Mock Half-Final

- Since 3-hour exams constitute cruel and unusual punishment,
  this is only 90 minutes long. There will be eight questions.
  We cover all post-midterm 3 topics and a random subset of earlier topics.

- Like the real exam, I suggest not referring to any notes/calculators/etc.

- Solutions are posted in Chapter 54 of my LAMV book at #url("https://web.evanchen.cc/1802.html").
]

#pagebreak()

#block[
#show heading: set align(center)
#set heading(numbering: none)

= 18.02 Mock Half-Final Questions

/ 1.:
  Give an example of a complex number $z$ whose
  real and imaginary part are both negative such that $z^3 = - 1000 i$.
  Write your answer in rectangular form.

/ 2.:
  Compute the unique real number $a$ for which the matrix
  $M = mat(1,1;a,6)$ has an eigenvalue of $2$.
  For this value of $a$, compute the other eigenvalue of $M$,
  and a (nonzero) eigenvector for that eigenvalue.

/ 3.:
  The four points $(b,0,0)$, $(0,b,0)$, $(0,0,b)$, and $(2,3,6)$ lie on a plane $cal(P)$.
  Compute $b$, and compute the distance from $(1,2,3)$ to $cal(P)$.

/ 4.:
  Let $f(x,y) = cos(x) + sin(y)$.
  Give an example of a saddle point of $f$, and an example of a local maximum of $f$.
  Pick either of these two points and sketch the level curve of $f$ passing through it.

/ 5.:
  Compute the maximum and minimum value of $x^2+2y^2+4x$ over the region $x^2+y^2 <= 9$.

/ 6.:
  Compute $int_(x=0)^1 int_(y=x)^1 int_(z=y)^1 e^(z^3) dif z dif y dif x$.
  (Recommended approach: change the order of integration.)

/ 7.:
  Compute the real number $c$ for which
  $bf(F)(x,y,z) = chevron.l 7 cos(x), thin cos(y) cos(2z), thin c sin(y) sin(2z) chevron.r$
  is conservative.
  For that $c$, compute the maximum possible value of a line integral
  $int_(cal(C)) bf(F) dot dif bf(r)$ across all possible choices of some curve $cal(C)$ in $RR^3$.

/ 8.:
  Let $bf(F)(x,y,z) = chevron.l x + e^y + z^3, thin e^x + y + z^3, thin z chevron.r$.
  Let $cal(S)$ be the surface defined by $x^2+y^2=100$ and $7 <= z <= 9$,
  with normal vector oriented outwards (thus $cal(S)$ is the curved part of a cylinder).
  Compute the divergence of $bf(F)$.
  Then compute the flux of $bf(F)$ through $cal(S)$.
  (Recommended approach: add two "lids" to $cal(S)$, calculate flux through the lids by hand,
  then use the divergence theorem.)

Solutions are posted in Chapter 54 of #url("https://web.evanchen.cc/textbooks/lamv.pdf").
]


#pagebreak()

= Solutions draft

== Solution to question 1 (complex numbers)

We'll just find all the answers to $z^3 = -1000 i$ and then identify the relevant one.
In polar form, write
$ z^3 = - 1000 i = 1000 dot (cos 270 degree + i sin 270 degree). $
Take the cube roots with the standard recipe:
the magnitudes should be $root(3, 1000) = 10$
and the arguments should start from $(270 degree) / 3 = 90 degree$
and be spaced $120 degree$ apart.
That is, the three cube roots should be
$ z_1 &= 10 (cos 90 degree + i sin 90 degree) \
  z_2 &= 10 (cos 210 degree + i sin 210 degree) \
  z_3 &= 10 (cos 330 degree + i sin 330 degree). $

Of these three answers, we want the one
whose real and imaginary part are both negative.
Only $z_2$ works; in rectangular form it is
$ z_2 = 10 (- sqrt(3) / 2 - i 1 / 2) = #boxed[$ - 5sqrt(3) - 5 i $] $
(and this is the only possible example).


== Solution to Q2 (matrix eigenvalues)

=== Solution with bare-hands

Given that $2$ is an eigenvalue of $M$,
we should have $det (M - 2 I) = 0$.
Write
$ 0 = det(M - 2 I) = detmat(1 - 2, 1; a, 6 - 2) = detmat(- 1, 1; a, 4)
  = -4 - a ==> #boxed[$ a=  -4 $]. $

Now let's go back to the characteristic polynomial again.
The eigenvalues are those $lambda$ such that
$ 0 = detmat(1 - lambda, 1; -4, 6 - lambda)
  = (1 - lambda)(6 - lambda) + 4 = lambda^2 - 7 lambda + 10. $
We know that $lambda = 2$ is one root of the quadratic;
the other one is $#boxed[$ lambda = 5 $]$.

To get the eigenvector, write $vec(x,y)$ so that we need
$ M vec(x,y) = 5vec(x,y) ==>
  cases((1-5)x + y = 0, -4+(6-5)y=0) ==> y=4x. $
So an eigenvector for $5$ is $#boxed[$ vec(1,4) $]$ (or any nonzero multiple of it).

=== Solution using trace and determinant shortcut

Let $lambda_2$ be the other eigenvalue.
If you happen to remember that the trace is the sum of the eigenvalues,
while the determinant was the product of the eigenvalues,
then this question can be done even more quickly:

$ lambda_2 + 2 = op("Trace") M &= 1 + 6 \
  lambda_2 dot 2 = det M &= detmat(1, 1; a, 6) = 6 - a. $
The first equation implies $lambda_2 = 5$; then the second implies $a = -4$.
The eigenvector is then recovered in the same way as the first solution.

== Solution to Q3 (plane)

We start by determining the equation of the plane through
$P_1 = (b,0,0)$, $P_2 = (0,b,0)$ and $P_3 = (0,0,b)$.
You might be able to guess the equation just by looking,
but if you didn't see it, you could also use the cross product
$ (P_2 - P_1) times (P_3 - P_1)
  &= vec(-b,b,0) times vec(-b,0,b)
  = vec(b^2, b^2, b^2) = b^2 vec(1,1,1). $
Therefore, $vec(1,1,1)$ is a normal vector to the plane,
so the plane's equation should be $x+y+z = "const"$.
The plane should pass through $(b,0,0)$ and so on; hence the plane's equation is
$ x + y + z = b. $

In order for this to also pass through $(2,3,6)$,
we need $b = 2 + 3 + 6 = #boxed[$ 11 $]$.

It remains to calculate the distance from $(0,0,0)$ to the plane $x+y+z=11$.
If you use the point-to-plane formula for this, you get
$ abs(1+2+3-11) / (sqrt(1^2+1^2+1^2)) = #boxed[$ 5/sqrt(3) $]. $

If you didn't remember this formula, you should instead
compute the length of the projection of the vector
$bf(v) = (1,2,3) - (2,3,6) = chevron.l -1,-1,-3 chevron.r$
(you can replace $(2,3,6)$ with any other point on the plane,
like $(0,0,11)$ or similar) along the direction of $bf(n) = chevron.l 1,1,1 chevron.r$.
Doing this by hand gives
$ (bf(v) dot bf(n)) / (|bf(n)|)
  = (chevron.l -1,-1,-3 chevron.r dot chevron.l 1,1,1 chevron.r) / sqrt(3)
  = -5 / sqrt(3) $
like before, although as I've described before,
we're really just repeating the proof of the point-to-plane formula.

== Solution to Q4

Let $f(x,y) = cos(x) + sin(y)$.
The gradient is given by
$ nabla f = chevron.l -sin(x), cos(y) chevron.r. $
So a critical point occurs at any point for which $sin(x) = cos(y) = 0$.
(These are the points where $cos(x) = pm 1$ and $sin(y) = pm 1$.)

=== Saddle point

To identify a saddle point, we compute the double derivatives:
$ f_(x x) &= -cos(x) \
  f_(x y) &= 0 \
  f_(y y) &= -sin(y). $
It's enough to pick any $(x,y)$ for which $f_(x x)$ and $f_(y y)$ have opposite sign.
One example would be $(x,y) = #boxed[$ (0, (3pi)/2) $]$, among many others.
At this value we get $f(0, (3pi)/2) = 0$.

In fact, the complete list of saddle points is given as follows:
whenever $m$ and $n$ are integers where $m+n$ is odd, the point
$ (x,y) = (m pi, (n + 1/2) pi) $
is a saddle point, and these are all saddle points.
The previous example was the special case $m = 0$ and $n = 1$.

The level curve of $f$ is the set of points $(x,y)$ with $cos(x) + sin(y) = 0$,
so in fact every saddle point lies on this level curve.
In @fig-practice-level-saddle, we draw the level curve below in blue, and the saddle points in red.
Since $cos(x) = sin(y)$ whenever $x pm y + pi/2$ is a multiple of $2 pi$,
the level curves are a mesh of lines running through the plane at diagonals.

#figure(
  image("figures/practice-level-saddle.svg", width: auto),
  caption: [The level curve of $f = cos(x) + sin(y) =  0$.
    Saddle points are marked in red, and these are all the saddle points.],
) <fig-practice-level-saddle>


=== Local maximum

An example of a local maximum would be $#boxed[$ 0, pi/2 $]$,
at which $f(0, pi/2) = cos 0 + sin (pi/2) = 2$.
In fact, the level curve of $f(x,y) = 2$ passes through all the local maximums,
which occur only when $cos x = sin y = 1$, meaning $x$ and $y-pi/2$ are integer multiples of $2pi$.
So the level curve of $f$ for the value $2$ contains _only_ a disjointed set of points,
as shown in @fig-practice-level-max.

#figure(
  image("figures/practice-level-max.svg", width: auto),
  caption: [The level curve of $f = cos(x) + sin(y) = 2$, in green.
    Each green point is a local maximum of $f$ (and these are the only local maximums).],
) <fig-practice-level-max>


== Solution to Q5

Let $f(x,y) = x^2 + 2y^2 + 4x$.
Let $cal(R)$ denote the region $x^2 + y^2 <= 9$,
which is 2D, has no limit cases, and boundary $x^2 + y^2 = 9$.
We carry out our optimization recipe.


0. There are no limit cases, but a boundary $x^2 + y^2 = 9$, a circle of radius $3$.

1. First let's find the critical points of $f(x,y,z) = x^2 + 2y^2 + 4x$.
  Write $ nabla f = vec(2x+4, 4y). $
  The only point at which $nabla f = 0$ is $(-2,0)$, at which $ f(-2,0) = -4. $

2. The boundary of $cal(R)$ is $x^2 + y^2 = 9$.
  We use Lagrange multipliers on the boundary, which we denote $cal(S)$,
  with constraint $g(x,y) = x^2+y^2 = 9$.

  0. The new region $cal(S)$ has no boundary and no limit cases.
  1. Let's find the LM-critical points for $f$ on $cal(S)$.
    Take the gradient of $g$ to get
    $ nabla g = vec(2x, 2y). $
    The only point at which $nabla g = bf(0)$ is $x=y=0$ which isn't on $cal(S)$,
    so we don't have to worry about $nabla g = bf(0)$ the case.
    Now we instead solve
    $ vec(2x+4,4y) = lambda vec(2x, 2y). $
    The second equation says
    $ 4y = lambda 2y ==> lambda = 2 " or " y = 0. $
    If $y = 0$, we get the points $(3,0)$ and $(-3,0)$ which we need to check.
    We have
    $ f(3,0) = 21 \
      f(-3,0) = -3. $
    Now suppose instead $lambda = 2$.
    Then $2x+4 = 4x ==> x = 2$, and hence $y = pm sqrt(5)$.
    We check those points
    $ f(2, sqrt(5)) &= 22 \
      f(2, -sqrt(5)) &= 22. $


  2. $cal(S)$ has no boundary to consider.
  3. $cal(S)$ has no limit cases to consider.

3. $cal(R)$ has no limit cases to consider.

Of the five points we've checked, $#boxed[$ f(-2,0) = -4 $]$
and $#boxed[$ f(2, pm sqrt(5)) = 22 $]$ give the optimal values.

== Solution to Q6

The region being integrated over can be succinctly described as
$ cal(R) = { 0 <= x <= y <= z <= 1 }. $
Swap the order of integration so that $z$ is outermost:
$ int_(x=0)^1 int_(y=x)^1 int_(z=y)^1 e^(z^3) dif z dif y dif x
  &= int_(z=0)^1 int_(y=0)^z int_(x=0)^y e^(z^3) dif x dif y dif z \
  &= int_(z=0)^1 e^(z^3) int_(y=0)^z int_(x=0)^y 1 dif x dif y dif z \
  &= int_(z=0)^1 e^(z^3) int_(y=0)^z y dif y dif z \
  &= int_(z=0)^1 e^(z^3) z^2/2 dif y dif z \
  &= 1/6 int_(z=0)^1 e^(z^3) 3z^2 dif y dif z \
  &= 1/6 [e^(z^3)]_(z=0)^1 = #boxed[$ (e-1)/6 $]. $

== Solution to Q7

The curl of $bf(F)$ can be computed as
$ nabla times bf(F)
  = detmat(
    ee_1, ee_2, ee_3;
    partial/(partial x), partial/(partial y), partial/(partial z);
    7 cos(x), cos(y) cos(2z), c sin(y) sin(2z)
  ) = vec(c cos(y) sin(2z) - cos(y) dot (-2sin(2z)), 0, 0) $
which is identically zero only for $#boxed[$ c = -2 $]$.
For that value of $c$, we can recover a potential function $f$ by writing
$ (partial f) / (partial x) &= 7 cos(x) ==> f = 7 sin(x) + C_1(y,z) \
  (partial f) / (partial y) &= cos(y) cos(2z) ==> f = sin(y) cos(2z) + C_2(z,x) \
  (partial f) / (partial z) &= -2 sin(y) sin(2z) ==> f = sin(y) cos(2z) + C_3(x,y). $
Hence, the potential function can be extracted:
$ f(x,y,z) = 7 sin(x) + sin(y) cos(2z). $
For a curve $cal(C)$ starting at $P$ and ending at $Q$, we have
$ int_(cal(C)) f dot dif bf(r) = f(Q) - f(P). $
However, since both the trig functions $sin$ and $cos$ take values in $[-1,1]$,
it's easy to see that $max f = 8$ (for example $f(pi/2, pi/2, 0) = 8$)
while $min f = -8$ (for example $f(-pi/2, -pi/2, 0) = -8$).
Hence the largest possible value of the line integral is $8 - (-8) = #boxed[$ 16 $]$.

== Solution to Q8

The divergence is
$nabla dot bf(F) =
  partial / (partial x)(x + e^y + z^3)
  + partial / (partial y)(e^x + y + z^3)
  + partial / (partial z) z = 1 + 1 + 1 = 3. $

Given $cal(S)$, we add two lids, $cal(S)_"top"$ and $cal(S)_"bottom"$.
The top lid is the flat surface given by $z = 9$ and $x^2+y^2 <= 100$,
with normal vector oriented upwards.
The bottom lid is the flat surface given by $z = 7$ and $x^2+y^2 <= 100$,
with normal vector oriented outwards.
Finally, let $cal(T)$ denote the cylinder $1 <= z <= 2$ and $x^2 + y^2 <= 100$,
which is enclosed by $cal(S)$, $cal(S)_"top"$, $cal(S)_"bottom"$.
Then the divergence theorem states that
$ iiint_(cal(T)) nabla dot bf(F) dif V
  = iint_(cal(S)_("top")) bf(F) dot bf(n) dif S
  + iint_(cal(S)_("bottom")) bf(F) dot bf(n) dif S
  + iint_(cal(S)) bf(F) dot bf(n) dif S. $
The fourth quantity is the flux we want,
so our strategy is to calculate the first three quantities.

The divergence is straightforward because its constant:
$ iiint_(cal(T)) nabla dot bf(F) dif V
  = iiint_(cal(T)) 3 dif V = 3 op("Vol")(cal(T)) = 3 dot 100pi dot 2 = 600 pi $
(the volume of a cylinder with height $2$ and base of area $100pi$).

For the top lid, we recall that for a flat surface parallel to the $x y$-plane,
we have $bf(n) dif S = pm chevron.l 0,0,1 chevron.r dif x dif y$.
For the top lid, we thus have
$ iint_(cal(S)_("top")) bf(F) dot bf(n) dif S
  &= iint_(cal(S)_("top")) chevron.l x+e^y+729, e^x+y+729, 9 chevron.r dot chevron.l 0,0,1 chevron.r dif x dif y \
  &= iint_(cal(S)_("top")) 9 dif x dif y \
  &= 9 op("Area")(cal(S)_("top")) = 900 pi. $
For the bottom lid, we instead have
$ iint_(cal(S)_("bottom")) bf(F) dot bf(n) dif S
  &= iint_(cal(S)_("bottom")) chevron.l x+e^y+343, e^x+y+343, 7 chevron.r dot chevron.l 0,0,-1 chevron.r dif x dif y \
  &= iint_(cal(S)_("bottom")) (-7) dif x dif y \
  &= - 7 op("Area")(cal(S)_("bottom")) = - 700 pi. $
Hence, the quantities in the divergence theorem become
$ 600pi = 900pi - 700pi + iint_(cal(S)) bf(F) dot bf(n) dif S $
so $iint_(cal(S)) bf(F) dot bf(n) dif S = #boxed[$ 400 pi $]$.
