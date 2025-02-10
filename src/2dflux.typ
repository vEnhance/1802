#import "@local/evan:1.0.0":*

= 2D flux <ch-2dflux>

== [TEXT] Definition of 2D flux

I will grudgingly define 2D flux first, since I just went over Green's theorem.
I say "grudgingly" because 2D flux is really a special case of 3D flux,
but to keep things simple we've still been working in two dimensions.

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
$ int_(cal(C)) bf(F) dot bf(n) dif s. $
#digression(title: [Digression on why $bf(n) dif s$ is the shorthand])[
  I think the reason this shorthand is used is:
  $bf(n)$ is supposed to be the "outward unit normal vector",
  i.e. a vector of length $1$ whose direction is $90 degree$ rotated from $bf(r)'(t)$.
  So then it needs to be scaled by the magnitude $|bf(r)'(t)|$,
  and so we copy the old $dif s$ from arc length.

  So this notation is consistent with the notation used for scalar-field line integrals
  (if you consider the scalar field $f = bf(F) dot bf(n)$).
  But I don't like to mention this because I want to avoid scalar-field line integrals
  in 18.02 for anything that isn't arc length to keep things simple.
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

We don't like the $bf(n) dif s$ notation because we don't like scalar-field line integrals.
Fortunately, there is another way to write the flux with shorthand that avoids $bf(n) dif s$ notation.
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
  To spell this out, imagine that $bf(r)'(t) = vec( r'_1(t), r'_2(t) )$,
  meaning that its $90 degree$ clockwise rotation is $vec( r'_2(t), -r'_1(t) )$.
  Then the two quantities
  $ bf(F) dot (90 degree "clockwise rotation of" bf(r)') &= vec(p,q) dot vec(r'_2, -r'_1) \
    (90 degree "counterclockwise rotation of" bf(F)) dot bf(r)' &= vec(-q, p) dot vec(r'_1, r'_2) $
  and equal as both are $p r'_2 - q r'_1$
  (strictly speaking,
  this quantity should be written in full as $p(bf(r)(t)) r'_2(t) - q(bf(r)(t)) r'_1(t)$,
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
  2D flux is conspicuously missing from our poster in @poster-stokes.
  Through this chapter, we were able to complete an analogy to get one Stokes result
  by translating 2D flux into 2D work and then quoting Green's theorem.
  However, as far as I can tell there isn't an analog of FTC that can be made this way.
  So actually one good thing about the notation $bf(n) dif s$ is that
  the presence of $dif s$ is a good reminder that there's no FTC result.

  In other words, 2D flux is conceptually missing one red Stokes arrow compared to 2D work.
  (I suppose if you really missed it, you could try to force it by asking
  whether $vec(-q,p)$ is conservative, but I haven't seen this done.
  One possible reason is that 2D flux is mostly used for closed loops $cal(C)$,
  and Green's theorem can handle that case anyway.)
]

== [SIDENOTE] A picture explaining why Green's Theorem for flux should be true (not a formal proof) <sec-2dflux-explain>

We can draw a figure much like the earlier @fig-ftcgreen-explain (from @sec-ftcgreen-explain)
for Green's Theorem for flux.
Remember that the quantity
$ (partial p) / (partial x) + (partial q) / (partial y) = nabla dot bf(F) $
is the divergence and interprets how much $bf(F)$ is moving away from the point.
So instead of _spirals_, we draw little green _explosions_ corresponding to how fast $bf(F)$
is moving out of each individual grey cell.
The picture now turns into @fig-2dflux-explain, and
$ iint_(cal(R)) nabla dot bf(F) dif A $
is drawn as the sum of the green explosions.

Like before, everything on the inside just cancels out.
So what's left over is now the measure of $bf(F)$ _against_ the purple walls:
the dark green arrows in @fig-2dflux-explain.
And this corresponds to the 2D flux of $bf(F)$ against the purple walls, as desired.

#figure(
  image("figures/2dflux-explain.svg", width: auto),
  caption: [Roughly what Green's Theorem for flux is trying to say:
    summing the green explosions gives just the force of $bf(F)$ against the walls.],
) <fig-2dflux-explain>

== [RECIPE] Computing 2D flux <sec-recipe-2d-flux>

#recipe(title: [Recipe for computing 2D flux])[
  1. If $cal(C)$ is a closed loop, use Green's theorem as a shortcut:
    $ oint_(cal(C)) (-q dif x + p dif y) = iint_(cal(R)) ((partial p)/(partial x) + (partial q)/(partial y)) dif A. $
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
  the shortcut with Green's theorem.

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
  We don't really want to parametrize the ellipse#footnote[Although
    it could be done with $bf(r) = (a cos t, b sin t)$ for $0 <= t <= 2pi$.
    So it's not _that_ bad.]
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

== [RECAP] Comparison

Since the recipes for 2D flux and work look so similar,
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

If you want to see examples of this written out, see @ch-lineex.
There I do four examples in full, using every applicable cell of @tab-work-vs-flux.
Since it's so long, I broke it out into a separate skippable chapter.

== [EXER] Exercises

#exer[Suggested by Ting-Wei Chao][
  As in @exer-parabola-1 and @exer-parabola-2,
  let $cal(C)$ be the oriented closed curve formed by the arc of the parabola $y = x^2-1$
  running from $(-1, 0)$ to $(1, 0)$, followed by a line segment from $(1, 0)$ back to $(-1, 0)$.
  Again let $ bf(F)(x,y) = vec(x^2(y+1), (y+1)^2). $
  Compute $int_(cal(C)) bf(F) dot bf(n) dif s$ using direct parametrization
  and by using Green's Theorem for flux.
] <exer-parabola-3>

#exer[
  Triangle $A B C$ has vertices $A = (-5,0)$, $B = (9,0)$, and $C$ on the positive $y$-axis.
  The flux of the vector field
  $ bf(F) (x , y) = vec(x + 7y^2, x^2 + 7y) $
  across the perimeter of $A B C$, oriented counterclockwise, is $672$.
  Compute the length of the perimeter of $A B C$.
] <exer-flux-triangle>
