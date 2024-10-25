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
    the integral above gives you a way to find it.
]

We'll come back to the first bullet in a moment;
for now, let's talk about how to do the reverse of the gradient operation.

== [TEXT] Anti-gradienting

The basic goal of this section is to find recipes for the following question:
#question[
  If you know $nabla f$, how can you find $f$?
]

I'll note right away that you still have the $+C$ from 18.01
To elaborate, you might remember in 18.01
that for $int x^2 dif x = x^3/3 + C$ for any constant $C$,
and we usually just ignore the $+C$ because it does nothing.

For 18.02 we'll do the same thing.
For example, if $f_1(x,y) = x^2+y^2$ and $f_2(x,y) = x^2+y^2+17$, then they have the same gradient:
$ nabla f_1 = nabla f_2 = vec(2x, 2y). $
However, we just agree to not care about the constant;
if asked to find a potential function, and $f$ is any acceptable answer, then so is $f + 100$.
But there are will be no other answers besides $f+C$ for various $C$.

So suppose $bf(F) : RR^3 -> RR^3$ is a vector field which you _already know_ is conservative.
(I'll do everything in three variables for convenience, but two variables isn't any different.)
We need to find a function $f$ such that $nabla f = bf(F)$.
There are a few strategies for doing so.

=== [RECIPE] Plan 1: Do the anti-derivative three times

=== [RECIPE] Plan 2: Trace a path

The simplest recipe goes as follows:
Consider any other point $(a,b,c)$ in $RR^3$.
The strategy is to consider the straight-line path $bf(r) : [0,1] -> RR^n$
defined by $ bf(r)(t) = (a t, b t, c t). $
This is a path from $(0,0,0)$ to $(a,b,c)$ that takes unit time, for which
$ bf(r)'(t) = vec(a,b,c). $
Then
$ f(a,b,c) - f(0,0,0) &= int_(t=0)^1 bf(F)(bf(r)(t)) bf(r)'(t) dif t \
  &= int_(t=0)^1 bf(F)(a t, b t, c t) dot vec(a, b, c) dif t. $
The number $f(0,0,0)$ is a constant, and we can shift away by it:
i.e. we'll go ahead and output the $f$ for which $f(0,0,0) = 0$.
... And that's it! It gives us a way to find $f(a,b,c)$ for any numbers $a$, $b$, $c$.

We can rewrite this as the following simple recipe.
Remember in the integral, the thing being integrated is over $t$:
so you should treat $a$, $b$, $c$ as fixed numbers.

#recipe(title: [One recipe for recovering the potential function given just $bf(F)$])[
  Suppose $bf(F) : RR^3 -> RR^3$ is a vector field already known to be conservative,
  and you wish to give an example of a function $f$ such that $nabla f = bf(F)$.

  1. Output $ f(a,b,c) = int_(t=0)^1 bf(F)(a t, b t, c t) dot vec(a, b, c) dif t. $
    You may also output $f+C$ for any constant $C$.
  2. If it bothers you that the variable names are $a$, $b$, $c$ in your final answer,
    change them back to $x$, $y$, $z$ at the end.
]

The reason for the letter change at the end is because
you'll find $x$, $y$, $z$ are probably used already as variable names in the question.
It'll make your life a bit easier to use a different letter.

#remark(title: [Remark: There are many other recipes, feel free to invent your own!])[
  I write "one recipe" because there are lots of other approaches too,
  even with different paths.

  For example, I picked a straight line from $(0,0,0)$ to $(a,b,c)$ earlier,
  but you don't have to:
  you could also go for example in a straight line from $(0,0,0)$ to $(a,0,0)$,
  then to $(a,b,0)$ then to $(a,b,c)$.
  The advantage of this is you can use a different amount of time going from one point
  to another, so you don't necessarily need time $1$.

  Or if there's a point other than $(0,0,0)$ that is easier to work with like $(1,1,1)$,
  you could start there instead and adjust your path $bf(r)$ accordingly.
  Or you could even make the path a circular arc, if it makes more sense for the problem.

  This is a case where it's more important to remember _how_ the recipe is invented
  rather than memorize this recipe exactly as written, because it's so easy to adapt.
]

#sample[
  Find an example of a function $f$ such that
  $ nabla f = vec(e^(x y) y z, e^(x y) x z, e^(x y) + e^z). $
]
#soln[
  If we use the recipe above, we get
]

=== [TEXT] Plan 3: Guess

Sometimes, you might even be able to guess the function $f$ by looking.
If so, go for it!


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
