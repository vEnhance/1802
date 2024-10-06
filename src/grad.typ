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
  For any number $c$ and function $f(x,y)$
  the level curve for the value $c$ is the plot of points for which $f(x, y) = c$.
]

The contrast to what you're used to is that:

- In high school and 18.01, the variables $x$ and $y$ play different roles,
  with $x$ representing the input and $y = f(X)$ representing output.
- In 18.02, when we draw a function $f(x,y)$
  both $x$ and $y$ are inputs; we treat them all with equal respect.
  Meanwhile, the _output_ of the function does _not_ have a variable name in the graph.

We give some examples.

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

== [TEXT] Level surfaces are exactly the same thing, with three variables instead of two

Nothing above really depends on having exactly two variables.
If we had a three-variable function $f(x,y,z)$,
we could draw _level surfaces_ for a value of $c$
by plotting all the points in $RR^3$ for which $f(x,y,z) = c$.

#example[
  If $f(x,y,z) = x^2 + y^2 + z^2$,
  then the level surface for the value $c$ will be a sphere with radius $sqrt(c)$ if $c >= 0$.
  (When $c < 0$, the level surface is empty.)
]

#example[
  If $f(x,y,z) = x + 2 y + 3 z$,
  all the level surfaces of $f$ are planes with normal vectors $RR^3$
  which are parallel to each other.
]

#pagebreak()

= Partial derivatives

This is an easy section.
We will tell you what a partial derivative is and how to compute it,
which is pretty mechanical and is just following 18.01 recipes.

We won't explain until the next section where this definition comes from.
(Spoiler: it's because it's used in the definition of the gradient.)

== [TEXT] Partial derivatives

Here's the definition:

#definition[
  Suppose $f(x,y)$ is a two-variable function.
  Then the _partial derivative with respect to $x$_, which we denote either $f_x$
  or $(partial f) / (partial x)$,
  is the result if we differentiate $f$ while treating $x$ as a variable $y$ as a constant.
  The partial derivative $f_y = (partial f) / (partial y)$ is defined the same way.

  Similarly, if $f(x,y,z)$ is a three-variable function,
  we write $f_x = (partial f) / (partial x)$ for the derivative when $y$ and $z$ are fixed.
]

But that's a lot of words.
I think this is actually better explained by example.
In fact you could probably just read the examples and ignore the definition above.

#example[
  Let $f(x,y) = x^3 y^2 + cos(y)$.

  Let's compute $f_x$.
  Again, pretend $y$ is a constant, so look at the function
  $ x |-> y^2 dot x^3 + cos(y). $
  If we differentiate with respect to $x$, then $x^3$ becomes $3x^2$,
  and $cos(y)$ goes to $0$ (it doesn't have any $x$ stuff in it).
  So
  $ f_x = y^2 dot 3x^2. $

  Similarly, let's compute $f_y$.
  This time we pretend $x$ is a constant, and look at
  $ y |-> x^3 dot y^2 + cos(y). $
  This time $y^2$ becomes $2y$, and $cos(y)$ has derivative $-sin(y)$. So
  $ f_y = x^3 dot 2y - sin(y). $
]

#example[
  Let $f(x,y,z) = e^(x y z)$ for a three-variable example.
  To compute $f_x$, think of the function
  $ x |-> e^(y z dot x) $
  where we pretend $y$ and $z$ are constants.
  Then the derivative is with respect to $x$ is just $y z e^(y z dot x)$
  (just like how the derivative of $e^(3 x)$ is $3 e^x$). In other words,
  $ f_x = y z e^(x y z). $
  For analogous reasons:
  $
    f_y &= z x e^(x y z) \
    f_z &= x y e^(x y z).
  $
]

== [RECIPE] Computing partial derivatives

#recipe[Partial derivatives][
  To compute the partial derivative of a function $f(x,y)$ or $f(x,y,z)$
  or $f(x_1, ..., x_n)$ with respect to one of its input variables,

  1. Pretend all the other variables are constants,
    and focus on just the variable you're taking the partial derivative to.
  2. Calculate the derivative of $f$ with respect to just that variable like in 18.01.
  3. Output the derivative you got.
]

We just saw two examples where we computed the partials for $f(x,y) = x^3 y^2 + cos (y)$
and $f(x,y,z) = e^(x y z)$.

Here are a bunch more examples that you can try to follow along:

== [EXER] Exercises

#pagebreak()

= The gradient

The gradient is the single most important concept in the multivariable differentiation.
Although its definition is actually quite easy to compute,
I want to give a proper explanation for where this comes from.

Throughout this section, remember two important ideas:

- The goal of the derivative is to approximate a function by a linear one.
- Everything you used slopes for before, you should use normal vectors instead.

== [TEXT] The point of differentiation is to approximate nearby values with linear ones

== [RECIPE] Calculating the gradient
== [RECIPE] Linear approximation

== [TEXT] Gradients are normal vectors

== [RECIPE] Computing tangent lines/planes to level curves/surfaces

== [TEXT] Gradient descent, and directional derivatives
== [RECIPE] Directional derivatives


== [RECAP] A recap of multivariable differentiation

Let's summarize the last few sections.
