#import "@local/evan:1.0.0":*

= Scalar-field line and surface integrals <sec-scalar-field-ints>

Think back to @fig-int-chart-triangle.
So far we've talked about everything except the three entries
labeled "line integral" and "surface integral".
This section will talk about them.
For clarity, I will actually call these *scalar-field line integral*
and *scalar-field surface integral*.

The reason for this naming is that later we'll meet
vector-field variants of the line and surface integral
that play a much bigger role in 18.02.
Indeed we mentioned in @sec-warning-trio that these scalar-field integrals
are only used for a few specific cases.

== [TEXT] Arc length, and its generalization to the scalar-field line integral

We've actually met arc length already back in Part Delta!
I'll restate it again here for convenience, but this is a repeat:

#memo(title: [Memorize: Arc length])[
  If the parametrization $bf(r)(t) : RR -> RR^n$ traces out a path in $RR^n$,
  the *arc length* is given by
  $ L = int_(t="start time")^("stop time") lr(|bf(r)'(t)|) dif t. $
]

More generally,
if the parametrization $bf(r)(t) : RR -> RR^n$ traces out a path in $RR^n$,
and $f : RR^n -> RR$ is a function,
then the *scalar-field line integral* of $f$ is defined by
$ int_(t="start time")^("stop time") f(bf(r)(t)) lr(|bf(r)'(t)|) dif t. $
However, we won't use this definition in this class,
except for the special case $f = 1$ for arc length.

#warning(title: [Warning: There are no red arrows for these integrals])[
  *We don't like these scalar-field line and surface integrals as much*;
  they just don't behave that well, in part because of the awkward absolute value.
  For example, Stokes' theorem --- the biggest theorem in the 18.02 course ---
  doesn't work for arc length (or anything else in this section).

  In particular: *you don't get Fundamental Theorem of Calculus for arc length*.
  To make that warning explicit, note two common "wrong guesses":
  $ int_(t=a)^(b) lr(|bf(r)'(t)|) dif t &!= |bf(r)(b)| - |bf(r)(a)| \
    int_(t=a)^(b) lr(|bf(r)'(t)|) dif t &!= |bf(r)(b) - bf(r)(a)|. $
  This is a tempting mistake to make and I've seen it happen;
  you might hope the fundamental theorem of calculus
  works somehow for $|bf(r)'(t)|$ in analogy to how $int_(x=a)^b f'(x) dif x = f(b) - f(a)$
  for differentiable functions $f : RR -> RR$.
  But that's simply not the case.
  There's just no analog of FTC for arc length.
  (Indeed, the arc length on the left-hand side depends on _how_ you travel from
  $bf(r)(a)$ to $bf(r)(b)$ --- a straight line will be shortest mileage,
  a windy meander with detours will be much longer mileage.
  So you can't possibly know just from the starting point and the destination point
  how long of a route you took.)
]

#typesig[
  The scalar-field line integral (and hence arc length as well) outputs a scalar.
]

Note that arc length is just letting $f$ be the constant function $1$.
We'll pretty much only use this generalization for mass/density type questions, and nowhere else.

As I mentioned in the shorthand table (@table-shorthand), many other sources abbreviate
$ dif s := lr(|bf(r)'(t)|) dif t. $
Whenever this shorthand is being used, one frequently cuts out the start and stop time too.
The way this is done is, you let $cal(C)$ denote the curve that $bf(r)(t)$ traces out.
Then we abbreviate
$ int_(t="start time")^("stop time") f(bf(r)(t)) lr(|bf(r)'(t)|) dif t $
all the way down to just
$ int_(cal(C)) f dif s. $
So that the arc length formula gets written as $L = int_(cal(C)) dif s$
and the general scalar-field line integral is $int_(cal(C)) f dif s$.

== [TEXT] Surface area

The section for surface area is about the same,
but the thing that makes this more complicated is you need to parametrize an entire _surface_.
It was pretty easy to think about $bf(r)(t)$ as a path in $RR^n$,
where $t$ was controlling time.
It's more obnoxious to talk about a whole surface,
which is why you see the notation is $bf(r)(u,v)$ --- now we need two variables,
and thinking about it as time won't cut it anymore.

Maybe it's best if I give an example of a parametrization.

#example(title: [Example of a parametrization: a sphere])[
  Consider the surface of the unit sphere, say $x^2 + y^2 + z^2 = 1$.
  One parametrization $bf(r)$ is given from the spherical coordinate system by
  $ bf(r) (phi, theta) = (sin phi cos theta , phi sin theta , cos phi) $
  across the range
  $ 0 <= theta < 2 pi quad "and" quad 0 <= phi < pi. $
  That is, as $theta$ and $phi$ vary across these ranges,
  we get every point on the sphere exactly once.
]

If this feels familiar, it's because we used more or less
the same analogy for change of variables --- cartography.
The Earth is round, but you can still draw a rectangular world map.
So what we call $bf(r)(u,v)$ here is playing the same role
that our transition map $bf(T)$ did back when we did change-of-variables.
The only difference is that in change of variables, we had $bf(T) : RR^2 -> RR^2$
in the 2D case and $bf(T) : RR^3 -> RR^3$ in the 3D case.
But for parametrizing a surface in $RR^3$, we have $bf(r) : RR^2 -> RR^3$ instead.
(That is, in change-of-variables we make a $n$-dimensional map of an $n$-dimensional region,
but here we make a $2$-dimensional map of a surface living in $RR^3$.)

Okay, so in analogy to here are surface area and the scalar-field surface integral.

#memo(title: [Memorize: Surface area and scalar-field surface integral])[
  If the parametrization $bf(r)(u,v) : cal(R) -> RR^3$ cuts out a surface $cal(S)$ in $RR^3$,
  the *surface area* is given by
  $ op("SurfArea")(cal(S)) := iint_(cal(R))
    lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|) dif u dif v. $
]
#warning[
  Here $cal(R)$ is a region in $RR^2$ used for the parametrization, often a rectangle.
  It is _not_ the surface $cal(S)$ whose surface area is being calculated;
  (and for 2D surfaces in 3D space we'll usually prefer the letter $cal(S)$
  so that it doesn't look like a region).
]

Yes, there's a cross product. Yes, it sucks (see @sec-cross-sucks).
This is one case where you probably would prefer to use the shorthand
$ dif S := lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|) dif u dif v $
so that one can swallow surface area into just
$ op("SurfArea")(cal(S)) &:= iint_(cal(S)) dif S $
where we also cut out the region $cal(R)$ on our cartographer's map from the notation;
instead we write $cal(S)$ directly.

More generally if we have a function $f : RR^3 -> RR$ we could define the
*scalar-field surface integral* of $f$ over $cal(S)$ as
$iint_(cal(R)) f(bf(r)(u,v)) lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|) dif u dif v$;
however this definition will not be used in this class
except for the special case $f = 1$ for surface area.
But if we did use it, we could have an abbreviation $iint_(cal(S)) f dif S$.

#typesig[
  The scalar-field surface integral (and hence surface area as well) outputs a scalar.
]

Here's surface area in recipe format.
#recipe(title: [Recipe for surface area])[
  1. Parametrize the surface by some $bf(r)(u,v) : cal(R) -> RR^3$
    for some 2D region $cal(R)$ (ideally something simple like a circle or rectangle).
  2. Compute the partial derivatives
    $(partial bf(r))/(partial u)$ and $(partial bf(r))/(partial v)$
    (both are three-dimensional vectors at each point).
  3. Compute the cross product $(partial bf(r))/(partial u) times (partial bf(r))/(partial v)$.
  4. Compute the magnitude $lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|)$
    of this cross product.
  5. Integrate the entire thing over $cal(R)$ using any of the methods for double integrals
    (such as horizontal/vertical slicing, polar coordinates, change of variables, etc.).
]

Here is a really ugly example to start, to give you some practice with spherical coordinates.
#example(title: [Example: Surface area of a sphere])[
  Find the surface area of the unit sphere $x^2+y^2+z^2=1$.
]
#soln[
  We will bludgeon our way through this task with sheer brute force using the formula above
  via spherical coordinates. (We'll show a more elegant solution later.)

  The parametrization $bf(r)$ is given from the spherical coordinate system by
  $ bf(r) (phi, theta) = (sin phi cos theta , sin phi sin theta , cos phi) , $
  across the range
  $ 0 <= theta <= 2 pi quad "and" quad 0 <= phi <= pi $
  for our region $cal(R)$.
  The partial derivatives are thus
  $ frac(partial bf(r), partial phi) &= (cos phi cos theta , cos phi sin theta , - sin phi) \
    frac(partial bf(r), partial theta) &= (- sin phi sin theta , sin phi cos theta , 0). $
  We brute force our way through the entire cross product.
  We have
  $ frac(partial bf(r), partial phi) times frac(partial bf(r), partial theta)
    &= (0 dot cos phi sin theta - sin phi cos theta dot (- sin phi)) bf(e_1)  \
    &quad - (0 dot cos phi cos theta - (- sin phi sin theta) dot (- sin phi) ) bf(e)_2 \
    &quad + (sin phi cos theta dot cos phi cos theta + sin phi sin theta dot cos phi sin theta) bf(e)_3 \
    &= (sin^2 phi cos theta) bf(e)_1  + (sin^2 phi sin theta) bf(e)_2
    + (sin phi cos phi sin^2 theta + sin phi cos phi cos^2 theta) bf(e)_3 \
    &= (sin^2 phi cos theta) bf(e)_1  + (sin^2 phi sin theta) bf(e)_2
    + (sin phi cos phi) bf(e)_3 $
  since $cos^2 theta + sin^2 theta = 1$.
  If we take the magnitude ,we get
  $ lr(|frac(partial bf(r), partial phi) times frac(partial bf(r), partial theta)|)
    &= sqrt((sin^2 phi cos theta)^2 + (sin^2 phi sin theta)^2 + (sin phi cos phi)^2) \
    &= sqrt(sin^4 phi cos^2 theta + sin^4 phi sin^2 theta + sin^2 phi cos^2 phi) \
    &= sqrt(sin^2 phi (sin^2 phi cos^2 theta + sin^2 phi sin^2 theta) + sin^2 phi cos^2 phi) \
    &= sqrt(sin^2 phi (sin^2 phi (cos^2 theta + sin^2 theta)) + sin^2 phi cos^2 phi) \
    &= sqrt(sin^2 phi (sin^2 phi) + sin^2 phi cos^2 phi) \
    &= sqrt(sin^4 phi + sin^2 phi cos^2 phi) \
    &= sqrt(sin^2 phi (sin^2 phi + cos^2 phi)) \
    &= sqrt(sin^2 phi dot 1) = lr(|sin phi|). $
  Thank the lord it's a simple answer.
  Great, now we can calculate the surface area of the sphere:
  $ op("SurfArea")("sphere")
    &= int_(theta=0)^(2 pi) int_(phi=0)^pi
      lr(|frac(partial bf(r), partial theta) times frac(partial bf(r), partial phi)|)
      dif phi dif theta \
    &= int_(theta=0)^(2 pi) int_(phi=0)^pi |sin phi| dif phi dif theta \
    &= (int_(phi=0)^(pi) |sin phi| dif phi) (int_(theta=0)^(2pi) dif theta) \
    &= (int_(phi=0)^(pi) sin phi dif phi) (int_(theta=0)^(2pi) dif theta) \
    &= [-cos phi]_(phi=0)^(pi) dot 2 pi \
    &= #boxed[$ 4 pi $]. #qedhere $
]

#digression(title: [Digression on the direction of the cross product])[
  We'll mention this more later, but it's worth noting now that
  in general if you parametrize a surface $cal(S)$ by $bf(r)(u,v)$,
  then $frac(partial bf(r), partial u) times frac(partial bf(r), partial v)$
  is a vector which is normal to both
  $frac(partial bf(r), partial u)$ and $frac(partial bf(r), partial v)$.
  Hence, the direction of this cross product turns out to be described by
  "normal vector to the tangent plane of the surface $cal(S)$ at $bf(r)(u,v)$".

  Of course, since we took an absolute value, the direction gets discarded for surface area.
  But if you are really observant you might have noticed that computed cross product is
  $ (sin^2 phi cos theta) bf(e)_1  + (sin^2 phi sin theta) bf(e)_2
    + (sin phi cos phi) bf(e)_3 = sin phi dot bf(r)(theta, phi) $
  which happened to be a multiple of the corresponding point on the sphere; and this is why,
  because for a sphere, $bf(r)(theta, phi)$ happens to be perpendicular to the tangent plane.
]

And here is an example that looks more like what you expect.
#sample[
  Find the surface area of the cone defined by $z = sqrt(x^2+y^2) <= 1$.
]
#soln[
  The given cone can be parametrized using Cartesian coordinates as:
  $ bf(r) (x , y) = vec(x , y , sqrt(x^2 + y^2)) $
  where $(x , y)$ lies within the disk $x^2 + y^2 <= 1$.

  Compute the partial derivatives of $bf(r)$ with respect to $x$ and $y$:
  $ frac(partial bf(r), partial x) &= vec((partial x) / (partial x) , (partial y) / (partial x) , (partial z) / (partial x)) = vec(1 , 0 , x / sqrt(x^2 + y^2)) \
    frac(partial bf(r), partial y) &= vec((partial x) / (partial y) , (partial y) / (partial y) , (partial z) / (partial y)) = vec(0 , 1 , y / sqrt(x^2 + y^2)). $
  Hence the cross product is
  $ frac(partial bf(r), partial x) times frac(partial bf(r), partial y)
    &= (0 dot y / sqrt(x^2 + y^2) - 1 dot x / sqrt(x^2 + y^2)) bf(e)_1 - (1 dot y / sqrt(x^2 + y^2) - 0 dot x / sqrt(x^2 + y^2)) bf(e)_2 \
    &#h(6em) + (1 dot 1 - 0 dot 0) bf(e)_3 \
    &= vec(- x / sqrt(x^2 + y^2) , - y / sqrt(x^2 + y^2) , 1) $
  Now, compute the magnitude of this cross product:
  $ lr(|frac(partial bf(r), partial x) times frac(partial bf(r), partial y)|) &= sqrt((- x / sqrt(x^2 + y^2))^2 + (- y / sqrt(x^2 + y^2))^2 + 1^2) \
    &= sqrt((x^2) / (x^2 + y^2) + (y^2) / (x^2 + y^2) + 1) = sqrt(2). $
  That's really convenient: we got a constant! Hence
  $ op("SurfArea")("cone") = iint_(x^2+y^2 <= 1) sqrt(2) dif A = sqrt(2) op("Area")(x^2+y^2 <= 1) = #boxed[$sqrt(2) pi $]. #qedhere $
]

== [SIDENOTE] Justification for the surface area formula

#todo[to be written]

== [TEXT] Formulas for the cross product <sec-magic-cross-prod>

As the examples above show, it's actually really annoying to compute the cross product by hand.
Consequently, we can make our lives a lot easier if we pre-compute
what the cross product works out to for some common situations,
so we don't have to work it out by hand.

In these notes we will pre-compute four different cross products:

- Any graph $z = f(x,y)$ (the cone we discussed is a good example)
- Any level surface $g(x,y,z) = c$, over some $x y$-region
- The curved part of a cylinder of radius $R$ centered along the $z$-axis,
  where the parameters are $theta$ and $z$
- The surface of a sphere of radius $R$ centered at the origin,
  where the parameters are $phi$ and $theta$

(As it turns out, in 18.02 it's likely these are the _only_ four situations you will see.)

The table showing the results in @table-magic-cross-prod-scalint.
Note that for surface area, you only need the _absolute value_ of the cross product (fourth column).
But I'm going to include the entire vector too, because we'll later need to reuse this table
in @sec-flux, and later there we will actually need to
know the direction the vector points in too, not just the absolute value.

#figure(
  table(
    columns: 4,
    align: center + horizon,
    table.header([Surface], [Param's],
      [$ frac(partial bf(r), partial u) times frac(partial bf(r), partial v) $],
      [$ lr(|frac(partial bf(r), partial u) times frac(partial bf(r), partial v)|) dif u dif v $],
    ),
    [$z = f(x,y)$],
      [$(x,y)$],
      [$ lr(angle.l - (partial f) / (partial x), - (partial f) / (partial y), 1 angle.r) $],
      [$sqrt(1 + ((partial f) / (partial x))^2 + ((partial f) / (partial y))^2) dif x dif y$],
    [Level surface $g(x,y,z) = c$ \ over an $x y$-region ],
      [$(x,y)$],
      [$ (nabla g) / (|partial g slash partial z|) $],
      [$ (|nabla g|) / (|partial g slash partial z|) dif x dif y $],
    [Cylindrical coords with fixed $R$ \ $bf(r)(theta, z) = (R cos theta, R sin theta, z)$],
      [$(theta, z)$],
      [$ angle.l R cos theta, R sin theta, 0 angle.r $],
      [$R dif theta dif z$],
    [Spherical coords with fixed $R$ \
      $bf(r)(phi, theta) = (R sin phi cos theta, \ quad R sin phi sin theta, R cos phi)$],
      [$(phi, theta)$],
      [$ R sin phi dot bf(r)(phi, theta) $],
      [$R^2 sin (phi) dif phi dif theta$],
  ),
  caption: [Pre-computed formulas for the cross product in four most common situations,
    which are likely to be all you need.],
  kind: table
) <table-magic-cross-prod-scalint>

Something that can be really helpful right now for remembering the third column
of @table-magic-cross-prod-scalint is the following geometric idea:
#idea[
  The vector $frac(partial bf(r), partial u) times frac(partial bf(r), partial v)$
  is normal to the tangent plane to the surface at each point.
]
For example:

- For the level surface $g(x,y,z) = c$,
  you should remember from @sec-gradient that $nabla g$ is normal to the tangent plane
  of the level surface, hence the cross product is a multiple of $nabla g$ as needed.
- The normal vector to (the curved part of) a cylinder points straight away from the $z$-axis
  away from the origin, which $angle.l R cos theta, R sin theta, 0 angle.r$ indeed does.
- For the sphere, the normal vector should point straight away from the center of the sphere,
  and indeed $sin(phi) dot bf(r)(phi, theta)$ is a multiple of the direction.

Again, for surface area you actually only need the fourth column, but
(1) I think the third column is actually easier to remember than the fourth column,
and (2) by @sec-flux you will need the third column anyway.

The first and second rows of @table-magic-cross-prod-scalint above are quite versatile,
whereas the third and fourth rows are really for specific specialized situations.
So in these notes I'll call these "magic" formulas because they save us so much work.

=== For a surface of the form $z = f(x,y)$

So imagine your surface is given by $z = f(x,y)$ for some $f$
over some region $cal(R)$ in the $x y$ plane (e.g. the cone had $cal(R) = {x^2+y^2<=1}$).
(e.g. the cone we just did was $f(x,y) = sqrt(x^2+y^2)$)
What we're going to do is try to capture the boilerplate work of the cross product
into a single formula that we can just remember, so we don't have to redo the cross product again.

The parametrization we expect to use is
$ bf(r)(x,y) = vec(x, y, f(x,y)). $
The partial derivatives are
$ frac(partial bf(r), partial x)
  &= vec((partial x) / (partial x) , (partial z) / (partial x) , (partial z) / (partial x))
  = vec(1 , 0 , (partial z) / (partial x) ) \
  frac(partial bf(r), partial y)
  &= vec((partial x) / (partial y) , (partial y) / (partial y) , (partial z) / (partial y))
  = vec(0 , 1 , (partial z) / (partial y)). $
Hence, in this case we arrive at
$ frac(partial bf(r), partial x) times frac(partial bf(r), partial y)
  &= (0 dot (partial z) / (partial y) - 1 dot (partial z) / (partial x)) bf(e)_1
    - (1 dot ((partial z) / (partial y)) - 0 dot (partial z) / (partial x)) bf(e)_2
    + (1 dot 1 - 0 dot 0) bf(e)_3 \
  &= - (partial z) / (partial x) bf(e)_1  - (partial z) / (partial y) bf(e)_2 + bf(e)_3 \
  &= - (partial f) / (partial x) bf(e)_1  - (partial f) / (partial y) bf(e)_2 + bf(e)_3. $

Let's write this down now.

#memo(title: [Memorize: Magic cross product formula for $z = f(x,y)$])[
  Consider a surface given by $z = f(x,y)$ with $f$ differentiable.
  Then for the obvious parametrization $bf(r)(x,y) = (x,y,f(x,y))$ we have
  $ frac(partial bf(r), partial x) times frac(partial bf(r), partial y)
  = lr(angle.l - (partial f) / (partial x), - (partial f) / (partial y), 1 angle.r). $
]

In particular, the surface area becomes
$ op("SurfArea")(cal(S)) = iint_(cal(R)) sqrt(1 + ((partial f) / (partial x))^2 + ((partial f) / (partial y))^2) dif x dif y. $
You'll find this formula written in a lot of other textbooks and it's worth knowing
(I would say you should memorize the full magic cross product formula,
since it's trivial to get the magnitude from it.)
Let's see how it can captures the boilerplate in the cone example.

#sample[
  Find the surface area of the cone defined by $z = sqrt(x^2+y^2) <= 1$.
]
#soln[
  Letting $f(x,y) = sqrt(x^2+y^2)$, this time we skip straight to
  $ (partial f) / (partial x) &= x/(sqrt(x^2+y^2)) \
    (partial f) / (partial y) &= y/(sqrt(x^2+y^2)). $
  Hence we got a shortcut to the vector $angle.l -x/(sqrt(x^2+y^2)), -y/(sqrt(x^2+y^2)), 1 angle.r$ we found before.
  We find its magnitude in the same way:
  $ sqrt(1 + ((partial f) / (partial x))^2 + ((partial f) / (partial y))^2)
  = sqrt(1 + (x^2) / (x^2 + y^2) + (y^2) / (x^2 + y^2) + 1) = sqrt(2). $
  Now
  $ op("SurfArea")("cone") = iint_(x^2+y^2 <= 1) sqrt(2) dif A = sqrt(2) op("Area")(x^2+y^2 <= 1) = #boxed[$sqrt(2) pi $]. #qedhere $
]

=== For a level surface $g(x,y,z) = c$

However, we can get an even better formula in a lot of cases using implicit differentiation.
The basic idea is that we would prefer to think of the cone as $x^2+y^2-z^2 = 0$,
so that we don't need to think about square roots.
And that's exactly a level surface.

So imagining a _level surface_ $g(x,y,z) = c$ instead,
where each $(x,y)$ in our region $cal(R)$ has exactly one $z = z(x,y)$ value.
On paper, you imagine solving for $z$ in terms of $x$ and $y$, and then using
$ frac(partial bf(r), partial x) times frac(partial bf(r), partial y)
  = - (partial z) / (partial x) bf(e)_1  - (partial z) / (partial y) bf(e)_2 + bf(e)_3 $
but we'd like to not have to solve for $z$ in such a brute way.

The trick is to consider the gradient of $g$ and use the chain rule.
You might remember that
$ nabla g = lr(angle.l (partial g) / (partial x), (partial g) / (partial y), (partial g) / (partial z) angle.r) $
is pretty easy to calculate, usually.
However, if we take the partial derivative of
$ g(x,y,z) = c $
with respect to $x$ and $y$, the derivative of $c$ vanishes while the chain rule gives
$ 0 = (partial g) / (partial x) + (partial g) / (partial z) dot (partial z) / (partial x)
  ==> (partial g) / (partial x) = - (partial g) / (partial z) dot (partial z) / (partial x). $
Similarly
$(partial g) / (partial y) = - (partial g) / (partial z) dot (partial z) / (partial y)$.
Hence
$ nabla g = lr(angle.l -(partial g) / (partial z) dot (partial z) / (partial x),
  -(partial g) / (partial z) dot (partial z) / (partial y), (partial g) / (partial z)  angle.r)
  = (partial g) / (partial z) dot lr(angle.l -(partial z) / (partial x), -(partial z) / (partial y), 1 angle.r). $

#digression(title: [Digression on the chain rule])[
  You might be spooked by the minus sign here,
  as I was, since if you just look at the fractions the expression seems wrong.
  This is why I don't like people who try to remember the chain rule as just "cancel the fractions",
  because in some contexts you'll get equations like this that don't seem correct.

  The context to remember here is that $z = z(x,y)$ is itself a function of $x$ and $y$
  that holds on to the requirement $g(x,y,z(x,y)) = c$;
  that is, if $x$ changes a little, $z = z(x,y)$ should change in an "opposite" way to ensure $g = c$ is still true.

  How much should the change be?
  It might be easiest to reason through two applications of linear approximation.
  If $epsilon$ is some small displacement, then linear approximation is saying that
  $ g(x + epsilon, y, z(x + epsilon, y))
    &approx g(x + epsilon, y, z(x, y) + (partial z) / (partial x) dot epsilon) \
    &approx g(x,y,z(x,y)) + nabla g dot vec(epsilon, 0, (partial z) / (partial x) dot epsilon) \
    &= g(x,y,z(x,y))
      + [(partial g) / (partial x) + (partial g) / (partial z) dot (partial z) / (partial x)] epsilon. $
  Hence we want the bracketed coefficient of $epsilon$ to be zero,
  which is the equation we got before.
]

Something really good is happening here, because the cross product we wanted just sits on the right-hand side!
Because of this, we have managed to derive the following miraculous identity.
#memo(title: [Memorize: Magic cross product formula for a level surface])[
  Let $g$ be differentiable and consider the level surface $g(x,y,z) = c$.
  Let $cal(S)$ be a part of this level surface described implicitly by some function $z=f(x,y)$,
  and suppose also that $partial g / partial z != 0$ over $cal(R)$.
  Then for the obvious parametrization $bf(r)(x,y) = (x,y,z)$ we have
    $ frac(partial bf(r), partial x) times frac(partial bf(r), partial y)
    = (nabla g) / (partial g slash partial z). $
]
The reason this magic identity is even better is that there is no need to differentiate $f$
or even to determine it.
Let's see it in action by redoing our example with a cone.
#sample[
  Find the surface area of the cone defined by $z = sqrt(x^2+y^2) <= 1$.
]
#soln[
  The cone is the part of the level surface of $g(x,y,z) = x^2+y^2-z^2$ with $z >= 0$.
  (We know in fact $f(x,y) = sqrt(x^2+y^2)$, but we won't use this.)
  Now we can jump straight to
  $ (nabla g) / (partial g / partial z) = lr(angle.l 2x, 2y, -2z angle.r) / (-2z)
    = lr(angle.l -x/z, -y/z, 1 angle.r). $
  The magnitude of this vector is
  $ sqrt((-x/z)^2 + (-y/z)^2 + 1) = sqrt((x^2+y^2)/z^2 + 1) = sqrt(2) $
  so we get
  $ op("SurfArea")("cone") = iint_(x^2+y^2 <= 1) sqrt(2) dif A
    = sqrt(2) op("Area")({x^2+y^2 <= 1}) = #boxed[$sqrt(2) pi $]. #qedhere $
]
If you compare this carefully with $z = sqrt(x^2+y^2)$,
you'll see this is _still_ the same solution as the first magic formula,
which is in turn _still_ the same solution as when we really used bare hands.
But the shortcuts are nice because it means you don't have to think about the cross product at all.

Now as we promised, let's show how to find surface area for a sphere
without having to slog through the pain of spherical coordinates.
#sample[
  Find the surface area of the sphere $x^2+y^2+z^2 = 1$.
]
#soln[
  We'll find the surface area for the hemisphere with $z >= 0$ and then double it.
  We could view the hemisphere as $z = f(x,y) = sqrt(1 - (x^2+y^2))$,
  but to avoid square roots we're much happier by letting
  $ g(x,y,z) = x^2+y^2+z^2 $
  and considering the hemisphere as the chunk of the level surface with $z >= 0$ and $x^2+y^2 <= 1$.
  In that case,
  $ (nabla g) / (partial g slash partial z) = lr(angle.l 2x, 2y, 2z angle.r) / (2z)
    = lr(angle.l x/z, y/z, 1 angle.r). $
  This time the magnitude of the vector is
  $ sqrt((x/z)^2 + (y/z)^2 + 1) = sqrt((x^2+y^2+z^2) / z^2) = 1/z. $
  Hence, we need to integrate
  $ op("SurfArea")("hemisphere") = iint_(x^2+y^2<=1) 1/sqrt(1-(x^2+y^2)) dif x dif y. $
  To nobody's surprise, we use polar coordinates to change this to
  $ op("SurfArea")("hemisphere")
    &= int_(theta=0)^(2pi) int_(r=0)^1 1/(sqrt(1-r^2)) (r dif r dif theta) \
    &= (int_(theta=0)^(2pi) dif theta) (int_(r=0)^1 r/(sqrt(1-r^2)) dif r). $
  The left integral is $2pi$.
  For the inner integral, use the $u$-substitution $u=1-r^2 ==> (dif u) / (dif r) = -2r$ to get
  $ int_(r=0)^1 r/(sqrt(1-r^2)) dif r
    = int_(u=1)^0 -1/2 u^(-1/2) dif u
    = int_(u=0)^1 1/2 u^(-1/2) dif u
    = [u^(1/2)]_(u=0)^1 = 1. $
  Hence
  $ op("SurfArea")("hemisphere") = 2 pi dot 1 = 2 pi $
  and the surface area of the sphere is thus $2 pi dot 2 = #boxed[$ 4 pi $]$.
]

=== For the curved part of the cylinder in cylindrical coordinates

If you have a cylinder aligned with the $z$-axis,
then you don't want to be using $x y$-plane as parameters,
because most pairs $(x,y)$ do not get used at all.
Thus, we'll instead use cylindrical coordinates as
$ bf(r)(theta, z) = (R cos theta, R sin theta, z). $
Compute the partial derivatives:
$ frac(partial bf(r), partial theta) &= angle.l - R sin theta, R cos theta, 0 angle.r \
  frac(partial bf(r), partial z) &= angle.l 0,0,1 angle.r. $
The cross product is pretty easy to evaluate in this case:
$ frac(partial bf(r), partial theta) times frac(partial bf(r), partial z)
  &= detmat(
    bf(e)_1, bf(e)_2, bf(e)_3;
    -R sin theta, R cos theta, 0;
    0, 0, 1
  ) \
  &= R cos theta bf(e)_1 + R sin theta bf(e)_2 \
  &= angle.l R cos theta, R sin theta, 0 angle.r. $
That's not too bad!
We can take the absolute value of this: $ dif S = R dif theta dif z. $

#tip(title: [Tip: $dif S$ for the sphere can be remembered geometrically])[
  The way to remember this is that "$dif S approx (dif V) / (dif r)$":
  if you multiply a bit of surface by a bit of the radial component,
  you get a chunk of volume of the sphere.
  And since we saw in @sec-triple that $dif V = r dif r dif theta dif z$,
  the formula for $dif S$ is what you get when you divide out $dif r$ and set $r = R$.

  Alternatively, each patch on the cylinder can be thought of as
  a little rectangle of height $dif z$ and width $R dif theta$.
]

=== For the curved part of the sphere, in spherical coordinates

We already saw the sphere is actually handled by our magic formula for level surfaces,
so if you're fine using $x y$-coordinates you are good to go.
Nonetheless, in the event you need spherical coordinates, here is the result.

We actually computed this already while working out the sphere's surface area by brute force:
if we take the parametrization
$ bf(r) (phi, theta) = (R sin phi cos theta , R sin phi sin theta , R cos phi) , $
then if we repeat the brutal calculation from last section with an extra $R$ tacked on, we get
$ frac(partial bf(r), partial phi) times frac(partial bf(r), partial theta)
  &= (R^2 sin^2 phi cos theta) bf(e)_1  + (R^2 sin^2 phi sin theta) bf(e)_2
  + (R^2 sin phi cos phi) bf(e)_3. $
This formula might look ugly until you realize that it's actually just
$ frac(partial bf(r), partial phi) times frac(partial bf(r), partial theta)
  = R sin phi dot bf(r)(phi, theta). $
Since $|bf(r)(phi, theta)| = R$, we get
$ dif S := lr(|frac(partial bf(r), partial phi) times frac(partial bf(r), partial theta)|) d phi d theta
  = R^2 sin phi dif phi dif theta. $

#tip(title: [Tip: $dif S$ for the sphere can be remembered geometrically])[
  The way to remember this is that "$dif S approx (dif V) / (dif rho)$":
  if you multiply a bit of surface by a bit of the radial component,
  you get a chunk of volume of the sphere.
  And since we saw in @sec-sph that $dif V = rho^2 sin phi dif rho dif phi dif theta$,
  the formula for $dif S$ is what you get when you divide out $dif rho$ and set $rho = R$.
]


== [RECIPE] Recap of surface area

Let's summarize the surface area procedure we just saw.

#recipe(title: [Recipe for computing surface area])[
  To compute the surface area of a surface $cal(S)$:

  1. Get the cross product
    $(partial bf(r))/(partial u) times (partial bf(r))/(partial v)$
    for a parametrization $bf(r)$ using the following checklist.
    - If you are using $(x,y)$-coordinates to parametrize
      (meaning $cal(S)$ is $z=f(x,y)$ or a level surface),
      use the magic formulas in rows 1 or 2 of @table-magic-cross-prod-scalint.
    - If $cal(S)$ is specifically given by cylindrical/spherical coordinates with fixed radius,
      use rows 3 or 4 of @table-magic-cross-prod-n-dS.
    - Otherwise, evaluate the cross product manually:
      - Pick a parametrization $bf(r)(u,v) : cal(R) -> RR^3$ of the surface $cal(S)$.
        Sort of like in @sec-flex-param, you have some freedom in how you set the parametrization.
      - Compute $(partial bf(r))/(partial u)$ and $(partial bf(r))/(partial v)$
        (both are three-dimensional vectors at each point),
      - Compute the cross product $(partial bf(r))/(partial u) times (partial bf(r))/(partial v)$ as in @sec-cross.
  2. Take the magnitude of the cross product to get a number for each point on the surface.
  3. Integrate it over $cal(R)$ using any of the methods for double integrals
    (such as horizontal/vertical slicing, polar coordinates, change of variables, etc.).
]

== [EXER] Exercises

#exer[
  Find the surface area of the surface defined by $z = x^2+y^2 <= 1$.
] <exer-surface-area-paraboloid>


#todo[write exercises]
