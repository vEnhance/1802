#import "@local/evan:1.0.0":*

= Solutions to practice midterm 2 <ch-sol-mt2>

The problem statements are given in @ch-mt1.

== Solution to the butterfly (@prob-mt2p1)

The butterfly’s position in the $x y$-plane is given by:
$ bf(r) (t) = angle.l cos (t) , cos (t) angle.r . $

=== Sketch of the trajectory

We start actually by sketching the trajectory first (even though this was the last part),
since that will make it easier to see what's going on in future parts.
The trajectory described by
$bf(r) (t) = angle.l cos (t) , cos (t) angle.r$ traces out a
straight line in the $x y$-plane because both the $x$- and
$y$-coordinates are equal for all $t$. Specifically, the butterfly’s
motion follows the line $y = x$, with $t in [0 , 2 pi]$ producing
oscillations between $x = 1$ and $x = - 1$.

Here is a sketch of the trajectory:

#figure(
  image("figures/mt2-butterfly.png", width: auto),
  caption: [Butterfly fluttering along the plane.],
)

The trajectory is a straight line from $(1,1)$ to $(- 1 , - 1)$ and back
following the line $y = x$.

=== Speed of the butterfly at $t = pi / 3$

The speed of the butterfly is given by the magnitude of its velocity vector,
which is the derivative of $bf(r) (t)$ with respect to time $t$.

First, compute the velocity $bf(r)'(t)$:
$ bf(r)' (t) = (d) / (dif t) angle.l cos (t) , cos (t) angle.r = angle.l - sin (t) , - sin (t) angle.r . $
(This has direction along the line $y=x$, which is what we expect.)

The speed at any time $t$ is the magnitude of the velocity vector:
$ "Speed" = lr(|bf(r)' (t)|) = sqrt((- sin (t))^2 + (- sin (t))^2) = sqrt(2 sin^2 (t))
  = sqrt(2) lr(|sin (t)|) . $

At $t = pi / 3$, we have: $ sin (pi / 3) = sqrt(3) / 2 . $
Thus, the speed at $t = pi / 3$ is:
$ "Speed" = sqrt(2) dot sqrt(3) / 2 = sqrt(6) / 2 . $

=== Arc length of the butterfly’s trajectory from $t = 0$ to $t = 2 pi$

Note that from the sketch of the trajectory, we can actually find the arc length
with no calculus at all. Indeed, "arc length" is a misnomer because the "arc"
is just two line segments!

From the Pythagorean theorem, distance from $(1,1)$ to $(-1,-1)$ is
$ sqrt((1-(-1))^2 + (1-(-1))^2) = sqrt(4+4) = 2sqrt(2). $
So the total distance is $ 2sqrt(2) + 2sqrt(2) = 4sqrt(2). $

Of course, one could also use the arc length formula, and we show how to do so.
The arc length of the trajectory is given by the integral of the speed:
$ L = int_("start time")^("stop time") lr(|bf(r)' (t)|) dif t . $

We just saw that $lr(|bf(r)' (t)|) = sqrt(2) lr(|sin (t)|)$.
Therefore, the arc length from $t = 0$ to $t = 2 pi$ is:
$ L = int_0^(2 pi) sqrt(2) lr(|sin (t)|) dif t . $

Because of the absolute value,
we can break the integral into two parts.
On the interval $[0 , pi]$, $sin (t) >= 0$, and on the interval $[pi , 2 pi]$, $sin (t) <= 0$, so
$ L = sqrt(2) (int_0^(pi) sin (t) dif t + int_(pi)^(2 pi) - sin (t) dif t) . $

Both integrals are the same, so we compute one and multiply by 2:
$ int_0^pi sin (t) dif t = [- cos (t)]_0^pi = - cos (pi) + cos (0) = 1 + 1 = 2 . $
Thus, the total arc length is:
$ L = sqrt(2) dot 2 dot 2 = 4 sqrt(2) . $

#pagebreak()

== Solution to the level curve (@prob-mt2p2)

The first task is to recover the value of $k$ which wasn't given in the statement.
First, substitute the point $(1 , 2)$ into the function $f (x , y)$:
$ f (1 , 2) = 1^3 + k (2^2) = 1 + 4 k . $
We are told that $f (1 , 2) = 21$, so we set the equation equal to 21:
$ 1 + 4 k = 21 ==> 4 k = 20 ==> k = 5 . $
Thus, the function is:
$ f (x , y) = x^3 + 5 y^2 . $

Now that we know $f$, we can compute the gradient by taking the partial derivatives:
$ nabla f = vec((partial f) / (partial x) , (partial f) / (partial y)) = vec(3x^2 , 10y). $
Now evaluate the gradient at $P = (1 , 2)$:
$ nabla f (1 , 2) = vec( 3 (1)^2 , 10 (2) ) = vec(3 , 20) . $
The gradient is always normal to the tangent line, so the tangent line must be of the form
$ 3 x + 20 y = t $
for some number $t$.
This line passes through $(1,2)$ so we can get
$ t = 3 dot 1 + 20 dot 2 = 43. $
Hence the line requested is
$ 3 x + 20 y = 43. $

#pagebreak()

== Solution to the linear approximation (@prob-mt2p3)

We are given the function: $ f (x , y) = x^(5 y) $ and are asked to
estimate $f (1.001 , 3.001)$ using linear approximation, starting from the point $(1 , 3)$,
at which $ f(1,3) = 1. $

We start by computing $nabla f$.
- To get the partial derivative with respect to $x$, use the power rule and chain rule:
  $ (partial f) / (partial x) = 5 y x^(5 y - 1) . $
- For the partial derivative with respect to $y$, we treat $x$ as a constant:
  $ (partial f) / (partial y) = x^(5 y) log(x) dot 5 . $
Thus, the gradient of $f (x , y)$ is:
$ nabla f (x , y) = ⟨5 y x^(5 y - 1) , 5 x^(5 y) log (x)⟩ . $
The gradient at $(1,3)$ is thus
$ nabla f(1,3) = vec(15,0). $

The linear approximation of $f (1.001 , y)$ near the point $(1 , 3)$ can be
expressed in terms of the gradient dot the displacement:
$ f (1.001 , 3.001) &approx f (1 , 3) + nabla f (1 , 3) dot vec(0.001, 0.001)
  &= 1 + vec(15,0) dot vec(0.001, 0.001) = 1.015. $

#pagebreak()

== Solution to the two-variable function (@prob-mt2p4)

Although this is stated as an 18.02 problem,
it can actually be solved basically only using 18.01 methods.
We'll still present the solution from an 18.02 perspective,
but we'll comment many times on places where just 18.01 methods would have been sufficient.

=== Finding the critical points

To find the critical points, we first compute the gradient.
The partial derivatives are
$ f_x (x , y) &= (partial) / (partial x) (cos (pi x) + y^4 / 4 - y^3 / 3 - y^2) = - pi sin (pi x) . \
  f_y (x , y) &= (partial) / (partial y) (cos (pi x) + y^4 / 4 - y^3 / 3 - y^2) = y^3 - y^2 - 2 y . $
Hence
$ nabla f(x,y) = vec(-pi sin(pi x), y^3 - y^2 - 2 y). $
Setting this equal to $bf(0)$ lets us solve each equation individually:

- $-pi sin(pi x) = 0$ is true whenever $x$ is an integer.
- To solve $y^3 - y^2 - 2 y = 0$,
  factor the equation: $ 0 = y (y^2 - y - 2) = y (y - 2) (y + 1) = 0 . $

So there are infinitely many critical points!
The critical points occur when $x$ is any integer
and $y = -1$, $y = 0$, $y = 2$.

=== Classification using second derivative test

We now classify each of the points using the second derivative test.
Calculate the second derivatives needed:
$ A = f_(x x) (x , y) &= (partial^2 f) / (partial x^2) = - pi^2 cos (pi x) , \
  B = f_(x y) (x , y) &= (partial^2 f) / (partial x partial y) = 0, \
  C = f_(y y) (x , y) &= (partial^2 f) / (partial y^2) = 3 y^2 - 2 y - 2. $

- We have $A = -pi^2$ if $x$ is odd and $A = pi^2$ if $x$ is even.
- We always have $B = 0$.
- We have
  $ C = cases(
    3(-1)^2 - 2(-1) - 2 &= 3 &" if " y = -1,
    3(0)^2 - 2(0) - 2 &= -2 &" if " y = 0,
    3(2)^2 - 2(2) - 2 &= 6 &" if " y = 2.) $

We summarize all six cases in the table below.
For each entry in the table we also compute $A C - B^2$ and then specify the answer
based on the second derivative test.

#figure(
  table(
    columns: 3,
    align: left,
    table.header([],
      [$x = ..., -4, -2, 0, 2, 4 ...$ is even],
      [$x = ..., -3, -1, 1, 3 ...$ is odd]),
    [$y = -1$],
      [$(A,B,C) = (-pi^2,0,3)$ \ $A C - B^2 = -3pi^2 < 0$ gives *saddle pt*],
      [$(A,B,C) = (pi^2,0,3)$ \ $A C - B^2 = 3pi^2 > 0$ gives *local min*],
    [$y = 0$],
      [$(A,B,C) = (-pi^2,0,-2)$ \ $A C - B^2 = 2pi^2 > 0$ gives *local max*],
      [$(A,B,C) = (pi^2,0,-2)$ \ $A C - B^2 = -2pi^2 < 0$ gives *saddle pt*],
    [$y = 2$],
      [$(A,B,C) = (-pi^2,0,6)$ \ $A C - B^2 = -6pi^2 < 0$ gives *saddle pt*],
      [$(A,B,C) = (pi^2,0,6)$ \ $A C - B^2 = 6pi^2 > 0$ gives *local min*],
  ),
  kind: table
) <table-sol-mt2-critical>

=== Another approach without the second derivative test

You can get the same classification by just looking at the given function too.
The point is that the function splits nicely into two halves:
if define the one-variable functions
$ a(x) &:= cos(pi x) \
  b(y) &:= y^4/4 - y^3/3 - y^2 $
then
$ f(x,y) = a(x) + b(y). $
In that case, the following result is true:

- A point $P = (x,y)$ is a critical point of $f(x,y)$ if $x$ is a critical point of $a(x)$
  and $y$ is a critical point of $b(y)$.
- If so then, the point $P$ is...
  - a local minimum of $f$ if $x$ is a local minimum of $a(x)$ and $y$ is a local minimum of $b(y)$.
  - a local maximum of $f$ if $x$ is a local maximum of $a(x)$ and $y$ is a local maximum of $b(y)$.
  - a saddle point otherwise.

If you have a good conceptual understanding of saddle points, this should be obvious.
It's essentially @fig-whysaddle from @sec-saddle-sim.

#figure(
  image("figures/mt2-graph.png", width: auto),
  caption: [The function $f$ is just the sum of two independent functions,
  which can be optimized independently.],
) <fig-sol-mt2-graph>

This gives us the same table as above, since:

- The critical points of $a(x) = cos(pi x)$ are $x = -2, -1, 0, 1, 2, ...$.
  The minimums are the odd integers when the $cos$ value reaches $-1$,
  the maximums are the even integers when the $cos$ value reaches $+1$.

- The critical points of $b(y) = y^4 / 4 - y^3 / 3 - y^2$
  are the roots of $b'(y) = y^3 - y^2 - 2y = y(y+1)(y-2)$,
  which are the same $y = -1, 0, 2$ we saw before.
  See @fig-sol-mt2-graph.
  There are local minimums at $y =-1$ and $y = 2$
  and a local maximum at $y = 0$.

=== The global minimums and maximums

First, we evaluate $f$ on every critical point.
This is easiest to do if we use the $a$ and $b$ notation from before and compute
$
  a("even") &= cos(pi dot "even") = 1 \
  a("odd") &= cos(pi dot "odd") = -1 \
  b(-1) &= (-1)^4/4 - (-1)^3/3 - (-1)^2 = -5/12 \
  b(0) &= (0)^4/4 - (0)^3/3 - (0)^2 = 0 \
  b(2) &= (2)^4/4 - (2)^3/3 - (2)^2 = -8/3
$
Then we get the six values shown in @table-sol-mt2-extremes.
#figure(
  table(
    columns: 3,
    align: left,
    table.header([],
      [$x = ..., -4, -2, 0, 2, 4 ...$ is even],
      [$x = ..., -3, -1, 1, 3 ...$ is odd]),
    [$y = -1$],
      [$f("even", -1) = 1 - 5/12 = 7/12$],
      [$f("odd", -1) = -1 - 5/12 = -17/12$],
    [$y = 0$],
      [$f("even", 0) = 1 + 0 = 1$],
      [$f("odd", 0) = -1 + 0 = -1$],
    [$y = 2$],
      [$f("even", 2) = 1 - 8/3 = -5/3$],
      [$f("odd", 2) = -1 - 8/3 = -11/3$],
  ),
  kind: table,
  caption: [Values of $f$ at the critical points]
) <table-sol-mt2-extremes>

There are no inequality constraints at all, so we just think about limit cases
$x -> pm oo$ or $y -> pm oo$.

When $y -> pm oo$, the quartic $b(y) = y^4 / 4 - y^3 / 3 - y^2$ explodes to infinity.
This implies already there cannot be any global maximum.

In the case where $x -> pm oo$,
the cosine term of $f(x,y)$ will oscillate between $-1$ and $1$, with period $2 pi$.
So there are no new smaller values of $f$ that can be obtained here.

=== Another way to see the global minimums and maximums

Because
$ f(x,y) = a(x) + b(y) $
the global minimum of $f$ should be the sum of the global minimums of $a$ and $b$,
and likewise the global maximum of $f$ should be the sum of the global maximums of $a$ and $b$.
So we could have also just used 18.01 methods on $a$ and $b$ individually,
as in @fig-sol-mt2-graph.
That is:

- Because $min a(x) = -1$ and $min b(y) = - 8/3$, the global minimum is $-11/3$.
- Because $max a(x) = 1$ and $min b(y) = +oo$, there is no global maximum.

Remember, this only works because we could easily divorce $f(x,y)$
into a function in $x$ plus a function in $y$.
For most functions $f(x,y)$ like $x y$ or $e^x sin(y)$,
this approach is not going to fly.

#pagebreak()

== Solution to the constrained optimization (@prob-mt2p5)

Let $f(x,y,z) = x+2y+2z$.
Let $cal(R)$ denote the region $x^2 + y^2 + z^2 <= 100$ (a ball of radius $10$)
and let $cal(S)$ denote the boundary $x^2 + y^2 + z^2 = 100$ (a sphere of radius $10$).
We follow the steps we described in the recipe in LAMV.

0. $cal(R)$ is three-dimensional and has no limit cases but a two-dimensional boundary $cal(S)$.
  (Because of the condition $x^2 + y^2 + z^2 <= 100$ and all the squares being nonnegative,
  none of the variables can go to $pm oo$.)
1. We calculate all the critical points of the objective function $f(x,y,z) = x+2y+2z$.
  The gradient is $ nabla f = vec(1, 2, 2) $
  So there are no critical points, because this gradient is never $0$.
2. The boundary in $cal(S)$ is a sphere, and it cannot easily be handled.
  We pull out Lagrange multipliers and follow the recipe all the way through again.
  0. $cal(S)$ is two-dimensional and has no limit cases or boundary.
  1. We search for LM-critical points by letting $g(x,y,z) = x^2+y^2+z^2$,
    so $cal(S)$ is the level surface $g = 100$.
    Calculate the gradient of $g$:
    $ nabla g = vec(2x, 2y, 2z). $
    Recall that an LM-critical point is one for which $g(P) = 100$ and _either_
    $ nabla f (P) = lambda nabla g (P) " OR " nabla (P) = 0. $
    This gradient $nabla g$ could be $bf(0)$ at $(x,y,z) = (0,0,0)$,
    but this point does not lie on $cal(S)$, so we disregard it.

    In the main case $nabla f = lambda g$, we seek points such that
    $ 1 &= lambda dot 2 x \
      2 &= lambda dot 2 y \
      2 &= lambda dot 2 z. $
    Our strategy is to kill every variable _except_ $lambda$, by writing
    $ x &= 1 / (2 lambda) \
      y &= 1 / (lambda) \
      z &= 1 / (lambda). $
    Plugging this back into the constraint equation $x^2 + y^2 + z^2 = 100$
    and simplifying gives
    $ ((1) / (2 lambda))^2 + (1 / lambda)^2 + (1 / lambda)^2 &= 100 \
    <==> (9) / (4 lambda^2) = 100 \
    <==> lambda^2 = 9 / 400 \
    <==> lambda = pm 3 / 20 . $
    Putting these two values of $lambda$ in gives
    $ (x,y,z) = (10/l, 20/3, 20/3) " and " (x,y,z) = (-10/3, -20/3, -20/3)$
    These are the two LM-critical points.
    Evaluating this gives
    $ f (10 / 3 , 20 / 3 , 20 / 3) = 10 / 3 + 2 dot 20 / 3 + 2 dot 20 / 3 &= 30 \
      f (-10 / 3 , -20 / 3 , -20 / 3) = -10 / 3 + 2 dot -20 / 3 + 2 dot -20 / 3 &= -30. $

  2. There are no boundary cases to consider for $cal(S)$.
  3. There are no limit cases to consider for $cal(S)$.

  In conclusion, the maximum value is $30$ and the minimum value is $-30$,
  at the points $(10/3, 20/3, 20/3)$ and $(-10/3, -20/3, -20/3)$ we found earlier.

3. There are no limit cases to consider for $cal(R)$.

#digression[
  Note that in fact one can note _a priori_ that any maximum or minimum should occur on the sphere.
  One way to see this is that if one takes a point strictly inside $cal(R)$
  like $P = (6,8,0)$, one can always increase the absolute value of $f$ by scaling $P$
  until it lies on the sphere (e.g. $(60, 80, 0)$).
  Hence there is no loss of generality in assuming maximums and minimums lie on $cal(S)$.
  So if one is observant enough they can skip straight to the LM on $cal(S)$,
  ignoring the region $cal(R)$ entirely.
]

#pagebreak()

== Solution to the tangent plane (@prob-mt2p6)

The gradient of the function $f$
$ nabla f = vec(2(x-1), 3(y-1)^2, 4(z-1)^3) $
and so the gradient at the origin is
$ nabla f (0,0,0) = vec(-2, 3, -4). $
The tangent plane $cal(H)$ consists of those vectors which are normal to $vec(-2, 3, -4)$.
This plane is two-dimensional.
So, to find two vectors spanning $cal(H)$,
according to the "buy two get one free" result from
we just need to give any two linearly independent (i.e. not multiples of each other) vectors
which are both perpendicular to $vec(-2, 3, -4)$.

There are many valid choices.
One such example might be $vec(3, 2, 0)$ and $vec(0, 4, 3)$.
These two vectors are clearly not multiples of each other, and
$ vec(-2, 3, -4) dot vec(3,2,0) &= (-2) dot 3 + 3 dot 2 + (-4) dot 0 = 0 \
  vec(-2, 3, -4) dot vec(0,4,3) &= (-2) dot 0 + 3 dot 4 + (-4) dot 3 = 0 $
so they are indeed tangent vectors contained in $cal(H)$.
