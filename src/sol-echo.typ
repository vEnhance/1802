#import "@local/evan:1.0.0":*

= Solutions to Part Echo

== Solution to @exer-level-curves (five level curve drawings)

#recall-thm(<exer-level-curves>)

In what follows, $c$ always denotes the value we're drawing the level curve.

/ For $f(x,y) = 3/2 x + y$:
  The level curves of $3/2 x + y$ will be straight lines with slope $-3/2$
  whose $y$-intercept is the point $(0,c)$.
  See @fig-sol-echo-level-1.

/ For $f(x,y) = x y$:
  When $c != 0$, the shape of $x y = c$ is a hyperbola $y = c/x$.
  For the exceptional value $c = 0$, the shape $x y = 0$ is the union of the axes.
  See @fig-sol-echo-level-2.

/ For $f(x,y) = sin(x^2+y^2)$:
  The level curve is only nonempty when $-1 <= c <= 1$.
  For these $c$, we obtain a bunch of concentric circles whose radii $r$ satisfy $sin sqrt(r) = c$.
  For example, when $c = 0$, we get circles of radius $0$, $sqrt(pi)$, $sqrt(2pi)$, and so on.
  See @fig-sol-echo-level-3.

/ For $f(x,y) = e^(y-x^2)$:
  The level curve is only nonempty when $c > 0$.
  The level curve is the parabola $y = x^2 + log(c)$.
  See @fig-sol-echo-level-4.

/ For $f(x,y) = max(x,y)$:
  The curve consists of what look like rotated L-shapes, as shown in the figure.
  See @fig-sol-echo-level-5.

#figure(
  image("figures/sol-echo-level-1.svg", width: auto),
  caption: [Level curves of $f(x,y) = 3/2 x+y$],
) <fig-sol-echo-level-1>
#figure(
  image("figures/sol-echo-level-2.svg", width: auto),
  caption: [Level curves of $f(x,y) = x y$],
) <fig-sol-echo-level-2>
#figure(
  image("figures/sol-echo-level-3.svg", width: auto),
  caption: [Level curves of $f(x,y) = sin(x^2+y^2)$],
) <fig-sol-echo-level-3>
#figure(
  image("figures/sol-echo-level-4.svg", width: auto),
  caption: [Level curves of $f(x,y) = e^(y-x^2)$],
) <fig-sol-echo-level-4>
#figure(
  image("figures/sol-echo-level-5.svg", width: auto),
  caption: [Level curves of $f(x,y) = max(x,y)$],
) <fig-sol-echo-level-5>

== Solution to @exer-level-seven (level curve with seven points)

#recall-thm(<exer-level-seven>)

This is quite tricky. The following function should work:

$ f(x,y) &= 100 + (x^2 + (y-1)^2)(x^2 + (y-2)^2) ... (x^2 + (y-7)^2). $

Then $f = 100$ if only if the product of the seven quadratics we gave was zero,
i.e. we have $x^2 + (y-k)^2 = 0$ for some $k = 1, ..., 7$.
But that can only happen when $(x,y) = (0, k)$.

In other words, this level curve for $100$ consists of only seven points:
$(0,1)$, $(0,2)$, $(0,3)$, $(0,4)$, $(0,5)$, $(0,6)$, and $(0,7)$.

== Solution to @exer-partials (partial derivative practice)

#recall-thm(<exer-partials>)

This is direct calculation and doesn't require any trick.

- For $f(x,y,z) = x / y + y / z + z / x$ we compute $f_x$:
  $ f_x = 1 / y - z / x^2 . $
  For the same reason:
  $ f_y = 1 / z - x / y^2 , quad f_z = 1 / x - y / z^2 . $

- For $f(x,y,z) = sin(x y z)$ we compute $f_x$:
  $ f_x = y z cos (x y z) . $
  For the same reason:
  $ f_y = x z cos (x y z) , quad f_z = x y cos (x y z) . $

- For $f(x,y,z) = x^y + y^z + z^x$ we compute $f_x$:
  $ f_x = y x^(y - 1) + (log z) z^x . $
  For the same reason:
  $ f_y = z y^(z - 1) + (log x) x^y , quad f_z = x z^(x - 1) + (log y) y^z . $

== Solution to @exer-sphere-123 (tangent to sphere)

#recall-thm(<exer-sphere-123>)

The equation of the given sphere is: $ x^2 + y^2 + z^2 = 14 . $
To find the equation of the tangent plane at the point $(1 , 2 , 3)$,
we first compute the gradient of the function
$ F (x , y , z) = x^2 + y^2 + z^2 - 14 . $
The gradient is:
$ nabla F = chevron.l 2 x , 2 y , 2 z chevron.r . $
Evaluating at $(1 , 2 , 3)$:
$ nabla F (1 , 2 , 3) = chevron.l 2, 4, 6 chevron.r. $
Hence the tangent plane should be given by
$ 2 x + 4 y + 6 z = c $
for some number $c$.
In order for this to pass through $(1,2,3)$, we take
$ c = 2 dot 1 + 4 dot 2 + 6 dot 3 = 28. $

Hence the answer is #boxed[$ 2x + 4y + 6z = 28 $].
Or one could write this as $x + 2y + 3z = 14$ if you don't like the unneeded factor of $2$.

== Solution to @exer-level-grad-poss (given level curve is a circle)

#recall-thm(<exer-level-grad-poss>)

#h3[Examples of functions]

For an example, one natural choice for $f (x , y)$ is:
$ f (x , y) = x^2 + y^2 - 11 . $
This satisfies:
$ f (x , y) = - 7 quad "if and only if" quad x^2 + y^2 = 4 , $
which
defines a circle of radius $2$ centered at the origin.
There are other examples, such as
$ f (x , y) = 100(x^2 + y^2) - 407  $
or
$ f (x , y) = e^(x^2 + y^2) - (e^4 + 7)  $
and so on.

#h3[Possible gradients]

For the second part, let $P$ denote the point $(1.2, -1.6)$.
Then $P$ lies on this circle.
However, from high school geometry (no calculus involved),
the tangent to the circle at $P$ is the line $3(x-1.2) + 4(y-1.6) = 0$.
(See @fig-sol-echo-circle-grad.)
The gradient needs to be some perpendicular to this line,
so it must be some vector in the direction of $(1.2, -1.6)$.
That is, $nabla f(1.2, -1.6)$ could be#footnote[
  Technically, one ought to show that every vector could occur for some function,
  but for 18.02 I won't dwell on that.
  Anyone who knows what I'm talking about should be able to fill in this step for me :P
]
*any vector in the same direction as $(3,4)$*.

#figure(
  image("figures/sol-echo-circle-grad.svg", width: auto),
  caption: [The gradient should be perpendicular to the tangent line (green) to the red circle at $P$.],
) <fig-sol-echo-circle-grad>

#h3[Linear approximation]

For the linear approximation step, we have
$ f(1.208, -1.594) approx f(1.2, -1.6) + (0.08, 0.06) dot nabla f(1.2, -1.6). $
But the vectors $(0.08, 0.06)$ and $nabla f(1.2, -1.6)$ are perpendicular.

== Solution to @exer-antigrad-preview (preview of anti-gradients)

#recall-thm(<exer-antigrad-preview>)

For the first three exercises, one just takes the following:

$
  f_1(x,y) &= x^2 / 2 + y^2 / 2  \
  f_2(x,y) &= 50 x^2 + y^2 / 2 \
  f_3(x,y) &= x y.
$

The fourth task is impossible: no such function could exist.
One will see this more clearly in later chapters,
but even directly now, one might be able to realize that from $f_x = 100 y$ one should have
$ f(x,y) = 100 x y + ("stuff with only" y "in it") $
and there's no way one can differentiate that with respect to $y$ and get just $x$.
Again, read @ch-antigrad for more details.

== Solution to @exer-grad-abc (level curve through $(0,d)$)

#recall-thm(<exer-grad-abc>)

The gradient of $f$ is given by
$ nabla f = vec( a e^(x + y) + b e^(x - y),  a e^(x + y) - b e^(x - y) ). $
At the origin $(x,y) = (0,0)$ we get
$ nabla f (0,0) = vec(a+b, a-b). $
The condition that the level curve is tangent to the line $y = 5 x$ at
the origin means the gradient vector $nabla f (0, 0)$ must be a multiple
of the normal vector to $-5x + y = 0$, which is $vec(-5,1)$.
In other words, we should have
$ (a+b)/(a-b) = -5 ==> 3a=2b ==> b = 3/2 a. $

We also know that $c = f(0,0) = f(0,d)$.
We compute
$ f(0,0) &= a e^(0+0) + b e^(0-0) = a + b = a + 3/2 a = 5/2 a \
  f(0,d) &= a e^d + b e^(-d) = (e^d + 3/2 e^(-d)) a. $
As $a != 0$, we conclude
$ e^d + 3/2 e^(-d) = 5/2 <==> (e^d-1)(e^d-3/2) = 0  $
and so $#boxed[$ d = log(3/2) $]$.

== Solution to @exer-antigrad-quad (anti-gradient practice)

#recall-thm(<exer-antigrad-quad>)

We are given the gradient of a function $f (x , y)$:
$ nabla f (x , y) = vec(x^2 + a x y + 2 y^2 + y + 1 , x^2 + x + b x y + y^2 + 2) . $

To compute $a$ and $b$, we compute
$ (partial) / (partial y) (x^2 + a x y + 2 y^2 + y + 1) &= a x + 4 y + 1 \
  (partial) / (partial x) (x^2 + x + b x y + y^2 + 2) &= 2 x + 1 + b y . $
These need to be equal for all $(x,y)$ so we require $#boxed[$ (a,b)=(2,4) $]$.

To recover $f$, we write
$ f (x , y) = int (partial f) / (partial x) dif x
  &= int (x^2 + 2 x y + 2 y^2 + y + 1) dif x \
  &= x^3 / 3 + x^2 y + 2 x y^2 + x y + x + C_1(y). \
  f (x , y) = int (partial f) / (partial y) dif y
  &= int (x^2 + x + 4 x y + y^2 + 2) dif y \
  &= x^2 y + x y + 2 x y^2 + y^3/3 + 2 y + C_2(x). $
Stitching these together to get the final expression for $f (x , y)$ as:
$ f (x , y) = #boxed($ x^3 / 3 + x^2 y + 2 x y^2 + y^3 / 3 + x y + x + 2 y + C $) $
for any constant $C$.
