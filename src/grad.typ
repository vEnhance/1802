#import "@local/evan:1.0.0":*

= Level curves (aka contour plots)

== [TEXT] Level curves replace $x y$-graphs

In high school and 18.01, you were usually taught to plot single-variable functions
in two dimensions, so $f(x) = x^2$ would be drawn as a parabola $y = x^2$, and so on.
You may have drilled into your head that $x$ is an input and $y$ is an output.

However, for 18.02 we'll typically want to draw pictures of functions
like $f(x,y) = x^2+y^2$ in a different way#footnote[
  This is a lot like how we drew planes in a symmetric form earlier.
  In high school algebra, you drew 2D graphs of one-variable functions
  like $y = 2 x + 5$ or $y = x^2 + 7$.
  So it might have seemed a bit weird to you that we wrote
  planes instead like $2 x + 5 y + 3 z = 7$ rather than, say, $z = (7 - 2 x - 5 y) / 3$.
  But this form turned out to be better, because it let us easily access the normal vector
  (which here is $angle.l 2, 5, 3 angle.r$).
  The analogy carries over here.
], using what's known as a _level curve_.

#definition[
  For any number $c$ and function $f : RR^n -> RR$,
  the level curve for the value $c$ is the plot of points for which $f(x_1, ..., x_n) = c$.
]

Then the idea is that given a function in two variables,
we represent it as a bunch of level curves in $RR^2$.
The contrast to what you're used to is that:

- In high school and 18.01, the variables $x$ and $y$ play different roles,
  with $x$ representing the input and $y$ representing output.
- In 18.02, when we draw a function $f : RR^n -> RR$ via level curves,
  _all_ the $n$ variables are inputs; we treat them all with equal respect.
  Meanwhile, the _output_ of the function does _not_ have a variable name in the graph.

We give some examples.
In order to make them easy to draw, all the examples here are two variables.
But if you had a three-variable function,
you would instead have surfaces in $RR^3$, etc.

=== Example: the level curves of $f(x,y) = y - x^2$

=== Example: the level curves of $f(x,y) = x - y^2$

=== Example: the level curves of $f(x,y) = x^2+y^2$

=== Example: the level curves of $f(x,y) = |x| + |y|$

== [RECIPE] Drawing level curves

Despite the fact this section is labeled "recipe", there isn't an
easy method that works for every function.
You have to do it in an ad-hoc way depending on the exact function you're given.
For many functions, it'll be pretty easy.

To summarize the procedure,
given an explicit function like $f(x,y)$ and the value of $c$,
one tries to plot all the points $(x,y)$ in space with $f(x,y) = c$.
We gave three examples right above, where:

- The level curves of $f(x,y) = y-x^2$ were easy to plot because
  for any given $c$, the equation just became an $x y$-plot like in 18.01.
- The level curves of $f(x,y) = x-y^2$ were similar to the previous example,
  but the roles of $x$ and $y$ were flipped.
- To draw the level curves of $f(x,y) = x^2+y^2$,
  you needed to know that $x^2 + y^2 = r^2$ represents a circle of radius $r$
  centered at $(0,0)$.
- To draw the level curves of $f(x,y) = |x| + |y|$,
  we had to think about it an ad-hoc manner where we worked in each quadrant;
  in Quadrant I we figured out that we got a line,
  and then we applied the same image to the other quadrants
  to get diamond shapes.

So you can see it really depends on the exact $f$ you are given.
If you wrote a really nasty function like $f(x,y) = e^(sin x y) + cos(x + y)$,
there's probably no easy way to draw the level curve by hand.

= Partial derivatives

== [TEXT] Partial derivatives

These are easy to compute, but you might not know yet why we care about them.
We'll postpone that explanation to next section and just define the notation
and give you the recipe now; then when we introduce the gradient,
you'll see where the partial derivative comes in.

== [RECIPE] Computing partial derivatives

= The gradient

== [TEXT] The point of differentiation is to approximate nearby values with linear ones

== [RECIPE] Calculating the gradient
== [RECIPE] Linear approximation

== [TEXT] Gradient descent, tangent lines/planes/etc., and directional derivatives

== [RECIPE] Directional derivatives

== [RECIPE] Computing tangent lines/planes to level curves/surfaces

== [RECAP] A recap of multivariable differentiation

Let's summarize the last few sections.
