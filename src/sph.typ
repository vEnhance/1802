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
  + rho^2 sin phi (sin^2 phi) (cos^2 theta + sin^2 theta) \
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
(except for a few degenerate cases that we'll ignore)
every point has exactly one set of coordinates.
The choice that we're going to use is the following.
#memo(title: [Memorize: The convention for spherical coordinate values])[
  When we want to impose a range of values for spherical coordinates
  to avoid repeating points, we will choose the following convention:
  #eqn[
    $
      rho &>= 0 \
      0 &<= phi <= pi \
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
  &= (int_(rho=0)^R rho^2 dif rho) (int_(phi=0)^(pi) sin phi dif phi) (int_(theta=0)^(2 pi) dif theta) \
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
    &= (int_(rho=0)^1 rho^3 dif rho) (int_(phi=0)^(pi) sin phi dif phi) (int_(theta=0)^(2 pi) dif theta) \
    &= 1/4 dot 2 dot (2 pi) = pi. $
  So the average value is
  $ (iiint_(cal(T)) ("distance to" (0,0,0)) dif V) / (op("Vol")(cal(T)))
  = (pi) / (4/3 pi) = #boxed[$ 3/4 $]. #qedhere $
]

== [TEXT] Famous example: offset sphere

Recall the famous example in @sec-offset-circle where we showed that in polar coordinates,
we could draw a circle passing through the origin;
we called it an "offset circle".
There's a 3D analog of this with an offset sphere
where you have a sphere that's sitting on the $x y$-plane.
It's actually pretty much exactly the same.

#sample[
  Let $cal(T)$ denote the solid ball of radius $1$ centered at $(0,0,1)$.
  Express the region $cal(T)$ in spherical coordinates.
]

#figure(
  [
    #image("figures/polar-offset.svg", width: auto)
    #image("figures/sph-offset.svg", width: auto)
  ],
  caption: [
    The sketch of $(x-1)^2 + y^2 <= 1$ from @fig-polar-offset
    is drawn along with a 3D version:
    the solid ball $x^2 + y^2 + (z-1)^2 <= 1$,
    which is a unit ball centered at $(0,0,1)$
    and lying above and tangent to the $x y$-plane at $(0,0,0)$.
    It corresponds to $rho <= 2 cos phi$.
  ],
) <fig-sph-offset>


#soln[
  Like in @sec-offset-circle,
  we can do either an algebra approach or a geometric one.

  / Geometric approach:
    See @fig-sph-offset.
    All the points of the sphere lie in the half-space $z >= 0$
    which is described as requiring $0 <= phi <= pi/2$.
    The value of $theta$ is irrelevant by rotational symmetry,
    and can be anything from $0$ to $2 pi$.
    So we need to figure out how $rho$ relates to $phi$.

    Let $O = (0,0,0)$ and $A = (0,0,2)$.
    Let $P$ be a point on the surface of the sphere.
    Like before, we have
    $ angle P = 90 degree, quad O A = 2, quad "and" angle A O P = phi. $
    So the surface of the sphere are those points for which $rho = 2 cos phi$.
    And the points _inside_ the ball are $0 <= rho <= 2 cos phi$, accordingly.

  / Algebraic approach:
    The $x y z$ coordinates of the ball are
    $ x^2 + y^2 + (z-1)^2 <= 1. $
    Recall the spherical coordinates transformation:
    $ x = rho sin phi cos theta \, quad y = rho sin phi sin theta \, quad z = rho cos phi . $
    Substituting these into the sphere's equation:
    $ (rho sin phi cos theta)^2 + (rho sin phi sin theta)^2 + (rho cos phi - 1)^2 <= 1 . $
    Expand and simplify:
    $ 1 &>= rho^2 sin^2 phi cos^2 theta + rho^2 sin^2 phi sin^2 theta + (rho cos phi - 1)^2 \
      &= rho^2 sin^2 phi (cos^2 theta + sin^2 theta) + (rho cos phi - 1)^2 \
      &= rho^2 sin^2 phi + (rho cos phi - 1)^2 \
      &= rho^2 sin^2 phi + rho^2 cos^2 phi - 2 rho cos phi + 1 \
      &= rho^2 (sin^2 phi + cos^2 phi) - 2 rho cos phi + 1 \
      &= rho^2 - 2 rho cos phi + 1. $
    Rearranging, this gives
    $ 0 &>= rho^2 - 2 rho cos phi = rho(rho  - 2 cos phi) \
      <==> 0 &<= rho <= 2 cos phi. $
    In particular this requires $cos phi >= 0$ i.e. $phi <= pi/2$.

  In conclusion, the answer is $cal(R)$ in polar coordinates is exactly
  $ #boxed[$ 0 <= theta < 2 pi " and " 0 <= phi <= pi/2 " and " rho <= 2 cos alpha $]. #qedhere $
]

The analogous famous exercise in 3D:
#sample[
  Let $cal(T)$ denote the solid ball of radius $1$ centered at $(0,0,1)$.
  Calculate $ iiint_(cal(T)) sqrt(x^2+y^2+z^2) dif x dif y dif z. $
]
#soln[
  As before, if we try to use $x y z$ integration it's a disaster,
  but spherical coordinates are great because
  $ rho = sqrt(x^2 + y^2 + z^2). $
  We just saw that $cal(T)$ is given in spherical coordinates according to
  $0 <= phi <= pi/2$, $0 <= theta < 2pi$, $0 <= rho <= 2 cos phi$.
  Thus, the integral becomes:
  $ iiint_(cal(T)) rho dif V
    &= iiint_(cal(T)) rho^3 sin phi dif rho dif phi dif theta \
    &= int_(theta=0)^(2 pi) int_(phi=0)^(pi / 2) int_(rho=0)^(2 cos phi)
      rho^3 sin phi dif rho dif phi dif theta \
    &= int_(theta=0)^(2 pi) int_(phi=0)^(pi / 2)
      sin phi [rho^4 / 4]_(rho=0)^(2 cos phi) dif phi dif theta \
    &= int_(theta=0)^(2 pi) int_(phi=0)^(pi / 2)
      sin phi dot (4 cos^4 phi) dif phi dif theta \
    &= 4 int_(theta=0)^(2 pi) [ -1/5 cos^5 phi]_(phi=0)^(pi / 2) dif theta \
    &= 4 int_(theta=0)^(2 pi) 1/5 dif theta \
    &= #boxed[$ (8pi) / 5 $]. #qedhere $
]

== [TEXT] Spherical coordinates for gravity

Let's go back to the equation for gravity where the components were given by
$
  G_1 &:= G m iiint_(cal(T)) (x delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z \
  G_2 &:= G m iiint_(cal(T)) (y delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z \
  G_3 &:= G m iiint_(cal(T)) (z delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z.
$

I didn't do any examples last section because using $x y z$ coordinates
when you have $(x^2+y^2+z^2)^(3/2)$ is just way too annoying.
However, in spherical coordinates, the equations become much more manageable.
For example, the one for $G_3$ reads:
#eqn[
  $ G_3 &= G m iiint_(cal(T)) (z delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z \
    &= G m iiint_(cal(T)) ((rho cos phi) delta(x,y,z))/(rho^3) (rho^2 sin phi dif rho dif phi dif theta) \
    &= G m iiint_(cal(T)) delta(x,y,z) sin phi cos phi dif rho dif phi dif theta. $
  <eqn-sph-G3>
]
Let's see it in action with an offset sphere.

#sample[
  Suppose $cal(T)$ is a metal ball of radius $1$ of constant unit density,
  and $P$ is a point of mass $m$ on its surface.
  Calculate the magnitude of the force of gravity exerted on the point $P$.
]

#soln[
  We use the offset sphere again: we pick coordinates so that $P = (0,0,0)$
  (so the origin is the point $P$, _not_ the center of $cal(T)$).
  The center of $cal(T)$ will instead be at $(0,0,1)$.
  Then by symmetry, we have $G_1 = G_2 = 0$, and @eqn-sph-G3 just says
  $ G_3 = G m iiint_(cal(T)) sin phi cos phi dif rho dif phi dif theta $
  after setting the density to $1$.

  Then we can put in the bounds of integration for the offset sphere:
  $ G_3
    &= G m int_(theta=0)^(2 pi) int_(phi=0)^(pi / 2) int_(rho=0)^(2 cos phi)
    sin phi cos phi dif rho dif phi dif theta \
    &= G m int_(theta=0)^(2 pi) int_(phi=0)^(pi / 2) (2 cos phi) dot
    sin phi cos phi dif phi dif theta \
    &= 2 G m int_(theta=0)^(2 pi) int_(phi=0)^(pi / 2) cos^2 phi sin phi dif phi dif theta \
    &= 2 G m int_(theta=0)^(2 pi)
    lr([-1/3 cos^3 phi])_(phi = 0)^(pi/2) dif theta \
    &= 2 G m int_(theta = 0)^(2 pi) 1/3 dif theta \
    &= (4 pi G m) / 3.
  $
  In other words, in the coordinate system we chose, gravity is given by
  $ bf(G) = lr(angle.l 0, 0, (4 pi G m)/3 angle.r). $
  The magnitude is $|bf(G)| = #boxed[$ (4 pi G m) / 3 $]. $
]

== [EXER] Exercises

#exer[
  Consider a solid ball of radius $1$ and a line $ell$ through its center.
  Across all points $P$ inside the ball,
  compute the average value of the distance from $P$ to $ell$.
  (The average is defined as
  $1/(op("Vol")(cal(T))) iiint_(cal(T)) d(P) dif V$,
  where $d(P)$ is the distance from $P$ to $ell$.)
]

#exer[
  Suppose $cal(T)$ is a solid metal hemisphere of radius $1$ of constant unit density,
  and $P$ is a point of mass $m$ at the center of the base of the hemisphere.
  Calculate the magnitude of the force of gravity exerted on the point $P$.
]
