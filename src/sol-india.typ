#import "@local/evan:1.0.0":*

= Solutions to Part India <ch-sol-india>

== Solution to @exer-touchgrass (touch grass)

#recall-thm(<exer-touchgrass>)

Here's a picture of moonlight sailing after having to grade the third midterm.

#figure(
  [
    #image("media/moon1.jpg", width: 60%) \
    #image("media/moon2.jpg", width: 60%)
  ],
  caption: [Moonlight sailing after the third midterm.],
)

If you'd like some more ideas for things to do, follow me on Instagram at
#link("https://www.instagram.com/evanchen.cc/")[\@evanchen.cc].

== Solution to @exer-poster (print a poster)

#recall-thm(<exer-poster>)

Here's a picture of a leftover poster taped up in my room.

#figure(
  image("media/room-poster.jpg", width: 60%),
  caption: [Hanging up a poster in my room.],
)

== Solution to @exer-gravity-div1 (divergence of gravity)

#recall-thm(<exer-gravity-div1>)

Recall that the gravity vector field is given by
$ bf(G) = lr(angle.l
  (-G m x)/((x^2+y^2+z^2)^(3/2)),
  (-G m y)/((x^2+y^2+z^2)^(3/2)),
  (-G m z)/((x^2+y^2+z^2)^(3/2))
  angle.r) $
For brevity, we let $rho = sqrt(x^2+y^2+z^2)$,
$ bf(G) = lr(angle.l (-G m x)/(rho^3), (-G m y)/(rho^3), (-G m z)/(rho^3) angle.r). $
Ignoring the constant factor $G m$, we start by
calculating the derivative of the first component with respect to $x$, that is:
$ (partial)/(partial x) x / rho^3. $
Using the quotient rule
$ (partial) / (partial x) x/rho^3
  = frac((rho^3) (partial) / (partial x) (x) - x (partial) / (partial x) (rho^3), (rho^3)^2) . $
Since $rho^3 = (x^2 + y^2 + z^2)^(3 \/ 2)$, the chain rule gives
$ (partial) / (partial x) (rho^3) = 3 / 2 (x^2 + y^2 + z^2)^(1 \/ 2) dot 2 x = 3 x rho. $
Hence, the quotient rule gives
$ (partial) / (partial x) x/rho^3
  = (rho^3 dot 1 - x dot 3 x rho) / (r^6) = (rho^2 - 3x^2) / rho^5. $
Now the divergence is given by
$ nabla dot bf(G) &=
  -G m ((partial) / (partial x) x/rho^3 + (partial) / (partial x) y/rho^3 + (partial) / (partial x) z/rho^3) \
  &= -G m ((rho^2 - 3x^2) / rho^5 + (rho^2 - 3y^2) / rho^5 + (rho^2 - 3z^2) / rho^5) \
  &= -G m (3rho^2 - 3(x^2+y^2+z^2)) / rho^5 \
  &= 0 $
as claimed.

== Solution to @exer-work-given-angle (work from $45 degree$ angle)

#recall-thm(<exer-work-given-angle>)

Take any parametrization of the curve $cal(C)$, say from $t=0$ to $1$.
The work we seek is then
$ int_(cal(C)) bf(F) dot dif bf(r) = int_(t=0)^(1) bf(F)(bf(r)(t)) dot bf(r)'(t) dif t. $
The point of the problem is that
$bf(F)(bf(r)(t))$ is supposed to have magnitude $5$
and form a $45 degree$ angle with $bf(r)'(t)$.
Hence, if we use the _geometric_ definition of the dot product, we get
$ int_(cal(C)) bf(F) dot dif bf(r) &= int_(t=0)^(1) |bf(F)(bf(r)(t))| |bf(r)'(t)| cos(45 degree) dif t \
  &= int_(t=0)^(1) 5 |bf(r)'(t)| cos(45 degree) dif t \
  &= 5 cos(45 degree)  int_(t=0)^(1) |bf(r)'(t)| dif t. $
But that integral is the arc length of $cal(C)$.
So
$ int_(cal(C)) bf(F) dot dif bf(r)
  = 5 cos(45 degree) dot 7 = 35 cos(45 degree) = #boxed[$ (35 sqrt(2)) / 2 $]. $

== Solution to @exer-consv (checking conservativeness)

#recall-thm(<exer-consv>)

Yes, because
$ (partial)/(partial y) sin(e^x) &= 0 \
  (partial)/(partial x) arctan(y^pi+pi^y) &= 0. $
In general, the point of this exercise is that every vector field of the form
$bf(F)(x,y) = angle.l "stuff only involving" x, "stuff only involving" y angle.r$
is always conservative, because the relevant partial derivatives are both $0$.

== Solution to @exer-work-1 (work exercise)

#recall-thm(<exer-work-1>)

The vector field is conservative, because
$ partial / (partial y) (x^2 - y) = -1 = partial / (partial x) (y^2 - x). $
So the answer is $0$.
(If you didn't notice this at first and tried to use Green's theorem,
you should notice at the moment where the curl turns out to $0$.)

== Solution to @exer-shoelace (the shoelace formula)

#recall-thm(<exer-shoelace>)
Green's theorem states that for a simple closed curve $cal(C)$ enclosing
a region $cal(R)$, we have
$ iint_(cal(R)) ((partial Q) / (partial x) - (partial P) / (partial y)) dif A = oint_(cal(C)) (P dif x + Q dif y) . $
We take $cal(C)$ as the polygon, oriented counterclockwise,
and $cal(R)$ as its interior.
We will chose the vector field
$ bf(F) = vec(0,x) $
so that the 2D scalar curl equals
$ (partial Q) / (partial x) - (partial P) / (partial y)
  = (partial) / (partial x) (x) - (partial) / (partial y) (0) = 1 . $
Thus, Green's theorem gives:
$ op("Area")(cal(P)) = oint_(cal(C)) x dif y . $

Now we evaluate the line integral "manually" across the $n$ sides of the polygon.
As the boundary $cal(C)$ consists of the edges $P_i P_(i + 1)$,
we sum over each edge:
$ oint_(cal(C)) x dif y = sum_(i = 0)^(n-1) int_("From" P_i "to" P_(i + 1)) x dif y . $

Let's parametrize the segment joining $(x_i, y_i)$ to $(x_(i+1), y_(i+1))$
by just the constant speed parametrization taking unit time:
$ bf(r)(t) = angle.l
  (1 - t) x_i + t x_(i + 1),
  (1 - t) y_i + t y_(i + 1)
  angle.r quad 0 <= t <= 1. $
Thus,
$ bf(F)(bf(r))(t) &= vec(0, (1 - t) x_i + t x_(i + 1)) \
  bf(r)'(t) &= vec( x_(i+1) - x_i, y_(i+1) - y_i ) $
so we are integrating the dot product
$ int_("From" P_i "to" P_(i + 1)) x dif y
  &= int_(t=0)^1 vec(0, (1 - t) x_i + t x_(i + 1))
  dot vec( x_(i+1) - x_i, y_(i+1) - y_i ) dif t \
  &= int_(t=0)^1 ((1 - t) x_i + t x_(i + 1)) (y_(i + 1) - y_i) dif t \
  &= (y_(i + 1) - y_i) ( x_i int_(t=0)^1 (1 - t) dif t + x_(i + 1) int_(t=0)^1 t  dif t ) \
  &= (y_(i + 1) - y_i) ( x_i dot 1/2 + x_(i + 1) dot 1/2 ) \
  &= 1/2 (y_(i + 1) - y_i) (x_i + x_(i + 1)) \
  &= (x_i y_(i+1) - x_(i+1) y_i)/2  + (x_(i+1) y_(i+1) - x_i y_i) / 2. $
Summing over all edges, the first term is the desired right-hand side,
while the second term cancels since
$ (x_1 y_1 - x_n y_n) / 2 + (x_2 y_2 - x_1 y_1) / 2
  + (x_3 y_3 - x_2 y_2) / 2 + ... + (x_n y_n - x_(n-1) y_(n-1)) / 2 = 0. $
In other words,
$ sum_(i = 0)^(n-1) int_("From" P_i "to" P_(i + 1)) x dif y
  &= sum_(i = 0)^(n-1) ((x_i y_(i+1) - x_(i+1) y_i)/2  + (x_(i+1) y_(i+1) - x_i y_i) / 2) \
  &= sum_(i = 0)^(n-1) ((x_i y_(i+1) - x_(i+1) y_i)/2) $
and the proof is complete.

== Solution to @exer-flux-triangle (flux across a triangle)

#recall-thm(<exer-flux-triangle>)

We are given a triangle $A B C$ with vertices:
$ A = (- 5 , 0) , quad B = (9 , 0) , quad C = (0 , h) , $
where $C$ is on the positive $y$-axis.
We'll find $h$, after which we can get the length of the perimeter easily.

The vector field is:
$ bf(F) (x , y) = (P , Q) = (x + 7 y^2 , x^2 + 7 y) . $
Let $cal(C)$ be the boundary of that triangle.
Green's theorem gives
$ 672 = oint_(cal(C)) bf(F) dot bf(n) dif s = iint_(cal(R)) ((partial Q) / (partial x) - (partial P) / (partial y)) dif A . $
Computing partial derivatives:
$ (partial P) / (partial x) &= (partial) / (partial x) (x + 7 y^2) = 1 , \
  (partial Q) / (partial y) &= (partial) / (partial y) (x^2 + 7 y) = 7 . $
Thus, the divergence is:
$ nabla dot bf(F) = (partial P) / (partial x) + (partial Q) / (partial y) = 1 + 7 = 8 . $
Hence, we get
$ 672 = iint_(cal(R)) 8 dif A = 8 op("Area")(cal(R)). $
But the area of a triangle is:
$ op("Area")(triangle.stroked.t A B C)
  = 1 / 2 dot upright("base") dot upright("height")
  = 1 / 2 dot 14 dot h = 7 h. $
Substituting this into the integral equation:
$ 8 dot 7 h = 672 . $
Solving for $h$:
$ 56 h = 672 ==> h = 672 / 56 = 12 . $

Hence, we know $C = (0,12)$.

We can then get the perimeter by computing all the side lengths:
$ A B &= lr(|9 - (- 5)|) = 14 \
  B C &= sqrt((9 - 0)^2 + (0 - 12)^2) = sqrt(81 + 144) = sqrt(225) = 15 \
  C A &= sqrt((0 - (- 5))^2 + (12 - 0)^2) = sqrt(25 + 144) = sqrt(169) = 13 . $
Thus, the perimeter is: $14 + 15 + 13 = #boxed[$ 42 $]. $

== Solution to @exer-mt3-butterfly (return of the butterfly)

#recall-thm(<exer-mt3-butterfly>)

Note the butterfly starts at $bf(r)(0) = (0,0)$ and ends at $bf(r)(2 pi) = (0,0)$ as well.

#h3[The short solution to both parts]

The answer is $#boxed[$0$]$ regardless of the vector field $bf(F)$!
Two ways to see this.
- This follows by Green's theorem, because the trajectory $bf(r)$
  cuts a degenerate parallelogram of area zero.
- The butterfly is tracing its own path in reverse, so the part from $0 <= t <= pi/2$
  cancels $pi/2 <= t <= pi$
  while the part from $pi <= t <= 3/2 pi$ cancels $3/2 pi <= t <= 2 pi$.

#h3[Another short way for the first vector field]

The first integral is of the conservative vector field $bf(F) = vec(x, 0)$,
because its 2D scalar curl is $0 - 0 = 0$.
So the fundamental theorem of calculus also implies the answer is $0$,
because the path is a loop.
(If $f$ is a potential function, then the answer should be $f(0,0) - f(0,0) = 0$.
You could compute the potential function $f(x,y) = x^2/2+C$ if you want, but it's not needed.)

#h3[The long way for the second non-conservative field]

In the second part, $bf(F) = vec(y,0)$ is not conservative.
Let's say you didn't come up with the idea in the slick solution.
Then you could still compute the integral manually by taking
$ bf(r)'(t) = angle.l cos(t), cos(t) angle.r $
so the line integral is given by
$ int_(t=0)^(2pi) bf(F)(sin(t), sin(t)) dot bf(r)'(t) dif t
  = int_(t=0)^(2pi) sin(t) cos(t) dif t. $
This integral is $0$; here are many ways to evaluate it.

1. Notice this is actually the same trig integral you got if you evaluated
  for the first line integral manually as well, so the answer should be the same, namely $0$.
2. Notice the contribution from $t$ and $t + pi$ cancel for $0 <= t <= pi$.
3. Another way to evaluate the integral is via the $u$-substitution $u = sin(t)$,
  where $dif u = cos(t) dif t$:
  $ int_(t=0)^(2pi) sin(t) cos(t) dif t = int_(u=sin(0))^(u=sin(2pi)) u dif u = int_0^0 u dif u = 0. $
4. Another way is to use the trig substitution
  $ int_(t=0)^(2pi) sin(t) cos(t) dif t = int_(t=0)^(2pi) sin(2t)/2 dif t = [-cos(2t)/4]_(t=0)^(2pi) = 0. $
5. If you are allergic to trig functions, a fifth approach is to remember that
  line integrals don't depend on the exact parametrization.
  So rather than using $bf(r)(t) = angle.l sin(t), sin(t) angle.r$,
  you could imagine cutting the butterfly's motion into three constant-velocity trajectories:
  - $bf(r)_1(t) = (t,t)$ for $0 <= t <= 1$
  - $bf(r)_2(t) = (1-t,1-t)$ for $0 <= t <= 2$
  - $bf(r)_3(t) = (t-1,t-1)$ for $0 <= t <= 1$.
  If you compute the three line integrals, the sum will also be zero.

== Solution to @exer-mt3-green (standard work and flux)

#recall-thm(<exer-mt3-green>)

This is a cookie-cutter application of Green's theorem (both forms).

For the line integral, use Green's theorem with 2D scalar curl:
$ int_(cal(C)) bf(F) dot dif bf(r)
  &= iint_(x^2+y^2 <= 1) (partial/(partial x)(4x+8y) - partial/(partial y)(x+2y)) dif A \
  &= iint_(x^2+y^2 <= 1) (4-2) dif A \
  &= 2 iint_(x^2+y^2 <= 1) dif A \
  &= #boxed[$ 2 pi $]. $

For the flux, use Green's theorem with divergence:
$ int_(cal(C)) bf(F) dot bf(n) dif s
  &= iint_(x^2+y^2 <= 1) nabla dot bf(F) dif A \
  &= iint_(x^2+y^2 <= 1) ( partial/(partial x)(x+2y) +  partial/(partial y)(4x+8y) ) dif A \
  &= iint_(x^2+y^2 <= 1) (1+8) dif A \
  &= 9 iint_(x^2+y^2 <= 1) dif A \
  &= #boxed[$ 9 pi $]. $

== Solution to @exer-mt3-chvar (region with area $pi$)

#recall-thm(<exer-mt3-chvar>)

Let $cal(R)$ denote the region in the problem.
This is a change of variables problem where
$ u = x + k y \
  v = k x + y $
changes $cal(R)$ into the disk $u^2 + v^2 <= 1/4$ of radius $1/2$.

Let $bf(T)$ denote the corresponding map $(u,v) |-> (x,y)$.
Compute the inverse of the Jacobian
$ J_(bf(T)^(-1)) = mat((partial u) / (partial x), (partial u) / (partial y);
  (partial v) / (partial x), (partial v) / (partial y))
  = mat(1, k; k, 1). $
So
$ det J_(bf(T)) = 1 / (detmat(1, k; k, 1)) = 1/(1-k^2). $
Now, the problem condition tells us
$ pi = iint_(cal(R)) dif x dif y
  = iint_(u^2+v^2 <= 1/4) lr(|1/(1-k^2)|) dif u dif v
  = lr(|1/(1-k^2)|) iint_(u^2+v^2 <= 1/4) dif u dif v
  = lr(|1/(1-k^2)|) dot pi / 4. $
So the equation we are trying to solve is
$ pi = lr(|1/(1-k^2)|) dot pi / 4 <==> k^2 - 1 = pm 1/4 <==> k^2 = 3/4 " or " k^2 = 5/4. $

Hence the answers are $ k = #boxed[$ pm sqrt(3) / 2 " or " pm sqrt(5) / 2 $]. $

== Solution to @exer-mt3-polar (center of mass of wedge)

#recall-thm(<exer-mt3-polar>)

First, we sketch the region.
The condition $x^2 + y^2 <= 9$ represents a circle of radius $3$ centered at the origin.
The inequality $y >= 0$ and $y >= sqrt(3) lr(|x|)$
cuts out a wedge covering the top half of the circle within the angle range
$pi / 3 <= theta <= (2 pi) / (3)$ in polar coordinates.
See @fig-mt3-slice.

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
In conclusion, the center of mass is given by $ (dash(x),dash(y)) = #boxed[$ (0, 6/pi) $]. $

#digression(title: [Digression: the long way for area])[
  If you don't want to do geometry,
  you can manually compute $op("Area")(cal(R))$ by the definition
  $op("Area")(cal(R)) = int_(theta = pi / 3)^((2 pi) / (3)) int_(r = 0)^3 r dif r dif theta$.
  First, integrate with respect to $r$:
  $ int_(r = 0)^3 r dif r = [r^2 / 2]_(r = 0)^3 = 9 / 2 . $
  Then, integrate with respect to $theta$:
  $ A = int_(theta = pi / 3)^((2 pi) / (3)) 9 / 2 dif theta = 9 / 2 ((2 pi) / (3) - pi / 3) = 9 / 2 dot pi / 3 = (3 pi) / (2) . $
]

#figure(
  image("figures/mt3-wedge.svg", width: auto),
  caption: [It's a one-sixth slice of a pizza or something.],
) <fig-mt3-slice>

#digression(title: [Digression: the long way for $overline(x)$])[
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

== Solution to @exer-mt3-consv (recovering $h$)

#recall-thm(<exer-mt3-consv>)

Because $bf(F)$ is conservative, we know the following two partial derivatives must be equal:
$ partial / (partial y) (x y + cos (x)) &= x \
  partial / (partial x) (h(x) + cos(y)) &= h'(x). $
From $h'(x) = x$ we deduce $ h(x) = x^2 / 2 + C $
for some constant $C$.

So we almost know $h$, except we need to use the last piece of information to find $C$.
First, recover a potential function for $bf(F)$ in terms of $C$:
$ f(x,y) = 1/2 x^2  y + sin(x) + sin(y) + C y + C' $
for some constant $C'$ (which is irrelevant).
Then use the fundamental theorem calculus for line integrals:
$ int_(cal(C)) bf(F) dot dif bf(r) &= f(pi, pi) - f(0,0) \
  ==> 0 &= (pi^3/2 + C pi + C') - C' ==> C = -pi^2/2. $
Thus we've completely recovered the function $h$:
$ h(x) = #boxed[$ x^2/2 - pi^2/2 $]. $

== Solution to @exer-mt3-log (integrating $log(sqrt(x)+1)$)

#recall-thm(<exer-mt3-log>)

At face value, this looks like an 18.01 integral,
but we know from 18.01 that this integral is actually measuring the area under some curve;
we denote that region by $cal(R)$, shaded in blue below.
The idea is that, to avoid having to deal with log and square root,
we are going to use horizontal slicing for the region under the curve shown in the figure.

#figure(
  image("figures/mt3-undergraph.svg", width: auto),
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
  &= e^2-2e - (e^2/2 - 2e) - (1/2-2) = #boxed[$ (e^2-3)/2 $]. $

#remark[
  It is also possible to calculate an antiderivative of $log(sqrt(x)+1)$ directly
  by using integration by parts and $u$-substitution, but this process is time-consuming.
  The anti-derivative turns out to equal $-x/2 + sqrt(x) + (x-1)log(sqrt(x)+1) + C$.
]
