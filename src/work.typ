#import "@local/evan:1.0.0":*

= Work and conservative vector fields <sec-work>

== [TEXT] Work <sec-work-def>

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
  $ int_(t="start time")^("stop time") bf(F)(bf(r)(t)) dot bf(r)'(t) dif t. $
]
#typesig[
  Keep in mind the types of the inputs; see @table-types-work.
  The work is a scalar quantity
  (there is a dot product inside the integrand, so it outputs a number).
]
#figure(
  table(
    columns: 4,
    align: left,
    table.header([Symbol], [Name], [Input type], [Output type]),
    [$bf(r) : RR -> RR^n$], [Parametrization of a path], [Scalar $t$ (time)], [Point (dot) in $RR^n$],
    [$bf(r)' : RR -> RR^n$], [Velocity vector for $bf(r)$], [Scalar $t$ (time)], [Vector (arrow) in $RR^n$],
    [$bf(F) : RR^n -> RR^n$], [Vector field], [Point (dot) in $RR^n$], [Vector (arrow) in $RR^n$],
  ),
  caption: [The type signatures of the objects in the work integral.],
  kind: table
) <table-types-work>

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

== [SIDENOTE] Aquatic interpretation of work

Letting $bf(F)$ represent water current as always,
the "work" done along a trajectory can be thought of as:
#idea[
  The work tells you how much the water current helps or hinders
  the movement of a swimmer through the water.
]

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
  The dot products are positive since at each point $P = bf(r)(t)$,
  the vectors $bf(F)(P)$ and $bf(r)'(t)$ align well,
  and the work is a sum of a lot of positive numbers.

2. _When the current opposes the path_: If the current direction
  opposes the trajectory at any point, it contributes negatively to the
  work, effectively resisting the motion. In this case, the object has to
  work against the current, experiencing it as a "drag" force that slows
  its progress.
  The dot products are negative since at each point $P = bf(r)(t)$,
  the vectors $bf(F)(P)$ and $bf(r)'(t)$ point against each other,
  and the work is a sum of a lot of negative numbers.

3. _When the current flows perpendicularly to the path_: If
  $bf(F)$ is perpendicular to the trajectory at a point, it
  does no work in the direction of travel, as the current neither aids nor
  resists the movement along the path. The effect of the current in this
  case would primarily cause a lateral drift rather than a forward or
  backward push along the trajectory.
  The dot products are zero in this case: at each point $P = bf(r)(t)$,
  the vectors $bf(F)(P)$ and $bf(r)'(t)$ are perpendicular.

#todo[might be nice to have a figure here]

== [TEXT] Visualizing line integrals via dot products

If you want to visualize the integral,
you can imagine walking along the path cut out by $bf(r)$.
At each point, you draw the tangent vector $bf(r)'(t)$ to the path,
and also look at the arrow for the vector field $bf(F)(bf(r(t)))$ at that point.
There's a dot product of these two vectors, which is a number.
The line integral adds up all these numbers.

#tip(title: [The light blue and purple in @fig-work-dot are totally separate])[
  When drawing a cartoon like in @fig-work-dot,
  it might be useful to keep in mind that there are two parts to the picture:

  - the curve $cal(C)$ and its parametrization $bf(r)(t)$ (purple in @fig-work-dot)
  - the vector field $bf(F)(x,y)$ (light blue arrows in @fig-work-dot)

  Remember, *these two parts have nothing to do with each other*.
  That is:
  - When you're sketching the light blue arrows for $bf(F)(x,y)$,
    you should only look at $bf(F)$ and completely ignore $cal(C)$ and $bf(r)$.
  - Similarly, when sketching the purple path $cal(C)$, ignore $bf(F)$ completely.
]

#figure(
  image("figures/work-dot.png", width: auto),
  caption: [Cartoon of the dot products being added up by the work integral.
  Imagine adding up all the dot products $bf(r)'(t) dot bf(F)(bf(r)(t))$.],
) <fig-work-dot>

In practice, if you actually want to do the integral calculation,
you end up having to do a parametrization, so the shorthand hides how much effort will be needed.
For example, in the following exercise, $cal(C)$ is the upper half of the circle $x^2+y^2=1$,
directed from the point $(1,0)$ to $(-1,0)$.
(Again, for work integrals, we always require a specification
of which way the integral moves along $cal(C)$,
if we choose to hide the parametrization $bf(r)(t)$ from the notation.)

#tip(title: [Tip: The work integral doesn't depend on the exact parametrization])[
  The work integral depends on which direction you walk along the path
  (it negates if you flip the start and stop point),
  but it doesn't depend on exactly how exactly you parametrize the path.

  Thus, we might talk about the work integral along, say,
  the arc upper semicircle from $(1,0)$ to $(-1,0)$ (see the blue arc in later @fig-work-ex1).

  When we actually do the calculation,
  we could use $bf(r)(t) = (cos(t), sin(t))$ for $0 <= t <= pi$;
  but we could also use $bf(r)(t) = (cos(pi t), sin(pi t))$ for $0 <= t <= 1$.
  Or if you wanted to annoy the grader,
  you could even use $bf(r)(t) = (cos(pi t^2), sin(pi t^2))$ for $0 <= t <= 1$,
  which traces out the same arc at an irregular rate.
  Since these all give the same answer, you should pick the parametrization
  that makes the calculation easiest for you.
]

#tip(title: [Tip: Splicing is OK])[
  There's no issue with cutting up the path into multiple parts.
  For example, if $cal(C)$ is a closed loop consisting of walking along
  the perimeter of the square, just cut it into the four line segments.
]

== [RECIPE] Computing line integrals by hand <sec-work-manual-recipe>

#recipe(title: [Recipe for computing line integrals by hand])[
  To compute the line integral of $bf(F)$ over the curve $cal(C)$:

  1. Pick *any* parametrization $bf(r) : RR -> RR^n$ of the curve $cal(C)$,
    including specifying the start and stop times.
    - You have some freedom in how you set the parametrization:
      it only matters you start and end at the right place,
      and trace out the exact curve $cal(C)$.
      So you should pick a parametrization that makes your calculation easier.
  2. Calculate the derivative $bf(r)'(t)$.
  3. Calculate the dot product $bf(F)(bf(r)(t)) dot bf(r)'(t)$.
  4. Integrate this from the start time to the stop time.
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
  caption: [Two example of a work integral in the vector field $bf(F)(x,y) = vec(2y, 3x)$.
    The blue path is the upper semicircle of $x^2+y^2=1$; the brown one is a straight line.],
) <fig-work-ex1>

#soln[
  We do both parts; to prevent drowning in subscripts, we'll use $cal(C)$ and $bf(r)$
  for the curve and parametrization for each part.

  Before jumping into the calculation, look at @fig-work-ex1 to get a sense of what's going on.
  The blue arc has mixed signs: near the start and end of the arc, the dot products we're adding
  are positive as the small arrows line up well with the blue path.
  But we're moving against the current near the top.
  Since the arrows near the start on longer, you might guess the work integral is a small
  positive number, and you'd be right.

  Meanwhile, along the brown arrow, all the arrows are perpendicular to our trajectory.
  We should expect the total work to thus be $0$, and indeed it is.

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
    $ int_(t=0)^pi [- 2 dot (1 - cos 2 t) / (2) + 3 dot (1 + cos 2 t) / (2)] dif t
    &= int_(t=0)^pi [- (1 - cos 2 t) + 3 / 2 (1 + cos 2 t)] dif t \
    &= int_(t=0)^pi [1 / 2 + 5 / 2 cos 2 t] dif t. $
    The term $int_(t=0)^pi cos(2t) dif t$ is zero by symmetry, so the final integral is $pi/2$.

  - Now let's suppose $cal(C)$ is the brown line segment shown.
    Parametrize the curve $cal(C)$ as $bf(r) (t) = (1 -  2 t, 0)$, where $0 <= t <= 1$.
    (You could also use $bf(r)(t) = (1-t, 0)$ for $0 <= t <= 2$ if you prefer,
    or any other parametrization starting from $(1,0)$ and ending at $(-1,0)$; you'll get the same answer.)

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

== [TEXT] Even more shorthand: $p dif x + q dif y$

Then notation $int_(cal(C)) bf(F) dot dif bf(r)$ can _still_ be contracted further:
there is another shorthand that hides both $bf(F)$ and $bf(r)$ altogether.
Here it is:

#definition(title: [Definition: More shorthand for line integrals])[
  In $RR^2$, suppose $bf(F)(x,y) = vec(p(x,y), q(x,y))$.
  Then the work integral can further be abbreviated as
  $ int_(cal(C)) (p dif x + q dif y). $

  Analogously, suppose we have a vector field
  $bf(F)(x,y,z) = vec(p(x,y,z), q(x,y,z), r(x,y,z))$ for $RR^3$.
  Then the work integral can further be abbreviated as
  $ int_(cal(C)) (p dif x + q dif y + r dif z). $
]

If any of $p$, $q$, $r$ are zero, that term can also be omitted entirely.
So for example, in 2D, if you see
$ int_(cal(C)) y dif x $
you should take this shorthand to mean
$ int_(cal(C)) y dif x := int_(cal(C)) vec(y, 0) dot dif bf(r). $

Let's do an example to practice the weird $dif x$ and $dif y$ shorthand,
along a different path.
#sample[
  Let $cal(C)$ denote the arc of the parabola $y = x^2$ starting from $(-1,1)$
  and moving right to $(1,1)$.
  Compute the line integral
  $ int_(cal(C)) y^(2 slash 3) dif x. $
]
#soln[
  First we need to expand the shorthand with $dif x$ and $dif y$.
  Recall that $p dif x + q dif y$ is shorthand for the vector field being $vec(p,q)$.
  So where $y^(2 slash 3) dif x = y^(2 slash 3) dif x + 0 dif y$, we expand the shorthand as
  $ int_(cal(C)) y^(2 slash 3) dif x = int_(cal(C)) vec(y^(2 slash 3), 0) dot dif bf(r)
    = int_("start time")^("stop time") bf(F)(bf(r)(t)) dot bf(r)'(t) dif t $
  where $bf(F)(x,y) := vec(y^(2 slash 3), 0)$ refers to the vector field
  encoded by the $y^(2 slash 3) dif x$ shorthand.

  Again, if you look at the sketch in @fig-work-ex1b, we're expecting a positive work:
  all the arrows are pointing right,
  and the path $cal(C)$ in red is moving right as well,
  so all the dot products are positive.
  (Again, if you imagine the blue arrows as a river current,
  it's definitely helping you swim, even if it's not directly aligned
  since you're not swimming straight east.)

  #figure(
    image("figures/work-ex1b.png", width: auto),
    caption: [The vector field $bf(F)(x,y) = vec(y^(2 slash 3), 0)$ (little light blue horizontal arrows)
    and an arc $cal(C)$ from the parabola $y=x^2$ in it (purple).],
  ) <fig-work-ex1b>

  The arc of the parabola we're trying to traverse needs to start at $(-1,1)$ and end at $(1,1)$.
  Just to make things concrete, examples of points we expect to pass through in our path are
  $ (-1,1) --> (-1/2, 1/4) --> (-1/3, 1/9) --> (0,0) --> (1/3, 1/9) --> (1/2, 1/4) --> (1,1). $
  Anyway, we choose to parametrize the time as varying in $-1 <= t <= 1$ with
  $ bf(r)(t) = (t, t^2). $

  Now if we throw everything in, we have
  $ bf(F)(bf(r)(t)) = bf(F)(t, t^2) = vec(t^(4/3), 0) $
  and
  $ bf(r)'(t) = vec(1, 2t). $
  So the overall line integral becomes
  $
    int_(t=-1)^1 underbrace(vec(t^(4/3),0), = bf(F)(bf(r)(t))) dot underbrace(vec(1, 2t), =bf(r)'(t)) dif t
    = int_(t=-1)^1 t^(4/3) dif t
    = [3/7 t^(7/3)]_(t=-1)^1 = 6/7. #qedhere
  $
]
== [TEXT] The fundamental theorem of calculus for line integrals

We now show the first Stokes result.
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

In other words:
#idea(title: [Idea: Practical consequences of FTC for line integrals])[
  If you _already know_ $bf(F)$ is conservative, then
  - If you also know the potential function $f$,
    then work integrals are extremely easy to calculate:
    just compute $f("ending point")-f("starting point")$.
  - If you don't know the potential function $f$,
    use the methods in @sec-antigrad to find it.
  - If the starting point and ending point are the same you don't even need to find $f$.
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
  $ int_(cal(C)) 5 dif x = f(42, 1337) - f(1, 100) = 5 dot 42 - 5 dot 1 = 5(42-1) = 204. #qedhere $
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

We expect there should be a Stokes result as well for the red arrow
joining the 2D work integral to an area integral.
#figure(
  box(image("figures/work-cut-greens.png", width: auto), stroke: 1pt),
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
  $oint_(cal(C))$ means "$int_(cal(C))$ but with an extra reminder that $cal(C)$ is a loop".
]

#tip(title: [Tip: Always use counterclockwise orientation])[
  Whenever $cal(C)$ is a closed loop in $RR^2$,
  we'll basically always assume that the direction
  we walk around it is counterclockwise.
  It's considered extremely bad manners to break this convention and have a loop oriented clockwise.
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
  So the answer is $2 dot 4 pi = 8 pi. $
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
  Thus: $ iint_(cal(R)) - 2 dif A = - 2 dot 1 / 2 = - 1 . #qedhere $
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
  $ 2 int_(y = 0)^1 (y+1/2) dif y = 2. #qedhere $
]

== [RECIPE] Evaluating line integrals, all together now

While we gave a definition of line integrals with parametrization,
we then saw right away there are a couple shortcuts,
namely FTC and Green's theorem (in 2D) in certain cases.
So with this, we can present a recipe that condenses these together.

#recipe(title: [Recipe for computing line integrals in general])[
  Suppose we want to evaluate $ int_(cal(C)) bf(F) dot dif bf(r)$.

  1. First, check if the vector field is conservative
    by seeing if the curl is zero.
    - If so, don't bother parametrizing $cal(C)$.
      Find a potential function $f$ for the vector field $bf(F)$
      and use the FTC as a shortcut.
  2. Second, if the line integral is in $RR^2$, check if $cal(C)$ is a closed loop.
    - If so, see if Green's theorem gives you an easy shortcut:
      $ oint_(cal(C)) (p dif x + q dif y) = iint_(cal(R)) ((partial q)/(partial x) - (partial p)/(partial y)) dif A. $
  3. If both of these fail,
    fall back the parametrization recipe described in @sec-work-manual-recipe.
]

== [EXER] Exercises

#exer[
  Is the vector field
  $ bf(F)(x,y) = vec(sin(e^x) + cos(e^x), arctan(y)) $
  conservative?
]

#exer[
  Calculate the line integral
  $ oint_(cal(C)) (x^2 - y) dif x + (y^2 - x) dif y $
  where $cal(C)$ is the boundary of the region enclosed by the circle $x^2 + y^2 = 4$,
  oriented counterclockwise.
] <exer-work-1>
