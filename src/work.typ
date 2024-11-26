#import "@local/evan:1.0.0":*

= Work (aka line integrals), and how to compute them with bare hands <sec-work>

This section defines a so-called _line integral_,
the first of the two purple pictures in our poster @fig-int-chart-stokes.
For now, we'll only view this cell in isolation,
so we'll give you the definition and show you how to use it with bare-hands.

However, it's worth saying now: *there will be shortcuts*
to computing line integrals that bypass the work of parametrization.
Those shortcuts are given by the _red arrows_ in the @fig-int-chart-stokes.
In fact, the entire next section, @sec-ftcgreen, is dedicated to these shortcuts.

== [TEXT] Work <sec-work-def>

We now define the leftmost purple pictures in our poster @fig-int-chart-stokes.
When we have a vector field $bf(F) : RR^n -> RR^n$
as a path $bf(r) : RR -> RR^n$ through it, we can define the *work* on it.

#figure(
  box(image("figures/work-cut.svg", width: auto), stroke: 1pt),
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
  image("figures/work-dot.svg", width: auto),
  caption: [Cartoon of the dot products being added up by the work integral.
  Imagine adding up all the dot products $bf(F)(bf(r)(t)) dot bf(r)'(t)$.],
) <fig-work-dot>

In practice, if you actually want to do the integral calculation,
you end up having to do a parametrization, so the shorthand hides how much effort will be needed.
For example, in the following exercise, $cal(C)$ is the upper half of the circle $x^2+y^2=1$,
directed from the point $(1,0)$ to $(-1,0)$.
(Again, for work integrals, we always require a specification
of which way the integral moves along $cal(C)$,
if we choose to hide the parametrization $bf(r)(t)$ from the notation.)

#tip(title: [Tip: You get flexibility in parametrizations, as in @sec-flex-param])[
  The work integral depends on which direction you walk along the path
  (it negates if you flip the start and stop point),
  but it doesn't depend on exactly how exactly you parametrize the path.

  Thus, the comments from @sec-flex-param apply here:
  if you're saying, parametrizing the semicircle
  $(1,0)$ to $(-1,0)$ the blue arc in later @fig-work-ex1),
  you should probably use $ bf(r)(t) = (cos(t), sin(t))$ for $0 <= t <= pi. $

  You could also use $bf(r)(t) = (cos(pi t), sin(pi t))$ for $0 <= t <= 1$.
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

== [RECIPE] Computing line integrals by bare-hands via parametrization <sec-work-manual-recipe>

Going back to our definition, here it is in recipe form.

#recipe(title: [Recipe for computing line integrals with bare-hands parametrization])[
  To compute the line integral of $bf(F)$ over the curve $cal(C)$:

  1. Pick *any* parametrization $bf(r) : RR -> RR^n$ of the curve $cal(C)$,
    including specifying the start and stop times.
    - As described in @sec-flex-param, you have some freedom in how you set the parametrization:
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
  image("figures/work-ex1.svg", width: auto),
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
  Since the arrows near the start are longer, you might guess the work integral is a small
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
    The term $int_(t=0)^pi cos(2t) dif t$ is zero by symmetry,
    so the final integral is $#boxed[$pi slash 2$]$.

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
    So the line integral is $#boxed[$0$]$ as well. #qedhere
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

#remark[
  Here's the reason the shorthand is written like so.
  For simplicity, let's say we're in the 2D case and $bf(r)(t) = vec(x(t), y(t))$.
  Then
  $vec(p,q) dot bf(r)' = vec(p,q) dot vec(x', y') = p dot x' + q dot y'
    = p dot (dif x) / (dif t) + q dot (dif y) / (dif t). $
  Hence, if we are integrating $int_(t="start")^("stop") vec(p,q) dot bf(r)' dif t$,
  we could imagine "cancelling" the $dif t$ out,
  the expression we'd get looks like $p dif x + q dif y$.

  For 18.02 purposes, all of this is only for mnemonic purposes;
  we don't actually define what any of the $dif$ symbols mean,
  so we can't make a more precise statement than that.
]

If any of $p$, $q$, $r$ are zero, that term can also be omitted entirely.
So for example, in 2D, if you see
$ int_(cal(C)) y dif x $
you should take this shorthand to mean
$ int_(cal(C)) y dif x := int_(cal(C)) (y dif x + 0 dif y) = int_(cal(C)) vec(y, 0) dot dif bf(r). $

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
    image("figures/work-ex1b.svg", width: auto),
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

== [EXER] Exercises

#exer[
  Calculate the line integral
  $ oint_(cal(C)) (x^2 - y) dif x + (y^2 - x) dif y $
  where $cal(C)$ is the boundary of the region enclosed by the circle $x^2 + y^2 = 4$,
  oriented counterclockwise.
] <exer-work-1>
