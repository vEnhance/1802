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
- Shortcut: Transforming to a surface area integral (covered in @sec-divthm)
- Shortcut when the surface is a level surface (covered in @sec-divthm)
- Shortcut: The divergence theorem, by converting to a 3D volume integral (covered in @sec-divthm)
- Shortcut: Stokes' theorem, if the vector field happens to be a curl (covered in @sec-badstokes)

== [TEXT] The definition of flux using bare-hands parametrization

#definition(title: [Definition of flux])[
  Let $bf(r)(u,v) : cal(R) -> RR^3$ parametrize a surface $cal(S)$ in $RR^3$.
  The flux of a vector field $bf(F) : RR^3 -> RR^3$ through $cal(S)$ is defined by
  $ iint_(cal(R)) bf(F)(bf(r)(u,v)) dot
    ((partial bf(r))/(partial u) times (partial bf(r))/(partial v)) dif u dif v. $
]
Yes, there's that hideous cross product again.
But at least the absolute value is gone --- that's a big improvement.

Naturally, people have shorthand to make this easier to swallow: this time either
$ iint_(cal(S)) bf(F) dot dif bf(S) = iint_(cal(S)) bf(F) dot bf(n) dif S $
is used to sweep everything under the carpet.

#typesig[
  Flux accepts a _parametrized surface_ and a _vector field_ and outputs a _number_.
]

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
  The vector $((partial bf(r))/(partial u) times (partial bf(r))/(partial v))$
  represents some normal vector to the surface at each point.
]
In other words, the tangent vectors in our work integral
are now replaced by normal vectors to the surface.

#todo[draw picture]

== [RECIPE] Recipe for flux integrals with bare-hands parametrization

We go back to recipe format now.

#recipe(title: [Recipe for computing flux integrals with bare-hands parametrization])[
  To compute the line integral of $bf(F)$ over the curve $cal(C)$:

  1. Pick a parametrization $bf(r)(u,v) : cal(R) -> RR^3$ of the curve $cal(S)$.
    - Sort of like in @sec-flex-param, you have some freedom in how you set the parametrization.
      But this time you need to pay attention to the order of $u$ and $v$.
    - In 18.02, the parametrization might be given to you in the question to save time.
  2. Compute the partial derivatives
    $(partial bf(r))/(partial u)$ and $(partial bf(r))/(partial v)$
    (both are three-dimensional vectors at each point).
  3. Compute the cross product $(partial bf(r))/(partial u) times (partial bf(r))/(partial v)$.
  4. Look at which way the cross product points (via right-hand rule).
    Does it point "outward"?
    If not, negate the cross product (equivalently, swap the order of $u$ and $v$) before going on.
  5. Compute the dot product $ bf(F) dot ((partial bf(r))/(partial u) times (partial bf(r))/(partial v)). $
    This gives you a number at every point on the parametrizing region $cal(R)$.
  6. Integrate the entire thing over $cal(R)$ using any of the methods for double integrals
    (such as horizontal/vertical slicing, polar coordinates, change of variables, etc.).
]

#todo[write examples]
