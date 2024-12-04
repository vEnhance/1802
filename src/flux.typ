#import "@local/evan:1.0.0":*

= Flux <sec-flux>

We now discuss (3D) flux, the final type of vector field integral that we haven't seen yet.
This is the final cell in the poster @fig-int-chart-stokes that we haven't met yet.

#figure(
  box(image("figures/flux-cut.svg", width: auto), stroke: 1pt),
  caption: [The flux integral for a surface circled in our poster @fig-int-chart-stokes.],
)

This section will be pretty reminiscent of @sec-work.
We'll start by giving a "bare-hands" definition of the flux through a parametrized surface.
It will be usable, but pretty cumbersome, so in the next section @sec-divthm
we'll immediately try to find ways to shortcut it.
For 18.02, the methods available to you will be

- Bare-hands parametrization (covered here)
  - Even here, magic formulas can save you a lot of work --- see @table-magic-cross-prod-n-dS.
- Shortcut: The divergence theorem, by converting to a 3D volume integral (covered in @sec-divthm)
- Shortcut: Transforming to a surface area integral (covered in @sec-divthm)
- Shortcut: Stokes' theorem, if the vector field happens to be a curl (covered in @sec-badstokes)

== [TEXT] The definition of flux using bare-hands parametrization

#definition(title: [Definition of flux])[
  Let $bf(r)(u,v) : cal(R) -> RR^3$ parametrize a surface $cal(S)$ in $RR^3$.
  The flux of a vector field $bf(F) : RR^3 -> RR^3$ through $cal(S)$ is defined by
  $ iint_(cal(R)) bf(F)(bf(r)(u,v)) dot
    ((partial bf(r))/(partial u) times (partial bf(r))/(partial v)) dif u dif v. $
]
#typesig[
  Flux accepts a _parametrized surface_ and a _vector field_ and outputs a _number_.
]

Yes, there's that hideous cross product again.
Naturally, people have shorthand to make this easier to swallow: this time either
$ iint_(cal(S)) bf(F) dot dif bf(S) = iint_(cal(S)) bf(F) dot bf(n) dif S $
is used to sweep everything under the carpet.

I promised you back in the surface area chapter that at some point
you'd need the whole cross product and not just its magnitude, and here we are!
In fact, the absolute value being gone is in some sense an _improvement_: I would argue
$lr(angle.l - (partial f) / (partial x), - (partial f) / (partial y), 1 angle.r)$
is less messy than $sqrt(1 + ((partial f) / (partial x))^2 + ((partial f) / (partial y))^2)$.

We'll do example calculations in a moment, but let me first talk about how to think about this.

== [TEXT] Aquatic interpretation of flux

The interpretation here is similar to 2D flux.
You should imagine the surface $cal(S)$ as some membrane in the water;
then the flux measures the rate at which water moves through it.

The thing that you have to pay attention for flux is the notion of "direction".
Remember, back when we had work integrals,
we distinguished between a "start" point and a "stop" point for the curve $cal(C)$,
which made sense.
For surface $cal(S)$, the usual way this is discussed is in terms of a _normal_ vector:
one chooses a direction to distinguish inside vs outside,
and points all the normal vectors one way.

#todo[draw a figure]

#digression[
  In 2D flux, we had a notion of "outside" vs "inside" even for curves $cal(C)$ that weren't closed,
  because we had a notion of $90 degree$ clockwise vs $90 degree$ counterclockwise.
  We don't have this in 3D space, sadly, which is why normal vectors keep showing up.
]

In particular, _the order of $u$ and $v$ matter_; if you flip the order of the two parameters
it will negate the entire cross product:
$ ((partial bf(r))/(partial u) times (partial bf(r))/(partial v))
  = - ((partial bf(r))/(partial v) times (partial bf(r))/(partial u)). $
Hence the flux will get negated too.
This sign issue is super disorienting because it wasn't present for work,
where "start to stop" was pretty easy to think about.

#todo[draw a picture]

== [TEXT] Visualizing flux integrals via dot products

Flip back to @fig-work-dot for a moment.
Back when we were talking about the work integral
$bf(F)(bf(r)(t)) dot bf(r)'(t)$,
I told you to visualize the work as adding the dot products of the force vectors
with tangent vectors.

With our new flux integral, we need to visualize the dot products
$ iint_(cal(R)) bf(F) dot ((partial bf(r))/(partial u) times (partial bf(r))/(partial v)) dif u dif v. $
The $bf(F)$ is still the force vector.
But what's the cross product supposed to be?
Answer:
#idea[
  The vector $ (partial bf(r))/(partial u) times (partial bf(r))/(partial v) $
  represents some normal vector to the surface at each point.
]
In other words, the tangent vectors in our work integral
are now replaced by normal vectors to the surface.

#todo[draw picture]

== [TEXT] Magic formulas for the cross product (reprise)

_TL;DR_: cross products are too annoying, so we pre-compute them all.

In @sec-magic-cross-prod I gave you @table-magic-cross-prod-scalint which let you bypass
the cross product step when calculating surface area, and it still works here.
But I'm actually going to rewrite the table to connect it to the shorthand $bf(n) dif S$.
In fact, people often split the shorthand $bf(n) dif S$ into two parts:
$ bf(n) := frac((partial bf(r))/(partial u) times (partial bf(r))/(partial v),
  lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|))
  quad " and " quad
  dif S := lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|) dif u dif v. $
(So that $bf(n) dif S$ is indeed the full cross product, as the two absolute value things cancel.)
That is, $bf(n)$ is the unit vector in the _direction_ of the cross product,
while $dif S$ represents the absolute value with $dif u dif v$ tacked on.

The reason people will separate it like this is to make the geometry a bit easier to think about.
Remember from back in @sec-cross that a cross product has two pieces of information:
a _direction_ (meant to give two right angles) and a _magnitude_ (meant to interpret area).
The point of separating the shorthand is to make these correspond
to $bf(n)$ and $dif S$ respectively.

So by popular request,
here's a version of @table-magic-cross-prod-scalint that separates the components.
I think this separation only really helps with the fourth and fifth rows,
because back in @sec-magic-cross-prod we described ways to remember $dif S$ geometrically
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
  caption: [An alternate version of @table-magic-cross-prod-scalint
    written in $bf(n)$ and $dif S$ notation.
    I think it's less elegant and you should just use the original
    @table-magic-cross-prod-scalint, personally,
    but the tables are the same, so it doesn't matter which one you use.],
  kind: table
) <table-magic-cross-prod-n-dS>

Again, when actually doing flux calculation with bare hands, you only need the fifth column.
And if you ever _do_ need the third and fourth column for some other reason,
they can be derived instantly from the fifth column anyways.
So the third and fourth column are only helpful insomuch as they might make the
formula for the cylinder and sphere easier to remember.
Otherwise they are pretty useless.

== [RECIPE] Recipe for flux integrals with bare-hands parametrization

We go back to recipe format now.

#recipe(title: [Recipe for computing flux integrals with bare-hands parametrization])[
  To compute the flux of $bf(F)$ over a surface $cal(S)$:

  1. Get the cross product
    $(partial bf(r))/(partial u) times (partial bf(r))/(partial v)$
    for a parametrization $bf(r)$ using the following checklist.
    - If you are using $(x,y)$-coordinates to parametrize
      (meaning $cal(S)$ is $z=f(x,y)$ or a level surface),
      use the magic formulas in rows 1 or 2 of @table-magic-cross-prod-n-dS.
    - If $cal(S)$ is specifically given by cylindrical/spherical coordinates with fixed radius,
      use rows 3 or 4 of @table-magic-cross-prod-n-dS.
    - Otherwise, evaluate the cross product manually:
      - Pick a parametrization $bf(r)(u,v) : cal(R) -> RR^3$ of the surface $cal(S)$.
        Sort of like in @sec-flex-param, you have some freedom in how you set the parametrization.
      - Compute $(partial bf(r))/(partial u)$ and $(partial bf(r))/(partial v)$
        (both are three-dimensional vectors at each point).
      - Compute the cross product $(partial bf(r))/(partial u) times (partial bf(r))/(partial v)$ as in @sec-cross.
  2. Look at which way the cross product points (via right-hand rule).
    Does it point "outward"?
    If not, negate the cross product (equivalently, swap the order of $u$ and $v$) before going on.
  3. Compute the dot product $ bf(F) dot ((partial bf(r))/(partial u) times (partial bf(r))/(partial v)). $
    This gives you a number at every point on the parametrizing region $cal(R)$.
  4. Integrate the entire thing over $cal(R)$ using any of the methods for double integrals
    (such as horizontal/vertical slicing, polar coordinates, change of variables, etc.).
]

#todo[write examples]

== [TEXT] Another trick: writing as surface area if $bf(F) dot bf(n)$ is constant

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
  Compute the flux $ iint_(cal(S)) bf(F) dot dif bf(S). $
  (Orient $bf(S)$ outwards.)
]
#soln[
  The normal vector $bf(n)$ at any point $(x,y,z)$ on the surface of the sphere
  is a unit vector pointing in the direction of $angle.l x,y,z angle.r$.
  Conveniently, the force vector $bf(F)$ is a vector of magnitude $17$ in the same direction!
  That is, $ bf(F) dot bf(n) = (17 bf(n)) dot (bf(n)) = 17. $
  Consequently,
  $ iint_(cal(S)) bf(F) dot dif bf(S) = 17 op("SurfArea")(cal(S)) = 17 dot (4 dot 289)pi = #boxed[$ 4 dot 17^3 pi $]. $
  (In general, we know a sphere of radius $R$ has surface area $4 R^2 pi$.)
]

#sample[
  Let $cal(S)$ denote the sphere $x^2+y^2+z^2=17^2=289$ of radius $17$.
  Let $bf(G)$ be the force of gravity exerted by a point mass $m$ at the origin.
  Compute the flux $ iint_(cal(S)) bf(G) dot dif bf(S). $
  (Orient $bf(S)$ outwards.)
]
#soln[
  This is just like the previous example except that the gravity exerted
  $bf(G)$ has magnitude $(G m) / 17^2$ and points in the _opposite_ direction as $bf(n)$.
  That is, $ bf(F) dot bf(n) = (-((G m) / (17^2)) bf(n)) dot (bf(n)) = -(G m) / 289. $
  Consequently,
  $ iint_(cal(S)) bf(F) dot dif bf(S) = -(G m) / 289 dot op("SurfArea")(cal(S))
    = (-G m)/(17^2) dot (4 dot 17^2 pi) = #boxed[$ -4 pi G m $]. $
  (In general, we know a sphere of radius $R$ has surface area $R^2 pi$.)
]
Note that the answer is independent of the radius! The $17$ cancels out.

== [EXER] Exercises
