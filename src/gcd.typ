#import "@local/evan:1.0.0":*

= Grad, curl, and div, individually <sec-gcd>

The goal of this section is to _define_ each individual red arrow in the poster.
For each red arrow, we'll show you

- How to compute it, and
- How to visualize it in an aquatic setting.

There is no integration in this section, and so it's actually pretty straightforward.

#figure(
  table(
    columns: 6,
    align: left,
    table.header([Red arrow], [Symbol], [Input type], [Output at \ each point], [Example input], [Example output]),
    [Gradient], [$nabla f$], [Scalar field], [Vector], [Measure of distance from top of waterfall], [Waterfall current pointing to lower elevation],
    [Curl], [$nabla times f$], [3D vec.~field], [3D vector], [Whirlpool current], [Arrow aligned with rotation axis, magnitude is rotation speed],
    [Divergence], [$nabla dot f$], [3D vec.~field], [Scalar], [Water flow], [Pump/drain speed],
    [2D curl], [$(partial g) / (partial y) - (partial f) / (partial x)$ \ where \ $bf(F) = (f,g)$], [2D vec.~field], [Scalar], [Whirlpool current], [Angular velocity],
    [2D div], [$nabla dot f$], [2D vec.~field], [Scalar], [Water flow], [Pump/drain speed],
  ),
  caption: [The red arrows, plus an extra 2D div that's a modified version of 2D curl.],
  kind: table
)

== [SIDENOTE] Aquatics are unlikely to improve your exam score

By the way, a quick word about aquatics.
For each of these, I'm trying to tell you how to think of the quantity in terms of real life.
This may help you internalize and remember the results.
However, on the actual 18.02 exam, you will find that most of the functions
you are taking curl's or divergence's of are rather artificial functions.
So your aquatic intuition is more or less useless for actually doing calculation.

It's kind of how like, you were told in 18.01 that derivatives measured rate of change.
But then on the calculus final exam you were asked things like
"differentiate $f(x) = sin(e^x)^2$".
Probably it wasn't much help to know that $f'(x)$ was the rate of change of $f$,
because the function $f$ is completely artificial and would never appear in real life.
The question was really testing whether you can apply a recipe
with the chain rule to get $f'(x) = 2e^x sin(e^x) cos(e^x)$.

The same is true in this section.
Exam questions about grad, curl, div tend to use artificial functions.
So the aquatic intuition is not going to be directly helpful
and you just need to be good at following the recipe.

For this reason, in these notes, I'm not even going to bother trying to explain
where the curl and div formulas come from.
Many have tried and many have failed.
If you want to see the grown-ups discuss this,
see #url("https://mathoverflow.net/q/21881/70654"),
where the top comment is "My advice: at this level, stick _strictly_ to the textbook".

== [TEXT] Gradient

You already know how to do this from @sec-gradient.
The function $f$ assigns some number to every point in $RR^n$,
and then $nabla f$ points in the direction that $f$ increases most rapidly.
In our aquatic examples, you could imagine you have a waterfall,
$f$ measures the distance from the top of the waterfall,
and $nabla f$ just points straight down.

== [TEXT] Curl

Here's the definition of curl in 3D space.

#definition(title: [Definition of curl])[
  Suppose
  $ bf(F)(x,y,z) = vec(p(x,y,z),q(x,y,z),r(x,y,z)) $
  is a 3D vector field.
  Then the *curl* of $bf(F)$ is the vector field defined by
  $ op("curl") bf(F) := nabla times bf(F)
    := vec(
      (partial r)/(partial y) - (partial q)/(partial z),
      (partial p)/(partial z) - (partial r)/(partial x),
      (partial p)/(partial x) - (partial q)/(partial y) ). $
]

#typesig[
  The curl takes in only a 3D vector field.
  The curl at each point is a 3D vector (i.e. is a 3D vector field).
]

#tip(title: [Tip: How to memorize curl])[
  In practice, everyone remembers this formula using the following mnemonic:
  $ nabla times bf(F) = det mat(bf(e)_1, bf(e)_2, bf(e)_3;
    (partial)/(partial x), (partial)/(partial y), (partial)/(partial z);
    p, q, r). $
  This equation does not pass type-safety, because it's a "matrix" whose entries
  are some combination of functions, vectors, and partial derivative operators,
  so it absolutely does not make sense.
  Nonetheless, if you ignore all the type safety warnings
  and try to "expand" this expression,
  you will find that it basically gives you the formula for curl above. (Try it.)

  This is why $nabla times bf(F)$ is the notation chosen.
  You could almost imagine
  $ nabla = vec((partial)/(partial x), (partial)/(partial y), (partial)/(partial z)) $
  in which case the determinant above is the old mnemonic for the cross product.
  Again, this makes absolutely zero sense math-wise.
  It's only a convenient way to remember the formula,
  but it works really well because you only have to remember "$nabla times bf(F)$".
]

#sample[
  Compute the curl of the vector field
  $ bf(F) (x , y , z) = vec(x y, y z, z x). $
]
#soln[
  Let $p(x,y,z) = x y$, $q(x,y,z) = y z$, $r(x,y,z) = z x$.
  We can compute the first component of the curl by calculating
  $ (partial r) / (partial y) &= (partial) / (partial y) (z x) = 0 \
    (partial q) / (partial z) &= (partial) / (partial z) (y z) = y. $
  Hence:
  $ (partial r) / (partial y) - (partial q) / (partial z) = (0 - y) = - y $
  is the first component of the curl.

  The second and third components are done in the same way.
  The second component is
  $ ((partial p) / (partial z) - (partial r) / (partial x)) = (0 - z) = - z $
  and the third component is
  $ ((partial q) / (partial x) - (partial p) / (partial y)) = (0 - x) = - x. $
  Hence
  $ nabla times bf(F) = vec(-y, -z, -x). #qedhere $
]

Now let's talk about aquatic intuition.
Suppose as we do for most of our examples
that our vector field $bf(F)$ represents the flow of water in an ocean or other body of water.
We think of the curl as capturing the local rotation
or swirling motion of the water at each point.

Here’s how you can imagine curl:

1. #strong[Place a small paddle wheel] (or imagine a small object that
  can rotate, like a stick with flags at each end) in the water at a point
  where you want to measure the curl.

2. #strong[Observe how the wheel rotates] due to the flow of water. If
  the water is flowing uniformly in a straight line, the wheel will not
  rotate. In this case, the curl at that point is zero because there’s no
  local rotation in the flow.

3. #strong[If the wheel spins];, this indicates that there is local
  rotational motion in the water.
  The curl at the point is a 3D vector, so there are two pieces of information:A

  - The #strong[direction] in which the
    wheel spins corresponds as follows to the direction of the curl.
    The #strong[axis of rotation] of the wheel will point in the direction
    of the curl vector at that point.
    For example, if the water causes the wheel to rotate
    counterclockwise when viewed from above, the curl vector points upward.
    If the wheel rotates clockwise, the curl vector points downward.

  - The #strong[magnitude] of the curl is related to how fast the wheel
    spins. A faster rotation means a stronger curl, indicating more intense
    local rotational motion in the flow of water.

Example of high and low curl:

- In a region where water is circulating in a whirlpool-like pattern,
  the curl is high because the water is rapidly rotating around a
  central point.

- In a calm, straight-moving current, the curl is low or zero because
  the water doesn't exhibit any significant rotation.

In short, the curl of a vector field $bf(F)$ in our context of water flow
measures the tendency of the water to rotate around each point,
rather than simply move in a straight line.
Visualizing it with a paddle wheel helps convey the idea of local
rotational motion, with the curl vector indicating the direction and
strength of that rotation.

Now, I promised you earlier that any two red arrows put together give $0$.
So now we prove the following.
#memo(title: [Memorize: Curl of conservative field is zero])[
  Let $f : RR^3 -> RR$ be a function (aka scalar field),
  and let $nabla f$ be the corresponding conservative vector field.
  Then (assuming $nabla f$ is continuously differentiable), the curl of $nabla f$ is zero,
  i.e.
  $ op("curl")(nabla f) = nabla times (nabla f) = bf(0). $
]
#figure(
  box(image("figures/gcd-cut-gc.png", width: auto), stroke: 1pt),
  caption: [Cut-out of two red arrows from the poster @fig-int-chart-stokes that chain to give zero.],
)


You can actually verify this theorem pretty easily by definition:
#proof[
  Since
  $ nabla f = vec( (partial f)/(partial x), (partial f)/(partial y), (partial f)/(partial z)) $
  we get
  $ op("curl")(nabla f) = vec(
      f_(z y) - f_(y z),
      f_(x z) - f_(z x),
      f_(y x) - f_(x y)) = vec(0,0,0) $
  because we saw in @sec-when-antigrad that $f_(z y) = f_(y z) = 0$, etc.
]

However, it's more important to have a visual understanding of why this is true.
Remember, in the context of water flow, the fact that the
curl of the gradient is zero means that if the flow is purely driven by a gradient
(such as water moving due to pressure differences or height differences),
there will be no rotational movement in the water.
For example, if you have a waterfall,
the water will flow directly downhill or uphill, without any swirling or spinning motion.

Here's an example showing this:
#sample[
  Compute the curl of the vector field
  $ bf(F)(x,y,z) = vec(y^2-sin(x), 2 x y + 4 y z, e^z+2y^2). $
]
Secretly, we happen to know the right-hand side
is the gradient of the function $f(x,y,z) = y^2 x + cos x + 2y^2 z + e^z + C$;
this was the last example in @sec-antideriv.
So with this insider information we expect the answer should come out to $bf(0)$.
Indeed, it does:
#soln[
  Let $p(x,y,z) = y^2-sin(x)$, $q(x,y,z) = 2 x y + 4 y z$, $r(x,y,z) = e^z+2y^2$.
  First compute $(partial r) / (partial y)$ and $(partial q) / (partial z)$:
  $ (partial r) / (partial y) &= (partial) / (partial y) (e^z + 2 y^2) = 4 y $
  $ (partial q) / (partial z) &= (partial) / (partial z) (2 x y + 4 y z) = 4 y. $
  Compute the first component:
  $ ((partial r) / (partial y) - (partial q) / (partial z)) = 4 y - 4 y = 0. $

  For the second component, compute $(partial p) / (partial z)$ and $(partial r) / (partial x)$:
  $ (partial p) / (partial z) &= (partial) / (partial z) (y^2 - sin x) = 0 \
    (partial r) / (partial x) &= (partial) / (partial x) (e^z + 2 y^2) = 0. $
  Hence
  $ ((partial p) / (partial z) - (partial r) / (partial x)) = 0 - 0 = 0. $

  Finally, compute $(partial q) / (partial x)$ and $(partial p) / (partial y)$:
  $ (partial q) / (partial x) &= (partial) / (partial x) (2 x y + 4 y z) = 2 y \
    (partial p) / (partial y) &= (partial) / (partial y) (y^2 - sin x) = 2 y. $
  Compute the third component:
  $ ((partial q) / (partial x) - (partial p) / (partial y)) = 2 y - 2 y = 0. $

  So the curl of the vector field $bf(F) (x , y , z)$ is $vec(0,0,0) = bf(0)$.
]
Hence this is an example of a _conservative_ vector field, which we'll talk more about later.

== [TEXT] Divergence

#definition(title: [Definition of divergence])[
  Suppose
  $ bf(F)(x,y,z) = vec(p(x,y,z),q(x,y,z),r(x,y,z)) $
  is a 3D vector field.
  Then the *divergence* of $bf(F)$ is the scalar field defined by
  $ op("div")(bf(F)) := nabla dot bf(F) := (partial p)/(partial x) + (partial q)/(partial y) + (partial r)/(partial z). $
]

#typesig[
  Divergence takes vector fields as input.
  The divergence at each point is a _number_ (i.e. is a scalar field).
]


#tip(title: [Tip: How to memorize divergence])[
  The notation $nabla dot bf(F)$ is supposed to also be a mnemonic.
  If you continue the analogy where
  $ nabla = vec((partial)/(partial x), (partial)/(partial y), (partial)/(partial z)) $
  then $nabla dot bf(F)$ looks like a dot product that does the right thing.
  Again, only for memory; this is totally nonsense math-wise.
]

#sample[
  Compute the divergence of the vector field
  $ bf(F) (x , y , z) = vec(x y, y z, z x). $
]
#soln[
  Let $p(x,y,z) = x y$, $q(x,y,z) = y z$, $r(x,y,z) = z x$.
  Then
  $ (partial p) / (partial x) &= (partial) / (partial x) (x y) = y \
    (partial q) / (partial y) &= (partial) / (partial y) (y z) = z \
    (partial r) / (partial z) &= (partial) / (partial z) (z x) = x. $
  Sum the partials to get the divergence:
  $ nabla dot bf(F) & = (partial F_1) / (partial x) + (partial F_2) / (partial y) + (partial F_3) / (partial z)\
    & = y + z + x = x + y + z. #qedhere $
]

Now let's talk about aquatics.
Again suppose $bf(F)$ represents the flow of
water in an ocean or another body of water.
To visualize the divergence of a vector field $bf(F)$,
think of the divergence as measuring how much the water is #strong[spreading out] or
#strong[converging] at each point.

Here’s how you can imagine it:

1. #strong[Place a small marker] (such as a floating object) at a point
  in the water flow. The goal is to observe how the flow of water behaves
  around that point.

2. #strong[If the water appears to be flowing outward];, as if water is
  being emitted from that point, the divergence is #strong[positive] at
  that location. This suggests that more water is moving away from the
  point than toward it, indicating a local source of water.

3. #strong[If the water appears to be flowing inward];, as if the water
  is being sucked into that point, the divergence is #strong[negative];.
  This suggests that water is converging at the point, indicating a local
  sink or depletion of water.

4. #strong[If there is no noticeable net flow inward or outward] (the
  water moves but does not spread out or converge), the divergence is
  zero. This indicates that there is no net change in how much water is
  entering or leaving that point.

Example of high and low divergence:

- In a region where water is being pumped outward from a source, the
  divergence is high and positive, indicating that the water is
  spreading out from that point.

- In a region where water is being drawn into a drain, the divergence is
  negative, indicating that the water is converging toward that point.

- In a region where the water is flowing uniformly with no sources or
  sinks, the divergence is zero because there is no net flow into or out
  of any point.

In summary, the divergence of a vector field $bf(F)$
in the context of water flow measures the rate at which water is spreading out
(positive divergence) or converging (negative divergence) at each point.
If there is neither spreading nor converging, the divergence is zero.

#digression(title: [Digression on divergence of curl])[
  I told you any two red arrows give you zero in the poster @fig-int-chart-stokes.
  So there is technically a theorem that says the divergence of a curl is 0: that is,
  $ op("div")(op("curl")(bf(F))) = nabla dot (nabla times bf(F)) = 0 $
  assuming $bf(F)$ has continuous second partial derivatives.
  However, I don't think we ever use this in 18.02.
  The problem is that our description of divergence assumes that our vector field
  is thought of like a water current,
  but $op("curl")(bf(F))$ is a vector field that describes how fast something rotates,
  and those arrows are emphatically _not_ a water current (or anything resembling one).
]

== [TEXT] 2D scalar curl

The 2D scalar curl is a little more unnatural.
The physical interpretation is the same,
but if you have a 2D body of water, there's only two ways to rotate:
either clockwise or counterclockwise.
(In contrast, if you put a paddle wheel into the ocean, there are _lots_ of ways it can rotate.)

So the 2D scalar curl, true to its name, only *outputs a number at each point*,
which you think of as an angular velocity of the spinning paddle wheel.
Unlike with the usual 3D curl it's no longer needed to specify an entire vector
so that you can talk about the direction of rotation.
Instead we take the convention that

- positive numbers mean counterclockwise spin,
- negative numbers mean clockwise spin.

#definition(title: [Definition of 2D scalar curl])[
  Suppose
  $ bf(F)(x,y) = vec(p(x,y),q(x,y)) $
  is a 2D vector field.
  Then the *2D scalar curl* of $bf(F)$ is the scalar field defined by
  $ op("curl") bf(F) := (partial q) / (partial x) - (partial p) / (partial y). $
]

#tip(title: [Tip: 2D scalar curl is a special case of 3D scalar curl])[
  The mnemonic $nabla times bf(F)$ actually still works if you just pretend $bf(F)$
  is a 3D vector field where the $z$-coordinate is always zero.
  That is, given $bf(F) = vec(p(x,y), q(x,y))$, consider the mnemonic
  $ nabla times vec(p(x,y), q(x,y), 0). $
  If you follow through, you will find you get
  $ det mat(bf(e)_1, bf(e)_2, bf(e)_3;
      partial / (partial x), partial / (partial y), partial / (partial z);
      p(x,y), q(x,y), 0). $
  All the terms involving $partial / (partial z)$ disappear, because there's no $z$ anywhere.
  So only the terms in front of $bf(e)_3$ survive, and you get
  $ det mat(partial / (partial x), partial / (partial y); p(x,y), q(x,y)) bf(e)_3
      = ((partial q) / (partial x) - (partial p) / (partial y)) bf(e)_3. $
  And there's the 2D scalar curl, the coefficient of $bf(e)_3$.
]

#sample[
  Compute the 2D scalar curl of
  $ bf(F)(x,y) = vec(x cos y , e^x + sin y). $
]
#soln[
  The 2D scalar curl is given by
  $ op("curl") F = (partial q) / (partial x) - (partial p) / (partial y). $
  Given $q(x,y) = e^x + sin y$, we have
  $ (partial q) / (partial x) = (partial) / (partial x) (e^x + sin y) = e^x + 0 = e^x. $
  Given $p(x,y) = x cos y$ we have
  $ (partial p) / (partial y) = (partial) / (partial y) (x cos y) = x (- sin y) = - x sin y. $
  Hence
  $ op("curl") bf(F)(x,y) = e^x + x sin y. $
]
It's still true (and indeed follows from the 3D version) that:
#memo[
  The curl of a conservative 2D vector field is zero.
]
#figure(
  box(image("figures/gcd-cut-gc2.png", width: auto), stroke: 1pt),
  caption: [These two red arrows from the poster @fig-int-chart-stokes also chain to give zero.],
)

Let's see an example of that.
#sample[
  Compute the 2D scalar curl of
  $ bf(F) (x , y) = vec(3 x^2 + 4 x y + y^2 , 2 x^2 + 2 x y - 3 y^2) $
]
Secretly, we happen to know the right-hand side
is the gradient of the function $f(x,y) = x^3 + 2x^2 y+x y^2-y^3$,
because we did this example @sec-antideriv.
So the 2D scalar curl should be $0$, and indeed it is.
#soln[
  Given $q(x,y) = 2 x^2 + 2 x y - 3 y^2$:
  $ (partial q) / (partial x) & = (partial) / (partial x) (2 x^2 + 2 x y - 3 y^2)\
    & = 4 x + 2 y $
  Given $p(x,y) = 3 x^2 + 4 x y + y^2$:
  $ (partial p) / (partial y) & = (partial) / (partial y) (3 x^2 + 4 x y + y^2)\
    & = 4 x + 2 y. $
  Hence
  $ op("curl") bf(F)(x,y) & = (partial q) / (partial x) - (partial p) / (partial y)\
     & = (4 x + 2 y) - (4 x + 2 y) = 0. #qedhere $
]

== [TEXT] 2D divergence

This is _not_ a red arrow in the picture.
But it comes up in one version of Green's theorem, and it's actually exactly the same as 3D.
So I'll just mention it briefly.

#definition(title: [Definition of divergence])[
  Suppose
  $ bf(F)(x,y) = vec(p(x,y),q(x,y)) $
  is a 2D vector field.
  Then the *divergence* of $bf(F)$ is the scalar field defined by
  $ op("div") bf(F) := nabla dot bf(F) := (partial p)/(partial x) + (partial q)/(partial y). $
]

The aquatic interpretation is the same too, just in 2D bodies of water.

#sample[
  Compute the divergence of
  $ bf(F) (x , y) = vec(x cos y , med e^x + sin y) $
]
#soln[
  In two dimensions, the divergence is given by
  $ nabla dot bf(F) = (partial p) / (partial x) + (partial q) / (partial y). $
  Given $p(x,y) = x cos y$:
  $ (partial p) / (partial x) = (partial) / (partial x) (x cos y) = cos y. $
  Given $q(x,y) = e^x + sin y$:
  $ (partial q) / (partial y) = (partial) / (partial y) (e^x + sin y) = cos y. $
  Hence
  $ nabla dot bf(F)(x,y) & = (partial p) / (partial x) + (partial q) / (partial y)\
     & = cos y + cos y= 2 cos y. #qedhere $
   ]

#sample[
  Compute the divergence of
  $ bf(F) (x , y) = vec(3 x^2 + 4 x y + y^2 , med 2 x^2 + 2 x y - 3 y^2) $
]
#soln[
  Given $p(x,y) = 3 x^2 + 4 x y + y^2$:
  $ (partial p) / (partial x) = (partial) / (partial x) (3 x^2 + 4 x y + y^2) = 6 x + 4 y $
  Given $q(x,y) = 2 x^2 + 2 x y - 3 y^2$:
  $ (partial q) / (partial y) = (partial) / (partial y) (2 x^2 + 2 x y - 3 y^2) = 2 x - 6 y. $
  Hence
  $ nabla dot bf(F)(x,y) & = (partial p) / (partial x) + (partial q) / (partial y)\
    &= (6 x + 4 y) + (2 x - 6 y)  = 8 x - 2 y. #qedhere $
]

== [EXER] Exercises

#todo[...]
