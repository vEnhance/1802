#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [18.02 Mock Midterm 3],
  author: "Evan Chen",
  date: [13 October 2024],
  maketitle: false,
)


#block[
#show heading: set align(center)
#set heading(numbering: none)

= 18.02 Mock Midterm 3 Instructions

- Don't turn the page until the signal to start is given (6:05pm ET in 1-190 on 13 Nov).

- You have 50 minutes to answer six questions.
  We're not grading anything, so write your solutions anywhere
  (the space below, other loose paper, notebook, iPad, etc.).

- Like the real exam, I suggest not referring to any notes/calculators/etc.

- Solutions are posted in Section 44 of my LAMV book at #url("https://web.evanchen.cc/1802.html").
]

#pagebreak()

#block[
#show heading: set align(center)
#set heading(numbering: none)

= 18.02 Mock Midterm 3 Questions

/ 1.:
  The butterfly from last time is fluttering in the $x y$ plane
  with position $bf(r)(t) = angle.l cos(t), cos(t) angle.r$.
  A wind is given by the vector field
  $bf(F)(x,y) = angle.l x^3, y^5 angle.r$.
  Compute the line integral $int_(t=0)^(2 pi) bf(F) dot dif bf(r)$.

/ 2.:
  Compute the center of mass of the region where $y >= 0$, $y^2 >= 3x^2$, and $x^2+y^2 <= 9$.
  (Assume $rho=1$.)

/ 3.:
  Suppose $h(x)$ is a function for which the vector field
  $bf(F)(x,y) = angle.l x y + cos(x), h(x) + cos(y) angle.r$ is conservative.
  Given $h(0)=1$, recover the function $h(x)$, and find a potential function for $bf(F)$.

/ 4.:
  Let $cal(C)$ denote the unit circle $x^2+y^2=1$ oriented counterclockwise,
  and consider the vector field $bf(F)(x,y) = angle.l x+2y, 4x+8y angle.r$.
  Compute the flux of $bf(F)$ through $cal(C)$.

/ 5.:
  Find all real $k$ for which the region defined by $0 <= k x + y <= 1$ and $0 <= x + k y <= 1$ has area $4$.

/ 6.: Assume $log$ is base $e approx 2.718$. Use any method (recommended: horizontal slicing) to compute
  $ int_(x=0)^((e-1)^2) log(sqrt(x)+1) dif x. $


Solutions are posted in Section 44 of #url("https://web.evanchen.cc/upload/1802/lamv.pdf").
]

#pagebreak()

= Solutions draft
May contain typos/errors/gaps. Still working on it.

#toc

#pagebreak()

== Solution to butterfly reprise

Note that because $ partial / (partial y) (x^3) = 0 = partial / (partial x) (y^5), $
it follows $bf(F)$ is conservative.
Since the butterfly has the same starting and ending point,
the total work must be $ int_(cal(C)) bf(F) dot dif bf(r) = 0. $

#remark[
  Even if $bf(F)$ was not conservative, the answer would still be zero.
  This follows by Green's theorem, because the trajectory $bf(r)$
  cuts a degenerate parallelogram of area zero.
]


#pagebreak()

== Solution to circular wedge

First, we sketch the region.
The condition $x^2 + y^2 <= 9$ represents a circle of radius $3$ centered at the origin.
The inequality $y >= 0$ and $y >= sqrt(3) lr(|x|)$
cuts out a wedge covering the top half of the circle within the angle range
$pi / 3 <= theta <= (2 pi) / (3)$ in polar coordinates.

#figure(
  image("figures/mt3-wedge.png", width: auto),
  caption: [It's a one-sixth slice of a pizza or something.],
)

Switching to polar coordinates, the region in polar coordinates is bounded by:
- $0 <= r <= 3$ (radius of the circle),
- $pi / 3 <= theta <= (2 pi) / (3)$ (angular bounds determined by $y = sqrt(3) x$ and $y = - sqrt(3) x$).

The coordinates of the center of mass are then given by:
$ dash(x) = 1 / (op("Area")(cal(R))) iint_cal(R) x dif A , quad dash(y) = 1 / (op("Area")(cal(R))) iint_cal(R) y dif A . $

- The area can computed by noticing the region is one-sixth of the area of the full circle:
  $ op("Area")(cal(R)) = 1/6 dot (3^2 dot pi) = (3 pi) / 2. $
- We have $dash(x) = 0$ by symmetry around the $y$-axis.
- We need to compute $dash(y)$.
  Use $y = r sin theta$:
  $ dash(y) = iint_cal(R) y dif A = int_(theta = pi / 3)^((2 pi) / (3)) int_(r = 0)^3 r sin theta dot r dif r dif theta = int_(theta = pi / 3)^((2 pi) / (3)) sin theta int_(r = 0)^3 r^2 dif r dif theta . $
  First, we compute
  $ int_(r = 0)^3 r^2 dif r = [r^3 / 3]_(r = 0)^3 = 27 / 3 = 9 . $
  Hence
  $dash(y) = iint_cal(R) y dif A = 9 int_(theta = pi / 3)^((2 pi) / (3)) sin theta dif theta$.
  Integrate $sin theta$ with respect to $theta$:
  $ int_(theta = pi / 3)^((2 pi) / (3)) sin theta dif theta
    = - [cos theta]_(theta = pi / 3)^((2 pi) / (3)) = - cos ((2 pi) / (3)) + cos (pi / 3)
    = - (- 1 / 2) + 1 / 2 = 1 . $
  Thus, $iint_cal(R) y dif A = 9 dot 1 = 9$, and so
  $ dash(y) = 1 / (op("Area")(cal(R))) iint_cal(R) y dif A = 9 / ((3 pi) / 2) = 6 / pi . $
In conclusion, the center of mass is given by $ (dash(x),dash(y)) = (0, 6/pi). $

#digression(title: [Digression: the long way for area])[
  If you don't want to do geometry,
  you can manually compute $op("Area")(cal(R))$ by the definition
  $op("Area")(cal(R)) = int_(theta = pi / 3)^((2 pi) / (3)) int_(r = 0)^3 r dif r dif theta$.
  First, integrate with respect to $r$:
  $ int_(r = 0)^3 r dif r = [r^2 / 2]_(r = 0)^3 = 9 / 2 . $
  Then, integrate with respect to $theta$:
  $ A = int_(theta = pi / 3)^((2 pi) / (3)) 9 / 2 dif theta = 9 / 2 ((2 pi) / (3) - pi / 3) = 9 / 2 dot pi / 3 = (3 pi) / (2) . $
]

#digression(title: [Digression: the long way for $dash(x)$])[
  For comparison, we show what happens if you didn't notice the symmetry and proceed to integrate.
  In polar coordinates, $x = r cos theta$ and $dif A = r dif r dif theta$.
  So:
  $ iint_cal(R) x dif A = int_(r = 0)^3 int_(theta = pi / 3)^((2 pi) / (3))  r cos theta dot r dif r dif theta
    = int_(r = 0)^3 r^2 int_(theta = pi / 3)^((2 pi) / (3)) cos theta  dif theta dif r. $
  However, the inner integral is
  $ int_(theta = pi / 3)^((2 pi) / (3)) cos theta dif theta &= [sin theta]_(theta = pi / 3)^((2 pi) / (3)) \
    &= sin ((2 pi) / (3)) - sin (pi / 3) = sqrt(3) / 2 - sqrt(3) / 2 = 0. $
  So the whole thing is $0$.
]

#pagebreak()

== Solution to vector field

Because $bf(F)$ is conservative, we know the following two partial derivatives must be equal:
$ partial / (partial y) (x y + cos (x)) &= x \
  partial / (partial x) (h(x) + cos(y)) &= h'(x). $
From $h'(x) = x$ we deduce $h(x) = x^2 / 2 + C$ for some constant $C$;
from $h(0) = 1$ we get $C = 1$.
In summary, we have $ h (x) = x^2 / 2 + 1. $

The potential function is given by
$ f(x,y) = 1/2 x^2  y + sin(x) + sin(y) + y + C. $

#pagebreak()

== Solution to counterclockwise circle

This is a cookie-cutter application of Green's theorem
to transform the flux into a 2D divergence integral:
$ int_(cal(C)) bf(F) dot dif bf(n)
  &= iint_(x^2+y^2 <= 1) nabla dot bf(F) dif A \
  &= iint_(x^2+y^2 <= 1) ( partial/(partial x)(x+2y) +  partial/(partial y)(4x+8y) ) dif A \
  &= iint_(x^2+y^2 <= 1) (1+8) dif A \
  &= 9 iint_(x^2+y^2 <= 1) dif A \
  &= 9 pi. $

#pagebreak()

== Solution to area

Let $cal(R)$ denote the region in the problem.
This is a change of variables problem where
$ u = x + k y \
  v = k x + y $
changes $cal(R)$ into the unit square $0 <= u <= 1$ and $0 <= v <= 1$.

Let $bf(T)$ denote the corresponding map $(u,v) |-> (x,y)$.
Compute the inverse of the Jacobian
$ J_(bf(T)^(-1)) = mat((partial u) / (partial x), (partial u) / (partial y);
  (partial v) / (partial x), (partial v) / (partial y))
  = mat(1, k; k, 1). $
So
$ det J_(bf(T)) = 1 / (det mat(1, k; k, 1)) = 1/(1-k^2). $
Now, the problem condition tells us
$ 4 = iint_(cal(R)) dif x dif y
  = int_(u=0)^1 int_(v=0)^1 lr(|1/(1-k^2)|) dif u dif v
  = lr(|1/(1-k^2)|) int_(u=0)^1 int_(v=0)^1 dif u dif v
  = lr(|1/(1-k^2)|) dot 1. $
So the equation we are trying to solve is
$ lr(|1/(1-k^2)|) = 4 <==> k^2 - 1 = pm 1/4 <==> k^2 = 3/4 " or " k^2 = 5/4. $

Hence the answers are $k = pm sqrt(3) / 2$ and $k = pm sqrt(5) / 2$.

#pagebreak()

== Solution to the integral

At face value, this looks like an 18.01 integral,
but we know from 18.01 that this integral is actually measuring the area under some curve;
we denote that region by $cal(R)$, shaded in blue below.
The idea is that, to avoid having to deal with log and square root,
we are going to use horizontal slicing for the region under the curve shown in the figure.

#figure(
  image("figures/mt3-undergraph.png", width: auto),
  caption: [The region $y <= log(sqrt(x)+1)$ for $0 <= x <= (e-1)^2$.],
)

The point is to now rewrite
$ y <= log(sqrt(x)+1) <==> e^y - 1 <= sqrt(x) <==> x >= (e^y-1)^2. $
Hence, we could equally well rewrite the shaded blue region $cal(R)$ as:
$ 0 <= y <= 1 " and " x >= (e^y-1)^2. $
Writing this as a double integral gives
$ op("Area")(cal(R))
  &= int_(y=0)^1 int_(x=(e^y-1)^2)^((e-1)^2) dif x dif y
  = int_(y=0)^1 ((e-1)^2 - (e^y-1)^2) dif y \
  &= e^2-2e - int_(y=0)^1 (e^(2y) - 2e^y) dif y
  = e^2-2e - lr([e^(2y)/2 - 2e^y])_(y=0)^1 \
  &= e^2-2e - (e^2/2 - 2e) - (1/2-2) = (e^2-3)/2. $

#remark[
  It is also possible to calculate an antiderivative of $log(sqrt(x)+1)$ directly
  by using integration by parts and $u$-substitution, but this process is time-consuming.
  The anti-derivative turns out to equal $-x/2 + sqrt(x) + (x-1)log(sqrt(x)+1) + C$.
]
