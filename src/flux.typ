#import "@local/evan:1.0.0":*

= Flux <ch-flux>

We now discuss (3D) flux, the final type of vector field integral that we haven't seen yet.
This is the final cell in the poster @poster-stokes that we haven't met yet.

#figure(
  box(image("figures/flux-cut.svg", width: auto), stroke: 1pt),
  caption: [The flux integral for a surface circled in our poster @poster-stokes.],
)

This chapter will be pretty reminiscent of @ch-work.
We'll start by giving a "bare-hands" definition of the flux through a parametrized surface.
It will be usable, but pretty cumbersome, so in the next chapter @ch-divthm
we'll immediately try to find ways to shortcut it.
For 18.02, the methods available to you will be

- Bare-hands parametrization (covered here)
  - Even here, magic formulas can save you a lot of work --- see @table-surfcross-2.
- Shortcut: Transforming to a surface area integral (covered in @sec-flux-to-surf)
- Shortcut: The divergence theorem, by converting to a 3D volume integral (covered in the next chapter @ch-divthm)

== [TEXT] The definition of flux using bare-hands parametrization

#definition(title: [Definition of flux])[
  Let $bf(r)(u,v) : cal(R) -> RR^3$ parametrize an oriented surface $cal(S)$ in $RR^3$.
  The flux of a vector field $bf(F) : RR^3 -> RR^3$ through $cal(S)$ is defined by
  $ iint_(cal(R)) bf(F)(bf(r)(u,v)) dot
    ((partial bf(r))/(partial u) times (partial bf(r))/(partial v)) dif u dif v. $
]
(We'll explain what "oriented" means in the next section.)
#typesig[
  Flux requires two inputs: an _oriented surface_ $cal(S)$
  and a _vector field_ $bf(F)$.
]

Yes, there's that hideous cross product again.
Naturally, people have shorthand to make this easier to swallow: this time either
$ iint_(cal(S)) bf(F) dot dif bf(S) = iint_(cal(S)) bf(F) dot bf(n) dif S $
is used to sweep everything under the carpet.
That is, $dif bf(S)$ and $bf(n) dif S$ are both shorthands for the longer
$(partial bf(r))/(partial u) times (partial bf(r))/(partial v) dif u dif v$.
We'll usually prefer $bf(n) dif S$ in this book.

I promised you back in the surface area chapter (@ch-scalint) that at some point
you'd need the whole cross product and not just its magnitude, and here we are!
In fact, the absolute value being gone is in some sense an _improvement_: I would argue
$lr(angle.l - (partial f) / (partial x), - (partial f) / (partial y), 1 angle.r)$
is less messy than $sqrt(1 + ((partial f) / (partial x))^2 + ((partial f) / (partial y))^2)$.

We'll do example calculations in a moment, but let me first talk about how to think about this,
and also explain what the adjective "oriented".

== [TEXT] Aquatic interpretation of flux

Flip back to @fig-work-dot for a moment.
Back when we were talking about the work integral
$bf(F)(bf(r)(t)) dot bf(r)'(t)$,
I told you to visualize the work as adding the dot products of the force vectors
with tangent vectors.

The interpretation here is similar to 2D flux.
You should imagine the surface $cal(S)$ as some membrane in the water;
then the flux measures the rate at which water moves through it.

To make this picture complete, I need to tell you about orientation.
Remember, back when we had work integrals,
a curve $cal(C)$ wasn't just a bunch of points;
we also had to tell you which point was the "start" and which one was the "stop".
In other words, work integrals operate on a curve with a _direction_.

Something similar happens with flux integrals over surfaces:
in addition to the actual points,
we need to specify an _orientation_.
To be more precise, at every point $P$ of the surface $cal(S)$,
the cross product from our parametrization could point in one of two opposite directions.
#definition(title: [Definition of orienting a surface])[
  To _orient_ the surface $cal(S)$ is to specify, at each point,
  which way you want the cross product of your parametrization to point.
]

#figure(
  image("figures/flux-cross-sign.svg", width: auto),
  caption: [The normal vector from before, and its negation.
    Note that when we swap $u$ and $v$,
    the vector flips the other way to the negative.
    Hence when parametrizing a surface, the order of $u$ and $v$ induces an orientation on the surface.
  ],
) <fig-flux-cross-sign>

Algebraically, this corresponds to choosing the _order of $u$ and $v$_;
as if you flip the order of the two parameters it will negate the entire cross product:
$ (partial bf(r))/(partial u) times (partial bf(r))/(partial v)
  = - ((partial bf(r))/(partial v) times (partial bf(r))/(partial u)). $
Hence the flux will get negated too.
This sign issue is disorienting because it wasn't present for work,
where "start to stop" was pretty easy to think about; we'll give more examples momentarily.

Going back to our new flux integral, we need to visualize the dot products
$ iint_(cal(R)) bf(F) dot ((partial bf(r))/(partial u) times (partial bf(r))/(partial v)) dif u dif v. $
The $bf(F)$ is still the force vector,
and as we describe earlier,
the vector $ (partial bf(r))/(partial u) times (partial bf(r))/(partial v) $
represents a normal vector to the surface at each point.
We draw this in @fig-flux-in-field.

#figure(
  image("figures/flux-in-field.svg", width: auto),
  caption: [
    Picture of a parametrized surface sitting in a vector field $bf(F)$.
    At each point, we take the dot product
    of the vector field $bf(F)$ at that point (drawn in black here)
    with a normal vector on the surface given by the same cross product
    that we considered for surface area (drawn in green here).
    The flux can be thought of as the sum of all the dot products across the whole surface.
  ],
) <fig-flux-in-field>

The dot product of @fig-flux-in-field should match your aquatic intuition.
For our oriented surface, the dot product is large when the force is moving
along the same direction as the normal vector.
That matches our description of a water current puncturing the surface.
On the other hand, if the force had been moving mostly parallel to the surface,
then the dot products and hence flux are both close to zero.

== [TEXT] More on orientation

Here's another example of an orientation to make things less abstract.

#example(title: [Example: Orienting a sphere])[
  Let's consider the sphere $x^2 + y^2 + z^2 = 1$ with $z > 0$.
  For each point $P$ on the sphere, the normal vector to the sphere at $P$
  either points straight towards the center of from $P$, or away from the center of $P$.

  What does this correspond to algebraically?
  We consider two possible ways to parametrize the sphere that differ only in the order.

  - Let's imagine we used a spherical parametrization of the hemisphere as
    $ bf(r)(phi, theta) = (sin phi cos theta, sin phi sin theta, cos phi) $
    where $0 <= phi <= pi$ and $0 <= theta <= 2 pi$.
    If we grinded out the cross product, you would find that
    (see @ch-surfcross to see this written out)
    $ (partial bf(r)) / (partial phi) times (partial bf(r)) / (partial theta)
      = sin phi dot (sin phi cos theta, sin phi sin theta, cos phi)
      = sin phi dot bf(r)(phi, theta). $
    At each point $P = bf(r)(phi, theta) = (sin phi cos theta, sin phi sin theta, cos phi)$
    of the sphere, this points outwards (since $sin phi >= 0$),
    so this would be a parametrization of the sphere with all the cross products pointing out.

  - But what if we had flipped the order of $phi$ and $theta$?
    That is, suppose we used
    $ bf(r)(theta, phi) = (sin phi cos theta, sin phi sin theta, cos phi) $
    where $0 <= theta <= 2 pi$  and $0 <= phi <= pi$ instead.
    Then the cross product will get negated:
    $ (partial bf(r)) / (partial theta) times (partial bf(r)) / (partial phi)
      = -sin phi dot (sin phi cos theta, sin phi sin theta, cos phi)
      = -sin phi dot bf(r)(phi, theta). $
    And now at every point, the cross product points inside the sphere instead!

  So which one of these orientations is "correct"? Well, that's why a convention is needed.
  It's just like when we computed work or flux integrals of circles in 2D,
  we had to say "counterclockwise" or "clockwise".
  For this sphere we have to say "outwards" or "inwards" or something like that
  so that whoever is computing the flux integral knows which way to take the cross product.
]

In general, for surfaces where inward vs outward has an obvious meaning,
the convention is usually "outward".
But not all surfaces have an obvious inward vs outward
(for example, the $x y$-plane given by $z = 0$),
and in those cases an exam question should tell you which one to use for that question.

#digression(title: [Digression: Comparison to 2D flux])[
  In 2D flux, we had a notion of "outside" vs "inside" even for curves $cal(C)$ that weren't closed,
  because we had a notion of $90 degree$ clockwise vs $90 degree$ counterclockwise.
  We don't have this in 3D space, sadly, which is why we resort to normal vectors instead.
]


== [TEXT] Magic formulas for the cross product (reprise)

_TL;DR_: cross products are too annoying, so we pre-compute them all.

In @ch-surfcross I gave you @table-surfcross-1 which let you bypass
the cross product step when calculating surface area, and it still works here.
But I'm actually going to rewrite the table to connect it to the shorthand $bf(n) dif S$.
In fact, people often split the shorthand $bf(n) dif S$ into two parts:
$bf(n)$ is the unit vector in the _direction_ of the cross product,
while $dif S$ represents the absolute value with $dif u dif v$ tacked on.
In symbols, this says
$ bf(n) := frac((partial bf(r))/(partial u) times (partial bf(r))/(partial v),
  lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|))
  quad " and " quad
  dif S := lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|) dif u dif v. $
(So $bf(n) dif S$ is indeed the full cross product, as the two absolute value things cancel.)

The reason people will separate it like this is to make the geometry a bit easier to think about.
Remember from back in @ch-cross that a cross product has two pieces of information:
a _direction_ (meant to give two right angles) and a _magnitude_ (meant to interpret area).
The point of separating the shorthand is to make these correspond
to $bf(n)$ and $dif S$ respectively.

Personally, I don't see the point of decomposing the information like this,
since you need the entire cross product when you do calculation anyway.
But a lot of people do it.
So by popular request,
here's a version of @table-surfcross-1 that separates the components.
I think this separation only really helps with the fourth and fifth rows,
because back in @ch-surfcross we described ways to remember $dif S$ geometrically
for the cylinder and the sphere.
(For the cylinder, $dif S approx (dif V) / (dif r)$;
for the sphere, $dif S approx (dif V) / (dif rho)$.)
For the first and second rows, you should just remember the fifth column.

#figure(
  table(
    columns: 5,
    align: center + horizon,
    table.header([Surface],
      [Param's],
      [$bf(n)$ (unit vec)],
      [$dif S$],
      [$bf(n) dif S \ = (partial bf(r))/(partial u) times (partial bf(r))/(partial v) dif u dif v$],
    ),
    [$z = f(x,y)$],
      [$(x,y)$],
      [$frac(
        lr(angle.l - (partial f) / (partial x), - (partial f) / (partial y), 1 angle.r),
        sqrt(1 + ((partial f) / (partial x))^2 + ((partial f) / (partial y))^2))$],
      [$sqrt(1 + ((partial f) / (partial x))^2 + ((partial f) / (partial y))^2) \ dif x dif y$],
      [$lr(angle.l - (partial f) / (partial x), - (partial f) / (partial y), 1 angle.r) \ dif x dif y$],
    [Level surface\ $g(x,y,z) = c$ \ over an $x y$-region ],
      [$(x,y)$],
      [$ pm (nabla g) / (|nabla g|) $],
      [$ (|nabla g|) / (|partial g slash partial z|) dif x dif y $],
      [$ (nabla g) / (partial g slash partial z) dif x dif y $],
    [Flat surface $z = c$],
      [$(x,y)$],
      [$ angle.l 0,0,1 angle.r $],
      [$ dif x dif y $],
      [$ angle.l 0,0,1 angle.r dif x dif y $],
    [Cylindrical coords with fixed $R$ \ $bf(r)(theta, z) = (R cos theta, R sin theta, z)$],
      [$(theta, z)$],
      [$angle.l cos theta, sin theta, 0 angle.r$],
      [$R dif theta dif z$],
      [$angle.l R cos theta, R sin theta, 0 angle.r \ dif theta dif z$],
    [Spherical coords with fixed $R$ \ $bf(r)(phi, theta) = (R sin phi cos theta, \ quad R sin phi sin theta, R cos phi)$],
      [$(phi, theta)$],
      [$1/R dot bf(r)(phi, theta)$\ (if $0 <= phi <= pi$)],
      [$R^2 sin phi dif phi dif theta$ \ (if $0 <= phi <= pi$)],
      [$R sin phi dot bf(r)(phi, theta) \ dif phi dif theta$],
  ),
  caption: [An alternate version of @table-surfcross-1
    written in $bf(n)$ and $dif S$ notation.
    I think it's less elegant and you should just use the original
    @table-surfcross-1, personally,
    but the tables are the same, so it doesn't matter which one you use.],
  kind: table
) <table-surfcross-2>

Again, when actually doing flux calculation with bare hands, *you only need the fifth column*.
And if you ever _do_ need the third and fourth column for some other reason,
they can be derived instantly from the fifth column anyways.
So the third and fourth column are only helpful insomuch as they might make the
formula for the cylinder and sphere easier to remember or more conceptually intuitive.
But for practical calculation they are redundant and hence useless.

== [RECIPE] Recipe for flux integrals with bare-hands parametrization <sec-recipe-flux-param>

We go back to recipe format now.

#recipe(title: [Recipe for computing flux integrals with bare-hands parametrization])[
  To compute the flux of $bf(F)$ over a surface $cal(S)$:

  1. Get the cross product
    $(partial bf(r))/(partial u) times (partial bf(r))/(partial v)$
    for a parametrization $bf(r)$ using the following checklist.
    - If you are using $(x,y)$-coordinates to parametrize
      (meaning $cal(S)$ is $z=f(x,y)$ or a level surface),
      use the magic formulas in rows 1 or 2 of @table-surfcross-2.
    - For a flat surface, it's easy (row 3 of @table-surfcross-2).
    - If $cal(S)$ is specifically given by cylindrical/spherical coordinates with fixed radius,
      use rows 4 or 5 of @table-surfcross-2.
    - Otherwise, evaluate the cross product manually:
      - Pick a parametrization $bf(r)(u,v) : cal(R) -> RR^3$ of the surface $cal(S)$.
        Sort of like in @sec-flex-param, you have some freedom in how you set the parametrization.
      - Compute $(partial bf(r))/(partial u)$ and $(partial bf(r))/(partial v)$
        (both are three-dimensional vectors at each point).
      - Compute the cross product $(partial bf(r))/(partial u) times (partial bf(r))/(partial v)$ as in @ch-cross.
  2. Look at which way the cross product points.
    Does it point the direction you want?
    If not, negate the entire cross product
    (equivalently, swap the order of $u$ and $v$) before going on.
  3. Compute the dot product $ bf(F) dot ((partial bf(r))/(partial u) times (partial bf(r))/(partial v)). $
    This gives you a number at every point on the parametrizing region $cal(R)$.
  4. Integrate the entire thing over $cal(R)$ using any of the methods for double integrals
    (such as horizontal/vertical slicing, polar coordinates, change of variables, etc.).
]

Let's give one example corresponding to each row of @table-surfcross-2.

#sample[
  Consider the surface $cal(S)$ defined by $z = x^3 + y^3$ for
  $0 <= x <= 1$ and $0 <= y <= 1$, with the normal vector oriented upwards
  (i.e. with positive $z$-component).
  Let $bf(F)(x,y,z) = vec(1 , 1 , z)$.
  Find the flux of $bf(F)$ through $cal(S)$.
]
#soln[
  Our parametrization of the surface $cal(S)$ is by definition
  $ bf(r)(x,y) = (x, y, x^3+y^3) $
  for $0 <= x <= 1$ and $0 <= y <= 1$.
  Accordingly, we use the first row of @table-surfcross-2 with $f(x,y) = x^3+y^3$.
  Compute the partial derivatives
  $ (partial f) / (partial x) = 3 x^2, quad (partial f) / (partial y) = 3 y^2. $
  Then by using the first row of @table-surfcross-2, if we
  we get that the cross product at each point is given by
  $ (partial bf(r)) / (partial x) times (partial bf(r)) / (partial y)
    = vec(- 3 x^2 , - 3 y^2 , 1). $

  At this point we have to check whether this cross product points the direction
  specified in the problem, or if we need to negate everything and consider
  $(partial bf(r)) / (partial y) times (partial bf(r)) / (partial x) = vec(3 x^2 , 3 y^2 , -1)$
  instead.
  The question wanted the normal vector to be oriented upwards, and since $1$ is positive,
  the original we had is okay; we use
  $ bf(n) dif S = vec(3 x^2, 3 y^2, -1) = vec(- 3 x^2 , - 3 y^2, 1) dif x dif y. $

  Now, the vector field is given at each point $(x,y)$ by
  $ bf(F)(bf(r)(x,y)) = vec(1 , 1 , x^3 + y^3). $
  So we can compute the dot product
  $ bf(F) dot ((partial bf(r)) / (partial x) times (partial bf(r)) / (partial y))
    &= (1) (- 3 x^2) + (1) (- 3 y^2) + (x^3 + y^3) (1) \
    &= - 3 x^2 - 3 y^2 + x^3 + y^3. $
  Hence the flux requested is given by
  $ iint_(cal(S)) bf(F) dot bf(n) dif S
    = int_(x=0)^1 int_(y=0)^1 (- 3 x^2 - 3 y^2 + x^3 + y^3) dif y dif x $
  which is straightforward to evaluate:
  $ iint_(cal(S)) bf(F) dot bf(n) dif S
    &= int_(x=0)^1 int_(y=0)^1 (x^3 - 3 x^2 + y^3 - 3 y^2) dif y dif x \
    &= int_(x=0)^1 (int_(y=0)^1 (x^3 - 3 x^2) dif x) dif y + int_(y=0)^1 (int_(x=0)^1 (y^3 - 3 y^2) dif y) dif x \
    &= int_(x=0)^1 (x^3 - 3 x^2 dif x) + int_(y=0)^1 (y^3 - 3 y^2 dif y) \
    &= [x^4 / 4 - x^3]_(x=0)^1 + [y^4 / 4 - y^3]_(y=0)^1 \
    &= - 3/4 - 3/4 = #boxed[$ -3/2 $]. #qedhere $
]

#sample[
  Consider the upper hemisphere of the sphere defined by
  $x^2 + y^2 + z^2 = 25$ with the unit normal vector oriented _downwards_ towards the $x y$-plane.
  Calculate the flux of the vector field
  $bf(F) = vec(y z , x z , 0)$ through this surface.
]

#soln[
  Our parametrization of $cal(S)$ is going to be
  $ bf(r)(x,y) = angle.l x^2, y^2, sqrt(25-(x^2+y^2)) angle.r $
  across $x^2 + y^2 <= 25$.
  If we wanted to use the first row of the table @table-surfcross-2,
  we would use $f(x,y) = sqrt(25 - (x^2+y^2))$.
  However, square roots are annoying and we'll use the second row instead
  by viewing this hemisphere as a chunk of the level surface
  $ g(x,y,z) = x^2+y^2+z^2 $ for the value $25$.
  Since $nabla g = angle.l 2x, 2y, 2z angle.r$ and $(partial g) / (partial z) = 2z$, our table gives
  $ (partial bf(r)) / (partial x) times (partial bf(r)) / (partial y)
    = (nabla g) / ((partial g) / (partial z))
    = (angle.l 2x, 2y, 2z angle.r)/(2z)
    = vec( x/z, y/z, 1 ). $
  Here $z = sqrt(25-(x^2+y^2))$.

  At this point we have to check whether this cross product points the direction
  specified in the problem, or if we need to negate everything and consider
  $(partial bf(r)) / (partial y) times (partial bf(r)) / (partial x) = vec( -x/z, -y/z, -1 )$ instead.
  This time, the question specified the normal vector should point _downwards_,
  towards the $x y$-plane.
  So we had better use the negative one:
  $ bf(n) dif S = (partial bf(r)) / (partial y) times (partial bf(r)) / (partial x) = vec( -x/z, -y/z, -1 ) dif x dif y. $

  Meanwhile, the force at each point of the parametrization is given by
  $ bf(F)(bf(r))(x,y) = vec(y z, x z, 0). $
  So the dot product is given by
  $ bf(F) dot ((partial bf(r)) / (partial y) times (partial bf(r)) / (partial x)) =
    y z dot (-x/z) + x z dot (-y/z) + 0 dot (-1) = - 2 x y. $
  Hence the flux we seek is
  $ iint_(cal(S)) bf(F) dot bf(n) dif S = iint_(x^2+y^2 <= 25) - 2 x y dif x dif y. $

  But notice that the integrand $- 2 x y$ is an odd function in both $x$ and $y$.
  Since the region $x^2+y^2 <= 25$ is symmetric with respect to both axes,
  we don't even have to bother changing to polar coordinates;
  we can just deduce directly that $ iint_(x^2+y^2 <= 25) - 2 x y dif x dif y = #boxed[$ 0 $]. #qedhere $
]

#sample[
  Consider the plane $x = 3$ with the normal vector oriented in the $-x$ direction,
  and the vector field $bf(F) = angle.l e^x, e^y, e^z angle.r$.
  Compute the flux of $bf(F)$ through the portion of the plane with $y^2 + z^2 <= 25$.
]

#soln[
  Let $cal(S)$ be the surface of the plane mentioned.
  We parametrize with the variables $y$ and $z$;
  $ bf(r)(y,z) = (3, y, z) $
  across $y^2 + z^2 <= 25$.

  This cross product is the third (easiest) row of @table-surfcross-2; you just get
  $ (partial bf(r)) / (partial y) times (partial bf(r)) / (partial z) = vec(1, 0, 0). $

  Before going on, we again have to check whether the normal vector points the correct way,
  or we should negate it and use
  $(partial bf(r)) / (partial z) times (partial bf(r)) / (partial y) = vec(-1, 0, 0)$ instead.
  The problem wants the $-x$ direction, so indeed, we take the negated one here:
  $ bf(n) dif S = (partial bf(r)) / (partial z) times (partial bf(r)) / (partial y) = vec(-1, 0, 0). $

  Meanwhile, the force vector at each point is just
  $ bf(F)(bf(r)(y,z)) = vec(e^3, e^y, e^z). $
  The dot product is then
  $ bf(F) dot ((partial bf(r)) / (partial z) times (partial bf(r)) / (partial y))
    = vec(e^3, e^y, e^z) dot vec(-1, 0, 0) = -e^3. $
  Hence, the flux we seek is
  $ iint_(cal(S)) bf(F) dot bf(n) dif S
    &= iint_(y^2 + z^2 <= 25) -e^3 dif y dif z \
    &= -e^3 dot op("Area")(y^2 + z^2 <= 25) = #boxed[$ -25 pi e^3 $]. #qedhere $
]

#sample[
  Let $cal(S)$ be the portion of the cylinder $x^2 + y^2 = 49$ where $0 <= z <= 10$,
  with normal vector oriented outwards.
  Calculate the flux of $bf(F) = vec(3x, 5y, e^z)$ through $cal(S)$.
]

#soln[
  It's natural to parametrize this with cylindrical coordinates as
  $ bf(r)(theta, z) = angle.l 7 cos theta, 7 sin theta, z angle.r $
  for $0 <= theta <= 2pi$ and $0 <= z <= 10$.
  As this is a cylinder, we use the fourth row of @table-surfcross-2 to get
  $ (partial bf(r)) / (partial theta) times (partial bf(r)) / (partial z)
    = vec(7 cos theta, 7 sin theta, 0). $

  As before we pause to see whether this points the right way or whether we need to instead use
  $(partial bf(r)) / (partial z) times (partial bf(r)) / (partial theta)
    = vec(-7 cos theta, -7 sin theta, 0)$.
  The question specifies to orient the normal vector outwards,
  so we use the former one:
  $ bf(n) dif S = (partial bf(r)) / (partial theta) times (partial bf(r)) / (partial z)
    = vec(7 cos theta, 7 sin theta, 0) dif theta dif z. $

  Meanwhile, the force at each point is given by
  $ bf(F)(bf(r)(theta, z)) = vec(7 dot 3 cos theta, 7 dot 5 sin theta, e^z). $
  Thus, the dot product $bf(F) dot bf(n)$ is:
  $ bf(F) dot ((partial bf(r)) / (partial theta) times (partial bf(r)) / (partial z))
    &= vec(7 dot 3 cos theta , 7 dot 5 sin theta , e^z) dot vec(7 cos theta , 7 sin theta , 0) \
    &= 49(3 cos^2 theta + 5 sin^2 theta). $
  Hence, the flux we seek is
  $ iint_(cal(S)) bf(F) dot bf(n) dif S
    &=  int_(theta=0)^(2 pi) int_(z=0)^(10) (21 cos^2 theta + 35 sin^2 theta) dot 7 dif z dif theta \
    &= int_(theta=0)^(2 pi) 490 (3 cos^2 theta + 5 sin^2 theta) dif theta \
    &= 490 int_(theta=0)^(2 pi) (3 cos^2 theta + 5 sin^2 theta) dif theta. $
  Recall that:
  $ int_(theta=0)^(2 pi) cos^2 theta dif theta = int_(theta=0)^(2 pi) sin^2 theta dif theta = pi $
  by using $cos^2 theta = (1 + cos(2 theta)) / 2$ and $sin^2 theta = (1 - cos(2 theta)) / 2$.
  Hence,
  $ 490 int_(theta=0)^(2 pi) (3 cos^2 theta + 5 sin^2 theta) dif theta
    = 490 dot (3 pi + 8 pi) = #boxed[$ 3920 pi $]. #qedhere $
]

For the final example, we actually use the same hemisphere again,
but this time we use spherical coordinates, so you can compare the methods.
(In my opinion, this is uglier, but some people prefer spherical coordinates anyway.)
#sample[
  Consider the upper hemisphere of the sphere defined by
  $x^2 + y^2 + z^2 = 25$ with the unit normal vector oriented _downwards_ towards the $x y$-plane.
  Calculate the flux of the vector field
  $bf(F) = vec(y z , x z , 0)$ through this surface.
]

#soln[
  We parametrize with spherical coordinates by writing
  $ bf(r)(phi, theta) = (5 sin phi cos theta, 5 sin phi sin theta, 5 cos phi) $
  for $0 <= phi <= pi/2$ and $0 <= theta <= 2 pi$.
  In that case, the cross product according to @table-surfcross-2 is
  $ ((partial bf(r))/(partial phi)) times ((partial bf(r))/(partial theta))
    = 5 sin phi dot bf(r)(phi, theta). $
  This points away from the sphere since $sin phi >= 0$, so we flip the order:
  $ ((partial bf(r))/(partial theta)) times ((partial bf(r))/(partial phi))
    = -5 sin phi dot bf(r)(phi, theta). $
  Meanwhile, we have
  $ bf(F)(bf(r)(phi, theta))
    = vec(25 sin phi cos phi sin theta, 25 sin phi cos phi cos theta, 0) $
  If we expand the entire dot product we now get
  $ bf(F) dot (((partial bf(r))/(partial theta)) times ((partial bf(r))/(partial phi)))
      &= (25 sin phi cos phi sin theta) dot (-5 sin phi) dot (5 sin phi cos theta) \
      &quad + (25 sin phi cos phi cos theta) dot (-5 sin phi) dot (5 sin phi sin theta) \
      &= -1250 (sin^3 phi cos phi sin theta cos theta). $
  In other words, we have
  $ iint_(cal(S)) bf(F) dot bf(n) dif S
    &= -1250 int_(theta=0)^(2 pi) int_(phi=0)^(pi / 2) sin^3 phi cos theta sin theta dif phi dif theta \
    &= -1250
      (int_(theta=0)^(2 pi) sin theta cos theta dif theta)
      (int_(phi=0)^(pi/2) sin^3 phi cos phi dif phi.) $
  The latter integral is super annoying to evaluate,
  but the former integral is zero because $sin theta cos theta = 1/2 sin(2theta)$,
  so we don't have to worry about the $dif phi$ integral at all; we just get $#boxed[$ 0 $]$
  as the answer.
]

== [TEXT] Another trick: writing as surface area if $bf(F) dot bf(n)$ is constant <sec-flux-to-surf>

We give one more trick for avoiding the cross product that only works in certain situations,
but when it does, it makes your life a lot easier.
Let $cal(S)$ be a surface parametrized by $bf(r) : cal(R) -> RR^3$,
and as always let $bf(n)$ be shorthand for
the unit vector in the direction of $((partial r)/(partial u) times (partial r)/(partial v))$.

Let's compare the flux and surface area in both longhand and shorthand.

- In longhand, we have
  $ op("SurfArea")(cal(S)) &= iint_(cal(R)) lr(|(partial r)/(partial u) times (partial r)/(partial v)|) dif u dif v \
    "Flux" &= iint_(cal(R)) bf(F) dot ((partial r)/(partial u) times (partial r)/(partial v)) dif u dif v
    = iint_(cal(R)) (bf(F) dot bf(n)) lr(|(partial r)/(partial u) times (partial r)/(partial v)|)  dif u dif v. $
  (Keep type safety in mind here: the absolute value is a number,
  and the $dot$ is dot product of vectors in $RR^3$.)
  What we've done for the flux is decompose the cross product
  $((partial r)/(partial u) times (partial r)/(partial v))$ into $bf(n)$ times its magnitude,
  which we can do (in general, _any_ vector $bf(w)$ equals $|bf(w)|$ multiplied by its direction unit vector).
  In this way you can make flux look a little more like surface area.
- In shorthand, it's even more obvious:
  $ "Flux" &= iint_(cal(S)) (bf(F) dot bf(n)) dif S quad " and " quad
    op("SurfArea")(cal(S)) &= iint_(cal(S)) dif S. $

However, this resemblance is mostly useless, _except_ in one really particular circumstance:
the case where it happens $bf(F) dot bf(n)$ is always equal to the same constant $c$
for every point on the surface.
If you are that lucky, then the resemblance can actually be put to use:
$ "Flux" = iint_(cal(R)) c dot lr(|(partial r)/(partial u) times (partial r)/(partial v)|) dif u dif v
  = c iint_(cal(R)) lr(|(partial r)/(partial u) times (partial r)/(partial v)|) dif u dif v
  = c dot op("SurfArea")(cal(S)). $
Then if you know the surface are of $cal(S)$, you don't have to do _any_ integration.
You just multiply the surface area by $c$.

Again, this particular trick is extremely specific.
It will only happen if $bf(F)$ and $cal(S)$
have been cherry-picked so that $bf(F) dot bf(n)$ is constant,
and if you write down a "random" vector field $bf(F)$
there is absolutely no chance this occurs by luck.
However, despite the brittleness of the technique,
this trick is still popular for some homework and exam questions because no calculation is needed.
Here are two examples of this with spheres.

#sample[
  Let $cal(S)$ denote the sphere $x^2+y^2+z^2=17^2=289$ of radius $17$.
  Let $bf(F) = vec(x,y,z)$.
  Compute the flux $ iint_(cal(S)) bf(F) dot bf(n) dif S. $
  (Orient $bf(S)$ outwards.)
]
#soln[
  The normal vector $bf(n)$ at any point $(x,y,z)$ on the surface of the sphere
  is a unit vector pointing in the direction of $angle.l x,y,z angle.r$.
  Conveniently, the force vector $bf(F)$ is a vector of magnitude $17$ in the same direction!
  That is, $ bf(F) dot bf(n) = (17 bf(n)) dot (bf(n)) = 17. $
  Consequently,
  $ iint_(cal(S)) bf(F) dot bf(n) dif S = 17 op("SurfArea")(cal(S)) = 17 dot (4 dot 289)pi = #boxed[$ 4 dot 17^3 pi $]. $
  (In general, we know a sphere of radius $R$ has surface area $4 R^2 pi$.)
]

#sample[
  Let $cal(S)$ denote the sphere $x^2+y^2+z^2=17^2=289$ of radius $17$.
  Let $bf(G)$ be the force of gravity exerted by a point mass $m$ at the origin.
  Compute the flux $ iint_(cal(S)) bf(G) dot bf(n) dif S. $
  (Orient $bf(S)$ outwards.)
]
#soln[
  This is just like the previous example except that the gravity
  $bf(G)$ exerted has magnitude $(G m) / 17^2$ and points in the _opposite_ direction as $bf(n)$.
  That is, $ bf(G) dot bf(n) = (-((G m) / (17^2)) bf(n)) dot (bf(n)) = -(G m) / 289. $
  Consequently,
  $ iint_(cal(S)) bf(F) dot bf(n) dif S = -(G m) / 289 dot op("SurfArea")(cal(S))
    = (-G m)/(17^2) dot (4 dot 17^2 pi) = #boxed[$ -4 pi G m $]. $
  (In general, we know a sphere of radius $R$ has surface area $R^2 pi$.)
]
Note that the answer is independent of the radius! The $17$ cancels out.

== [EXER] Exercises
