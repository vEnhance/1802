#import "@local/evan:1.0.0":*

= Flux <sec-flux>

We now discuss (3D) flux, the final type of vector field integral that we haven't seen yet.
This is the final cell in the poster @fig-int-chart-stokes that we haven't met yet.

This section will be pretty reminiscent of @sec-work.
We'll start by giving a "bare-hands" definition of the flux through a parametrized surface.
It will be usable, but pretty cumbersome, so in the next section @sec-divthm
we'll immediately try to find ways to shortcut it.
For 18.02, the methods available to you will be

- Bare-hands parametrization (covered here)
  - Even here, magic formulas can save you a lot of work.
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
I think this separation only really helps with the third and fourth rows,
because back in @sec-magic-cross-prod we described ways to remember $dif S$ geometrically
for the cylinder and the sphere.
(For the cylinder, $dif S approx dif V / dif r$;
for the sphere, $dif S approx dif V / dif rho$.)
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
      [$ (nabla g) / (|nabla g|) $],
      [$ (|nabla g|) / (|partial g slash partial z|) dif x dif y $],
      [$ (nabla g) / (|partial g slash partial z|) dif x dif y $],
    [Cylindrical coords with fixed $R$ \ $bf(r)(theta, z) = (R cos theta, R sin theta, z)$],
      [$(theta, z)$],
      [$angle.l cos theta, sin theta, 0 angle.r$],
      [$R dif theta dif z$],
      [$angle.l R cos theta, R sin theta, 0 angle.r \ dif theta dif z$],
    [Spherical coords with fixed $R$ \ $bf(r)(phi, theta) = (R sin phi cos theta, \ quad R sin phi sin theta, R cos phi)$],
      [$(phi, theta)$],
      [$1/R dot bf(r)(phi, theta)$],
      [$R^2 sin (phi) dif phi dif theta$],
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

  1. Figure out how to get the cross product
    $(partial bf(r))/(partial u) times (partial bf(r))/(partial v)$
    for a parametrization $bf(r)$ using the following checklist.
    - If you are using $(x,y)$-coordinates to parametrize
      (meaning $cal(S)$ is $z=f(x,y)$ or a level surface),
      use the magic formulas in rows 1 and 2 of @table-magic-cross-prod-n-dS.
    - If $cal(S)$ is specifically a cylinder or sphere in cylindrical/spherical coordinates,
      use the magic formulas in rows 3 and 4 of @table-magic-cross-prod-n-dS.
    - Otherwise, use the long way:
      - Pick a parametrization $bf(r)(u,v) : cal(R) -> RR^3$ of the surface $cal(S)$.
        Sort of like in @sec-flex-param, you have some freedom in how you set the parametrization.
      - Compute the partial derivatives
        $(partial bf(r))/(partial u)$ and $(partial bf(r))/(partial v)$
        (both are three-dimensional vectors at each point).
      - Compute the cross product $(partial bf(r))/(partial u) times (partial bf(r))/(partial v)$.
  2. Look at which way the cross product points (via right-hand rule).
    Does it point "outward"?
    If not, negate the cross product (equivalently, swap the order of $u$ and $v$) before going on.
  3. Compute the dot product $ bf(F) dot ((partial bf(r))/(partial u) times (partial bf(r))/(partial v)). $
    This gives you a number at every point on the parametrizing region $cal(R)$.
  4. Integrate the entire thing over $cal(R)$ using any of the methods for double integrals
    (such as horizontal/vertical slicing, polar coordinates, change of variables, etc.).
]

#todo[write examples]
