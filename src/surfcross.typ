#import "@local/evan:1.0.0":*

= Pre-computed cross products for common surfaces <ch-surfcross>

_TL;DR_: cross products are too annoying, so we pre-compute them all.

== [TEXT] Pre-computed formulas for the cross product

As the examples last chapter show,
it's actually really annoying to compute the cross product by hand.
Consequently, we can make our lives a lot easier if we pre-compute
what the cross product works out to for some common situations,
so we don't have to redo it by hand every time we need it.

In these notes we will pre-compute five different cross products:

- Any graph $z = f(x,y)$ (the cone we discussed is a good example)
- Any level surface $g(x,y,z) = c$, over some $x y$-region
- A flat surface in the $x y$-plane (which could also be $y z$ or $z x$ parallel).
- The curved part of a cylinder of radius $R$ centered along the $z$-axis,
  where the parameters are $theta$ and $z$
- The surface of a sphere of radius $R$ centered at the origin,
  where the parameters are $phi$ and $theta$

(As it turns out, in 18.02 it's likely these are the _only_ five situations you will see.)

The table showing the results is @table-surfcross-1.
Note that for surface area, you only need the _absolute value_ of the cross product (fourth column).
But I'm going to include the entire vector too,
because we'll later need to reuse this table in @ch-flux
(where one reformats it as @table-surfcross-2).
At that point, we will actually need to know the direction the vector points in too,
not just the absolute value.

#figure(
  table(
    columns: 4,
    align: center + horizon,
    table.header([Surface], [Param's],
      [$ frac(partial bf(r), partial u) times frac(partial bf(r), partial v) $],
      [$ lr(|frac(partial bf(r), partial u) times frac(partial bf(r), partial v)|) dif u dif v $],
    ),
    [$z = f(x,y)$],
      [$(x,y)$],
      [$ lr(angle.l - (partial f) / (partial x), - (partial f) / (partial y), 1 angle.r) $],
      [$sqrt(1 + ((partial f) / (partial x))^2 + ((partial f) / (partial y))^2) dif x dif y$],
    [Level surface $g(x,y,z) = c$ \ over an $x y$-region ],
      [$(x,y)$],
      [$ (nabla g) / (partial g slash partial z) $],
      [$ (|nabla g|) / (|partial g slash partial z|) dif x dif y $],
    [Flat surface $z=c$],
      [$(x,y)$],
      [$ lr(angle.l 0, 0, 1 angle.r) $],
      [$dif x dif y$],
    [Cylindrical coords with fixed $R$ \ $bf(r)(theta, z) = (R cos theta, R sin theta, z)$],
      [$(theta, z)$],
      [$ angle.l R cos theta, R sin theta, 0 angle.r $],
      [$R dif theta dif z$],
    [Spherical coords with fixed $R$ \
      $bf(r)(phi, theta) = (R sin phi cos theta, \ quad R sin phi sin theta, R cos phi)$],
      [$(phi, theta)$],
      [$ R sin phi dot bf(r)(phi, theta) $],
      [$R^2 sin phi dif phi dif theta$ \ (if $0 <= phi <= pi$)],
  ),
  caption: [Pre-computed formulas for the cross product in five most common situations,
    which are likely to be all you need.],
  kind: table
) <table-surfcross-1>

Recall the following geometric idea from the earlier @fig-scalint-mesh,
when we described where the cross product was coming from:
#idea[
  The vector $frac(partial bf(r), partial u) times frac(partial bf(r), partial v)$
  is normal to the tangent plane to the surface at each point.
]
This can help a lot with remembering the third column of @table-surfcross-1.
For example:

- For the level surface $g(x,y,z) = c$,
  you should remember from @ch-grad that $nabla g$ is normal to the tangent plane
  of the level surface, hence the cross product is a multiple of $nabla g$ as needed.
- The normal vector to (the curved part of) a cylinder points straight away from the $z$-axis
  away from the origin, which $angle.l R cos theta, R sin theta, 0 angle.r$ indeed does.
- For the sphere, the normal vector should point straight away from the center of the sphere,
  and indeed $sin(phi) dot bf(r)(phi, theta)$ is a multiple of the direction.

Again, for surface area you actually only need the fourth column. But
- I think the third column is actually easier to remember than the fourth column,
  because of the geometric interpretation above;
- by @ch-flux you will need the third column anyway.

The first and second rows of @table-surfcross-1 above are quite versatile,
so in these notes I'll call them "magic" formulas because they save us so much work.
In contrast, the other rows are for more specialized situations.

== [TEXT] @table-surfcross-1 row 1: For a surface of the form $z = f(x,y)$

So imagine your surface is given by $z = f(x,y)$ for some $f$
over some region $cal(R)$ in the $x y$ plane (e.g. the cone had $cal(R) = {x^2+y^2<=1}$).
(e.g. the cone we just did was $f(x,y) = sqrt(x^2+y^2)$)
What we're going to do is try to capture the boilerplate work of the cross product
into a single formula that we can just remember, so we don't have to redo the cross product again.

The parametrization we expect to use is
$ bf(r)(x,y) = vec(x, y, f(x,y)). $
The partial derivatives are
$ frac(partial bf(r), partial x)
  &= vec((partial x) / (partial x) , (partial z) / (partial x) , (partial z) / (partial x))
  = vec(1 , 0 , (partial z) / (partial x) ) \
  frac(partial bf(r), partial y)
  &= vec((partial x) / (partial y) , (partial y) / (partial y) , (partial z) / (partial y))
  = vec(0 , 1 , (partial z) / (partial y)). $
Hence, in this case we arrive at
$ frac(partial bf(r), partial x) times frac(partial bf(r), partial y)
  &= detmat(ee_1, ee_2, ee_3;
    1 , 0 , (partial z) / (partial x);
    0 , 1 , (partial z) / (partial y)) \
  &= - (partial z) / (partial x) ee_1  - (partial z) / (partial y) ee_2 + ee_3 \
  &= - (partial f) / (partial x) ee_1  - (partial f) / (partial y) ee_2 + ee_3. $

Let's write this down now.

#memo(title: [Memorize: Magic cross product formula for $z = f(x,y)$])[
  Consider a surface given by $z = f(x,y)$ with $f$ differentiable.
  Then for the obvious parametrization $bf(r)(x,y) = (x,y,f(x,y))$ we have
  $ frac(partial bf(r), partial x) times frac(partial bf(r), partial y)
  = lr(angle.l - (partial f) / (partial x), - (partial f) / (partial y), 1 angle.r). $
]

In particular, the surface area becomes
$ op("SurfArea")(cal(S)) = iint_(cal(R)) sqrt(1 + ((partial f) / (partial x))^2 + ((partial f) / (partial y))^2) dif x dif y. $
You'll find this formula written in a lot of other textbooks and it's worth knowing
(I would say you should memorize the full magic cross product formula,
since it's trivial to get the magnitude from it.)
Let's see how it can captures the boilerplate in the cone example.

#sample[
  Find the surface area of the cone defined by $z = sqrt(x^2+y^2) <= 1$.
]
#soln[
  Letting $f(x,y) = sqrt(x^2+y^2)$, this time we skip straight to
  $ (partial f) / (partial x) &= x/(sqrt(x^2+y^2)) \
    (partial f) / (partial y) &= y/(sqrt(x^2+y^2)). $
  Hence we got a shortcut to the vector $angle.l -x/(sqrt(x^2+y^2)), -y/(sqrt(x^2+y^2)), 1 angle.r$ we found before.
  We find its magnitude in the same way:
  $ sqrt(1 + ((partial f) / (partial x))^2 + ((partial f) / (partial y))^2)
  = sqrt(1 + (x^2) / (x^2 + y^2) + (y^2) / (x^2 + y^2) + 1) = sqrt(2). $
  Now
  $ op("SurfArea")("cone") = iint_(x^2+y^2 <= 1) sqrt(2) dif A = sqrt(2) op("Area")(x^2+y^2 <= 1) = #boxed[$sqrt(2) pi $]. #qedhere $
]

== [TEXT] @table-surfcross-1 row 2: For a level surface $g(x,y,z) = c$ <sec-surf-grad-magic>

However, we can get an even better formula in a lot of cases using implicit differentiation.
The basic idea is that we would prefer to think of the cone as $x^2+y^2-z^2 = 0$,
so that we don't need to think about square roots.
And that's exactly a level surface.

So imagining a _level surface_ $g(x,y,z) = c$ instead,
where each $(x,y)$ in our region $cal(R)$ has exactly one $z = z(x,y)$ value.
On paper, you imagine solving for $z$ in terms of $x$ and $y$, and then using
$ frac(partial bf(r), partial x) times frac(partial bf(r), partial y)
  = - (partial z) / (partial x) ee_1  - (partial z) / (partial y) ee_2 + ee_3 $
but we'd like to not have to solve for $z$ in such a brute way.

The trick is to consider the gradient of $g$ and use the chain rule.
You might remember that
$ nabla g = lr(angle.l (partial g) / (partial x), (partial g) / (partial y), (partial g) / (partial z) angle.r) $
is pretty easy to calculate, usually.
However, if we take the partial derivative of
$ g(x,y,z) = c $
with respect to $x$ and $y$, the derivative of $c$ vanishes while the chain rule gives
$ 0 = (partial g) / (partial x) + (partial g) / (partial z) dot (partial z) / (partial x)
  ==> (partial g) / (partial x) = - (partial g) / (partial z) dot (partial z) / (partial x). $
Similarly
$(partial g) / (partial y) = - (partial g) / (partial z) dot (partial z) / (partial y)$.
Hence
$ nabla g = lr(angle.l -(partial g) / (partial z) dot (partial z) / (partial x),
  -(partial g) / (partial z) dot (partial z) / (partial y), (partial g) / (partial z)  angle.r)
  = (partial g) / (partial z) dot lr(angle.l -(partial z) / (partial x), -(partial z) / (partial y), 1 angle.r). $

#digression(title: [Digression on the chain rule])[
  You might be spooked by the minus sign here,
  as I was, since if you just look at the fractions the expression seems wrong.
  This is why I don't like to remember the chain rule as just "cancel the fractions",
  because in some contexts you'll get equations like this that don't seem correct.

  The context to remember here is that $z = z(x,y)$ is itself a function of $x$ and $y$
  that holds on to the requirement $g(x,y,z(x,y)) = c$;
  that is, if $x$ changes a little, $z = z(x,y)$ should change in an "opposite" way to ensure $g = c$ is still true.

  How much should the change be?
  It might be easiest to reason through two applications of linear approximation.
  If $epsilon$ is some small displacement, then linear approximation is saying that
  $ g(x + epsilon, y, z(x + epsilon, y))
    &approx g(x + epsilon, y, z(x, y) + (partial z) / (partial x) dot epsilon) \
    &approx g(x,y,z(x,y)) + nabla g dot vec(epsilon, 0, (partial z) / (partial x) dot epsilon) \
    &= g(x,y,z(x,y))
      + [(partial g) / (partial x) + (partial g) / (partial z) dot (partial z) / (partial x)] epsilon. $
  Hence we want the bracketed coefficient of $epsilon$ to be zero,
  which is the equation we got before.
]

Something really good is happening here, because the cross product we wanted just sits on the right-hand side!
Because of this, we have managed to derive the following miraculous identity.
#memo(title: [Memorize: Magic cross product formula for a level surface])[
  Let $g$ be differentiable and consider the level surface $g(x,y,z) = c$.
  Let $cal(S)$ be a part of this level surface described implicitly by some function $z=f(x,y)$,
  and suppose also that $(partial g) / (partial z) != 0$ over $cal(R)$.
  Then for the obvious parametrization $bf(r)(x,y) = (x,y,f(x,y))$ we have
    $ frac(partial bf(r), partial x) times frac(partial bf(r), partial y)
    = (nabla g) / (partial g slash partial z). $
]
The reason this magic identity is even better is that there is no need to differentiate $f$
or even to determine it.
Let's see it in action by redoing our example with a cone.
#sample[
  Find the surface area of the cone defined by $z = sqrt(x^2+y^2) <= 1$.
]
#soln[
  The cone is the part of the level surface of $g(x,y,z) = x^2+y^2-z^2$ with $z >= 0$.
  (We know in fact $f(x,y) = sqrt(x^2+y^2)$, but we won't use this.)
  Now we can jump straight to
  $ (nabla g) / ((partial g) / (partial z)) = lr(angle.l 2x, 2y, -2z angle.r) / (-2z)
    = lr(angle.l -x/z, -y/z, 1 angle.r). $
  The magnitude of this vector is
  $ sqrt((-x/z)^2 + (-y/z)^2 + 1) = sqrt((x^2+y^2)/z^2 + 1) = sqrt(2) $
  so we get
  $ op("SurfArea")("cone") = iint_(x^2+y^2 <= 1) sqrt(2) dif A
    = sqrt(2) op("Area")({x^2+y^2 <= 1}) = #boxed[$sqrt(2) pi $]. #qedhere $
]
If you compare this carefully with $z = sqrt(x^2+y^2)$,
you'll see this is _still_ the same solution as the first magic formula,
which is in turn _still_ the same solution as when we really used bare hands.
But the shortcuts are nice because it means you don't have to think about the cross product at all.

Now as we promised, let's show how to find surface area for a sphere
without having to slog through the pain of spherical coordinates.
#sample[
  Find the surface area of the sphere $x^2+y^2+z^2 = 1$.
]
#soln[
  We'll find the surface area for the hemisphere with $z >= 0$ and then double it.
  We could view the hemisphere as $z = f(x,y) = sqrt(1 - (x^2+y^2))$,
  but to avoid square roots we're much happier by letting
  $ g(x,y,z) = x^2+y^2+z^2 $
  and considering the hemisphere as the chunk of the level surface with $z >= 0$ and $x^2+y^2 <= 1$.
  In that case,
  $ (nabla g) / (partial g slash partial z) = lr(angle.l 2x, 2y, 2z angle.r) / (2z)
    = lr(angle.l x/z, y/z, 1 angle.r). $
  This time the magnitude of the vector is
  $ sqrt((x/z)^2 + (y/z)^2 + 1) = sqrt((x^2+y^2+z^2) / z^2) = 1/z. $
  Hence, we need to integrate
  $ op("SurfArea")("hemisphere") = iint_(x^2+y^2<=1) 1/sqrt(1-(x^2+y^2)) dif x dif y. $
  To nobody's surprise, we use polar coordinates to change this to
  $ op("SurfArea")("hemisphere")
    &= int_(theta=0)^(2pi) int_(r=0)^1 1/(sqrt(1-r^2)) (r dif r dif theta) \
    &= (int_(theta=0)^(2pi) dif theta) (int_(r=0)^1 r/(sqrt(1-r^2)) dif r). $
  The left integral is $2pi$.
  For the inner integral, use the $u$-substitution $u=1-r^2 ==> (dif u) / (dif r) = -2r$ to get
  $ int_(r=0)^1 r/(sqrt(1-r^2)) dif r
    = int_(u=1)^0 -1/2 u^(-1/2) dif u
    = int_(u=0)^1 1/2 u^(-1/2) dif u
    = [u^(1/2)]_(u=0)^1 = 1. $
  Hence
  $ op("SurfArea")("hemisphere") = 2 pi dot 1 = 2 pi $
  and the surface area of the sphere is thus $2 pi dot 2 = #boxed[$ 4 pi $]$.
]

== [TEXT] @table-surfcross-1 row 3: For a flat surface

This is the really easy special case of $z = f(x,y)$ when $f(x,y) = c$ is constant.
Your parametrization is just $ bf(r)(x,y) = angle.l x,y,c angle.r. $

I hesitated to include this row because it's so easy and is a special case of the first row,
but it's common enough I decided I might as well toss it in.
However, you should have no problem deriving this yourself even in your sleep; it's literally
$ (partial bf(r)) / (partial x) &= angle.l 1, 0, 0 angle.r \
  (partial bf(r)) / (partial y) &= angle.l 0, 1, 0 angle.r $
and the cross product of these is $angle.l 0,0,1 angle.r$, so there you go.

Note that you might encounter flat surfaces parallel to the $x z$ or $y z$ planes instead.
In which case you should just swap the roles of the variables.

== [TEXT] @table-surfcross-1 row 4: For the curved part of the cylinder in cylindrical coordinates

If you have a cylinder aligned with the $z$-axis,
then you don't want to be using $x y$-plane as parameters,
because most pairs $(x,y)$ do not get used at all.
Thus, we'll instead use cylindrical coordinates as
$ bf(r)(theta, z) = (R cos theta, R sin theta, z). $
Compute the partial derivatives:
$ frac(partial bf(r), partial theta) &= angle.l - R sin theta, R cos theta, 0 angle.r \
  frac(partial bf(r), partial z) &= angle.l 0,0,1 angle.r. $
The cross product is pretty easy to evaluate in this case:
$ frac(partial bf(r), partial theta) times frac(partial bf(r), partial z)
  &= detmat(
    ee_1, ee_2, ee_3;
    -R sin theta, R cos theta, 0;
    0, 0, 1
  ) \
  &= R cos theta ee_1 + R sin theta ee_2 \
  &= angle.l R cos theta, R sin theta, 0 angle.r. $
That's not too bad!
We can take the absolute value of this: $ dif S = R dif theta dif z. $

#tip(title: [Tip: $dif S$ for the cylinder can be remembered geometrically])[
  The way to remember this is that "$dif S approx (dif V) / (dif r)$":
  if you multiply a bit of surface by a bit of the radial component,
  you get a chunk of volume of the sphere.
  And since we saw in @ch-triple that $dif V = r dif r dif theta dif z$,
  the formula for $dif S$ is what you get when you divide out $dif r$ and set $r = R$.

  Alternatively, each patch on the cylinder can be thought of as
  a little rectangle of height $dif z$ and width $R dif theta$.
]

== [TEXT] @table-surfcross-1 row 5: For the curved part of the sphere, in spherical coordinates

We already saw the sphere is actually handled by our magic formula for level surfaces,
so if you're fine using $x y$-coordinates you are good to go.
Nonetheless, in the event you need spherical coordinates, here is the result.

We actually computed this already while working out the sphere's surface area by brute force:
if we take the parametrization
$ bf(r) (phi, theta) = (R sin phi cos theta , R sin phi sin theta , R cos phi) , $
then if we repeat the brutal calculation from @sec-recipe-surface-area-direct
with an extra $R$ tacked on, we get
$ frac(partial bf(r), partial phi) times frac(partial bf(r), partial theta)
  &= (R^2 sin^2 phi cos theta) ee_1  + (R^2 sin^2 phi sin theta) ee_2
  + (R^2 sin phi cos phi) ee_3. $
This formula might look ugly until you realize that it's actually just
$ frac(partial bf(r), partial phi) times frac(partial bf(r), partial theta)
  = R sin phi dot bf(r)(phi, theta). $
Since $|bf(r)(phi, theta)| = R$, we get
$ dif S := lr(|frac(partial bf(r), partial phi) times frac(partial bf(r), partial theta)|) d phi d theta
  = R^2 sin phi dif phi dif theta. $
Here I'm dropping the absolute value bars around $|sin phi|$ because
our spherical coordinate convention requires $0 < phi < pi$.

#tip(title: [Tip: $dif S$ for the sphere can be remembered geometrically])[
  The way to remember this is that "$dif S approx (dif V) / (dif rho)$":
  if you multiply a bit of surface by a bit of the radial component,
  you get a chunk of volume of the sphere.
  And since we saw in @ch-sph that $dif V = rho^2 sin phi dif rho dif phi dif theta$,
  the formula for $dif S$ is what you get when you divide out $dif rho$ and set $rho = R$.
]

== [RECIPE] Recap of surface area

Let's write a new recipe for surface area now that we have @table-surfcross-1.

#recipe(title: [Recipe for surface area upgraded with @table-surfcross-1])[
  To compute the surface area of a surface $cal(S)$:

  1. Get the cross product
    $(partial bf(r))/(partial u) times (partial bf(r))/(partial v)$
    for a parametrization $bf(r)$ using the following checklist.
    - If you are using $(x,y)$-coordinates to parametrize
      (meaning $cal(S)$ is $z=f(x,y)$ or a level surface),
      use the magic formulas in rows 1 or 2 of @table-surfcross-1.
    - For a flat surface, it's easy (row 3 of @table-surfcross-1).
    - If $cal(S)$ is specifically given by cylindrical/spherical coordinates with fixed radius,
      use rows 4 or 5 of @table-surfcross-1.
    - Otherwise, evaluate the cross product manually:
      - Pick a parametrization $bf(r)(u,v) : cal(R) -> RR^3$ of the surface $cal(S)$.
        Sort of like in @sec-flex-param, you have some freedom in how you set the parametrization.
      - Compute $(partial bf(r))/(partial u)$ and $(partial bf(r))/(partial v)$
        (both are three-dimensional vectors at each point).
      - Compute the cross product $(partial bf(r))/(partial u) times (partial bf(r))/(partial v)$ as in @ch-cross.
  2. Take the magnitude of the cross product to get a number for each point on the surface.
  3. Integrate it over $cal(R)$ using any of the methods for double integrals
    (such as horizontal/vertical slicing, polar coordinates, change of variables, etc.).
]

== [EXER] Exercises

#exer[
  Find the surface area of the surface defined by $z = x^2+y^2 <= 1$.
] <exer-surface-area-paraboloid>
