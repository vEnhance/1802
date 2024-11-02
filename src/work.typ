#import "@local/evan:1.0.0":*

= Work and conservative vector fields <sec-work>

== [TEXT] Work

We now define the leftmost purple pictures in our poster @fig-int-chart-stokes.
When we have a vector field $bf(F) : RR^n -> RR^n$
as a path $bf(r) : RR -> RR^n$ through it, we can define the *work* on it.

#figure(
  box(image("figures/work-cut.png", width: auto), stroke: 1pt),
  caption: [The work integral circled from the giant poster in @fig-int-chart-stokes.],
)

#definition(title: [Definition of work])[
  The *work* of $bf(F) : RR^n -> RR^n$ done on a path $bf(r) : RR -> RR^n$
  is defined as
  $ int_("start time")^("stop time") bf(F)(bf(r)(t)) dot bf(r)'(t) dif t. $
]
#typesig[
  The work is a scalar quantity (there is a dot product inside the integrand,
  so it returns a number.)
]

This is commonly abbreviated with shorthand in two ways.
- First, we mention a new row of the shorthand in @table-shorthand:
  $ dif bf(r) := bf(r)'(t) dif t. $
- Second, often the time parametrization is suppressed from the notation
  and we just write $int_(cal(C))$ instead, where $cal(C)$ denotes the curve that $bf(r)(t)$ traces out.
  In this context we always consider the curve to be *directed*,
  i.e. one of the endpoints is the starting point, and the other is the ending point.

That means the above work integral can be rewritten as just
$ int_(cal(C)) bf(F) dot dif bf(r). $
Mercifully, the shorthand still writes a dot product in the symbols, to remind you that, yes,
you should be evaluating a dot product when you compute this.
I can't imagine how much confusion it would cause if the shorthand didn't have the dot product.

If you want to visualize the integral,
you can imagine walking along the path cut out by $bf(r)$.
At each point, you draw the tangent vector $bf(r)'(t)$ to the path,
and also look at the arrow for the vector field $bf(F)(bf(r(t)))$ at that point.
There's a dot product of these two vectors, which is a number.
The line integral adds up all these numbers.

#figure(
  image("figures/work-dot.png", width: auto),
  caption: [Cartoon of the dot products being added up by the work integral.
  Imagine adding up all the dot products $bf(r)'(t) dot bf(F)(bf(r)(t))$.],
)

In practice, if you actually want to do the integral calculation,
you end up having to do a parametrization, so the shorthand hides how much effort will be needed.
For example, in the following exercise, $cal(C)$ is the upper half of the circle $x^2+y^2=1$,
directed from the point $(1,0)$ to $(-1,0)$.
(Again, for work integrals, we always require a specification
of which way the integral moves along $cal(C)$,
if we choose to hide the parametrization $bf(r)(t)$ from the notation.)

#tip(title: [The work integral doesn't depend on the exact parametrization])[
  The work integral depends on which direction you walk along the path
  (it negates if you flip the start and stop point),
  but it doesn't depend on exactly how exactly you parametrize the path.
  Thus, we might talk about the work integral along, say,
  the arc upper semicircle from $(1,0)$ to $(-1,0)$, i.e. the blue arc in @fig-work-ex1.

  When we actually do the calculation,
  we could use $bf(r)(t) = (cos(t), sin(t))$ for $0 <= t <= pi$;
  but we could also use $bf(r)(t) = (cos(pi t), sin(pi t))$ for $0 <= t <= 1$.
  Or if you wanted to annoy the grader,
  you could even use $bf(r)(t) = (cos(pi t^2), sin(pi t^2))$ for $0 <= t <= 1$,
  which traces out the same arc at an irregular rate.
  Since these all give the same answer, you should pick the parametrization
  that makes the calculation easiest for you.
]


Let's show some examples of how to calculate this in practice.

#sample[
  Compute the line integral of the vector field
  $bf(F) (x , y) = vec(2 y , 3 x)$ along the following two curves:

  - the upper half of the circle $x^2 + y^2 = 1$, oriented counterclockwise
    (blue in @fig-work-ex1).
  - the line segment from $(1,0)$ to $(-1,0)$
    (brown in @fig-work-ex1).
]

#figure(
  image("figures/work-ex1.png", width: auto),
  caption: [Two example of a work integral in the vector field $bf(F) = vec(2y, 3x)$
    The blue path is the upper semicircle of $x^2+y^2=1$; the brown one is a straight line.],
) <fig-work-ex1>


#soln[
  We do both parts; to prevent drowning in subscripts, we'll use $cal(C)$ and $bf(r)$
  for the curve and parametrization for each part.

  - Let's first do the problem when $cal(C)$ is the arc.
    The upper half of the circle $x^2 + y^2 = 1$ can be parametrized by:
    $ bf(r) (t) = vec(cos t , sin t) , quad upright("where ") t upright(" ranges from ") 0 upright(" to ") pi . $
    Substitute the parameterization into the vector field:
    $ bf(F) (bf(r) (t)) = bf(F) (cos t , sin t) = vec(2 sin t , 3 cos t) . $
    Differentiate $bf(r) (t)$ with respect to $t$:
    $ bf(r)' (t) = vec(- sin t , cos t) . $
    The line integral of $bf(F)$ along $cal(C)$ is given by:
    $ int_(cal(C)) bf(F) dot dif bf(r) &= int_(t=0)^pi bf(F) (bf(r) (t)) dot bf(r)' (t) dif t \
      &= int_(t=0)^pi vec(2 sin t , 3 cos t) dot vec(- sin t , cos t) dif t \
      &= int_(t=0)^pi [-2 sin^2 t + 3 cos^2 t] dif t. $
    To simplify these trig expressions, we use the fact that
    $ sin^2 t = (1 - cos 2 t) / (2) , quad cos^2 t = (1 + cos 2 t) / (2) . $
    Substitute these into the integral:
    $ int_(t=0)^pi [- 2 dot (1 - cos 2 t) / (2) + 3 dot (1 + cos 2 t) / (2)] dif t \
    &= int_(t=0)^pi [- (1 - cos 2 t) + 3 / 2 (1 + cos 2 t)] dif t \
    &= int_(t=0)^pi [1 / 2 + 5 / 2 cos 2 t] dif t. $
    The term $int_(t=0)^pi cos(2t) dif t$ is zero by symmetry, so the final integral is $pi/2$.

  - Now let's suppose $cal(C)$ is the brown line segment shown.
    Parametrize the curve $cal(C)$ as $bf(r) (t) = (1 -  2 t, 0)$, where $t in [0, 1]$.
    Differentiate $bf(r) (t)$ with respect to $t$:
    $ bf(r)' (t) = vec(- 2 , 0) . $
    Meanwhile, the parameterization into the vector field is:
    $ bf(F) (bf(r) (t)) = bf(F) (0, 1 - 2t) = vec(0, 3 - 6t). $
    The dot product is identically equal to zero:
    $ vec(-2, 0) dot vec(0, 3-6t) = 0. $
    So the line integral is $0$ as well. #qedhere
]

In particular the work integral in general depends on which path you take:
we got different answers for the blue and brown path above.
It's only for the so-called *conservative* vector fields,
which we'll talk about more in a moment,
for which work integrals are path-independent.

== [SIDENOTE] Aquatic interpretation of work

Letting $bf(F)$ represent water current as always,
the "work" done along a trajectory can be thought of
as a measure of how much the water current assists or resists movement
along that path.

To compute this, consider a trajectory along which an object, such as a
boat or swimmer, moves through the water. The current vector field
$bf(F)$ at any point describes the speed and direction of the
water flow at that location. The work done by the current as the object
follows a path $cal(C)$ depends on the alignment of the current with the
object’s movement along that path.

1. _When the current aligns with the path_: If the direction of
  $bf(F)$ aligns with the direction of the trajectory at a
  point, the current contributes positively to the work along that
  segment, effectively aiding the motion. This is experienced as a
  "push" in the direction of travel.

2. _When the current opposes the path_: If the current direction
  opposes the trajectory at any point, it contributes negatively to the
  work, effectively resisting the motion. In this case, the object has to
  work against the current, experiencing it as a "drag" force that slows
  its progress.

3. _When the current flows perpendicularly to the path_: If
  $bf(F)$ is perpendicular to the trajectory at a point, it
  does no work in the direction of travel, as the current neither aids nor
  resists the movement along the path. The effect of the current in this
  case would primarily cause a lateral drift rather than a forward or
  backward push along the trajectory.

== [TEXT] The fundamental theorem of calculus for line integrals

We now show the first special case of Stokes' theorem.
It corresponds to a statement for the red arrow shown below.

#figure(
  box(image("figures/work-cut-ftc.png", width: auto), stroke: 1pt),
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

More practically, the following two results are true:
#idea(title: [Idea: Practical consequences of FTC for line integrals])[
  If you _already know_ $bf(F)$ is conservative, then
  - If you also know the potential function $f$,
    then work integrals are extremely easy to calculate:
    just compute $f("ending point")-f("starting point")$.
  - If you don't know the potential function $f$,
    the integral above could give you a way to find it,
    if you can't get the methods in @sec-antigrad to work.
]

Let's see this concretely with a conservative vector field.
We'll use $ bf(F) (x , y) = vec(2 x + 1, 3 y) $
which, if we follow the recipe from @sec-antigrad,
we can recover the $f$ such that $bf(F) = nabla f$:
$ f(x,y) = x^2 + x + 3 / 2 y^2. $
Thus, now that $f$ is known, line integrals are trivial to compute:

#sample[
  Compute the line integral of the vector field
  $bf(F) (x , y) = vec(2 x , 3 y)$ along the following two curves:

  - the upper half of the circle $x^2 + y^2 = 1$, oriented counterclockwise
    (blue in @fig-work-ex2).
  - the line segment from $(1,0)$ to $(-1,0)$
    (brown in @fig-work-ex2).
]

#figure(
  image("figures/work-ex2.png", width: auto),
  caption: [The same brown and blue path from @fig-work-ex1,
  but this time with a different vector field, now conservative.],
) <fig-work-ex2>


#soln[
  Because we know the potential function
  $ f(x,y) = x^2 + x + 3 / 2 y^2 $
  the answer to both parts is the same:
  $ f(-1,0) - f(1,0) = 0 - 2 = -2. #qedhere $
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

== [TEXT] Okay, but how do you tell whether $bf(F)$ is conservative?

We saw that when $bf(F)$ is conservative, the curl $nabla times bf(F)$ is zero.
It turns out that if $bf(F)$ is defined everywhere, then the reverse is true too:
that is, we can use $nabla times bf(F)$ as a criteria for checking conservative fields.

#memo(title: [Memorize: Conservative $<==>$ $nabla times bf(F) = bf(0)$])[
  Assume here the vector field is continuously differentiable and defined everywhere.
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

#digression[
  This theorem also fails if the vector field $bf(F)$ is only defined on part of $RR^n$
  and the region is not _simply connected_.
  In that case it only works one direction --- that is,
  if $nabla times bf(F) != bf(0)$ then $bf(F)$ is definitely not conservative,
  but some non-conservative fields also satisfy $nabla times bf(F) = bf(0)$.
  We won't get into this here, because in 18.02 I don't think you will encounter
  any vector fields that aren't defined on a simply connected region.
]

== [TEXT] Green's theorem (2D only)

We expect there should be a special case of Stokes' theorem as well for the red arrow
joining the 2D work integral to an area integral.
#figure(
  box(image("figures/work-cut-greens.png", width: auto), stroke: 1pt),
  caption: [Green's theorem is Stokes' theorem for the above red arrow
    from the poster @fig-int-chart-stokes.],
)

Here is what it says:
#memo(title: [Memorize: Green's theorem for converting work to curl])[
  Suppose $cal(C)$ is a closed loop parametrized by $bf(r)(t)$
  that encloses a region $cal(R)$ counterclockwise.
  Then for any vector field $bf(F) = vec(p(x,y), q(x,y))$, conservative or not, we have
  $ oint_(cal(C)) bf(F) dot dif bf(r) = iint_(cal(R))
    ((partial q)/(partial x) - (partial p)/(partial y)) dif A. $
]
There's a new symbol $oint_(cal(C))$ on the left,
but it has the same meaning as $int_(cal(C))$.
The circle is there to emphasize that $cal(C)$ is a closed loop,
i.e. it's required to have the same start and ending point
(unlike the other curves we saw in earlier examples).
In other words:
#definition(title: [Definition of $oint$])[
  $oint_(cal(C))$ means "$int_(cal(C))$ but with an extra reminder that $cal(C)$ is a loop".
]

Note this doesn't require $bf(F)$ to be conservative!
(All the past discussion about $bf(F)$ being conservative
was because we were using the red "grad" arrow in @fig-work-ftc-red-arrow.
But we're now moving on to a new red arrow in our poster,
and that assumption about a gradient isn't needed anymore.)
In fact, in the event that $bf(F)$ _is_ conservative,
we know that $(partial q)/(partial x) - (partial p)/(partial y) = 0$:
the 2D scalar curl of a conservative vector field is $0$.
So Green's theorem is then just saying that $oint_(cal(C)) nabla f dif bf(r) = 0$
which we already knew.

Green's theorem gives us a way to short-circuit a bunch of calculations
that we were doing by hand earlier in the case where our loop is closed.
Here are a few.

#todo[clean up the notation etc. for the following examples]

#strong[Example 1:]

Calculate the line integral
$integral.cont_C (x^2 - y) dif x + (y^2 - x) dif y$, where $C$ is
the boundary of the region enclosed by the circle $x^2 + y^2 = 4$,
oriented counterclockwise.

#strong[Solution:]

By Green’s theorem, we have:
$ integral.cont_C P dif x + Q dif y = iint_D ((partial Q) / (partial x) - (partial P) / (partial y)) dif A , $
where $P (x , y) = x^2 - y$ and $Q (x , y) = y^2 - x$.

Calculate $(partial Q) / (partial x)$ and $(partial P) / (partial y)$:
$ (partial Q) / (partial x) = - 1 , quad (partial P) / (partial y) = - 1 . $

Substitute these into Green’s theorem:
$ iint_D ((partial Q) / (partial x) - (partial P) / (partial y)) dif A = iint_D (- 1 - (- 1)) dif A = iint_D 0 dif A = 0 . $

Since the integrand is zero, the value of the line integral is:
$ #box(stroke: black, inset: 3pt, [$ 0 $]) . $

#strong[Example 2:]

Evaluate the line integral $integral.cont_C (y dif x - x dif y)$,
where $C$ is the triangle with vertices at $(0 , 0)$, $(1 , 0)$, and
$(0 , 1)$, oriented counterclockwise.

#strong[Solution:]

By Green’s theorem:
$ integral.cont_C P dif x + Q dif y = iint_D ((partial Q) / (partial x) - (partial P) / (partial y)) dif A , $
where $P (x , y) = y$ and $Q (x , y) = - x$.

Calculate $(partial Q) / (partial x)$ and $(partial P) / (partial y)$:
$ (partial Q) / (partial x) = - 1 , quad (partial P) / (partial y) = 1 . $

Substitute these into Green’s theorem:
$ iint_D ((partial Q) / (partial x) - (partial P) / (partial y)) dif A = iint_D (- 1 - 1) dif A = iint_D - 2 dif A . $

The area of the triangle $D$ is:
$ upright("Area") = 1 / 2 dot upright("base") dot upright("height") = 1 / 2 dot 1 dot 1 = 1 / 2 . $

Thus: $ iint_D - 2 dif A = - 2 dot 1 / 2 = - 1 . $

The value of the line integral is:
$ #box(stroke: black, inset: 3pt, [$ - 1 $]) . $

#strong[Example 3:]

Calculate the line integral
$integral.cont_C (x^2 dif y - y^2 dif x)$, where $C$ is the
boundary of the square with vertices at $(1 , 1)$, $(- 1 , 1)$,
$(- 1 , - 1)$, and $(1 , - 1)$, oriented counterclockwise.

#strong[Solution:]

By Green’s theorem:
$ integral.cont_C P dif x + Q dif y = iint_D ((partial Q) / (partial x) - (partial P) / (partial y)) dif A , $
where $P (x , y) = - y^2$ and $Q (x , y) = x^2$.

Calculate $(partial Q) / (partial x)$ and $(partial P) / (partial y)$:
$ (partial Q) / (partial x) = 2 x , quad (partial P) / (partial y) = - 2 y . $

Substitute these into Green’s theorem:
$ iint_D (2 x - (- 2 y)) dif A = iint_D (2 x + 2 y) dif A . $

Since $D$ is a square with side length $2$ centered at the origin,
integrate over $x$ and $y$ from $- 1$ to $1$:
$ iint_D (2 x + 2 y) dif A = 2 int_(- 1)^1 int_(- 1)^1 (x + y) dif x dif y . $

Evaluate the inner integral with respect to $x$:
$ 2 int_(- 1)^1 [x^2 / 2 + y x]_(- 1)^1 dif y = 2 int_(- 1)^1 [(1 / 2 + y) - (1 / 2 - y)] dif y = 2 int_(- 1)^1 2 y dif y . $

Evaluate the integral with respect to $y$:
$ 4 int_(- 1)^1 y dif y = 4 dot 0 = 0 . $

The value of the line integral is:
$ #box(stroke: black, inset: 3pt, [$ 0 $]) . $



== [EXER] Exercises

#exer[
  Is the vector field
  $ bf(F)(x,y) = vec(sin(e^x) + cos(e^x), arctan(y)) $
  conservative?
]
