#import "@local/evan:1.0.0":*

= Shortcuts for work: conservative vector fields and Green's theorem <sec-ftcgreen>

In the last chapter we showed the definition of work and how to compute
$int_(cal(C)) bf(F) dot dif bf(r)$ with bare-hands by using parametrization.
However, parametrization can be a lot of work.
So the purpose of this chapter is to show you under what conditions you can get away
with _not_ having to do a parametrization.
There will be two such categories:

- If $bf(F)$ is a _conservative_ vector field, then the _fundamental theorem of calculus_
  is the way to go.
- If you're working in 2D and $cal(C)$ is a closed loop, then Green's theorem is the way to go.

We'll show you both of these now.

== [TEXT] The fundamental theorem of calculus for line integrals

We now show the first Stokes result.
It corresponds to a statement for the red arrow shown below.

#figure(
  box(image("figures/work-cut-ftc.svg", width: auto), stroke: 1pt),
  caption: [The FTC for line integrals is the Stokes statement
    for the "grad" red arrows in the poster @fig-int-chart-stokes.],
) <fig-work-ftc-red-arrow>

#memo(title: [Memorize: FTC for line integrals])[
  Suppose $bf(F) : RR^n -> RR^n$ is a conservative vector field,
  given by $bf(F) = nabla f$ for some potential function $f : RR^n -> RR$.
  Then for any curve $cal(C)$ from a point $P$ to a point $Q$ we have
  $ int_(cal(C)) bf(F) dot dif bf(r) = f(Q)-f(P). $
]

This has several important consequences.
If you know $bf(F)$ is conservative, then
- For _any_ loop (i.e. a curve from a point to itself), the work integral is zero.
- More generally, all the work integrals are _path independent_
  if $cal(C)$ and $cal(C)'$ are two different paths from $P$ to $Q$ but the endpoints are the same,
  the work integrals will both be equal.
Indeed in the first case the work integral is $f(P)-f(P)=0$
and the second case it equals $f(Q)-f(P)$ (for both $cal(C)$ and $cal(C)$').
But those two bullets are nice philosophically because they don't even require
you to know anything at all about the function $f$.

In other words:
#idea(title: [Idea: Practical consequences of FTC for line integrals])[
  If you _already know_ $bf(F)$ is conservative, then
  - If you also know the potential function $f$,
    then work integrals are extremely easy to calculate:
    just compute $f("ending point")-f("starting point")$.
  - If you don't know the potential function $f$,
    use the methods in @sec-antigrad to find it.
  - If the starting point and ending point are the same you don't even need to find $f$.
    The work integral is always $0$.
]

Let's see this concretely with a conservative vector field.
We'll use $ bf(F) (x , y) = vec(2 x + 1, 3 y) $
which, if we follow the recipe from @sec-antigrad,
we can recover the $f$ such that $bf(F) = nabla f$:
$ f(x,y) = x^2 + x + 3 / 2 y^2. $
Thus, now that $f$ is known, line integrals are trivial to compute:

#sample[
  Compute the line integral of the vector field
  $bf(F) (x , y) = vec(2 x + 1, 3 y)$ along the following two curves:

  - the upper half of the circle $x^2 + y^2 = 1$, oriented counterclockwise
    (blue in @fig-work-ex2).
  - the line segment from $(1,0)$ to $(-1,0)$
    (brown in @fig-work-ex2).
]

#figure(
  image("figures/work-ex2.svg", width: auto),
  caption: [The same brown and blue path from @fig-work-ex1,
  but this time with a different vector field, now conservative.],
) <fig-work-ex2>


#soln[
  Because we know the potential function
  $ f(x,y) = x^2 + x + 3 / 2 y^2 $
  the answer to both parts is the same:
  $ f(-1,0) - f(1,0) = 0 - 2 = #boxed[$ -2 $]. #qedhere $
]

For comparison, we show how we could have computed the line integrals "by hand"
for each of the bullets above,
if we were not clever enough to notice that $bf(F)$ was conservative.
Of course, we do this knowing that the two answers better be equal (to $-2$).

- Work on the blue path, which is again $bf(r)(t) = (cos t, sin t)$ for $0 <= t <= pi$
  with $bf(r)'(t) = vec(- sin t, cos t)$.
  The values of the new vector field $bf(F)$ along the curve are
  $ bf(F) (bf(r) (t)) = bf(F) (cos t , sin t) = (2 cos t + 1, 3 sin t) $

  Hence, the dot product being integrated is
  $ bf(F) (bf(r) (t)) dot bf(r)'(t)
    &= (2 cos t + 1) (- sin t) + (3 sin t) (cos t) \
    &= - 2 cos t sin t - sin t + 3 sin t cos t = cos t sin t - sin t $

  Integrate with respect to $t$ from $0$ to $pi/2$:
  $ int_(t=0)^(pi) (cos t sin t - sin t) dif t
    = int_(t=0)^(pi) (sin(2t)/2 - sin t) dif t
    = lr([-cos(2t) - cos(t)])_(t=0)^pi = -2. $

- Work on the brown line segment,
  parametrized again as $bf(r) (t) = (1 -  2 t, 0)$, where $t in [0, 1]$,
  and $ bf(r)' (t) = vec(- 2 , 0) . $
  Putting parameterization into the new vector field gives:
  $ bf(F) (bf(r) (t)) = vec(2 (1 - 2 t) + 1 , 3 dot 0) = vec(3 - 4 t , 0) . $

  The line integral of $bf(F)$ along $cal(C)$ is given by:
  $ int_(cal(C)) bf(F) dot dif bf(r) &= int_(t=0)^1 bf(F) (bf(r) (t)) dot bf(r)' (t) dif t
    = int_(t=0)^1 -2(3-4t) dif t \
    &= int_(t=0)^1 (8t-6) dif t = (4t^2-6t)_(t=0)^1 = -2. $

#sample[
  Suppose $cal(C)$ is any path from $(1,100)$ to $(42, 1337)$.
  Compute $ int_(cal(C)) 5 dif x. $
]
#soln[
  Expanding the shorthand $5 dif x = 5 dif x + 0 dif y$,
  the vector field we're integrating over is the constant vector field $bf(F)(x,y) = vec(5,0)$.
  (In the cartoon, every blue arrow points directly east and has the same length $5$.)
  This is certainly conservative: the potential function
  $ f(x,y) = 5x $
  can be found just by guessing or via the method in @sec-antigrad.
  Indeed, $nabla f = vec(5,0)$ as we needed.

  So now that we know $bf(F)$ is conservative and
  have found a potential function $f$,
  we can forget about parametrizing $cal(C)$ and just write directly
  $ int_(cal(C)) 5 dif x = f(42, 1337) - f(1, 100) = 5 dot 42 - 5 dot 1 = 5(42-1)
    = #boxed[$ 204 $]. #qedhere $
]

#remark[
  In general, the vector field encoded by $c dif x$ for any constant $c$ is conservative
  with potential function $f(x,y) = c x$.
  Hence, $int_(cal(C)) c dif x = c int_(cal(C)) dif x$
  will always just equal to $c$ times the total change in $x$.
]

== [TEXT] Okay, but how do you tell whether $bf(F)$ is conservative?

We saw that when $bf(F)$ is conservative, the curl $nabla times bf(F)$ is zero.
It turns out that if $bf(F)$ is defined everywhere, then the reverse is true too:
that is, we can use $nabla times bf(F)$ as a criteria for checking conservative fields.

#memo(title: [Memorize: Conservative $<==>$ $nabla times bf(F) = bf(0)$])[
  Assume here the vector field is continuously differentiable
  and defined everywhere on $RR^2$ or $RR^3$.
  - A vector field $bf(F) : RR^2 -> RR^2$
    given by $bf(F)(x,y) = vec(p(x,y), q(x,y))$
    is conservative if and only if the 2D scalar curl is zero everywhere:
    $ (partial q) / (partial x) - (partial p) / (partial y) = 0. $
  - A vector field $bf(F) : RR^3 -> RR^3$
    is conservative if and only if the curl $nabla times bf(F)$ is zero everywhere.
    In symbols, if $bf(F)(x,y) = vec(p(x,y,z), q(x,y,z), r(x,y,z))$ then we need
    all three components of the curl to equal $0$:
    $ (partial r) / (partial y) - (partial q) / (partial z)
      = (partial q) / (partial x) - (partial p) / (partial y)
      = (partial p) / (partial z) - (partial r) / (partial x) = 0. $
]

This should look familiar: it's the same thing I told you in @sec-when-antigrad.
The only thing that's change is that I now have an aquatic interpretation of all the equations:
that we require the 2D or 3D curl to be zero.
But the equations are the same.

#remark[
  This theorem also fails if the vector field $bf(F)$ is only defined on part of $RR^n$
  and the region is not _simply connected_.
  In that case it only works one direction --- that is,
  if $nabla times bf(F) != bf(0)$ then $bf(F)$ is definitely not conservative,
  but some non-conservative fields also satisfy $nabla times bf(F) = bf(0)$.
  // We won't get into this here, because in 18.02 I don't think you will encounter
  // any vector fields that aren't defined on a simply connected region.
  // jk we have gravity smh
]

#todo[insert some examples]

== [TEXT] Green's theorem (2D only)

We expect there should be a Stokes result as well for the red arrow
joining the 2D work integral to an area integral.
#figure(
  box(image("figures/work-cut-greens.svg", width: auto), stroke: 1pt),
  caption: [Green's theorem is the Stokes result for the above red arrow
    from the poster @fig-int-chart-stokes.],
)

Here is what it says.
#memo(title: [Memorize: Green's theorem for converting work to curl])[
  Suppose $cal(C)$ is a closed loop parametrized by $bf(r)(t)$
  that encloses a region $cal(R)$ counterclockwise.
  Then for any vector field $bf(F) = vec(p(x,y), q(x,y))$, conservative or not, we have
  $ oint_(cal(C)) bf(F) dot dif bf(r) = oint_(cal(C)) (p dif x + q dif y)
    = iint_(cal(R)) ((partial q)/(partial x) - (partial p)/(partial y)) dif A. $
]
There's a new symbol $oint_(cal(C))$ on the left,
but it has the same meaning as $int_(cal(C))$.
The circle is there to emphasize that $cal(C)$ is a closed loop,
i.e. it's required to have the same start and ending point
(unlike the other curves we saw in earlier examples).
In other words:
#definition(title: [Definition of $oint$])[
  $oint_(cal(C))$ means "$int_(cal(C))$ but with an extra optional reminder that $cal(C)$ is a loop".
  (The reminder is optional, i.e. you are not obligated
  to add the circle even when $cal(C)$ is a loop.)
]

Note this doesn't require $bf(F)$ to be conservative!
(All the past discussion about $bf(F)$ being conservative
was because we were using the red "grad" arrow in @fig-work-ftc-red-arrow.
But we're now moving on to a new red arrow in our poster,
and that assumption about a gradient isn't needed anymore.)
In fact, in the event that $bf(F) = nabla f$ _is_ conservative,
we know that $(partial q)/(partial x) - (partial p)/(partial y) = 0$:
the 2D scalar curl of a conservative vector field is $0$.
So Green's theorem is then just saying that $oint_(cal(C)) nabla f dif bf(r) = 0$
which we already knew.

#tip(title: [Tip: Always use counterclockwise orientation])[
  Whenever $cal(C)$ is a closed loop in $RR^2$,
  we'll basically always assume that the direction
  we walk around it is counterclockwise.
  It's considered bad manners to break this convention and have a loop oriented clockwise.
]

Green's theorem gives us a way to short-circuit a bunch of calculations
that we were doing by hand earlier in the case where our loop is closed.
Here are a few.

#sample[
  Calculate the line integral
  $ oint_(cal(C)) (x^3 - y) dif x + (x + y^3) dif y , $
  where $cal(C)$ is the circle $x^2 + y^2 = 4$ oriented counterclockwise.
]

#soln[
  Let $cal(R)$ denote the region enclosed by $cal(C)$.
  We use Green's theorem with the vector field
  $ p (x , y) = x^3 - y , quad q (x , y) = x + y^3 . $
  Calculate the partial derivatives of $q$ with respect to $x$ and $p$
  with respect to $y$:
  $ (partial q) / (partial x) = (partial) / (partial x) (x + y^3) &= 1 ,
    (partial p) / (partial y) = (partial) / (partial y) (x^3 - y) &= - 1 . $
  Substitute the partial derivatives into Green’s theorem:
  $ oint_(cal(C)) p dif x + q dif y
    = iint_(cal(R)) ((partial q) / (partial x) - (partial p) / (partial y)) dif A = iint_(cal(R)) (1 - (- 1)) dif A = iint_(cal(R)) 2 dif A . $
  The region $cal(R)$ is the disk defined by $x^2 + y^2 <= 4$,
  which is a circle of radius $2$, hence with area
  $ op("Area") (cal(R)) = pi r^2 = pi (2)^2 = 4 pi . $
  So the answer is $2 dot 4 pi = #boxed[$ 8 pi $]. $
]

#sample[
  Evaluate the line integral $ oint_(cal(C)) (y dif x - x dif y) $
  where $cal(C)$ is the triangle with vertices at $(0 , 0)$, $(1 , 0)$, and
  $(0 , 1)$, oriented counterclockwise.
]
#soln[
  Let $cal(R)$ denote the interior of the triangle.
  By Green’s theorem:
  $ oint_(cal(C)) p dif x + q dif y
    = iint_(cal(R)) ((partial q) / (partial x) - (partial p) / (partial y)) dif A , $
  where $P (x , y) = y$ and $Q (x , y) = - x$.
  Calculate $(partial q) / (partial x)$ and $(partial p) / (partial y)$:
  $ (partial q) / (partial x) = - 1 , quad (partial p) / (partial y) = 1 . $
  Hence
  $ iint_(cal(R)) ((partial q) / (partial x) - (partial p) / (partial y)) dif A = iint_(cal(R)) (- 1 - 1) dif A = iint_(cal(R)) - 2 dif A . $
  The area of the triangle $cal(R)$ is:
  $ op("Area")(cal(R)) = 1 / 2 dot upright("base") dot upright("height")
    = 1 / 2 dot 1 dot 1 = 1 / 2 . $
  Thus: $ iint_(cal(R)) - 2 dif A = - 2 dot 1 / 2 = #boxed[$ -1 $]. #qedhere $
]

#sample[
  Calculate the line integral
  $ oint_(cal(C)) (x^2 dif y - y^2 dif x) $
  where $C$ is the boundary of the square with vertices at
  $(1 , 1)$, $(0, 1)$, $(0, 0)$, and $(1 , 0)$,
  oriented counterclockwise.
]

#soln[
  Let $cal(R)$ denote the interior of the square.
  By Green’s theorem:
  $ oint_(cal(C)) p dif x + q dif y = iint_(cal(R)) ((partial q) / (partial x) - (partial p) / (partial y)) dif A , $
  where $p (x , y) = - y^2$ and $q (x , y) = x^2$.
  Calculate $(partial q) / (partial x)$ and $(partial p) / (partial y)$:
  $ (partial q) / (partial x) = 2 x , quad (partial p) / (partial y) = - 2 y . $
  Substitute these into Green’s theorem:
  $ iint_(cal(R)) (2 x - (- 2 y)) dif A = iint_(cal(R)) (2 x + 2 y) dif A . $

  Since $cal(R)$ is a square with side length $1$ centered at the origin,
  integrate over $x$ and $y$ from $0$ to $1$:
  $ iint_(cal(R)) (2 x + 2 y) dif A
    = 2 int_(y = 0)^1 int_(x = 0)^1 (x + y) dif x dif y . $

  Evaluate the inner integral with respect to $x$:
  $ [x^2 / 2 + y x]_(x=0)^1 = y + 1/2. $

  Evaluate the integral with respect to $y$:
  $ 2 int_(y = 0)^1 (y+1/2) dif y = #boxed[$ 2 $]. #qedhere $
]

== [SIDENOTE] A rough explanation for why Green's Theorem is true

#todo[write this]

== [RECIPE] Evaluating line integrals, all together now <sec-recipe-work>

While we gave a definition of line integrals with parametrization,
we then saw right away there are a couple shortcuts,
namely FTC and Green's theorem (in 2D) in certain cases.
So with this, we can present a recipe that condenses these together.

#recipe(title: [Recipe for computing line integrals with possible shortcuts])[
  Suppose we want to evaluate $ int_(cal(C)) bf(F) dot dif bf(r)$.

  1. First, check if the vector field is conservative
    by seeing if the curl is zero.
    - If so, don't bother parametrizing $cal(C)$.
      Don't even look at $cal(C)$ besides the endpoints.
      Find a potential function $f$ for the vector field $bf(F)$
      and use the FTC as a shortcut: output
      $ f("stop") - f("start"). $
  2. Second, if the line integral is in $RR^2$, check if $cal(C)$ is a closed loop.
    - If so, see if Green's theorem gives you an easy shortcut:
      $ oint_(cal(C)) (p dif x + q dif y) = iint_(cal(R)) ((partial q)/(partial x) - (partial p)/(partial y)) dif A. $
  3. If both of these fail,
    fall back the parametrization recipe described in @sec-work-manual-recipe.
    To repeat it here:
      1. Pick *any* parametrization $bf(r) : RR -> RR^n$ of the curve $cal(C)$,
        including specifying the start and stop times.
        As described in @sec-flex-param, you have some freedom in how you set the parametrization.
      2. Calculate the derivative $bf(r)'(t)$.
      3. Calculate the dot product $bf(F)(bf(r)(t)) dot bf(r)'(t)$.
      4. Integrate this from the start time to the stop time.
]

We'll give several more examples of this in @sec-recipe-2d-flux,
where we contrast it to another type of line integral, the "2D flux".

== [TEXT] Piecing things together

#todo[write this]

== [EXER] Exercises

#exer[
  Is the vector field
  $ bf(F)(x,y) = vec(sin(e^x) + cos(e^x), arctan(y)) $
  conservative?
]
