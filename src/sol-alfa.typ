#import "@local/evan:1.0.0":*

= Solutions to Part Alfa <ch-sol-alfa>

== Solution to @exer-tsafe

- The expression $(bf(u) dot bf(v)) dot bf(w)$ is a *vector*, since
  $ bf(u) dot bf(v) & = "scalar"\
  "scalar" dot bf(w) & = "vector" $

- The expression $bf(u) dot bf(v) + bf(w)$ is a *type-error* since
  $ bf(u) dot bf(v) & = "scalar" \
  "scalar" + bf(w) & = "undefined (cannot add scalar and vector)". $

- The expression $bf(u) dot (bf(v) + bf(w))$ is a *real number* since
  $ bf(v) + bf(w) & = "vector"\
  bf(u) dot "vector" & = "scalar" $

== Solution to @exer-vectors-dir

We are asked to compute the unit vector along the direction of the vector
$angle.l -0.0008 pi, -0.0009 pi, -0.0012 pi angle.r$.

The point of this example is to emphasize that you can scale
out weird positive constants like $0.0001 pi$;
the vector $ bf(w) = vec(-8, -9, -12) $
points in the same direction.
So it's enough to find the unit vector in the direction of $ bf(w) $ which is
$ 1/(|bf(w)|) bf(w)
  &= 1/sqrt((-8)^2 + (-9)^2 + (-12)^2) vec(-8, -9, -12) \
  &= 1/sqrt(64+81+144) vec(-8, -9, -12) \
  &= 1/sqrt(289) vec(-8, -9, -12) \
  &= 1/17 vec(-8, -9, -12) \
  &= #boxed[$ vec(-8 slash 17, -9 slash 17, -12 slash 17) $]. $
(Note that $angle.l 8/17, 9/17, 12/17 angle.r$ is not a correct answer:
that vector points in the opposite direction.)

== Solution to @exer-vectors-coplanar

We are given four points in $RR^3$, which we name:
$ P_1 &= (0,0,0) \
  P_2 &= (1,0,1) \
  P_3 &= (0,1,2) \
  P_4 &= (1,2,a). $
We need to determine the value of $a$ such that all four points
lie on the same plane.
There are several approaches to this (including ones that use later material);
the one using the material in this chapter is the following:

#idea[
  Four points are coplanar if the volume of the
  parallelepiped formed by the vectors connecting one point to the other
  three is zero. This condition is equivalent to the determinant of the
  matrix formed by these three vectors being zero.
]

Choose $P_1 = (0,0,0)$ as the reference point.
Then, the vectors from $P_1$ to the other points are:
$ bf(v)_1 &= P_2 - P_1 = vec(1, 0,  1) \
  bf(v)_2 &= P_3 - P_1 = vec(0 , 1 , 2) \
  bf(v)_3 &= P_4 - P_1 = vec(1, 2 , a) $
Then construct a $3 times 3$ matrix using these vectors as columns:
$ M = mat(1, 0, 1; 0, 1, 2; 1, 2, a). $
The determinant of $M$ is:
$ det (M) = 1 dot detmat(1, 2; 2, a)
  - 0 dot detmat(0, 2; 1, a)
  + 1 detmat(0, 1; 1, 2). $
Compute each minor determinant:
$ detmat(1, 2; 2, a) &= (1) (a) - (2) (2) = a - 4 \
  detmat(0, 2; 1, a) &= (0) (a) - (2) (1) = - 2 \
  detmat(0, 1; 1, 2) &= (0) (2) - (1) (1) = - 1. $
Substituting back:
$ det M = 1 dot (a - 4) - 0 dot (- 2) + 1 dot (- 1) = a - 4 - 1 = a - 5. $
Hence $det M = 0 <==> #boxed[$ a = 5 $]$.

== Solution to @exer-dot-perp4d

We need the dot product to be zero:
$ 0 &= angle.l 1,2,3,4 angle.r dot angle.l 5,6,7,t angle.r \
  &= 1 dot 5 + 2 dot 6 + 3 dot 7 + 4 dot t \
  &= 38 + 4t ==> #boxed[$ t = -19/2 $]. $

== Solution to @exer-dot-proj

The first part asks to
compute the vector projection of $angle.l 123,456,789 angle.r$
in the direction of $ee_1$.
The answer is just $ #boxed[$ angle.l 123,0,0 angle.r  $]. $
You could get this using the recipe if you wanted,
but if you draw a picture the point is you're just projecting
the vector $angle.l 123, 456, 789 angle.r$ to the $x$-axis,
which gives you its $x$-component.

For the second part, e are given the vectors:
$ bf(v) &= vec(1 , 2 , 3) \
  bf(w) &= vec(- 3000, - 4000, 0) $
and we need to compute the scalar component of $bf(v)$ along $bf(w)$ and
the vector projection of $bf(v)$ along $bf(w)$.

Note that the factor of $-1000$ in $bf(w)$ doesn't matter,
since scaling $bf(w)$ doesn't matter.
We'll keep the $-1000$ around just for illustration reasons,
but in practice an experienced student would just use
$bf(w) = angle.l 3, 4, 0 angle.r$ instead.

We just follow the recipe in @sec-recipe-proj directly.
We first compute the dot product:
$ bf(v) dot bf(w) = (1) (- 3000) + (2) (- 4000) + (3) (0)
  = - 3000 - 8000 + 0 = - 11000 $
The magnitude is
$ |bf(w)| = sqrt((- 3000)^2 + (- 4000)^2 + 0^2) = 5000. $
The scalar component of $bf(v)$ along $bf(w)$ is given by:
$ op("comp")_(bf(w))(bf(v)) = frac(bf(v) dot bf(w), |bf(w)|)
  = (- 11000) / (5000) = - 11/5. $

The vector projection of $bf(v)$ along $bf(w)$ is
given by:
$ op("proj")_(bf(w))(bf(v))
  &= frac(bf(v) dot bf(w), |bf(w)|) (bf(w) / (|bf(w)|))
  &= -11/5 dot vec(-3000, -4000, 0) / 5000 \
  &= -11/5 dot vec(-3 slash 5, -4 slash 5, 0) \
  &= #boxed[$ vec(33 slash 25, 44 slash 25, 0) $]. $

== Solution to @exer-dot-reverse

We are given the vector: $ bf(w) = angle.l 3 , 4 angle.r. $
We need to find all unit vectors
$bf(v) = angle.l x , y angle.r$ in $bb(R)^2$ such that $bf(v) dot bf(w) = 3$.

(You might already guess one of the solutions ---
$bf(w) = angle.l 1,0 angle.r $ obviously works ---
but we'll pretend we didn't notice that.)

(Geometrically, we expect there to be two solutions:
if $theta$ is the angle between the two vectors,
we need $cos theta = 3/5$,
and so there should be two vectors that work.
See @fig-sol-alfa-dot-reverse for a picture.)

#figure(
  image("figures/sol-alfa-dot-reverse.svg", width: auto),
  caption: [The two answers to @exer-dot-reverse],
) <fig-sol-alfa-dot-reverse>

Translating the givens algebraically,
we have the following system of equations:
$ bf(v) dot bf(w) = 3 &==> 3 x + 4 y = 3 \
  |bf(v)| = 1 &== > x^2 + y^2 = 1 $

From the dot product condition, solve for $x$:
$ 3 x + 4 y = 3 ==> x = (3 - 4 y) / (3) $

Substitute $x = (3 - 4 y) / (3)$ into $x^2 + y^2 = 1$:
$ ((3 - 4 y) / (3))^2 + y^2 &= 1 \
  (3 - 4 y)^2 / 9 + y^2 &= 1 \
  (9 - 24 y + 16 y^2) / (9) + y^2 &= 1 \
  (9 - 24 y + 16 y^2 + 9 y^2) / (9) &= 1 \
  (25 y^2 - 24 y + 9) / (9) &= 1 \
  25 y^2 - 24 y &= 0 \
  y (25 y - 24) &= 0. $
Hence either $y = 0$ or $y = 24/25$.

- If $y = 0$ we get $x = frac(3 - 4 (0), 3) = 1$.
  Thus, the first unit vector is: $bf(v)_1 = angle.l 1 , 0 angle.r$.
- If $y = 24 / 25$ we get
  $ x = frac(3 - 4 (24 / 25), 3) = (3 - 96 / 25) / (3)
  = (75 / 25 - 96 / 25) / (3) = (- 21) / (25) dot 1 / 3 = - 7 / 25. $
  Thus, the second unit vector is:
  $bf(v)_2 = angle.l -7 / 25 , 24 / 25 angle.r$.

In conclusion the answer is
$ #boxed[$ angle.l 1,0 angle.r " and " lr(angle.l -7/25, 24/25 angle.r) $]. $
See @fig-sol-alfa-dot-reverse for a picture of the two answers.

== Solution to @exer-planes-cube

We are given that a cube in $RR^3$
has two of its faces lying on the planes
$ x + 2 y + 3 z &= 4 \
  5 x + 6 y + k z &= 7 $
and we need to find $k$.

The main observation is this:
#idea[
  The faces of the cube have orthogonal normal vectors.
]
And the normal vectors to the two planes are:
$ bf(n)_1 = angle.l 1 , 2 , 3 angle.r
  bf(n)_2 = angle.l 5 , 6 , k angle.r. $
For the planes to be perpendicular, their normal vectors must satisfy:
$ 0 &= bf(n)_1 dot bf(n)_2 \
  &= (1) (5) + (2) (6) + (3) (k) = 5 + 12 + 3 k = 17 + 3 k. $
Solving for $k$ gives $#boxed[$ k = -17/3 $]$.

== Solution to @exer-planes-sandwich

We are given two parallel planes in $RR^3$:
$ "Plane" Pi_1 : quad 3 x + 4 y + 12 z &= - 1 \
  "Plane" Pi_2 : quad 3 x + 4 y + 12 z &= 1000 $
and a point $P$ such that the distance from $P$ to $Pi_1$ is $42$.
We need to compute the possible distances $d$ from $P$ to the plane $Pi_2$.
See @fig-sol-alfa-plane-sandwich.
The idea is that the planes are parallel, so there really should just
be two possible answers.

#figure(
  image("figures/sol-alfa-plane-sandwich.svg", width: auto),
  caption: [A cartoon showing the planes $Pi_1$ and $Pi_2$
    and couple possible locations for the point $P$.],
) <fig-sol-alfa-plane-sandwich>

To do the algebra, first observe that (parallel) planes $Pi_1$ and $Pi_2$
have the same normal vector:
$ bf(n) = angle.l 3 , 4 , 12 angle.r $
which has $|bf(n)| = sqrt(3^2+4^2+12^2) = 13$.

Now to compute the distance between $Pi_1$ and $Pi_2$,
we consider an arbitrary point $(x_0, y_0, z_0)$ on $Pi_2$
(meaning $3x_0 + 4y_0 + 12z_0 = 1000$)
and find the distance from it to $Pi_1$.
According to the recipe in @sec-distance-plane, it equals
$ "distance from" (x_0, y_0, z_0) "to" Pi_1
  &= (|3x_0 + 4y_0 + 12z_0 + 1|) / (|bf(n)|) \
  &= (|1000 + 1|) / 13 = 77. $
Hence the answers are $d = 77 pm 42$, that is
$#boxed[$ d = 35 $]$ or $#boxed[$ d = 119 $]$.

#remark[
  If you don't have the idea of looking at the distance
  between $Pi_1$ and $Pi_2$, you can still solve the problem
  by applying the recipe in @sec-distance-plane directly to $P$.
  Indeed, suppose $P = (x_1, y_1, z_1)$.
  Then
  $ 42 = op("dist")(P, Pi_1) &= (|3x_1 + 4y_1 + 12z_1 + 1|) / (|bf(n)|) \
    d = op("dist")(P, Pi_2) &= (|3x_1 + 4y_1 + 12z_1 - 1000|) / (|bf(n)|) $
  The first equation tells us that
  $ 3x_1 + 4y_1 + 12z_1 = pm 42 dot 13 - 1. $
  The second equation tells us that
  $ d = (|(pm 42 dot 13 - 1) - 1000|) / 13
    = (|pm 42 dot 13 - 1001|) / 13
    = |pm 42 - 77| $
  and this gives the same answers.
]
