#import "@local/evan:1.0.0":*

= Spherical coordinates <ch-sph>

In addition to cylindrical coordinates, there's one more system we'll use,
called spherical coordinates.
This chapter defines them and shows how to use them.

#warning(title: [Warning: There are _eight_ competing standards, check your book])[
  Note that there are competing conventions!
  For us, the letter names are going to mean
  $
    rho &:= "distance to" (0,0,0) &quad& "(spelled rho, pronounced like row)" \
    phi &:= "angle down" z" axis" &quad& "(spelled phi, pronounced like fee)" \
    theta &:= "same as in polar coordinates" quad&& "(spelled theta, prounced like thay-tah)"
  $
  and we write them in that order.
  However, depending on your book:
  - The names of $theta$ and $phi$ might be swapped.
    (Also note that the Greek letter $phi$ may be written as $phi.alt$ in different fonts.
    If you use LaTeX, these are `\varphi` and `\phi`.)
  - The order of $theta$ and $phi$ might be swapped (regardless of whether the names change too).
  - $rho$ might be replaced by $r$ instead.
]

== [TEXT] The definition of spherical coordinates

The idea behind spherical coordinates is that the projection of your point $P$ onto the $x y$-plane
will have polar coordinates $(r cos theta, r sin theta, 0)$ for some $r$.
But then rather than using $z$ to lift the point straight up,
you rotate via some angle $phi$, getting a new distance $rho$ such that
$r = rho sin phi$
which we'll use to replace $r$ everywhere in what follows.
See @fig-triple-spherical below.
#figure(
  image("figures/sph-def.svg", width: auto),
  caption: [The diagram for spherical coordinates.],
) <fig-triple-spherical>

Because of the right triangle with angle $phi$, hypotenuse $rho$,
and legs $r$ and $z$, we have
$ r &= rho sin phi \
  z &= rho cos phi. $
Unwinding everything to kill all the $r$'s,
the transition map $(rho, phi, theta) |-> (x,y,z)$ is given by
$
  x &= underbrace(rho sin phi, =r) cos theta \
  y &= underbrace(rho sin phi, =r) sin theta \
  z &= rho cos phi.
$
Just like how I wrote $(r, theta)_"pol"$ for polar if I needed to be more concise,
we'll have the analogous shorthand here:
#definition(title: [Definition of spherical coordinates])[
  We define spherical coordinates by
  $ (rho, phi, theta)_"sph" := (rho sin phi cos theta, rho sin phi sin theta, rho cos phi). $
]
Now, in order to integrate over this, there's supposed to be a change of variables
with some Jacobian.
To get the area scaling factor, we would compute the Jacobian
$
  det J_("spherical") = detmat(
    (partial x) / (partial rho), (partial x) / (partial phi), (partial x) / (partial theta);
    (partial y) / (partial rho), (partial y) / (partial phi), (partial y) / (partial theta);
    (partial z) / (partial rho), (partial z) / (partial phi), (partial z) / (partial theta);
  ).
$
This takes some effort,
so you probably should only do this once in your life and then remember the result.
It works out to
$
  det J_("spherical")
  &=
  detmat(
    sin phi cos theta, rho cos phi cos theta, - rho sin phi sin theta;
    sin phi sin theta, rho cos phi sin theta, rho sin phi cos theta;
    cos phi, - rho sin phi, 0
  ) \
  &=
  cos phi
  detmat( rho cos phi cos theta, - rho sin phi sin theta;
    rho cos phi sin theta, rho sin phi cos theta;)
  + rho sin phi
  detmat(
    sin phi cos theta, - rho sin phi sin theta;
    sin phi sin theta, rho sin phi cos theta;
  ) \
  &=
  cos phi (rho^2 cos phi sin phi) (cos^2 theta + sin^2 theta)
  + rho sin phi (sin^2 phi) (cos^2 theta + sin^2 theta) \
  &= rho^2 sin phi (cos^2 phi + sin^2 phi) \
  &= rho^2 sin phi.
$
I tried to do this calculation during recitation and got stuck at the board;
not the kind of thing I'm good at.
You really don't want to redo this calculation on an exam, so just remember the result.
#memo(title: [Memorize: Scaling factor for spherical coordinates])[
  $ dif V := dif x dif y dif z = rho^2 sin phi dif rho dif phi dif theta. $
]

== [TEXT] The bounds of $phi$

Before talking about the bounds for spherical coordinates,
let me revisit polar coordinates for comparison.

=== The bounds for polar coordinates

In polar (or cylindrical) coordinates, when we considered
$ (r, theta)_"pol" = (r cos theta, r sin theta), $
we usually choose the convention
#eqn[
  $ r >= 0 quad "and" quad 0 <= theta < 2 pi. $
  <eqn-polar-bounds>
]
The thing I want to stress that some thought was put into choosing the interval for $theta$:
the reason we use an interval of length $2 pi$ is because
if you choose a value of $theta$ bigger than $2 pi$,
then the point just "wraps around" to one you already knew; e.g.
$ (r, 2.7 pi )_"pol" = (r, 0.7 pi)_"pol" $
denote the same point.
More generally,
$ (r, theta + 2 pi)_"pol" = (r, theta)_"pol". $

That's why we adopt the convention @eqn-polar-bounds.
When we define a coordinate system $(r, theta)_"pol"$,
we want to make sure that every $(x,y)$ point is given by _exactly_ one pair.
That is, every point should have a coordinate,
but different coordinates should occupy different points.

Hence, to avoid repeating the same point with the same coordinates, the usual convention is
to choose $0 <= theta < 2 pi$, although the convention $-pi < theta <= pi$ works fine too,
as does any interval of length $2 pi$.

#digression(title: [Digression on $r = 0$])[
  The claim that @eqn-polar-bounds lines up perfectly is a white lie:
  the origin $(0,0)$ in $x y$-coordinates can be represented by $(0, theta)_"pol"$
  for every value of $theta$.
  So @eqn-polar-bounds is almost right, except for the one special case $r = 0$
  where $theta$ is indeterminate.
  We will sweep this under the rug and not think about it.
]

=== The bounds for spherical coordinates

Let's go back to spherical coordinates
$ (rho, phi, theta)_"sph" := (rho sin phi cos theta, rho sin phi sin theta, rho cos phi). $
We want to choose a convention for values of $(rho, phi, theta)$ such that
(except for a few degenerate cases that we'll ignore),
every point has exactly one set of coordinates.
The choice that we're going to use is the following.
#memo(title: [Memorize: The convention for spherical coordinate values])[
  When we want to impose a range of values for spherical coordinates
  to avoid repeating points, we will choose the following convention:
  #eqn[
    $
      rho &>= 0 \
      0 &<= phi < pi \
      0 &<= theta < 2 pi \
    $
    <eqn-sph-ranges>
  ]
]
That is, I claim that this choice of values @eqn-sph-ranges
will ensure every point is represented exactly once by $(rho, phi, theta)_"sph"$,
with a small number of exceptions#footnote[
  If you want to know, the exceptions are exactly the $z$-axis,
  where $theta$ can be arbitrary.
  Every other point should only appear once.
]
we ignore.

The $theta$ going from $0$ to $2 pi$ is the same as in polar coordinates.
However, the angle for $phi$ might be a surprise to you;
a common question asked on various forms is:
#question[
  Why does $phi$ only range from $0$ to $pi$?
  What happens if $-pi < phi < 0$ or $pi < phi < 2 pi$?
]

Well, if my claim about @eqn-sph-ranges is true,
that means if I plug in an "illegal" value of $phi$,
into the formula then I should get a point that's already represented.
This is a bit like how $(r, theta + 2 pi)_"pol" = (r, theta)_"pol"$,
but the formula is a bit more complicated.
So we'll illustrate two cases in full to show how to convert the illegal value into a legal one.

#digression(title: [Digression: Other conventions])[
  Remember, all of these are conventions; you should choose one and stick with it,
  so long as it represents every point (not on the $z$-axis) exactly once.
  For example, if you wanted to instead require $rho >= 0$,
  $0 <= phi < 2 pi$, $0 <= theta < pi$, I think that would also work.
]

=== First case: Illegal angle greater than $pi$

In this case, I assert the following equation is true:
#eqn[
  $ (rho, phi + pi, theta)_"sph" = (rho, pi - phi, theta pm pi)_"sph". $
  <eqn-sph-phi-too-big>
]
Here the sign for $theta pm pi$ is arbitrary,
and it's chosen so that $0 <= theta pm pi < 2 pi$ is a legal value.

#figure(
  image("figures/sph-phi-too-big.svg", width: auto),
  caption: [
    Illustrating @eqn-sph-phi-too-big in picture format.
  ],
) <fig-sph-phi-too-big>

Here are two ways to verify @eqn-sph-phi-too-big is true.

/ Algebraic proof (easier):
  We need to verify that the $x$, $y$, $z$ coordinates on both sides are the same:
  $
    rho sin (phi+pi) cos theta &= rho sin (pi-phi) cos (theta pm pi) \
    rho sin (phi+pi) sin theta &= rho sin (pi-phi) sin (theta pm pi) \
    rho cos (phi+pi) &= rho cos (pi-phi).
  $
  But $sin(phi+pi) = -sin(pi-phi)$, $cos(theta pm pi) = -cos theta$,
  $sin(theta pm pi) = -sin(theta)$, and $cos(phi+pi) = cos(pi-phi)$,
  so all the equations are true.

/ Geometric proof (more informative):
  Look at @fig-sph-phi-too-big.
  When the "illegal" value $phi + pi$ is picked for the angle,
  the red arrow ends up going all the way through $O$.
  Hence, the projection of the new point onto the polar circle in blue
  ends up being the antipode $(r, theta pm pi)_"pol"$ rather than $(r, theta)_"pol"$.
  If we then think about the angle from the $+z$ axis to the brown radius $rho$,
  it has changed to the angle $pi - phi$ instead.
  This picture gives a geometric way of seeing why @eqn-sph-phi-too-big is true.

=== Second case: Illegal angle less than zero

This time, I assert the following equation instead:
#eqn[
  $ (rho, -phi, theta)_"sph" = (rho, phi, theta pm pi)_"sph". $
  <eqn-sph-phi-neg>
]
This is actually a bit easier to see than the last case.

#figure(
  image("figures/sph-phi-neg.svg", width: auto),
  caption: [
    Illustrating @eqn-sph-phi-neg in picture format.
  ],
) <fig-sph-phi-neg>

/ Algebraic proof (easier):
  We need to verify that the $x$, $y$, $z$ coordinates on both sides are the same:
  $
    rho sin(-phi) cos theta &= rho sin phi cos (theta pm phi) \
    rho sin(-phi) sin theta &= rho sin phi sin (theta pm phi) \
    rho cos (-phi) &= rho cos phi.
  $
  But $sin(-phi) = -sin(phi)$, $cos(theta pm pi) = -cos theta$,
  $sin(theta pm pi) = -sin(theta)$, and $cos(-phi) = cos phi$,
  so all the equations are true.

/ Geometric proof (more informative):
  Look at @fig-sph-phi-neg.
  This time, all that happens is we take the mirror image through the
  plane formed by the $z$-axis and the line $O P$.

== [TEXT] Examples of using spherical coordinates

Here are two cookie-cutter uses where we have a sphere centered at the origin
and we just integrate over the entire sphere
(so taking $0 <= rho <= R$, $0 <= phi <= pi$ and $0 <= theta <= 2 pi$).

#sample[
  Consider a solid ball of radius $R$. Compute its volume.
]
#soln[
  Placing the ball $cal(T)$ with its center at the origin:
  $ op("Vol")(cal(T)) &= iiint_(cal(T)) 1 dif V \
  &= iiint_(cal(T)) rho^2 sin phi dif rho dif phi dif theta  \
  &= int_(rho=0)^R int_(phi=0)^(pi) int_(theta=0)^(2 pi) rho^2 sin phi dif theta dif phi dif rho \
  &= (int_(rho=0)^R rho^2 dif rho) (int_(phi=0)^(pi) sin phi dif phi) (int_(theta=0)^(2 pi) theta dif theta) \
  &= R^3/3 dot 2 dot (2 pi) = #boxed[$ 4/3 pi R^3 $]. #qedhere $
]

#sample[
  Consider a solid ball of radius $1$.
  Across all points $P$ inside the ball,
  compute the average value of the distance from $P$ to the center.
]
Here, the "average" value of a function $f$ over a solid region $cal(T)$
is defined as $1/(op("Vol")(cal(T))) iiint_(cal(T)) f dif V$.

#soln[
  The sphere has volume $4/3 pi$ as we just saw.
  The only change to what we did before is that rather than integrating $1 dif V$,
  we replace $1$ with the distance:
  $ iiint_(cal(T)) ("distance to" (0,0,0)) dif V
    &= iiint_(cal(T)) rho dif V \
    &= iiint_(cal(T)) rho dot (rho^2 sin phi dif rho dif phi dif theta)  \
    &= int_(rho=0)^1 int_(phi=0)^(pi) int_(theta=0)^(2 pi) rho^3 sin phi dif theta dif phi dif rho \
    &= (int_(rho=0)^1 rho^3 dif rho) (int_(phi=0)^(pi) sin phi dif phi) (int_(theta=0)^(2 pi) theta dif theta) \
    &= 1/4 dot 2 dot (2 pi) = pi. $
  So the average value is
  $ (iiint_(cal(T)) ("distance to" (0,0,0)) dif V) / (op("Vol")(cal(T)))
  = (pi) / (4/3 pi) = #boxed[$ 3/4 $]. #qedhere $
]

== [TEXT] Famous example: offset sphere

Remember the famous example in @sec-offset-circle where
we showed that in polar coordinates, we could draw a circle passing through the origin;
we called it an "offset circle".
There's a 3D analog of this with an offset sphere
where you have a sphere that's sitting on the $x y$-plane.
It's actually pretty much exactly the same.

#todo[write this]

== [TEXT] Spherical coordinates for gravity

Let's go back to the equation for gravity where the components were given by
$
  G_1 &:= G m iiint_(cal(T)) (x delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z \
  G_2 &:= G m iiint_(cal(T)) (y delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z \
  G_3 &:= G m iiint_(cal(T)) (z delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z.
$

I promised that spherical coordinates would make things cleaner.
Let's make good on this promise for $G_3$ and do the change of variables:
$ (z delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z
  &= ((rho cos phi) delta(x,y,z))/(rho^3) (rho^2 sin phi dif rho dif phi dif theta) \
  &= delta(x,y,z) sin phi cos phi  dif rho dif phi dif theta. $

#todo[do some applications of this]

== [EXER] Exercises

#sample[
  Consider a solid ball of radius $1$ and a line $ell$ through its center.
  Across all points $P$ inside the ball,
  compute the average value of the distance from $P$ to $ell$.
]
