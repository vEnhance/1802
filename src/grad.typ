#import "@local/evan:1.0.0":*

= The gradient <ch-grad>

The gradient of $f : RR^n -> RR$, denoted $nabla f$,
is the single most important concept in the entire "Multivariable differentiation" part.
Although its definition is actually quite easy to compute,
I want to give a proper explanation for where it comes from.

Throughout this chapter, remember two important ideas:

- The goal of the derivative is to approximate a function by a linear one.
- Everything you used slopes for before, you should use normal vectors instead.

If you want spoilers for what's to come, see the following table.

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Thing], [18.01], [18.02]),
    [Input], [$f: RR -> RR$], [$f: RR^n -> RR$],
    [Output], [$f': RR -> RR$], [$nabla f: RR^n -> RR^n$],
    [Think of as], [Slope (rise/run)], [Measures change in _each_ of $n$ directions],
    [Approximation], [Multiply by small run], [Dot product with small displacement],
    [Picture], [Slope of tangent in $x y$-graph], [Normal vector to tangent of level curve]
  ),
  kind: table,
  caption: [How to think of $nabla f$ for multivariable functions,
    compared to the derivative in 18.01.]
)

== [TEXT] The gradient rewrites linear approximation into a dot product <text-gradient>

In 18.01, when $f : RR -> RR$ was a function and $p in RR$ was an input,
we thought of the single number $f'(p)$ as the slope to interpret it geometrically.
Now that we're in 18.02, we have $n$ different rates of change,
but we haven't talked about how to think of it geometrically yet.

It turns out the correct definition is to take the $n$ numbers and make them into a vector.
Bear with me for just one second:

#definition[
  If $f(x,y)$ is a two-variable function (so $f : RR^2 -> RR$),
  the *gradient* of $f$, denoted $nabla f$, is the function $RR^2 -> RR^2$ obtained by
  taking the two partial derivatives as the coordinates:

  $ nabla f(x,y) = vec(f_x (x,y), f_y (x,y)). $

  The case of $n$ variables is analogous;
  for example if $f(x,y,z)$ is a three-variable function, then
  $ nabla f(x,y,z) = vec(f_x (x,y,z), f_y (x,y,z), f_z (x,y,z)). $
]

#typesig[
  The types are confusing here. To continue harping on type safety:

  - Suppose $f : RR^2 -> RR$ accepts *points* in $RR^2$ and outputs *scalars* in $RR$.
  - Then $nabla f : RR^2 -> RR^2$ accepts *points* in $RR^2$ and outputs *vectors* in $RR^2$.

  Keep the distinction between points and vectors in mind when drawing pictures.
  We'll always draw points as dots, and vectors as arrows.
]

The reason for defining this gradient is that it lets us do
linear approximation with a *dot product*,
and consequently dot products are going to be super important throughout this chapter.
Let me show you how.
Let's go back to our protagonist
$ f(x,y) = x^2+y^2 $
at the point $P = (3,4)$.
Way back in @example-circle-3-4 (on #pageref(<example-circle-3-4>)),
we computed $f_x (P) = 2 dot 3 = 6$ and $f_y (P) = 2 dot 4 = 8$
and used it to get the approximation
$
  f(P + angle.l epsilon_x, epsilon_y angle.r)
  &= f(angle.l 3,4 angle.r + angle.l epsilon_x, epsilon_y angle.r) \
  &= (3 + epsilon_x)^2 + (4 + epsilon_y)^2 approx 25 + 6 epsilon_x + 8 epsilon_y. $

Now the idea that will let us do geometry is to replace the pair of numbers
$epsilon_x$ and $epsilon_y$ with a single "small displacement" vector
$bf(v) = vec(epsilon_x, epsilon_y)$,
and the pair of numbers $6$ and $8$
with the vector $vec(6,8)$ instead,
so that *the approximation part just becomes a dot product*:
$ f(vec(3,4) + bf(v)) approx f(vec(3,4)) + vec(6,8) dot bf(v). $

#warning(title: [Warning: the directional derivative sucks])[
  In some places you see the abbreviation
  $D_bf(v) f (P) := nabla f (P) dot bf(v)$
  and the name "directional derivative" for it.
  I hate this term, because some people have different notations and definitions
  (according to Wikipedia, some authors require $bf(v)$ to be a unit vector, etc.).

  So I will always just write the dot product $nabla f (P) dot bf(v)$ instead,
  which is unambiguous and means you have one less symbol to remember.
  The gradient does everything directional derivative can do, and does it better.
]

In full abstraction, we can rewrite linear approximation as:
#memo(title: [Memorize: Linear approximation])[
  Suppose $f$ is differentiable at a point $P$.
  Then for small displacement vectors $bf(v)$,
  *linear approximation* promises that
  $ f(P + bf(v)) approx f(P) + nabla f(P) dot bf(v). $
  In other words the net change from $f(P)$ to $f(P + bf(v))$
  is approximated by the dot product $nabla f(P) dot bf(v)$.
]
Up until now, all we've done is rewrite the earlier equation with a different notation;
so far, nothing new has been introduced.
Why did we do all this work to use different symbols to say the same thing?

The important idea is what I told you a long time ago:
*anything you used to think of in terms of slopes, you should rethink in terms of normal vectors*.
It turns out that to complete the analogy to differentiation,
the normal vector is going to be that gradient $nabla f(P)$,
and we'll see why in just a moment (spoiler: it's because of the dot product).
For now, you should just know that $nabla f(P)$ is _going to be_ the right way to draw pictures
of all $n$ rates of change at once, although I haven't explained why yet.

Before going on, let's write down the recipes and some examples
just to make sure the _definition_ of the gradient makes sense,
then I'll explain why the gradient is the normal vector we need to complete our analogy.

== [RECIPE] Calculating the gradient

#recipe(title: [Recipe for calculating the gradient])[
  1. Compute every partial derivative of the given function.
  2. Output the vector whose components are those partial derivatives.
]

#sample[
  Consider the six functions
  $
  f_1(x,y) = x^3 y^2 + cos(y), &#h(2em) f_2(x,y,z) = e^(x y z)  \
  f_3(x,y) = x^2 + y^2, &#h(2em) f_4(x,y,z) = x+y+z \
  f_5(x,y,z) = x y + y z + z x  &#h(2em) f_6(x,y) = x^y
  $
  from back in @text-compute-partial and @recipe-compute-partial.
  Compute their gradients.
]

#soln[
  Take the partial derivatives we already computed and make them the components:
  $
  nabla f_1 (x,y) = vec(3x^2 y^2, 2 x^3 y - sin(y)), &#h(2em)
  nabla f_2 (x,y) = vec( y z e^(x y z), x z e^(x y z), x y e^(x y z) ), \
  nabla f_3 (x,y) = vec(2 x, 2 y), &#h(2em)
  nabla f_4 (x,y,z) = vec(1,1,1), \
  nabla f_5 (x,y,z) = vec(y+z, x+z, x+y), &#h(2em)
  nabla f_6 (x,y) = vec(y x^(y-1), log(y) dot x^y). #qedhere
  $
  (Remember $log$ is the natural log, not base $10$.)
]

== [RECIPE] Linear approximation

We actually could have stated an equivalent recipe right after we
defined partial derivatives,
but conceptually I think it's better to think of everything in terms of the gradient,
so I waited until after I had defined the gradient to write the recipe.

#recipe(title: [Recipe for linear approximation])[
  To do linear approximation of $f(P + bf(v))$ for a small displacement vector $bf(v)$:

  1. Compute $nabla f (P)$, the gradient of $f$ at the point $P$.
  2. Take the dot product $nabla f(P) dot bf(v)$ to get a number, the approximate change.
  3. Output $f(P)$ plus the change from the previous step.
]

#sample[
  Let $f(x, y) = x^2 + y^2$.
  Approximate the value of $f(3.01, 4.01)$ by using linear approximation from $(3,4)$.
]
#soln[
  Compute the gradient by taking both partial derivatives:
  $ nabla f(x, y) = vec(2x, 2y). $
  So the gradient vector at the starting point is given by
  $ nabla f(3, 4) = vec(2 dot 3, 2 dot 4) = vec(6, 8). $
  The target point $(3.01, 4.01)$ differs from the starting point $(3,4)$
  by the displacement $bf(v) = (0.01, 0.01)$.
  So the approximate change in $f$ is given by
  $ underbrace(vec(6,8), = nabla f(3,4)) dot underbrace(vec(0.01, 0.01), =bf(v))
    = (6 dot 0.01 + 8 dot 0.01) = 0.14. $
  Therefore,
  $ f(3.01, 4.01) approx underbrace(f(3,4), = 25) + 0.14 = 25.14. #qedhere $
]


#sample[
  Let $f(x, y) = x^3 - y^3$.
  Approximate the value of $f(2.01, -1.01)$ by using linear approximation from $(2,-1)$.
]
#soln[
  Compute the gradient by taking both partial derivatives:
  $ nabla f(x, y) = vec(3x^2, -3y^2). $
  So the gradient vector at the starting point $(2,-1)$ is given by
  $ nabla f(2, -1) = vec(3(2)^2, -3(-1)^2) = vec(12, -3). $
  The target point $(2.01, -1.01)$ differs from the starting point $(2,-1)$
  by the displacement $bf(v) = (0.01, -0.01)$.
  So the approximate change in $f$ is given by
  $ underbrace(vec(12,-3), = nabla f(2,-1)) dot underbrace(vec(0.01, -0.01), =bf(v))
    = (12 dot 0.01 + (-3) dot (-0.01)) = 0.15. $
  Therefore,
  $ f(2.01, -1.01) approx underbrace(f(2,-1), = 9) + 0.15 = #boxed[$ 9.15 $]. #qedhere $
]

#sample[
  Let $f(x, y) = e^x sin(y) + 777$.
  Approximate the value of $f(0.04, 0.03)$ by using linear approximation from the point $(0,0)$.
]
#soln[
  Compute the gradient by taking both partial derivatives:
  $ nabla f(x,y) = vec(e^x sin y, e^x cos y). $
  So the gradient vector at the starting point $(0,0)$ is given by
  $ nabla f(0,0) = vec(e^0 sin 0, e^0 cos 0) = vec(0,1). $
  The target point $(0.04, 0.03)$ differs from the starting point $(0,0)$ by $(0.04, 0.03)$.
  So the approximate change in $f$ is given by
  $ underbrace(vec(0,1), = nabla f(0,0)) dot underbrace(vec(0.04, 0.03), =bf(v))
    = 0 dot 0.04 + 1 dot 0.03 = 0.03. $
  Therefore,
  $ f(0.04, 0.03) approx underbrace(f(0,0), =777) + 0.03 = #boxed[$ 777.03 $]. #qedhere $
]

== [TEXT] Gradient descent

At the end of @text-gradient, we promised the geometric definition of the dot product
would pay dividends. We now make good on that promise.

The motivating question here is:
#question[
  Let $f(x,y) = x^2 + y^2$.
  Imagine we're standing at the point $P = (3,4)$.
  We'd like to take a step $0.01$ away in some direction of our choice.
  For example, we could go to $(2.99, 4)$, or $(3, 4.01)$ or $(2.992, 4.006)$,
  or any other point on the circle we've marked in the figure below.
  (For the third point, note that $sqrt((3-2.992)^2-(4-4.006)^2) = 0.01$,
  so that point is indeed $0.01$ away.)

  - Which way should we step if we want to maximize the $f$-value at the new point?
  - Which way should we step if we want to the $f$-value to stay about the same?
  - Which way should we step if we want to minimize the $f$-value at the new point?
]

You can see a cartoon of the situation in @fig-grad-descent.
Note that this figure is not to scale, because $0.01$ is too small to be legibly drawn,
so the black circle is drawn much larger than it actually is.

#figure(
  image("figures/grad-gdescent.svg", width: auto),
  caption: [Starting from $P = (3,4)$, we make a step $bf(v)$ away, where $|bf(v)|=0.01$.
    Not to scale.],
) <fig-grad-descent>

To answer the question, we use the geometric interpretation of the dot product now.
Remember that the change in $f$ is approximated by
$ f(P + bf(v)) - f(P) approx nabla f (P) dot bf(v). $
The geometric definition of the dot product is that it equals
$ nabla f (P) dot bf(v) = |nabla f(P)| |bf(v)| cos theta $
where $theta$ is the included angle.
But $|nabla f(P)|$ is fixed (in this example, it's $sqrt(6^2+8^2)=10$)
and $|bf(v)|$ is fixed as well (in this example we chose it to be the small number $0.01$).

So actually all we care about is the angle $theta$! Think about that for a moment.
Then remember how the cosine function works:

- $cos(0 degree) = 1$ is the most positive value of the cosine,
  and that occurs when $bf(v)$ and $nabla f(P)$ point the same direction.
- $cos(180 degree) = -1$ is the most negative value of the cosine,
  and that occurs when $bf(v)$ and $nabla f(P)$ point opposite directions.
- If $nabla f (P)$ and $bf(v)$ are perpendicular
  (so $theta = 90 degree$ or $theta = 270 degree$), then the dot product is zero.

Translation:

#memo[
  - Move *along* the gradient to increase $f$ as quickly as possible.
  - Move *against* the gradient to decrease $f$ as quickly as possible.
  - Move *perpendicular to* the gradient to avoid changing $f$ by much either direction.
]

== [TEXT] Normal vectors to the tangent line/plane

We only need to add one more idea:
_keeping $f$ about the same should correspond to moving along the tangent line or plane_.

Indeed, in the 2D case, the tangent line is the line that "hugs" the level curve the closest,
so we think of it as the direction causing $f$ to avoid much change.
The same is true for a tangent plane to a level surface in the 3D case;
the plane hugs the curve near the point $P$.
So that means the last bullet could be rewritten as

#memo[
  The gradient $nabla f (P)$ is normal to the tangent line/plane at $P$.
  It points towards the direction that increases $f$.
]
#example[
  In the previous example with a level curve, the gradient pointed away from the interior.
  This is not true in general.
  For example, imagine instead the function
  $ f(x,y) = 1 / (x^2 + y^2). $
  The point $(3,4)$ lies on the level curve of $f(3,4) = 1/25$.
  The level curve of $f(x,y)$ with value $1/25$ is _also_ a circle of radius $5$,
  because it corresponds to the equation $1/(x^2+y^2) = 1/25$.

  However, the gradient looks quite different: with enough calculation one gets
  $ nabla f(x,y) = vec((-2x) / ((x^2+y^2)^2), (-2y) / ((x^2+y^2)^2)). $
  Evaluating at $(3,4)$, we get
  $ nabla f(3,4) = vec(-6/625, -8/625). $
  Hence, for the function $f(x,y) = 1/(x^2+y^2)$,
  drawing the figure analogous to @fig-grad-descent gives something that looks quite similar,
  except the green arrow points the _other_ way and is way smaller.
  This makes sense: as you move _towards_ the origin, you expect $1/(x^2+y^2)$ to get larger.
  See @fig-grad-descent-2.
]

#figure(
  image("figures/grad-gdescent2.svg", width: auto),
  caption: [Similar picture but for $f(x,y) = 1/(x^2+y^2)$.
    It looks very similar to @fig-grad-descent, but now the gradient points the other way
    and has much smaller absolute value, indicating
    that the value of $f$ increases as we go _towards_ the center (but only slightly).
    Not to scale.]
) <fig-grad-descent-2>

#remark[
  Back in the 3D geometry in the linear algebra part of the course,
  we usually neither knew nor cared what the sign and magnitude of the normal vector was.
  That is, when asked "what is a normal vector to the plane $x-y+2z=8$?",
  you could answer $vec(1,-1,2)$ or $vec(-1,1,-2)$ or even $vec(-100, 100, -200)$.
  But this doesn't apply to the gradient anymore:
  while it is a normal vector to the tangent line/plane,
  the magnitude carries additional information we shouldn't just throw away.
]

== [RECIPE] Computing tangent lines/planes to level curves/surfaces

At this point, we can compute tangent lines and planes easily.
We apply the old recipe in @recipe-plane-known-dir
(finding a plane given a point with a known normal vector)
with $nabla f (P)$ as the normal vector.
To spell it out:

#recipe(title: [Recipe: Tangent line/plane to level curve/surface])[
  To find the tangent line/plane to a level curve/surface of a function $f$ at point $P$:

  1. Compute the gradient $nabla f$. This is a normal vector,
    so it tells you the left-hand side for the equation of the line/plane.
  2. Adjust the right-hand side so it passes through $P$, like in @recipe-plane-known-dir.
]

#sample[
  Compute the tangent line to $x^2 + y^2 = 25$ at the point $(3, 4)$.
]
#soln[
  Let $f(x,y) = x^2 + y^2$, so we are looking at the level curve for $25$ of $f$.
  We have seen already that
  $ nabla f = vec(2x, 2y) ==> nabla f(3,4) = vec(6, 8). $
  Hence, the tangent line should take the form
  $ 6x + 8y = d $
  for some $d$.
  To pass through $P = (3,4)$, we need $d = 6 dot 3 + 8 dot 4$, so the answer is
  $ #boxed[$ 6 x + 8 y = 50 $]. #qedhere $
]

#sample[
  Compute the tangent line to $y = x^2 + 5$ at the point $(3,14)$.
]
#soln[
  Isn't this an 18.01 question?
  Yes, but the level curves work fine here to.
  We think of this parabola as the level curve of $f(x,y) = y - x^2$ for the value $5$.
  The gradient is then
  $ nabla f = vec(-2x, 1) ==> nabla f(3,14) = (-6, 1). $
  Hence the tangent line should take the line $-6x+y=d$ for some $d$.
  We need to pass through $(3,14)$, so we take $d = (-6) dot 3 + 14 = -4$ to get the answer
  $ #boxed[$ -6 x + y = -4 $]. $
  (Written in 18.01 form this would be $y = 6 x - 4$, which shouldn't be a surprise,
  because we know the derivative of $x^2+5$ at $x=3$ is $6$.)
]

== [RECAP] A recap of Part Echo on Multivariable Differentation

Let's summarize the last few sections.

- We replaced the old graphs we used in 18.01 with level curve and level surface pictures
  in @ch-level.
  These new pictures differed from 18.01 pictures because all the variables on the axes
  are inputs now, and we treat them all with equal respect.
- We explained in @ch-partial how to take a partial derivative
  of $f(x,y)$ or $f(x,y,z)$, which measures the change in just one of the variables.
- We used these partial derivatives to define the gradient $nabla f$ in @ch-grad.
  This made linear approximation into a dot product,
  where $f(P + bf(v)) approx f(P) + nabla f(P) dot bf(v)$ for a small displacement $bf(v)$.
- Using the geometric interpretation of a dot product, $nabla f (P)$ was a normal vector
  to the level curve of $f$ passing through $P$, and:
  - Going along the gradient increases $f$ most rapidly
  - Going against the gradient decreases $f$ most rapidly
  - Going perpendicular to the gradient puts you along the tangent line or plane at $P$.

== [EXER] Exercises

#exer[
  Compute the equation of the tangent plane to the sphere $x^2 + y^2 + z^2 = 14$
  at the point $(1,2,3)$.
]

#exer[
  The level curve of a certain differentiable function $f(x,y)$ for the value $-7$
  turns out to be a circle of radius $2$ centered at $(0,0)$.

  - Give an example of one such function $f$.
  - What are all possible vectors that $nabla f(1.2, -1.6)$ could be?
  - Do linear approximation to estimate $f(1.208, -1.594)$ starting from the point $(1.2, -1.6)$.
]

#exer[
  For each part, either give an example of $f$ or show that none exist.

  - Can you find a function $f : RR^2 -> RR^2$ such that $nabla f (x,y) = angle.l x,y angle.r$?
  - Can you find a function $f : RR^2 -> RR^2$ such that $nabla f (x,y) = angle.l 100 x,y angle.r$?
  - Can you find a function $f : RR^2 -> RR^2$ such that $nabla f (x,y) = angle.l y,x angle.r$?
  - Can you find a function $f : RR^2 -> RR^2$ such that $nabla f (x,y) = angle.l 100 y,x angle.r$?
]

#exerstar[
  Let $a$, $b$, $c$, $d$ be nonzero real numbers and let $ f(x,y) = a e^(x+y) + b e^(x-y). $
  Suppose the level curve of $f$ for the value $c$ is tangent to the line $y = 5x$ at the origin,
  and also passes through $(0,d)$. Compute $d$.
] <exer-grad-abc>
