#import "@local/evan:1.0.0":*

= Shortcuts for work: conservative vector fields and Green's theorem <ch-ftcgreen>

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
    for the "grad" red arrows in the poster @poster-stokes.],
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
    use the methods in @ch-antigrad to find it.
  - If the starting point and ending point are the same you don't even need to find $f$.
    The work integral is always $0$.
]

Let's see this concretely with a conservative vector field.
We'll use $ bf(F) (x , y) = vec(2 x + 1, 3 y) $
which, if we follow the recipe from @ch-antigrad,
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
  can be found just by guessing or via the method in @ch-antigrad.
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

#sample[
  For which real number $c$ is the vector field
  $ bf(F) = vec(e^(cos x) + x y^5, c x^2 y^4 + log(y^2+1) ) $
  a conservative vector field?
]
#soln[
  We need the number $c$ such that
  $ (partial)/(partial x)(c x^2 y^4 + log(y^2 + 1)) &= (partial)/(partial y)(e^(cos x) + x y^5) \
    <==> c dot 2 x y^4 &= 5 x y^4 $
  holds for all real numbers $x$ and $y$.
  This occurs only when $#boxed[$ c = 5/2. $]$.
]

#sample[
  For which real numbers $a$, $b$ is the vector field
  $ bf(F) = vec(y^2 + a x^2 z + e^x, b x y + z cos (y z),  x^3 + y cos (y z)). $
  a conservative vector field?
]
#soln[
  Let
  $ p &= y^2 + a x^2 z + e^x \
    q &= b x y + z cos (y z) \
    r &= x^3 + y cos (y z). $
  We need to seek $(a,b)$ such that the curl $nabla dot bf(F)$ is zero, that is
  $ (partial r) / (partial y) - (partial q) / (partial z)
    = (partial q) / (partial x) - (partial p) / (partial y)
    = (partial p) / (partial z) - (partial r) / (partial x) = 0. $
  We compute all six partial derivatives in turn.

  - For the first component of the curl to be zero, we need the following to partials to be equal:
    $ (partial r) / (partial y) &= (partial) / (partial y) (x^3 + y cos (y z)) = cos (y z) + y (- sin (y z)) z = cos (y z) - y z sin (y z) \
      (partial q) / (partial z) &= (partial) / (partial z) (b x y + z cos (y z)) = cos (y z) + z (- sin (y z)) y = cos (y z) - y z sin (y z). $
    But this is always true, regardless of $a$ and $b$.
  - For the second component of the curl to be zero,
    we need the following to partials to be equal:
    $ (partial p) / (partial z) &= (partial) / (partial z) (y^2 + a x^2 z + e^x) = a x^2 \
      (partial r) / (partial x) &= (partial) / (partial x) (x^3 + y cos (y z)) = 3 x^2. $
    This occurs if and only if $a = 3$.
  - For the third component of the curl to be zero,
    we need the following to partials to be equal:
    $ (partial q) / (partial x) &= (partial) / (partial x) (b x y + z cos (y z)) = b y \
      (partial p) / (partial y) &= (partial) / (partial y) (y^2 + a x^2 z + e^x) = 2 y. $
    This occurs if and only if $b = 2$.

  Hence $#boxed[$ (a,b) = (3,2) $]$ is the only answer.
]

#digression[
  In particular, there should be a potential function for each of the two examples above.

  In the first example, it's not easy to _write down_ a potential function,
  because $e^(cos x)$ has no easily-expressed anti-derivative.
  (Though $log(y^2+1)$ does; it turns out to be $y(log(y^2+1)-2)+2arctan(y)$.)
  So we are content that some potential function _does exist_
  even if it cannot be written down using familiar functions.

  On the other hand, the second example can be integrated readily enough,
  by following the procedure in @ch-antigrad:
  one should get $ f(x,y,z) = e^x + cos(y z) + x^3 z + x y^2 + C. $
]


== [TEXT] Green's theorem (2D only)

We expect there should be a Stokes result as well for the red arrow
joining the 2D work integral to an area integral.
#figure(
  box(image("figures/work-cut-greens.svg", width: auto), stroke: 1pt),
  caption: [Green's theorem is the Stokes result for the above red arrow
    from the poster @poster-stokes.],
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

== [SIDENOTE] A picture explaining why Green's Theorem for work should be true (not a formal proof) <sec-ftcgreen-explain>

Here is an extremely informal explanation of what Green's Theorem is trying to say pictorially.
We won't make it precise or go into the details.

Remember that the _2D scalar curl_ of a 2D vector field $bf(F)$ at a point $P$ is a number that describes
the counterclockwise swirl of the field $bf(F)$ near $P$.
So to draw a picture (@fig-ftcgreen-explain):

- Let's $cal(C)$ be a counterclockwise loop oriented counterclockwise.
  For the picture, we'll draw $cal(C)$ as a purple square, which encloses a region $cal(R)$.
- Then we imagine breaking $cal(R)$ into a bunch of tiny little squares.
  At each little square, we draw a little green swirl inside it that corresponds roughly
  to the 2D scalar curl of $bf(F)$ at the center of the tiny square.

Then the integral
$ iint_(cal(R)) ((partial q)/(partial x) - (partial p)/(partial y)) dif A $
can be thought of as the "sum of the green swirls" (whatever that means).
#figure(
  image("figures/ftcgreen-explain.svg", width: auto),
  caption: [A rough picture of what Green's Theorem for work is trying to say:
    "if you add up the green swirls, then only the work along the purple boundary is left".],
) <fig-ftcgreen-explain>

However, in @fig-ftcgreen-explain you should realize: *all the swirls on the inside cancel*.
Imagine one of the vertical grey walls between two grey cells:
you can imagine the direction and magnitude of $bf(F)$ along the wall
contributes to the "swirliness" of the two adjacent cells,
but whatever it contributes positively to one cell, it contributes negatively to the other one.
(Again, this is all an informal picture, so I won't make this precise.)

So if we add all the green stuff, the only thing that's left is the green stuff that's
just along the purple curve (drawn darker above).
For example, the dark green arrows on the left correspond to how much $bf(F)$
points downwards against the nearby grey walls:
which exactly matches the description of the work integral of $bf(F)$ along that western wall.
And when you sum all four dark green currents,
you just get the total work done by $bf(F)$ along the purple curve $cal(C)$, as desired.

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
    fall back to the parametrization recipe described in @sec-work-manual-recipe.
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

== [TEXT] Advanced technique: sealing regions <sec-green-seal-region>

Green's Theorem is powerful enough that it can be handy
even if the path $cal(C)$ is not a closed loop:
the idea is to "seal" the loop by adding some simple path,
for which the line integral is easy to calculate.
To show this technique, we bring back the first example from @sec-work-manual-recipe
all the way back when we first introduced how to compute work with bare hands.

#sample[
  Compute the line integral of the vector field
  $bf(F) (x , y) = vec(2 y , 3 x)$ along
  the upper half of the circle $x^2 + y^2 = 1$, oriented counterclockwise.
  See @fig-ftcgreen-ex1.
]

We already saw that we could compute this using bare-hands parametrization.
Now we'll show how to use Green's Theorem as a shortcut
by adding the line segment from $(-1,0)$, to $(1,0)$.

#figure(
  image("figures/ftcgreen-ex1.svg", width: auto),
  caption: [Evaluation of $int_(cal(C)) bf(F) dot dif bf(r)$ by "sealing"
    the region, adding in a line segment joining $(-1,0)$ to $(1,0)$.
    The line integral across the segment is easy to compute (it equals zero,
    since the force is perpendicular to it.)
    Then Green's theorem applies to the sealed region $cal(R)$.],
) <fig-ftcgreen-ex1>

#soln[
  Let $cal(C)$ denote the semicircle.
  Because $cal(C)$ is not a closed loop, Green's Theorem does not apply directly.
  To use it, we instead add a new line segment $cal(C)_("lid")$
  pointing from $(-1,0)$ to $(1,0)$.
  Then if we consider _both_ $cal(C)$ and the new lid $cal(C)_("lid")$,
  they enclose the upper half of a disk $cal(R)$ with area $pi/2$, as shown in @fig-ftcgreen-ex1.
  Hence Green's Theorem on the two-part boundary states that
  $ underbrace(int_(cal(C)) (2 y dif x + 3 x dif y), "what we want")
    + int_(cal(C)_("lid")) (2 y dif x + 3 x dif y)
    &= iint_(cal(R)) ((partial q)/(partial x) - (partial p)/(partial y)) dif A \
    &= iint_(cal(R)) ((partial)/(partial x)(3x) - (partial)/(partial y)(2y)) dif A \
    &= iint_(cal(R)) (3-2) dif A = iint_(cal(R)) dif A \
    &= op("Area")(cal(R)) = pi/2. $
  On the other hand, I claim that
  $ int_(cal(C)_("lid")) (2 y dif x + 3 x dif y) = 0. $
  This is easy to compute with direct parametrization:
  if we parametrize the lid by $bf(r)(t) = (t, 0)$ for $-1 <= t <= 1$, for example, then
  $ int_(cal(C)_("lid")) (2 y dif x + 3 x dif y)
    &= int_(t=-1)^1 vec(2 dot 0, 3 dot t) dot bf(r)'(t) dif t
    = int_(t=-1)^1 vec(0, 3t) dot vec(1, 0) dif t
    = int_(t=-1)^1 0 dif t = 0. $
  Indeed one can even see it from @fig-ftcgreen-ex1 directly,
  since the vector field is perpendicular to the $x$-axis
  along the entire lid, so the total work being $0$ is not a surprise.
  Thus, the desired line integral is
  $ underbrace(int_(cal(C)) (2 y dif x + 3 x dif y), "what we want")
    &= iint_(cal(R)) ((partial q)/(partial x) - (partial p)/(partial y)) dif A
      - int_(cal(C)_("lid")) (2 y dif x + 3 x dif y) \
    &= pi/2 - 0 = #boxed[$ pi/2 $]. #qedhere $
]

== [EXER] Exercises

#exer[
  Is the vector field
  $ bf(F)(x,y) = vec(sin(e^x), arctan(y^pi+pi^y)) $
  conservative?
] <exer-consv>

#exer[
  Calculate the line integral
  $ oint_(cal(C)) (x^2 - y) dif x + (y^2 - x) dif y $
  where $cal(C)$ is the boundary of the region enclosed by the circle $x^2 + y^2 = 4$,
  oriented counterclockwise.
] <exer-work-boring>

#exer[Suggested by Ting-Wei Chao][
  As in @exer-parabola-1,
  let $cal(C)$ be the oriented closed curve formed by the arc of the parabola $y = x^2-1$
  running from $(-1, 0)$ to $(1, 0)$, followed by a line segment from $(1, 0)$ back to $(-1, 0)$.
  Again let $ bf(F)(x,y) = vec(x^2(y+1), (y+1)^2). $
  Compute $int_(cal(C)) bf(F) dot dif bf(r)$ this time using Green's Theorem.
] <exer-parabola-2>

#exerstar[Shoelace formula][
  Let $n >= 3$ be an integer and
  suppose $cal(P) = P_1 P_2 ... P_n$ is a convex $n$-gon in $RR^2$,
  where the vertices $P_i = (x_i, y_i)$ are labeled counterclockwise.
  Use Green's theorem to prove the following formula for the area of $cal(P)$:
  $ op("Area")(cal(P)) = 1/2 sum_(i=0)^(n-1) (x_i y_(i+1) - x_(i+1) y_i). $
  Here $x_0 = x_n$ and $y_0 = y_n$ by convention,
  so the $i=0$ summand is $x_n y_1 - x_1 y_n$.
] <exer-shoelace>
