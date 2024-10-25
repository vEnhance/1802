#import "@local/evan:1.0.0":*

= Work and conservative vector fields <sec-work>

== [TEXT] Work

We now define the leftmost purple pictures @fig-int-chart-stokes.
When we have a vector field $bf(F) : RR^n -> RR^n$
as a path $bf(r) : RR -> RR^n$ through it, we can define the *work* on it.

#todo[cut out this part of the picture]

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

In practice, if you actually want to do the integral calculation,
you end up having to do a parametrization, so the shorthand hides how much effort will be needed.
For example, in the following exercise, $cal(C)$ is the upper half of the circle $x^2+y^2=1$,
directed from the point $(1,0)$ to $(-1,0)$.
(Again, for work integrals, we always require a specification
of which way the integral moves along $cal(C)$,
if we choose to hide the parametrization $bf(r)(t)$ from the notation.)

#sample[
  Compute the line integral of the vector field
  $bf(F) (x , y) = vec(2 x , 3 y)$ along the curve $cal(C)$
  which is the upper half of the circle $x^2 + y^2 = 1$, oriented counterclockwise.
]

#soln[
  The line integral of a vector field $bf(F)$ along a curve $cal(C)$
  is given by: $ int_cal(C) bf(F)(bf(r)(t)) dot bf(r)'(t) dif t $
  Parametrize the curve $cal(C)$ as $bf(r) (t) = (cos t , sin t)$, where $t in [0 , pi/2]$.

  First we compute $bf(r)'(t)$ which is $ bf(r)'(t) dif t = (- sin t, cos t) $.
  Meanwhile, the values of $bf(F)$ along the curve are
  $ bf(F) (bf(r) (t)) = bf(F) (cos t , sin t) = (2 cos t , 3 sin t) $

  Hence, the dot product being integrated is
  $ bf(F) (bf(r) (t)) dot bf(r)'(t)
    &= (2 cos t) (- sin t) + (3 sin t) (cos t) \
    &= - 2 cos t sin t + 3 sin t cos t = cos t sin t $

  Integrate with respect to $t$ from $0$ to $pi/2$:
  $ int_0^(pi/2) cos t sin t dif t $

  Using the identity $cos t sin t = 1 / 2 sin (2 t)$, we rewrite the integral:
  $ int_0^pi cos t sin t dif t &= 1 / 2 int_0^(pi/2) sin (2 t) dif t \
    &= 1 / 2 [- 1 / 2 cos (2 t)]_0^(pi/2) \
    &= 1 / 2 [- 1 / 2 cos (pi) + 1 / 2 cos (0)] \
      &= 1 / 2 [- 1 / 2 (-1) + 1 / 2 (1)] = 1/2. #qedhere $
]

Here's the aquatics.
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

We now show the first special case of Stokes' theorem:

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

#todo[example]

== [TEXT] Okay, but how do you tell whether $bf(F)$ is conservative?

We saw that when $bf(F)$ is conservative, the curl $nabla times bf(F)$ is zero.
It turns out that if $bf(F)$ is defined everywhere, then the reverse is true too:
that is, we can use $nabla times bf(F)$ as a criteria for checking conservative fields.

#memo(title: [Memorize: Conservative $<==>$ $nabla times bf(F) = bf(0)$])[
  - A vector field $bf(F) : RR^2 -> RR^2$ given by $bf(F)(x,y) = vec(f(x,y), g(x,y))$
    which is defined everywhere is conservative if and only if the 2D scalar curl
    $(partial g) / (partial x) - (partial f) / (partial y)$ is zero everywhere.
  - A vector field $bf(F) : RR^3 -> RR^3$ which is defined everywhere
    is conservative if and only if the curl $nabla times bf(F)$ is zero everywhere.
]

#digression[
  This theorem fails if the vector field $bf(F)$ is only defined on part of $RR^n$
  and the region is not _simply connected_.
  In that case it only works one direction --- that is,
  if $nabla times bf(F) != bf(0)$ then $bf(F)$ is definitely not conservative,
  but some non-conservative fields also satisfy $nabla times bf(F) = bf(0)$.
  We won't get into this here, because in 18.02 I don't think you will encounter
  any vector fields that aren't defined on a simple connected region.
]

= [TEXT] Green's theorem (in two forms)
