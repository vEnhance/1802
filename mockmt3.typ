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

- Don't turn the page until the signal to start is given #todo[time].

- You have 50 minutes to answer six questions.
  We're not grading anything, so write your solutions anywhere
  (the space below, other loose paper, notebook, iPad, etc.).

- Like the real exam, I suggest not referring to any notes/calculators/etc.

- Solutions are posted in Section #todo[?] of my LAMV book at #url("https://web.evanchen.cc/1802.html").
]

#pagebreak()

#block[
#show heading: set align(center)
#set heading(numbering: none)

= 18.02 Mock Midterm 3 Questions

/ 1.:
  Another butterfly is fluttering in the $x y$ plane
  with position $bf(r)(t) = angle.l sin(t), sin(t) angle.r$.
  A wind is also blowing given by the vector field $bf(F)(x,y) = vec( x^2+3, y^4+5 )$.
  Let $cal(C)$ denote the trajectory of the butterfly
  from time $t = 0$ to $t = 2pi$.
  Compute the arc length $int_(cal(C)) dif s$
  and the line integral $int_(cal(C)) bf(F) dot dif bf(r)$.

/ 2.:
  Compute the center of mass of the region where $y >= 0$, $y^2 >= 3x^2$, and $x^2+y^2 <= 9$.
  (Assume $rho=1$.)

/ 3.:
  Suppose $h(x)$ is a function for which the vector field
  $bf(F)(x,y) = vec(x y + cos(x), h(x) + cos(y))$
  is conservative. Recover the function $h(x)$, and find a potential function for $bf(F)$.

/ 4.:
  Let $cal(C)$ denote the unit circle $x^2+y^2=1$ oriented counterclockwise,
  and consider the vector field $bf(F)(x,y) = vec(x+2y, 4x+8y)$.
  Compute the flux of $bf(F)$ through $cal(C)$.

/ 5.:
  Find all $k$ for which the region defined by $0 <= k x + y <= 1$ and $0 <= x + k y <= 1$ has area $1$.

/ 6.:
  Compute $int_0^9 sqrt(sqrt(x)+1) dif x$.

#v(3em)

The solutions to all the problems are now posted in Section 44 of my LAMV book:
#align(center)[
  #url("https://web.evanchen.cc/upload/1802/lamv.pdf").
]
]

#pagebreak()

#part[Solutions draft]
May contain typos/errors/gaps. Still working on it.

#outline()

= Solution

== Sketch the region

First, we sketch the region.
The condition $x^2 + y^2 <= 9$ represents a circle of radius 3
centered at the origin.
The inequality $y >= 0$ and $y >= sqrt(3) lr(|x|)$ describes two lines:
- $y = sqrt(3) x$
- $y = - sqrt(3) x.$
These lines form a wedge covering the top half of the circle within the angle range
$pi / 3 <= theta <= (2 pi) / (3)$ in polar coordinates.

#todo[figure]

== Setup of integral

To simplify integration, switch to polar coordinates:
$ x = r cos theta , quad y = r sin theta . $
The region in polar coordinates is bounded by:
- $0 <= r <= 3$ (radius of the circle),
- $pi / 3 <= theta <= (2 pi) / (3)$ (angular bounds determined by $y = sqrt(3) x$ and $y = - sqrt(3) x$).

Since density is uniform, the mass is proportional to the area.
The area $A$ of the region can be found by integrating in polar coordinates:
$ op("Area")(cal(R)) = int_(theta = pi / 3)^((2 pi) / (3)) int_(r = 0)^3 r dif r dif theta . $
The coordinates of the center of mass $(X , Y)$ are then given by:
$ dash(x) = 1 / (op("Area")(cal(R))) iint_cal(R) x dif A , quad dash(y) = 1 / (op("Area")(cal(R))) iint_cal(R) y dif A . $

== Calculation of area

Geometers may just notice that the region is one-sixth of the area of the full circle,
since it's a $60 degree$ slice.
Hence $ A = 1/6 dot (3^2 dot pi) = (3 pi) / 2. $

#digression(title: [Digression: the long way])[
  Of course, if you don't notice this, you could integrate it too.
  First, integrate with respect to $r$:
  $ int_(r = 0)^3 r dif r = [r^2 / 2]_(r = 0)^3 = 9 / 2 . $
  Then, integrate with respect to $theta$:
  $ A = int_(theta = pi / 3)^((2 pi) / (3)) 9 / 2 dif theta = 9 / 2 ((2 pi) / (3) - pi / 3) = 9 / 2 dot pi / 3 = (3 pi) / (2) . $
]

== Calculation of $x$-coordinate

It is obvious from symmetry that $ dash(x) = 0. $ That's it.

#digression(title: [Digression: the long way])[
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

== Calculation of $y$-coordinate

Use $y = r sin theta$:
$ dash(y) = iint_cal(R) y dif A = int_(theta = pi / 3)^((2 pi) / (3)) int_(r = 0)^3 r sin theta dot r dif r dif theta = int_(theta = pi / 3)^((2 pi) / (3)) sin theta int_(r = 0)^3 r^2 dif r dif theta . $
First, we compute
$ int_(r = 0)^3 r^2 dif r = [r^3 / 3]_(r = 0)^3 = 27 / 3 = 9 . $
Hence
$ dash(y) = iint_cal(R) y dif A = 9 int_(theta = pi / 3)^((2 pi) / (3)) sin theta dif theta . $
Integrate $sin theta$ with respect to $theta$:
$ int_(theta = pi / 3)^((2 pi) / (3)) sin theta dif theta
  = - [cos theta]_(theta = pi / 3)^((2 pi) / (3)) = - cos ((2 pi) / (3)) + cos (pi / 3)
  = - (- 1 / 2) + 1 / 2 = 1 . $
Thus, $ iint_cal(R) y dif A = 9 dot 1 = 9 , $ and so
$ dash(y) = 1 / (op("Area")(cal(R))) iint_cal(R) y dif A = 9 / (3 pi) / (2) = 6 / pi . $

In conclusion, the center of mass is given by $ (dash(x),dash(y)) = (0, 6/pi). $
