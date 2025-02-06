#import "@local/evan:1.0.0":*

= Solutions to Part Golf

== Solution to @exer-slicing-standard (practice with slicing)

#recall-thm(<exer-slicing-standard>)

Let $cal(R)$ be the region bounded by the curves $y = sqrt(x)$ and $y = x^3$.
We wish to compute the integral
$ I = iint_(cal(R)) x^(100) y^(200) dif x dif y . $

To determine the limits of integration,
we find the intersection points by solving $sqrt(x) = x^3$
Squaring both sides gives $x = x^6 ==> x(x^5-1) = 0$, so $x=0$ or $x=1$.
That is, the intersection points are $(0,0)$ and $(1,1)$.
A sketch of the region is shown in @fig-sol-golf-double-sol1.

#figure(
  image("figures/sol-golf-double-sol1.svg", width: auto),
  caption: [The region between $y = sqrt(x)$ and $y = x^3$.],
) <fig-sol-golf-double-sol1>

From the figure, we can describe the region $cal(R)$ with the inequalities
$ 0 <= x^3 <= y <= sqrt(x) <= 1. $

#h3[Integrating with $x$ inside and $y$ outside]

The values of $y$ go from $0$ to $1$.
For each fixed $y$, the values of $x$ range from
$ y^2 <= x <= y^(1\/3) $
so the integral is:
$ I = int_(y = 0)^1 int_(x = y^2)^(y^(1 \/ 3)) x^(100) y^(200) dif x dif y . $
Evaluating the inner integral:
$ int_(x = y^2)^(y^(1 \/ 3)) x^100 dif x = [x^101 / 101]_(x = y^2)^(y^(1\/3))
  = y^(101 \/ 3) / 101 - y^202 / 101 . $
Now, integrating over $y$:
$ I &= int_(y = 0)^1 (y^(101 \/ 3) / 101 - y^202 / 101) y^200 dif y \
    &= 1 / 101 (int_(y=0)^1 y^(701\/3) dif y - int_(y=0)^1 y^(402) dif y) \
    &= 1 / 101 (3/704 - 1/403) = #boxed[$ 5 / 283712 $]. $

#h3[Integrating with $y$ inside and $x$ outside]

The values of $x$ go from $0$ to $1$.
For a fixed $x$, the values of $y$ range from
$ x^3 <= y <= x^(1\/2) $
so the integral is
$ I = int_(x = 0)^1 int_(y = x^3)^(x^(1 \/ 2)) x^(100) y^(200) dif y dif x . $

Evaluating the inner integral:
$ int_(y = x^3)^(sqrt(x)) y^200 dif y = [y^201 / 201]_(y = x^3)^(y = sqrt(x))
  = x^(201\/2) / 201 - x^603 / 201 . $
Now, integrating over $x$:
$ I &= int_(x = 0)^1 x^100 (x^(201\/2) / 201 - x^603 / 201) dif x \
  &= 1/201 (int_(x=0)^1 x^(401\2) dif x - int_(x=0)^1 x^(703) dif x) \
  &= 1/201 (2/403 - 1/704) = #boxed[$ 5 / 283712 $]. $

== Solution to @exer-slicing-mass (center of mass of a region)

#recall-thm(<exer-slicing-mass>)

The region is really similar to the one in the preceding exercise, and can be described as
$ 0 <= x^2 <= y <= sqrt(x) <= 1 $
for the same reason, as shown in @fig-sol-golf-double-sol2.
(It's exactly the same as the last exercise except $x^3$ was changed to $x^2$,
so one just replaces all the $3$'s with $2$'s.)
Note that the region is symmetric around the line $y = x$,
so _a priori_ we should expect our answer to lie on $y = x$ as well.

#figure(
  image("figures/sol-golf-double-sol2.svg", width: auto),
  caption: [The region between $y=sqrt(x)$ and $y=x^2$.],
) <fig-sol-golf-double-sol2>

First, to compute the area of $cal(R)$, we can write
$ op("Area")(cal(R)) = int_(x = 0)^1 int_(y=x^2)^(sqrt(x)) 1 dif y dif x
  = int_(x=0)^1 (sqrt(x) - x^2) dif x
  = [2/3 x^(3\/2) - 1/3 x^3]_(x=0)^1 = 1/3. $

The $x$-coordinate of the center of mass is therefore given by
$ dash(x) = 1 / (op("Area")(cal(R))) int_(cal(R)) x dif A
  &= 1 / (1\/3) int_(x = 0)^1 int_(y=x^2)^(sqrt(x)) x dif y dif x \
  &= 3 int_(x = 0)^1 x (sqrt(x) - x^2) dif x \
  &= 3 [2/5 x^(5/2) - 1/4 x^4]_(x=0)^1 = 9/20. $

As for the $y$-coordinate, we expect $dash(y) = dash(x)$ from the symmetry of the region, and indeed
$ dash(y) = 1 / (op("Area")(cal(R))) int_(cal(R)) y dif A
  &= 1 / (1\/3) int_(x = 0)^1 int_(y=x^2)^(sqrt(x)) y dif y dif x \
  &= 3 int_(x = 0)^1 [y^2/2]_(y=x^2)^(sqrt(x)) dif x \
  &= 3/2 int_(x = 0)^1 (x-x^4) dif x \
  &= 3/2 [1/2 x^(2) - 1/5 x^5]_(x=0)^1 = 9/20. $

Thus, the center of mass of the region is: $ #boxed[$ (9/20, 9/20) $]. $

== Solution to @exer-swapint-fifth (double integral with 5th root)

#recall-thm(<exer-swapint-fifth>)

Writing as a region, this is
$ cal(R) = cases(0 <= y <= 1, y <= x <= root(5, y)). $
The values of $x$ could range anywhere in $0 <= x <= 1$.
For a fixed $x$, the value $y$ needs to satisfy four conditions: $0 <= y <= 1$
and also $x^5 <= y <= x$.
But in fact $ 0 <= x^5 <= y <= x <= 1 $
so we can compress this to just:
$ cal(R) = cases(0 <= x <= 1, x^5 <= y <= x). $
Thus, the new limits of integration become:
$ int_(x = 0)^1 int_(y = x^5)^x (x y^2) / (1 - x^12) dif y dif x $

We now compute the inner integral with respect to $y$:
$ int_(y = x^5)^x y^2 dif y = [y^3 / 3]_(y = x^5)^(y = x) $
Substituting the limits of integration:
$ 1 / 3 (x^3 - (x^5)^3) = 1 / 3 (x^3 - x^15) $

Now substitute this result into the outer integral:
$ int_(x = 0)^1 (x) / (1 - x^12) dot 1 / 3 (x^3 - x^15) dif x $
Simplifying:

$ 1 / 3 int_(x = 0)^1 (x) / (1 - x^12) (x^3 - x^15) dif x
  &= 1 / 3 int_(x = 0)^1 (x^4 - x^16) / (1 - x^12) dif x \
  &= 1/3 int_(x = 0)^1 x^4 dif x \
  &= 1/3 (1/5 - 0) = 1/15. $

== Solution to @exer-chvar-triangle (integral over triangle)

#recall-thm(<exer-chvar-triangle>)

We use the transformation: $ u = x + y , quad v = x / y . $
The region under $(u,v)$ coordinates can be expressed as
$ 0 <= u <= 3, quad 1/2 <= v <= 2. $
This is drawn in @fig-sol-golf-triangle.

#figure(
  image("figures/sol-golf-triangle.svg", width: auto),
  caption: [The triangle with vertices $(0,0)$, $(1,2)$, and $(2,1)$,
    with a change of variables suggested using $u = x+y$ and $v = x/y$],
) <fig-sol-golf-triangle>

This is a case where we want to use the inverse Jacobian
$ det (J_(bf(T)^(-1))) = detmat(
    (partial u)/(partial x), (partial u)/(partial y);
    (partial v)/(partial x), (partial v)/(partial y)
  ) = detmat(
    1, 1;
    1/y, -x/y^2
  ) = -(x+y) / y^2. $
So
$ 1 / (|det (J_(bf(T)^(-1)))|) = y^2 / (x+y). $

Hence, the transformed integral becomes
$
  int_(u=0)^3 int_(v=1/2)^2 (x+y)^2 / (x y) dot y^2 / (x+y) dif v dif u
  &= int_(u=0)^3 int_(v=1/2)^2 y/x dot (x+y) dif v dif u \
  &= int_(u=0)^3 int_(v=1/2)^2 1/v dot u dif v dif u \
  &= (int_(u=0)^3 u dif u)(int_(v=1/2)^2 1/v dif v) \
  &= [u^2/2]_(u=0)^3 dot [log v]_(v=1/2)^2 \
  &= 9/2 dot (log 2 - log (1/2)) = #boxed[$ 9 log 2 $].
$

== Solution to @exer-polar1 (polar integral 1)

#recall-thm(<exer-polar1>)

The limits of integration describe the region bounded by:
- $0 <= x <= 1$,
- $0 <= y <= sqrt(1 - x^2)$.
This corresponds to the quarter-circle in the first quadrant of the unit
disk, given by $x^2 + y^2 <= 1$ with $x >= 0$.

Using the polar coordinate transformations:
$ x = r cos theta , quad y = r sin theta , quad dif x dif y = r dif r dif theta . $
The given region corresponds to:
- $0 <= r <= 1$,
- $0 <= theta <= pi / 2$.
Rewriting the integrand:
$ x y = (r cos theta) (r sin theta) = r^2 cos theta sin theta . $

Hence the integral transforms into:
$ I &= int_(theta = 0)^(pi \/ 2) int_(r = 0)^1 r^2 cos theta sin theta dot r dif r dif theta \
  &= (int_(r=0)^1 r^3 dif r) (int_(theta = 0)^(pi \/ 2) sin(2theta)/2 dif theta) \
  &= [r^4/4]_(r=0)^1 [-cos(2theta)/4]_(theta=0)^(pi\/2) \
  &= 1/4 dot 1/2 = #boxed[$ 1/8 $]. $

== Solution to @exer-polar2 (polar integral 2)

#recall-thm(<exer-polar2>)

In @sec-offset-circle, we have already established that the given region in polar
coordinates is described by:
$ 0 <= r <= 2 cos theta , quad - pi / 2 <= theta <= pi / 2 . $
Using the standard polar transformations:
$ x = r cos theta , quad y = r sin theta , quad dif x dif y = r dif r dif theta , $
the given integrand is just $r$.
$ 1 / sqrt(x^2 + y^2) = 1 / sqrt(r^2) = 1 / r . $
Thus, the integral
becomes:
$ I &= int_(theta = - pi \/ 2)^(pi \/ 2) int_(r = 0)^(2 cos theta) 1 / r dot r dif r dif theta \
  &= int_(theta = - pi \/ 2)^(pi \/ 2) int_(r = 0)^(2 cos theta) dif r dif theta \
  &= int_(theta = - pi \/ 2)^(pi \/ 2) 2 cos theta dif theta \
  &= [2 sin theta]_(theta = - pi \/ 2)^(pi \/ 2) \
  &= #boxed[$ 4 $]. $

== Solution to @exer-polar3 (polar integral 3)

#recall-thm(<exer-polar3>)

This is actually a disguised version of the example in @sec-offset-circle!
That is, the answer is also $32/9$.

To repeat, in @sec-offset-circle the example can be thought of as showing
$ I_1 = iint_((x-1)^2 + y^2 <= 1) sqrt(x^2+y^2) dif x dif y = 32/9. $
Our goal is to argue that
$ I_2 = iint_(x^2+y^2 <= 1) sqrt((x+3/5)^2 + (y+4/5)^2) dif x dif y = #boxed[$ 32/9 $]. $

Note that:
- The first integral $I_1$ is taken over the disk centered at $(1 , 0)$ with radius 1.
  We call this disk $cal(R)_1$.
- The second integral $I_2$ is taken over the unit disk centered at $(0 , 0)$.
  We call this disk $cal(R)_2$.

Observe that the disks $cal(R)_1$ and $cal(R)_2$ are congruent.
Moreover,

- The integrand in $I_1$ is $sqrt(x^2 + y^2)$.
  This measures the distance of each point in $cal(R)_1$ from the origin $O = (0 , 0)$.
  Note that $O$ is a point on the boundary of $cal(R)_1$.
- The integrand in $I_2$ is $sqrt((x + 3 / 5)^2 + (y + 4 / 5)^2)$.
  This measures the distance of each point in $cal(R)_2$ from the origin $P = (-3/5, -4/5)$.
  Note that $P$ is a point on the boundary of $cal(R)_2$.

See the illustration in @fig-sol-golf-polar.

#figure(
  image("figures/sol-golf-polar.svg", width: auto),
  caption: [Illustration of the integrals $I_1$ and $I_2$ of
    from @sec-offset-circle and @exer-polar3, showing they're computing the same thing.],
) <fig-sol-golf-polar>

Since both integrals effectively compute the same function over congruent regions,
the results must be equal.
