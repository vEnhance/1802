#import "@local/evan:1.0.0":*

= Solutions to Part Foxtrot <ch-sol-foxtrot>

== Solution to @exer-crit-2var (critical points of a 2-variable function)

#recall-thm(<exer-crit-2var>)

#h3[Finding the critical points]

The first-order partial derivatives are:
$ f_x = (partial f) / (partial x) = 3 x^2 - 6 y , quad f_y = (partial f) / (partial y) = 6 y^2 - 6 x . $

To find the critical points, we solve the system:
$ 3 x^2 - 6 y = 0 , quad 6 y^2 - 6 x = 0 . $
Rewriting the equations: $ x^2 = 2 y , quad y^2 = x . $
From $y^2 = x$, substitute into $x^2 = 2 y$:
$ (y^2)^2 = 2 y ==> 0 = y (y^3 - 2). $
Hence either $y = 0$ or $y = root(3, 2)$.
These correspond to $x = 0$ and $x = root(3, 4)$.

#h3[Classifying the critical points]

Hence the two critical points are
$ #boxed[$ (x,y) = (0,0) " and " (x,y) = (root(3, 4), root(3, 2)). $] $

To classify them, compute the second-order derivatives.
Then in the notation of @sec-second-deriv,
$ A = f_(x x) = 6 x , quad C = f_(y y) = 12 y , quad B = f_(x y) = - 6 . $

- At $(0 , 0)$, we have $ A C - B^2 = 72 (0) (0) - 36 = - 36 < 0 . $
  So $#boxed[$(0,0)$ is a saddle point]$.

- At $(root(3, 4) , root(3, 2))$, we have
  $ A C - B^2 = 72 (root(3, 4)) (root(3, 2)) - 36 = 108 > 0. $
  Since $A, C > 0$, and $A C - B^2 > 0$,
  it follows $#boxed[$(root(3, 4) , root(3, 2))$ is a local minimum]$.

== Solution to @exer-crit-3var (critical points of a 3-variable function)

#recall-thm(<exer-crit-3var>)

#h3[Finding the critical points]

The first-order partial derivatives are:
$ f_x = (partial f) / (partial x) = 2 x , quad f_y = (partial f) / (partial y) = 3 y^2 , quad f_z = (partial f) / (partial z) = 4 z^3 . $
To find the critical points, we solve the system:
$ 2 x = 0 , quad 3 y^2 = 0 , quad 4 z^3 = 0 . $
Solving for each variable:
$ x = 0 , quad y^2 = 0 arrow.r.double y = 0 , quad z^3 = 0 arrow.r.double z = 0 . $
Thus, the only critical point is: $ (0 , 0 , 0) . $

#h3[Classifying the critical points]

Since this is a $3$-variable function,
we cannot classify it using the second derivative test.
However, one can tell just by looking at the function that it is neither
a local minimum or maximum.
One simple way to do so is to note that for any small $epsilon > 0$ we have

$ f(0, epsilon, 0) &= epsilon^3 > 0 \
  f(0, -epsilon, 0) &= -epsilon^3 < 0 $

In other words, there are always points near the origin $(0,0,0)$ which are
both larger than $f(0,0,0) = 0$ and smaller than $f(0,0,0) = 0$.
Hence $#boxed[$(0,0,0)$ is a saddle point]$.

== Solution to @exer-every-saddle (every point is a saddle point)

#recall-thm(<exer-every-saddle>)

No, it's not possible.

We will prove that the following result:
#thm[
  Suppose $f : RR^2 -> RR$ is a function for which every point is a critical point.
  Then $f$ must be the constant function.
]
In particular, every point of $f$ will be both a local minimum or local maximum.
This means that $f$ has no saddle points at all.

#proof[
  Consider any two points $P_1 = (x_1, y_1)$ and $P_2 = (x_2, y_2)$.
  We prove that $f(x_1, y_1) = f(x_2, y_2)$.

  Define the function $g : [0 , 1] arrow.r RR$ along the line segment
  from $(x_1 , y_1)$ to $(x_2 , y_2)$ by
  $ g (t) = f (x_1 + t (x_2 - x_1) , y_1 + t (y_2 - y_1)) . $
  This function $g$ represents $f$ restricted to the straight-line path between the two points.

  Since $f$ is differentiable, $g$ is also differentiable on $(0,1)$, and the
  derivative of $g$ can be computed using the chain rule:
  $ g' (t) = (partial f) / (partial x) (d x) / (dif t) + (partial f) / (partial y) (d y) / (dif t) . $
  Since $x = x_1 + t (x_2 - x_1)$ and $y = y_1 + t (y_2 - y_1)$, we have
  $ (d x) / (dif t) = x_2 - x_1 , quad (d y) / (dif t) = y_2 - y_1 . $
  Thus,
  $ g' (t) = (partial f) / (partial x) (x_2 - x_1) + (partial f) / (partial y) (y_2 - y_1) . $
  By assumption, every point is a critical point, meaning
  $(partial f) / (partial x) = 0$ and $(partial f) / (partial y) = 0$
  everywhere. Therefore,
  $ g' (t) = 0 quad upright("for all ") t in (0 , 1) . $

  Hence, $g$ must be a constant function.
  So $g(0) = g(1)$ implies $f (x_1 , y_1) = f (x_2 , y_2)$ as needed.
]

== Solution to @exer-lattice-saddle (every lattice point is a saddle point)

#recall-thm(<exer-lattice-saddle>)

#h3[Inventing the function]

The function
$ #boxed[$ f(x,y) = cos((x-y) pi) - cos((x+y) pi) = sin(pi x) sin(pi y) $] $
works.
The idea is that a saddle point occurs if and only if one of these two conditions holds:

- when the cosines reach their maximum value, meaning $x-y$ and $x+y$ are even integers;
- when the cosines reach their minimum value, meaning $x-y$ and $x+y$ are odd integers.

#h3[Verifying the function works]

Inventing the example above (which is one of many) is the main difficulty of the exercise.
For completeness, let's just verify that the guess above does in fact work.
From now on, use $ f (x , y) = sin (pi x) sin (pi y) . $

The first-order partial derivatives are:
$ f_x &= (partial f) / (partial x) = pi cos (pi x) sin (pi y) , \
  f_y &= (partial f) / (partial y) = pi sin (pi x) cos (pi y) . $
To find critical points, we set $f_x = 0$ and $f_y = 0$:
$ pi cos (pi x) sin (pi y) = 0 , quad pi sin (pi x) cos (pi y) = 0 . $
Since $pi != 0$, the equations reduce to:
$ cos (pi x) sin (pi y) = 0 , quad sin (pi x) cos (pi y) = 0 . $
Solving these equations:

- $cos (pi x) = 0$ when $x = m + 1 / 2$ for $m in bb(Z)$.
- $sin (pi y) = 0$ when $y = n$ for $n in bb(Z)$.
- $sin (pi x) = 0$ when $x = m$ for $m in bb(Z)$.
- $cos (pi y) = 0$ when $y = n + 1 / 2$ for $n in bb(Z)$.

A critical point must satisfy both conditions simultaneously.
The only common solutions occur in two cases.

- Each lattice point $(m , n)$, where $m , n$ are integers, is a critical point.
- Each point $(m + 1/2, n + 1/2)$, where $m , n$ are integers, is a critical point.

We classify with the second derivative test.
Compute
$ A &= f_(x x) = - pi^2 sin (pi x) sin (pi y) \
  C &= f_(y y) = - pi^2 sin (pi x) sin (pi y) \
  B &= f_(x y) = pi^2 cos (pi x) cos (pi y) . $

Now we check the cases:

- At any lattice point $(m , n)$, we have $A = C = 0$ and $B = pm pi^2$,
  so $A C - B^2 = -pi^4 < 0$.
  So every lattice point is indeed a saddle point.

- At any point of the form $(m + 1/2, n + 1/2)$, we have $A = C = pm pi^2$ and $B = 0$,
  so $A C - B^2 = pi^4 < 0$.
  Hence there are no saddle points here.

== Solution to @exer-opt-geo (geometry optimization)

#recall-thm(<exer-opt-geo>)

For $P = (x , y)$ we let
$ f (x , y) = P A^2 + P B^2 + P C^2 . $
See @fig-sol-echo-triangle.

#figure(
  image("figures/sol-echo-triangle.svg", width: auto),
  caption: [A triangle $A B C$ and a point $P$ connected to its three vertices],
) <fig-sol-echo-triangle>

We first want to change $f$ into an expression like we're used to.
We do this using the Pythagorean theorem as follows:
$ P A^2 &= (x-0)^2 + (y - 12)^2 = x^2 + y^2 - 24 y + 144 , \
  P B^2 &= (x + 5)^2 + (y-0)^2 = x^2 + 10 x + 25 + y^2 , \
  P C^2 &= (x - 9)^2 + (y-0)^2 = x^2 - 18 x + 81 + y^2 . $
Summing these expressions:
$ f (x , y) &= (x^2 + y^2 - 24 y + 144) + (x^2 + 10 x + 25 + y^2) + (x^2 - 18 x + 81 + y^2) \
  &= 3 x^2 + 3 y^2 - 8 x - 24 y + 250 . $

We are optimizing $f$ over the entire space $cal(R) = RR^2$.
Let's follow the recipe in @sec-recipe-opt-easy:

0. There is no boundary, but we have limit cases if $x -> pm oo$ or $y -> pm oo$.
1. To find the critical points, we compute the partial derivatives:
  $ f_x = (partial f) / (partial x) = 6 x - 8 = 0 &==> x = 4 / 3 .
    f_y = (partial f) / (partial y) = 6 y - 24 = 0 &==> y = 4 . $
  Thus, the only critical point is: $ P = (4 / 3 , 4) . $
2. There are no boundary points to consider.
3. If either $x -> pm oo$ or $y -> pm oo$,
  then the quadratic terms $3 x^2 + 3 y^2$ dominate and cause $f (x , y) -> +oo$.
  Hence $f$ can take arbitrarily large values.

Putting this together, the point $P = (4 / 3 , 4)$ is the unique point minimizing
$P A^2 + P B^2 + P C^2$.

#remark[
  If $A B C$ is replaced by a different triangle,
  it turns out that the best point $P$ is the _center of mass_ of the three points $A$, $B$, $C$.
  In other words, if $A = (x_1, y_1)$, $B = (x_2, y_2)$, $C = (x_3, y_3)$
  the answer will work out to
  $ P = ((x_1 + x_2 + x_3)/3, (y_1 + y_2 + y_3)/3). $
  (This point is called the _centroid_ or _gravity center_ of $A B C$
  and is often denoted by the letter $G$.)
]

== Solution to @exer-opt-lm-sin (sine optimization)

#recall-thm(<exer-opt-lm-sin>)

0. The region $cal(R)$ has boundary whenever $x = 0$ or $y = 0$.
  It also has limit cases when $x -> +oo$ or $y -> +oo$.

1. We find the LM-critical points.
  The gradients are $ nabla f = vec(1,1) $ and $ nabla g = vec(cos(x), cos(y)). $

  From the first two equations, we have:
  $ lambda = 1 / (cos (x)) quad upright("and") quad lambda = 1 / (cos (y)) . $
  Equating these expressions for $lambda$, we get:
  $ frac(1, cos (x)) = frac(1, cos (y)) ==> cos (x) = cos (y) . $
  Thus, we get an LM-critical point whenever
  $ cos(x) &= cos(y) \
    sin(x) + sin(y) &= 1 $
  Note that $sin(x)^2 = 1 - cos(x)^2 = 1 - cos(y)^2 = sin(y)^2$.
  Since $sin(x)+sin(y) = 1 != 0$, we conclude $sin(x) = sin(y) = 1/2$.
  Together with $cos(x) = cos(y)$,
  that means $x$ and $y$ must differ by a multiple of $2 pi$.

  Since we want $x+y$ to be as small as possible, we might as well take $x=y$.
  The smallest $x$ for which $sin(x) = 1/2$ is $x = pi/6$.
  So of all the LM-critical points, the lowest value occurs when
  $ f (pi / 6 , pi / 6) = pi / 6 + pi / 6 = pi / 3 . $

2. In the limit cases if either $x -> +oo$ or $y -> +oo$ then $f -> +oo$.
3. Suppose $x = 0$. Then $sin(y) = 1$.
  So this part of the boundary consists of the points $(0,pi)$, $(0,3pi)$, $(0,5pi)$, ....
  All of these have $x+y >= pi$, so they do worse than the point $(pi/6, pi/6)$ from before.

  Similarly, if $y=0$, we get boundary points $(pi,0)$, $(3pi,0)$, $(5pi,0)$, ....
  Again all of these have $x+y >= pi$, so they do worse than the point $(pi/6, pi/6)$ from before.

In conclusion the minimum possible value occurs at
$ f (pi / 6 , pi / 6) = pi / 3 . $

== Solution to @exer-lm-abs (optimization with absolute value)

#recall-thm(<exer-lm-abs>)

This problem shows a case where $nabla f$ does not exist at certain points:
the derivative of $lr(|x|)$ only exists when $x != 0$.

To avoid this issue, we split into cases based on the sign of the term inside the absolute value.
We will split#footnote[
  If you wanted to, you could split the cases a bit differently.
  For example, you could do $x^2 + y^2 <= 25$ and $x^2 + y^2 > 25$ so the cases don't overlap.
  Or you could split into three cases with $x^2 + y^2 < 25$, $x^2 + y^2 = 25$, $x^2 + y^2 > 25$.
  However, I think doing it with $x^2 + y^2 <= 25$ and $x^2 + y^2 >= 25$ is cleanest,
  so you do not need to consider limit cases when $x^2+y^2$ approaches $25$.
  The boundary $x^2 + y^2 = 25$ is shared, so you only need to do it once.
] into two cases $x^2 + y^2 <= 25$ and $x^2 + y^2 >= 25$.
In each case we execute the procedure.

#h3[Case where $x^2 + y^2 <= 25$]
We follow @sec-recipe-opt-easy.

0. The region $x^2 + y^2 <= 25$ is a two-dimensional region with no limit cases
  but whose boundary is $x^2 + y^2 = 25$.
1. We seek all points with $nabla f = bf(0)$.
  In the region $x^2 + y^2 <= 25$, we have
  $ f (x , y) = 25 - x^2 - y^2 - 3 x - 4 y . $
  Solving $nabla f = bf(0)$ gives
  $ (partial f)/(partial x) &= - 2 x - 3 = 0 , \
    (partial f)/(partial y) &= - 2 y - 4 = 0 . $
  Therefore, it gives the critical point $(x,y) = (- 3 / 2 , - 2)$.
  This point is indeed in the region $x^2 + y^2 < 25$,
  so this is a critical point.
2. We apply Lagrange multipliers (@sec-recipe-lm) on the boundary $x^2 + y^2 = 25$.
  Let $g(x,y) = x^2 + y^2$.
  0. This is a one-dimensional region with no boundary and no limit cases.
  1. We search for all LM-critical points.
    First note that $nabla g$ is never zero on this boundary.
    The system of equations is
    $ - 3 &= lambda dot 2 x , \
    - 4 &= lambda dot 2 y \
    x^2 + y^2 &= 25 . $
    It's clear that $lambda$, $x$, $y$ must be nonzero.
    Hence, the first two equations together imply $x / y = 3 / 4$.
    Hence, we get two critical points $(3,4)$ and $(-3,-4)$ in this case.
  2. There are no boundary points to consider.
  3. There are no limit points to consider.
3. There are no limit cases.

#h3[Case where $x^2 + y^2 >= 25$]
We follow @sec-recipe-opt-easy again.

0. The region $x^2 + y^2 >= 25$ is a two-dimensional region with limit cases
  when $x -> pm oo$ and $y -> pm oo$ but whose boundary is $x^2 + y^2 = 25$.
1. In the region $x^2 + y^2 >= 25$, we have
  $ f (x , y) = x^2 + y^2 - 25 - 3 x - 4 y . $
  Solving $nabla f = bf(0)$ gives
  $ (partial f)/(partial x) &= 2 x - 3 = 0 , \
    (partial f)/(partial y) &= 2 y - 4 = 0 . $
  This gives the point $(3/2, 2)$,
  but this point doesn't lie inside $x^2 + y^2 >= 25$,
  so we don't need to consider it.
2. We need to apply Lagrange multipliers (@sec-recipe-lm) on the boundary $x^2 + y^2 = 25$.
  However, we did this already in the earlier case where $x^2 + y^2 <= 25$.
  So we can just repeat the same calculation verbatim here.
3. When $|x| -> +oo$ or $|y| -> +oo$, the square terms dominate and $f -> +oo$.
  Hence we get that $f$ is bounded above.

#h3[Putting things together]

We are searching for the global minimum of $f$.
Aggregating the critical points, we check
$ f (3 / 2 , 2) &= 25 / 4 , \
  f (3 , 4) &= - 25 , \
  f (- 3 , - 4) = 25 . $
Therefore, the global minimum is $#boxed[$ f(3,4) = -25 $]$.


== Solution to @exer-mt2p1 (butterfly)

#recall-thm(<exer-mt2p1>)

#h3[Sketch of the trajectory]

We start actually by sketching the trajectory first (even though this was the last part),
since that will make it easier to see what's going on in future parts.
See @fig-mt2-butterfly.
The trajectory described by
$bf(r) (t) = chevron.l cos (t) , cos (t) chevron.r$ traces out a
straight line in the $x y$-plane because both the $x$- and
$y$-coordinates are equal for all $t$. Specifically, the butterfly’s
motion follows the line $y = x$, with $t in [0 , 2 pi]$ producing
oscillations between $x = 1$ and $x = - 1$.

#figure(
  image("figures/mt2-butterfly.svg", width: auto),
  caption: [Butterfly fluttering along the plane.
  A few more examples of points in the trajectory are marked in green for illustration,
  but the blue endpoints are the important ones.
  The green points are a little offset to show both parts of the trajectory,
  e.g. $bf(r)(pi/2) = (0,0)$ is drawn a little bit left of where it should be.],
) <fig-mt2-butterfly>

The trajectory is a straight line from $(1,1)$ to $(- 1 , - 1)$ and back
following the line $y = x$.

#h3[Speed of the butterfly at $t = pi / 3$]

The speed of the butterfly is given by the magnitude of its velocity vector,
which is the derivative of $bf(r) (t)$ with respect to time $t$.

First, compute the velocity $bf(r)'(t)$:
$ bf(r)' (t) = (d) / (dif t) chevron.l cos (t) , cos (t) chevron.r = chevron.l - sin (t) , - sin (t) chevron.r . $
(This has direction along the line $y=x$, which is what we expect.)

The speed at any time $t$ is the magnitude of the velocity vector:
$ "Speed" = lr(|bf(r)' (t)|) = sqrt((- sin (t))^2 + (- sin (t))^2) = sqrt(2 sin^2 (t))
  = sqrt(2) lr(|sin (t)|) . $

At $t = pi / 3$, we have: $ sin (pi / 3) = sqrt(3) / 2 . $
Thus, the speed at $t = pi / 3$ is:
$ "Speed" = sqrt(2) dot sqrt(3) / 2 = sqrt(6) / 2 . $

#h3[Arc length of the butterfly’s trajectory from $t = 0$ to $t = 2 pi$]

Note that from the sketch of the trajectory, we can actually find the arc length
with no calculus at all. Indeed, "arc length" is a misnomer because the "arc"
is just two line segments!

From the Pythagorean theorem, distance from $(1,1)$ to $(-1,-1)$ is
$ sqrt((1-(-1))^2 + (1-(-1))^2) = sqrt(4+4) = 2sqrt(2). $
So the total distance is $ 2sqrt(2) + 2sqrt(2) = 4sqrt(2). $

Of course, one could also use the arc length formula, and we show how to do so.
The arc length of the trajectory is given by the integral of the speed:
$ L = int_(t="start time")^("stop time") lr(|bf(r)' (t)|) dif t . $

We just saw that $lr(|bf(r)' (t)|) = sqrt(2) lr(|sin (t)|)$.
Therefore, the arc length from $t = 0$ to $t = 2 pi$ is:
$ L = int_0^(2 pi) sqrt(2) lr(|sin (t)|) dif t . $
#warning[
  Don't forget about the absolute value!
  In general, for real $X$, we have $sqrt(X^2) = |X|$.
  If you forget the absolute value here, you'll end up getting $0$ as the answer,
  which doesn't make sense because the butterfly certainly traveled more than $0$ distance.
  Remember, speed (absolute value of velocity vector) should always be nonnegative.
]

Because of the absolute value,
we can break the integral into two parts.
On the interval $[0 , pi]$, $sin (t) >= 0$, and on the interval $[pi , 2 pi]$, $sin (t) <= 0$, so
$ L = sqrt(2) (int_0^(pi) sin (t) dif t + int_(pi)^(2 pi) - sin (t) dif t) . $
See @fig-abs-sin for an illustration of this integral.

#figure(
  image("figures/mt2-abs-sin.svg", width: auto),
  caption: [The integral $int_0^(2pi) |sin(t)| dif t$ is two copies
  of the first hump $int_0^(pi) sin(t) dif t$ (which doesn't have an absolute value on it).],
) <fig-abs-sin>

Both integrals are the same, so we compute one and multiply by 2:
$ int_0^pi sin (t) dif t = [- cos (t)]_0^pi = - cos (pi) + cos (0) = 1 + 1 = 2 . $
Thus, the total arc length is:
$ L = sqrt(2) dot 2 dot 2 = 4 sqrt(2) . $

== Solution to @exer-mt2p2 (tangent to level curve)

#recall-thm(<exer-mt2p2>)

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

== Solution to @exer-mt2p3 (approximation of $f = x^(5 y)$)

#recall-thm(<exer-mt2p3>)

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

== Solution to @exer-mt2p4 (cosine-quartic critical points)

#recall-thm(<exer-mt2p4>)

Although this is stated as an 18.02 problem,
it can actually be solved basically only using 18.01 methods.
We'll still present the solution from an 18.02 perspective,
but we'll comment many times on places where just 18.01 methods would have been sufficient.

#h3[Finding the critical points]

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
See @fig-mt2-crits.

#figure(
  image("figures/mt2-crits.svg", width: auto),
  caption: [Plot of the critical points of the function in the $x y$-plane as red dots.],
) <fig-mt2-crits>


#h3[Classification using second derivative test]

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

#h3[Another approach without the second derivative test]

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
  image("figures/mt2-graph.svg", width: auto),
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

#h3[The global minimums and maximums]

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

#h3[Another way to see the global minimums and maximums]

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

== Solution to @exer-mt2p5 (LM practice)

#recall-thm(<exer-mt2p5>)

Let $f(x,y,z) = x+2y+2z$.
Let $cal(R)$ denote the region $x^2 + y^2 + z^2 <= 100$ (a ball of radius $10$)
and let $cal(S)$ denote the boundary $x^2 + y^2 + z^2 = 100$ (a sphere of radius $10$).
We follow the steps we described in the recipe in @sec-recipe-opt-easy and @sec-recipe-lm.

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

== Solution to @exer-mt2p6 (tangent plane)

#recall-thm(<exer-mt2p6>)

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
