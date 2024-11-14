#import "@local/evan:1.0.0":*

= 2D flux <sec-2d-flux>

== [TEXT] Definition of 2D flux

I will grudgingly define 2D flux first, since I just went over Green's theorem.
I say "grudgingly" because 2D flux is an awkward hacked special case of 3D flux,
forced to work in two dimensions.
But okay, gotta follow the script.

The idea of flux is that you have some closed curve $cal(C)$ in $RR^2$.
When we had a work integral, we went along the curve $cal(C)$ and added together the
dot product of the vector field with the tangent vectors on that vector field.

With 2D flux, we instead take the dot product of the vector field
with the _normal vector_ rather than the tangent vector.
This should be drawn as a _$90 degree$ clockwise rotation of $bf(r)'(t)$_.
Seriously, I can't make this up.

#figure(
  image("figures/2dflux-dot.svg", width: auto),
  caption: [The 2D flux is the dot product where the tangent $bf(r)'(t)$ is replaced by its rotated version.],
)

In any case, the 2D flux is then defined as follows.
#definition(title: [Definition of 2D flux])[
  The 2D flux of a vector field $bf(F)$ through the closed path $cal(C)$
  parametrized by $bf(r)(t)$ is defined by
  $ int_(t="start time")^("stop time") bf(F)(bf(r)(t)) dot
    (90 degree "clockwise rotation of" bf(r)'(t)) dif t. $
]

#typesig[
  2D flux is a scalar quantity.
  It's only defined for a vector field in $RR^2$ piercing a closed path in $RR^2$.
]

The "$90 degree$ clockwise rotation of $bf(r)'(t)$" is so awkward
that you can bet people immediately made up a shorthand to sweep it under the rug.
I think the usual notation is
$ bf(n) dif s := (90 degree "clockwise rotation of" bf(r)'(t)) dif t $
so that the above thing will usually be condensed to
$ oint_(cal(C)) bf(F) dot bf(n) dif s. $
#digression(title: [Digression on why $bf(n) dif s$ is the shorthand])[
  I think the reason this shorthand is used is:
  $bf(n)$ is supposed to be the "outward unit normal vector",
  i.e. a vector of length $1$ whose direction is $90 degree$ rotated from $bf(r)'(t)$.
  So then it needs to be scaled by the magnitude $|bf(r)'(t)|$,
  and so we copy the old $dif s$ from arc length.

  I _promise_ that none of this was my idea.
]

#warning[
  The rotated $bf(r)'(t)$ is sometimes called the "outward normal vector".
  However, despite the name, it only points outward if we oriented $cal(C)$ counterclockwise.
  If $cal(C)$ is clockwise it points inwards instead!
]

== [TEXT] Aquatic interpretation of 2D flux

Aquatically, if the curve $cal(C)$ is thought of as some permeable membrane,
then the 2D flux measures the rate the current passes through the membrane.
Assuming $cal(C)$ is oriented counterclockwise,
the 2D flux is positive if water is (net) moving out of $cal(C)$; it's negative if it flows in.

== [TEXT] 2D flux is a rotation of 2D work

There is another way to write the flux with shorthand that avoids $bf(n) dif s$ notation.
To see where it comes from, once again write
$ bf(F)(x,y) = vec(p(x,y), q(x,y)). $
Rather than rotating $bf(r)'(t)$ by $90 degree$ clockwise,
let's imagine we instead rotated $bf(F)$ by $90 degree$ counterclockwise instead, and use:
$ (90 degree " counterclockwise rotation of " bf(F) (x,y)) = vec(-q(x,y), p(x,y)). $
The idea is the following:
#idea[
  $ bf(F) dot (90 degree "clockwise rotation of" bf(r)') = (90 degree "counterclockwise rotation of" bf(F)) dot bf(r)'. $
]
So what we've done is put the rotation thing onto the vector field instead.
#proof(title: [Proof of the equation])[
  To spell this out, imagine that $bf(r)'(t) = vec( r_1(t), r_2(t) )$,
  meaning that its $90 degree$ clockwise rotation is $vec( r_2(t), -r_1(t) )$.
  Then the two quantities
  $ bf(F) dot (90 degree "clockwise rotation of" bf(r)') &= vec(p,q) dot vec(r_2, -r_1) \
    (90 degree "counterclockwise rotation of" bf(F)) dot bf(r)' &= vec(-q, p) dot vec(r_1, r_2) $
  and equal as both are $p r_2 - q r_1$
  (strictly speaking,
  this quantity should be written in full as $p(bf(r)(t)) r_2(t) - q(bf(r)(t)) r_1(t)$,
  for each time $t$).
]

The upshot of this is that we can actually change the flux into a work integral:
$ int_(cal(C)) bf(F) dot bf(n) dif s = int_(cal(C)) (bf(F) "rotated" 90 degree "counterclockwise") dot dif bf(r). $
This looks a bit better but we still want to get rid of the rotation thing.
But we can, because there is a shorthand for work that uses just $p$ and $q$.
Specifically, since $bf(F) "rotated" 90 degree "counterclockwise" = vec(q, -p)$, we have
$ int_(cal(C)) (bf(F) "rotated" 90 degree "counterclockwise") dot dif bf(r) = int_(cal(C)) (-q dif x + p dif y). $
In summary, we get the following more readable shorthand:

#definition(title: [Better definition of 2D flux using work shorthand])[
  Let $bf(F)(x,y) = vec(p(x,y), q(x,y))$ be a 2D vector field
  and let $cal(C)$ be a path in $RR^2$.
  Then the flux of $bf(F)$ through $cal(C)$ is defined as
  $ int_(cal(C)) (-q dif x + p dif y). $
]

#tip[
  For this reason, we usually prefer to rotate $bf(F)$ by $90 degree$ counterclockwise
  (rather than rotate $bf(r)'$ by $90 degree$ clockwise) when doing concrete calculation,
  though of course they give the same result.
  I think it's easier to remember and more natural this way,
  because it makes things more consistent with the work integral.
  We'll use that convention in all the examples to follow.
]

In particular, if $cal(C)$ is a loop (and that's usually the case if we're talking about flux at all)
that means we can apply Green's theorem again;
the resulting theorem is called _Green's theorem in flux form_.
We get that
$ oint_(cal(C)) (-q dif x + p dif y)
  = iint_(cal(R)) ((partial p) / (partial x) + (partial q) / (partial y)) dif A. $
The right-hand side is 2D divergence, so it could be condensed even further to
$ iint_(cal(R)) nabla dot bf(F) dif A. $
There's like four different versions of the same expression now,
so let me just put everything in one place for sanity's sake:

#memo(title: [Memorize: Green's theorem in flux form])[
  Suppose $cal(C)$ is a closed curve oriented counterclockwise enclosing a region $cal(R)$.
  We have
  $ underbrace(oint_(cal(C)) (-q dif x + p dif y), = oint_(cal(C)) (bf(F) dot bf(n) dif s))
    = underbrace(iint_(cal(R)) ((partial p) / (partial x) + (partial q) / (partial y)) dif A,
      = iint_(cal(R)) nabla dot bf(F) dif A). $
]

#warning(title: [Warning: There's no FTC for flux])[
  2D flux is conspicuously missing from our poster in @fig-int-chart-stokes.
  Through this section, we were able to complete an analogy to get one Stokes result
  by translating 2D flux into 2D work and then quoting Green's theorem.
  However, as far as I can tell there isn't an analog of FTC that can be made this way.
  So actually one good thing about the notation $bf(n) dif s$ is that
  the presence of $dif s$ is a good reminder that there's no FTC result.

  In other words, 2D flux is missing one red Stokes arrow compared to 2D work.
]

== [RECIPE] Computing 2D flux <sec-recipe-2d-flux>

#recipe(title: [Recipe for computing 2D flux])[
  1. If $cal(C)$ is a closed loop, see if using Green's theorem gives you a shortcut.
  2. Otherwise, do the manual recipe in @sec-work-manual-recipe
    with $bf(F) = vec(p,q)$ replaced by its $90 degree$ counterclockwise rotation $vec(-q, p)$:
    1. Pick *any* parametrization $bf(r) : RR -> RR^n$ of the curve $cal(C)$,
      including specifying the start and stop times.
      As described in @sec-flex-param, you have some freedom in how you set the parametrization.
    2. Calculate the derivative $bf(r)'(t)$.
    3. Calculate the dot product $vec(-q, p) dot bf(r)'(t)$.
      (The vector field $vec(-q,p)$ is the $90 degree$ counterclockwise rotation of $bf(F)$.)
    4. Integrate this from the start time to the stop time.
]

Here are a few examples for documentation.
For each example, we actually show how to do it "manually"
(by calculating a line integral) and how to do it with Green's theorem for flux.

#sample[
  Compute the flux of the vector field
  $bf(F) (x , y) = vec(x^2 , y^2)$ across the circle
  $cal(C)$ defined by $x^2 + y^2 = 1$, oriented counterclockwise.
]

#soln[
  For this one, we'll actually show how to do it both using Green and manually, for comparison.
  - Using Green's theorem:
    Green’s theorem for flux states:
    $ "Flux" = iint_(cal(R)) ((partial p) / (partial x) + (partial q) / (partial y)) dif A , $
    where $cal(R)$ is the region enclosed by $cal(C)$.

    The divergence is
    $ nabla dot bf(F) = (partial p)/(partial x) + (partial q)/(partial y) = (partial)/(partial x)(x^2) + (partial)/(partial y)(y^2) = 2 x + 2 y. $
    Therefore,
    $ "Flux" = iint_(cal(R)) (2 x + 2 y) dif A . $

    Since the region $cal(R)$ is the unit circle centered at the origin, and
    the integrand $2 x + 2 y$ is an odd function over this symmetric region,
    the integral evaluates to $#boxed[$ 0 $]$.
    (Alternatively, integrate using polar coordinates.)

  - Use the definition
    $ "Flux" = oint_(cal(C)) (p dif y - q dif x) $
    and parametrize the curve by using
    $ bf(r)(t) = vec(cos(t), sin(t)) quad 0 <= t <= 2pi $
    so
    $ bf(r)'(t) = vec(-sin(t), cos(t)) quad 0 <= t <= 2pi. $
    So the dot product inside the integrand is
    $ (bf(F) "rotated" 90 degree "counterclockwise") dot bf(r)'(t)
      &= vec(-q, p) dot bf(r)'(t) \
      &= vec(cos(t)^2, sin(t)^2) dot vec(-sin(t), cos(t)) \
      &= cos^2 t dot cos t - sin^2 t dot (- sin t) = cos^3 t + sin^3 t. $
    Hence
    $ "Flux" = int_(t = 0)^(t = 2 pi) (cos^3 t + sin^3 t) dif t . $
    It's possible to observe from here again that the integral is symmetric;
    that is, for $0 <= t <= pi$ we have $cos^3(t) + cos^3(t+pi) = 0$
    and $sin^3(t) + sin^3(t+pi) = 0$.
    So again the entire contribution of the integral is $#boxed[$0$]$.
]

#sample[
  Compute the flux of the vector field
  $bf(F) (x , y) = vec(5x, 7y)$ across the square
  $cal(C)$ with vertices at $(1 , 1)$, $(-1 , 1)$, $(-1 , -1)$, $(1 , -1)$, oriented counterclockwise.
]

#soln[
  If we were to do the line integral manually,
  we would have to parametrize all four sides.
  This would be straightforward, but it's annoying, so we'll just jump straight
  to Green the shortcut with Green's theorem.

  The divergence is
  $ nabla dot bf(F) := (partial p)/(partial x) + (partial q)/(partial y)
    = (partial)/(partial x)(5x) + (partial)/(partial y)(7y) = 12. $
  So by Green's theorem,
  $ "Flux" = iint_(cal(R)) 12 dif A = 12 op("Area")(cal(R)) = 12 dot 2^2 = #boxed[$ 48 $]$
  where $cal(R)$ is the region enclosed by $cal(C)$, a square of side length $2$.
]

#sample[
  Let $a, b > 0$.
  Compute the flux of the vector field
  $bf(F) (x , y) = vec(x , y)$ across the ellipse
  $cal(C)$ defined by $x^2 / a^2 + y^2 / b^2 = 1$, oriented counterclockwise.
]

#soln[
  We don't really want to parametrize the ellipse,
  although it could be done with $bf(r) = (a cos t, b sin t)$ for $0 <= t <= 2pi$.
  Again, we jump straight to Green's theorem, with
  $
    nabla dot bf(F)
    = (partial p) / (partial x) + (partial q) / (partial y)
    = (partial) / (partial x) (x) + (partial) / (partial y) (y)
    = 1 + 1 = 2.
  $
  So by Green's theorem,
  $ "Flux" = iint_(cal(R)) 2 dif A = 2 op("Area")(cal(R)). $
  In a previous section (@sec-ex-ellipse) we saw the area of this ellipse is was $a b pi$;
  if you didn't remember this, you would go back to the change of variables and execute it.
  In any case, this means the flux is $2 dot (a b pi) = #boxed[$ 2 a b pi $]$.
]

== [RECAP] Work vs flux

Since the recipes for flux and work look so similar,
it might be helpful to compare them side by side.
This comparison is shown in the table below.

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Method],
      [Work $int_(cal(C)) bf(F) dot bf(r)$\ (see @sec-recipe-work)],
      [2D Flux $int_(cal(C)) bf(F) dot bf(n) dif s$ \ (see @sec-recipe-2d-flux)]),
    table.hline(),
    [$bf(F)$ is conservative \ $==>$ FTC],
      [If $bf(F) = nabla f$, \ Output $f("stop") - f("start")$], [_Not applicable_],
    [$cal(C)$ is a closed loop \ $==>$ Green],
      [Output $iint_(cal(R)) underbrace(((partial q)/(partial x) - (partial p)/(partial y)), "2D scalar curl") dif A$],
      [Output $iint_(cal(R)) underbrace((partial p)/(partial x) + (partial q)/(partial y), "Div" = nabla dot bf(F)) dif A$],
    [Bare-hands definition \ Use parametrization],
      [Output $int (p dif x + q dif y)$ \ $= int_(cal(C)) bf(F) dot bf(r)'(t) dif t$ ],
      [Output $int (-q dif x + p dif y)$ \ $= int_(cal(C)) (bf(F) "rot" 90 degree "ccw") dot bf(r)'(t) dif t$],
  ),
  caption: [
    Comparison of the recipe for work and flux.
    Methods higher in the table are less work, and preferred when they apply.
  ],
  kind: table
) <tab-work-vs-flux>

To flesh out this table with examples, we'll show the entire table with four situations:

- The conservative field $bf(F) = vec(2x+y, x+2y)$
  over the unit circle oriented counterclockwise (a closed loop).
- The conservative field $bf(F) = vec(2x+y, x+2y)$
  over the line segment from $(1,4)$ to $(3,9)$.
- The non-conservative field $bf(F) = vec(x^2+3y,5y)$
  over the unit circle oriented counterclockwise (a closed loop).
- The non-conservative field $bf(F) = vec(x^2+3y,5y)$
  over the line segment from $(1,4)$ to $(3,9)$.

=== Example with $bf(F) = vec(2x+y, x+2y)$ and $cal(C)$ the unit circle

#sample[
  Let $bf(F) = vec(2x+y, x+2y)$
  and let $cal(C)$ be the unit circle oriented counterclockwise.
  Evaluate $int bf(F) dot dif bf(r)$ and $int bf(F) dot bf(n) dif s$.
]

We use the parametrization
$ bf(r)(t) = vec(cos(t), sin(t)) quad 0 <= t <= 2pi $
so
$ bf(r)'(t) = vec(-sin(t), cos(t)) quad 0 <= t <= 2pi. $

The line integral is trivially zero:
we don't even have to compute the potential function,
because the FTC implies that we'll get $f(1,0) - f(1,0) = 0$.
In fact the potential function is $f(x,y) = x^2 + x y + y^2$
but we won't use this until the next example.

If you missed that the vector field was conservative,
and you use Green's theorem,
you unsurprisingly get $0$ for the 2D scalar curl:
conservative functions have vanishing curl.
So actually even if you don't notice the field is conservative to start,
when you try to apply Green's theorem you'll get a rather rude reminder when you realize
you're just integrating the $0$ function.

As for flux, we don't get a fundamental theorem of calculus anyway,
but the divergence is $2+2=4$ everywhere, which is a constant,
so the flux works out to $4op("Area")(cal(R))$, which is just $4pi$.

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Method],
      [Work $int_(cal(C)) bf(F) dot bf(r)$\ (see @sec-recipe-work)],
      [2D Flux $int_(cal(C)) bf(F) dot bf(n) dif s$ \ (see @sec-recipe-2d-flux)]),
    [$bf(F)$ is conservative \ $==>$ FTC],
      [$f(1,0)-f(1,0)=0$], [_Not applicable_],
    [$cal(C)$ is a closed loop \ $==>$ Green],
      [$iint_(cal(R)) underbrace(1-1, "2D scalar curl") dif A = 0$],
      [Output $iint_(cal(R)) underbrace(2+2, "Div" = nabla dot bf(F)) dif A = 4pi$],
    [Bare-hands definition \ Use parametrization],
      [$int_(t=0)^(2pi) vec(2cos(t)+sin(t), cos(t)+2sin(t)) dot vec(-sin(t), cos(t)) dif t$],
      [$int_(t=0)^(2pi) vec(-(cos(t)+2sin(t)), 2cos(t)+sin(t), ) dot vec(-sin(t), cos(t)) dif t$],
  ),
  caption: [For $bf(F) = vec(2x+y, x+2y)$ which is conservative,
    with potential function $f(x,y) = x^2 + x y + y^2$, around the unit circle.],
  kind: table
)

On the other hand, the bare-hands parametrization in both cases is really not fun.
But it can be done.

- For the work integral, you compute it as follows:
  $ bf(F)(cos t, sin t) dot bf(r)'(t) &= vec(2cos(t)+sin(t), cos(t)+2sin(t)) dot vec(-sin(t), cos(t)) \
    &= (2 cos t + sin t) (- sin t) + (cos t + 2 sin t) (cos t) \
    &= - 2 cos t sin t - sin^2 t + cos^2 t + 2 cos t sin t \
    &= cos^2 t - sin^2 t = cos(2t). $
  So the integral becomes:
  $ int_0^(2 pi) cos (2 t) dif t = 0 $
  because it's an integral over two full periods of the cosine function, hence $0$.
  (Alternatively, write $[(sin 2 t) / (2)]_(t=0)^(2 pi) = (sin 4 pi) / (2) - (sin 0) / (2) = 0 - 0 = 0$.)
- For the flux integral, rotate the vector for the vector field
  (that is, look at $-q dif x + p dif y$) to get the dot product
  $ vec(-(cos(t)+2sin(t)), 2cos(t)+sin(t)) dot vec(-sin(t), cos(t))
    &= (2 cos t + sin t) cos t + (cos t + 2 sin t) sin t \
    &= 2 cos^2 t + sin t cos t + cos t sin t + 2 sin^2 t \
    &= 2 (cos^2 t + sin^2 t) + 2 sin t cos t \
    &= 2 (1) + sin 2 t = 2 + sin 2 t . $
  Consequently,
  $ int_(t=0)^(2 pi) (2 + sin 2 t) dif t  = 4 pi + int_(t=0)^(2 pi) sin 2 t dif t = 4 pi. $
  since $int_(t=0)^(2 pi) sin 2 t$ is an integral over two full periods of the sine function.

=== Example with $bf(F) = vec(2x+y, x+2y)$ and $cal(C)$ a line segment

#sample[
  Let $bf(F) = vec(2x+y, x+2y)$
  and let $cal(C)$ be the path from $(1,4)$ to $(3,9)$.
  Evaluate $int bf(F) dot dif bf(r)$ and $int bf(F) dot bf(n) dif s$.
]

We use the same vector field, but this time we parametrize our line segment
$ bf(r)(t) = vec(1+2t, 4+5t) quad 0 <= t <= 1 $
so
$ bf(r)'(t) = vec(2,5) quad 0 <= t <= 2pi. $

This time, our table looks like this:

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Method],
      [Work $int_(cal(C)) bf(F) dot bf(r)$\ (see @sec-recipe-work)],
      [2D Flux $int_(cal(C)) bf(F) dot bf(n) dif s$ \ (see @sec-recipe-2d-flux)]),
    [$bf(F)$ is conservative \ $==>$ FTC],
      [$f(3,9)-f(1,4) = 117 - 21 = 96$], [_Not applicable_],
    [$cal(C)$ is a closed loop \ $==>$ Green],
      [_Cannot use here_],
      [_Cannot use here_],
    [Bare-hands definition \ Use parametrization],
      [$int_(t=0)^(1) vec(2(1+2t)+(4+5t), (1+2t)+2(4+5t)) dot vec(2,5) dif t$],
      [$int_(t=0)^(1) vec(-((1+2t)+2(4+5t)), 2(1+2t)+(4+5t)) dot vec(2,5) dif t$],
  ),
  caption: [For $bf(F) = vec(2x+y, x+2y)$ which is conservative,
    with potential function $f(x,y) = x^2 + x y + y^2$,
    but this time on the line segment from $(1,4)$ to $(3,9)$.],
  kind: table
)

This time, we will use the potential function
$ f(x,y) = x^2 + x y + y^2 $
(or really $f(x,y) = x^2 + x y + y^2 + C$ for any constant $C$).
So we can short-circuit the entire line integral by simply evaluating
$ f(3,9)-f(1,4) = 117 - 21 = 96. $

As always, the bare-hands method is the most work,
but for the flux integral we don't really have a choice because no other method is possible.

- For the work integral, first expand
  $ bf(F) (1+2t,4+5t) = vec(2(1+2t)+(4+5t), (1+2t)+2(4+5t)) = vec(2 + 4 t + 4 + 5 t , 1 + 2 t + 8 + 10 t) = vec(6 + 9 t, 9 + 12 t). $
  Hence the dot product is
  $ bf(F) (1+2t,4+5t) dot bf(r)'(t) = vec(6 + 9 t, 9 + 12 t) dot vec(2, 5) = 2(6 + 9 t) + 5(9 + 12 t) = 57 + 78 t. $
  Integrating this gives
  $ int_(t=0)^1 (57 + 78 t) dif t = [57 t + 39 t^2]_0^1 = 57 (1) + 39 (1)^2 - 0 = 57 + 39 = 96. $

- For the flux integral, rotate the vector for the vector field
  (that is, look at $-q dif x + p dif y$) to get the dot product
  $ vec(-(9 + 12 t), 6 + 9 t) dot vec(2, 5) = -2(9 + 12t) + 5(6+ 9t) = 12 + 21 t $
  Integrating this gives
  $ int_(t=0)^1 (12 + 21 t) dif t = [12 t + 21/2 t^2]_(t=0)^1 = 45/2. $


=== Example with $bf(F) = vec(x^2+3y,5y)$ and $cal(C)$ the unit circle

#sample[
  Let $bf(F) = vec(x^2+3y, 5y)$
  and let $cal(C)$ be the unit circle oriented counterclockwise.
  Evaluate $int bf(F) dot dif bf(r)$ and $int bf(F) dot bf(n) dif s$.
]

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Method],
      [Work $int_(cal(C)) bf(F) dot bf(r)$\ (see @sec-recipe-work)],
      [2D Flux $int_(cal(C)) bf(F) dot bf(n) dif s$ \ (see @sec-recipe-2d-flux)]),
    [$bf(F)$ is conservative \ $==>$ FTC],
      [_Cannot use here_], [_Not applicable_],
    [$cal(C)$ is a closed loop \ $==>$ Green],
      [$iint_(cal(R)) underbrace(0-3, "2D scalar curl") dif A = 0$],
      [Output $iint_(cal(R)) underbrace(2x+5, "Div" = nabla dot bf(F)) dif A = 5pi$],
    [Bare-hands definition \ Use parametrization],
      [$int_(t=0)^(2pi) vec(cos(t)^2+3sin(t), 5sin(t)) dot vec(-sin(t), cos(t)) dif t$],
      [$int_(t=0)^(2pi) vec(-5sin(t), cos(t)^2+3sin(t)) dot vec(-sin(t), cos(t)) dif t$],
  ),
  caption: [For $bf(F) = vec(x^2+3y, 5y)$ which is not conservative,
    integrated over the unit circle.],
  kind: table
)

Green's theorem works readily here because $cal(C)$ is closed.
For the work version, we do
$ (partial q) / (partial x) &= (partial) / (partial x) (5 y) = 0 \
  (partial p) / (partial y) &= (partial) / (partial y) (x^2 + 3 y) = 3 . $
so the answer is $iint_(cal(R)) (0-3) dif A = -3 pi$.
For the flux version, it's instead
$ (partial p) / (partial x) &= (partial) / (partial x) (x^2 + 3 y) = 2 x \
  (partial q) / (partial y) = (partial) / (partial y) (5 y) = 5 . $
so the flux is
$ oint_(cal(C)) bf(F) dot bf(n) dif s = iint_(cal(R)) (2 x + 5) dif A . $
By symmetry, we have $iint_(cal(R)) 2 x dif A = 0$
(or if you want, you can use polar coordinates to compute this),
and $iint_(cal(R)) 5 dif A = 5 pi$, giving the answer.

#remark[
  If you don't notice the symmetry trick, you can use polar coordinates
  $ x = r cos theta , quad y = r sin theta , quad dif A = r dif r dif theta , $
  instead where $0 <= r <= 1$ and $0 <= theta <= 2 pi$.
  In that case
  $ 2 x + 5 = 2 r cos theta + 5 . $
  Thus, the flux integral becomes:
  $ oint_(cal(C)) bf(F) dot bf(n) dif s &= int_(theta=0)^(2 pi) int_(r=0)^1 (2 r cos theta + 5) r dif r dif theta \
    &= int_(theta=0)^(2 pi) int_(r=0)^1 (2 r^2 cos theta + 5 r) dif r dif theta \
    &= 2 int_(theta=0)^(2 pi) cos theta int_(r=0)^1 r^2 dif r dif theta
      + 5 int_(theta=0)^(2 pi) int_(r=0)^1 r dif r dif theta . $
  Evaluate the inner integrals:
  $ int_(r=0)^1 r^2 dif r = 1 / 3 , quad int_(r=0)^1 r dif r = 1 / 2 . $
  Thus, the flux equals
  $ 2 dot 1 / 3 int_0^(2 pi) cos theta dif theta + 5 dot 1 / 2 int_0^(2 pi) dif theta
    = 2/3 dot 0 + 5 dot 1/2 dot 2 pi = 5 pi.$
]

You can also do parametrization, which is disgusting, but it works.
We don't delve into the calculation here, because it's horrendous.

=== Example with $bf(F) = vec(x^2+3y,5y)$ and $cal(C)$ a line segment

#sample[
  Let $bf(F) = vec(x^2+3y, 5y)$
  and let $cal(C)$ be the path from $(1,4)$ to $(3,9)$.
  Evaluate $int bf(F) dot dif bf(r)$ and $int bf(F) dot bf(n) dif s$.
]

Here in both cases we have to bite the bullet --- none of our shortcuts apply.
As before we use the parametrization
$ bf(r)(t) = vec(1+2t, 4+5t) quad 0 <= t <= 1 $
with
$ bf(r)'(t) = vec(2,5) quad 0 <= t <= 2pi. $

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Method],
      [Work $int_(cal(C)) bf(F) dot bf(r)$\ (see @sec-recipe-work)],
      [2D Flux $int_(cal(C)) bf(F) dot bf(n) dif s$ \ (see @sec-recipe-2d-flux)]),
    [$bf(F)$ is conservative \ $==>$ FTC],
      [_Cannot use here_], [_Not applicable_],
    [$cal(C)$ is a closed loop \ $==>$ Green],
      [_Cannot use here_],
      [_Cannot use here_],
    [Bare-hands definition \ Use parametrization],
      [$int_(t=0)^(1) vec((1+2t)^2+3(4+5t), 5(4+5t)) dot vec(2,5) dif t$],
      [$int_(t=0)^(1) vec(-5(4+5t), (1+2t)^2+3(4+5t)) dot vec(2,5) dif t$],
  ),
  caption: [For $bf(F) = vec(x^2+3y, 5y)$ which is not conservative,
    integrated over the unit circle.],
  kind: table
)

- For the work integral, substitute $1 + 2 t$ and $4 + 5 t$ into $bf(F)$:
  $ bf(F) (1+2t, 4+5t) = vec((1 + 2 t)^2 + 3 (4 + 5 t) , thin 5 (4 + 5 t)) = vec(4t^2 + 19t + 13, 25t+20). $
  Then the dot product is
  Dot product:
  $ vec(4t^2 + 19t + 13, 25t+20) dot vec(2,5) = 2 (4 t^2 + 19 t + 13) + 5 (25 t + 20) = 8 t^2 + 163 t + 126. $
  Hence
  $ int_(cal(C)) bf(F) dot dif bf(r) = int_(t=0)^1 (8t^2 + 163t + 126) dif t . $
  Integrate term by term:
  $ int_(t=0)^1 126 dif t &= 126, \
    int_(t=0)^1 163 t dif t &= [163 / 2 t^2]_(t=0)^1 = 163 / 2 (1)^2 - 163 / 2 (0)^2 = 163 / 2 , \
    int_(t=0)^1 8 t^2 dif t &= [8 / 3 t^3]_(t=0)^1 = 8 / 3 (1)^3 - 8 / 3 (0)^3 = 8 / 3 . $
  Combine the results:
  $ int_(cal(C)) bf(F) dot dif bf(r) = 126 + 163/2 + 8/3 = 1261 / 6. $

- For the flux integral, instead do the dot product
  $ vec(-(25t+20), 4t^2 + 19t + 13) dot vec(2,5) = -2 (25t+20) + 5(4t^2+19t+13) = 20t^2 + 45t + 25. $
  Integrate term by term again:
  $ int_(t=0)^1 25 dif t &= 25, \
    int_(t=0)^1 45 t dif t &= [45 / 2 t^2]_(t=0)^1 = 45 / 2 (1)^2 - 45 / 2 (0)^2 = 45 / 2 , \
    int_(t=0)^1 20 t^2 dif t &= [20 / 3 t^3]_(t=0)^1 = 20 / 3 (1)^3 - 20 / 3 (0)^3 = 20 / 3 . $
  Combine the results:
  $ int_(cal(C)) bf(F) dot bf(n) dif s = 25 + 45 / 2 + 20 / 3 = 150 / 6 + 135 / 6 + 40 / 6 = 325 / 6. $

== [EXER] Exercises
