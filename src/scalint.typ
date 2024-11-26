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
(Here $cal(R)$ is a region in $RR^2$ used for the parametrization, often a rectangle.
It is _not_ the region whose surface area is being calculated.)

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
  We will bludgeon our way through this task with sheer brute force using the formula above.
  The parametrization $bf(r)$ is given from the spherical coordinate system by
  $ bf(r) (phi, theta) = (sin phi cos theta , phi sin theta , cos phi) , $
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
    + (sin phi cos phi) bf(e)_3. $
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
  We'll mention this more later, but it's worth noting know that
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
  $ op("SurfArea")("cone") = iint_(x^2+y^2 <= 1) sqrt(2) dif A = sqrt(2) op("Area")(x^2+y^2 <= 1) = #boxed[$sqrt(2) pi $]. $
]

== [EXER] Exercises

#exer[
  Find the surface area of the surface defined by $z = x^2+y^2 <= 1$.
] <exer-surface-area-paraboloid>

#exer[
  Let $f(x,y)$ be any differentiable function and consider the surface $z = f(x,y)$
  above some region $cal(R)$ in the $x y$-plane.
  Many other textbooks state the formula for surface area in this special case as
  $ iint_(cal(R)) sqrt(1 + ((partial f) / (partial x))^2 + ((partial f) / (partial y))^2) dif y dif x. $
  Derive this formula from our existing recipe.
]
#todo[write exercises]
