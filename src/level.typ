#import "@local/evan:1.0.0":*

= Level curves (aka contour plots) <sec-level-curve>

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
  Meanwhile, the _output_ of the function does _not_ have a variable name.
  If we really want to refer to it, we might sometimes write $f = 2$ as a shorthand
  for "the level curve for output $2$".

To repeat that in table format:
#figure(
  table(
    columns: 2,
    align: left,
    table.header([18.01 $x y$-graphs], [18.02 level curves]),
    [$x$ is input], [Both variables are inputs],
    [$y$ is output], [No variable name for output],
  ),
  kind: table
)

We give some examples.

#example(title: [Example: the level curves of $f(x,y) = y - x^2$])[
  To draw the level curves of the function $f(x, y) = y - x^2$,
  we begin by recalling that a level curve corresponds to the points $(x, y)$
  such that the function takes on a constant value, say $c$.
  For our function, this becomes:
  $ y - x^2 = c $
  which rearranges to
  $ y = x^2 + c. $
  Let's talk through some values of $c$.
  - As an example, if $c = 0$, then some points on the level curve would be
    $(-3,9)$, $(-2,4)$, $(-1,1)$, $(0,0)$, $(1,1)$, $(2,4)$, $(3,9)$,
    or even $(sqrt(5), 6)$ and $(sqrt(11), 12)$.
    You probably already recognize what's happening: $y = x^2$ happens to be an equation
    you met before in 18.01 form, so you get a parabola.
    (More generally, if you get an equation in 18.01 form where $y$ is a function of $x$,
    you can sketch it like you did before).
  - If we change the value of $c = 2$, this equation represents a family of parabolas.
    For example, the level curve for $2$ will be the parabola with points like
    $(-2,6)$, $(-1,3)$, $(0,2)$, $(1,3)$, $(2,6)$.

  In general, as $c$ varies, the level curves are parabolas
  that shift upward or downward along the $y$-axis.
  The shape of these curves is determined by the quadratic term $x^2$,
  which indicates that all level curves will have the same basic "U" shape.

  #figure(
    image("figures/level-curve1.svg"),
    caption: [The level curves of $f(x,y) = y-x^2$.],
  )
]

#example(title: [Example: the level curves of $f(x,y) = x - y^2$])[
  Let's draw level curves for $f(x,y) = x-y^2$.
  This example is exactly like the previous one, except the roles of $x$ and $y$ are flipped.

  #figure(
    image("figures/level-curve2.svg"),
    caption: [The level curves of $f(x,y) = x-y^2$.],
  )
]

#example(title: [Example: the level curves of $f(x,y) = x^2+y^2$])[
  Let's draw level curves of $f(x,y) = x^2+y^2$
  For each $c$ we want to sketch the curve
  $ x^2 + y^2 = c. $
  When $c < 0$, no points at all appear on this curve, and when $c = 0$
  the only point is the origin $(0,0)$.
  For $c > 0$ this equation represents a family of circles centered at the origin $(0, 0)$,
  with radius $sqrt(c)$.
  For example:

  - No points work for $c < 0$.
  - For $c = 0$, the level curve is the single point $(0,0)$.
  - For $c = 1$, the level curve is a circle with radius $1$.
  - For $c = 4$, the level curve is a circle with radius $2$.
  - For $c = 9$, the level curve is a circle with radius $3$.

  As $c$ increases, the circles expand outward from the origin.
  These concentric circles represent the level curves of the function $f(x, y) = x^2 + y^2$.

  #figure(
    image("figures/level-curve3.svg"),
    caption: [Four of the level curves for $f(x,y) = x^2+y^2$.],
  )
]

#example(title: [Example: the level curves of $f(x,y) = |x| + |y|$])[
  Let's draw level curves of $f(x,y) = |x| + |y|$.
  To draw the level curve for $c$, we are looking at
  $ |x| + |y| = c. $

  Like before, if $c < 0$ there are no pairs $(x,y)$ at all and for $c = 0$ there is only a single point.

  This equation represents a family of polygons.
  Specifically, for a given value of $c$,
  the points that satisfy this equation form a diamond shape centered at the origin.
  Indeed, in the first quadrant (where the absolute values don't do anything)
  it represents the line segment joining $(0,c)$ to $(c,0)$.

  So for example,

  - When $c < 0$, there are no points.
  - For $c = 0$, the level curve is just the point $(0,0)$.
  - For $c = 1$, the level curve is a diamond with vertices at $(1, 0)$, $(-1, 0)$, $(0, 1)$, and $(0, -1)$.
  - For $c = 2$, the level curve is a larger diamond with vertices at $(2, 0)$, $(-2, 0)$, $(0, 2)$, and $(0, -2)$.
  - For $c = 3$, the diamond expands further, with vertices at $(3, 0)$, $(-3, 0)$, $(0, 3)$, and $(0, -3)$.

  As $c$ increases, the diamonds expand outward, maintaining their shape but increasing in size.
  Each level curve is a square rotated by 45 degrees.

  #figure(
    image("figures/level-curve4.svg"),
    caption: [Four of the level curves for $f(x,y) = |x|+|y|$.],
  )
]

== [RECIPE] Drawing level curves

Despite the fact this chapter is labeled "recipe", there isn't an
easy method that works for every function.
*You have to do it in an ad-hoc way depending on the exact function you're given*.
For many functions you'll see on an exam, it'll be pretty easy.

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

#example(title: [Example: Level surface of $f(x,y,z) = x^2+y^2+z^2$])[
  If $f(x,y,z) = x^2 + y^2 + z^2$,
  then the level surface for the value $c$ will be a sphere with radius $sqrt(c)$ if $c >= 0$.
  (When $c < 0$, the level surface is empty.)
]

#example(title: [Example: Level surface of $f(x,y,z) = x + 2 y + 3 z$])[
  If $f(x,y,z) = x + 2 y + 3 z$,
  all the level surfaces of $f$ are planes in $RR^3$,
  which are parallel to each other with normal vector $vec(1,2,3)$.
]

== [EXER] Exercises

#exer[
  Draw 2D level curves for some values for the following functions:

  - $f(x,y) = 5 x + y$
  - $f(x,y) = x y$
  - $f(x,y) = sin(x^2 + y^2)$
  - $f(x,y) = e^(y - x^2)$
  - $f(x,y) = max(x,y)$ (i.e.~$f$ outputs the larger of its two inputs,
    so $f(3,5)=5$ and $f(2,-9)=2$, for example).
]

#exerstar[
  Give an example of a polynomial function $f(x,y)$
  for which the level curve for the value $100$ consists of exactly seven points.
]
