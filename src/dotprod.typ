#import "@local/evan:1.0.0":*

= The dot product

The dot product is the first surprising result you'll see in this class,
because it has _two_ definitions that look nothing alike,
one algebraic and one geometric.
Because of that, we'll be able to get a ton of mileage out of it.

This will be a general theme across the course:
almost every new concept we define will have some sort "algebraic" side
(like the coordinates for vector addition)
and some "geometric" side (the parallelogram in @fig-parallelogram).
This is the bar a concept has to pass for us to study it in this class:
in order for us to deem a concept worthy of our attention in 18.02,
it must have both an interpretation with algebra and an interpretation in geometry.

== [TEXT] Two different definitions of the dot product

I promised you two definitions right? So here they are.

#definition[
  Suppose $bf(v) = vec(a_1, dots.v, a_n)$ and $bf(w) = vec(b_1, dots.v, b_n)$ are two vectors in $RR^n$.

  The _algebraic definition_ is to take the sum of the component-wise products:
  $
    vec(a_1, dots.v, a_n)
    dot
    vec(b_1, dots.v, b_n)
    :=  a_1 b_1 + ... + a_n b_n.
  $

  The _geometric definition_ is that if $theta$ is the angle between the two vectors
  when we draw them as arrows with a common starting point, then
  $ bf(v) dot bf(w) := |bf(v)| |bf(w)| cos theta. $
  That is, the dot product equals the product of the lengths
  times the cosine of the included angle.
]

It's totally not obvious that these two definitions are the same?
The standard proof uses the law of cosines;
I'll say a bit more about this once I've done a few examples.
I also found a proof without trigonometry that I typed in @appendix-dotpf.
I won't dwell on this proof too much in the interest of moving these notes forward.

#typesig[
  Remember, the dot product takes two vectors _of equal dimensions_ as inputs
  and outputs a _scalar_ (i.e. a real number).
  *It does not output a vector!*
  This is the mistake every calculus or linear algebra
  instructor dreads for the first few weeks of class.

  Repeat: dot product output type is *number*! Not a vector!
]

#example[
  Let's find the dot product of $bf(v) = vec(-5, 5 sqrt(3))$
  and $bf(w) = vec(7sqrt(3), -7)$, both ways.

  - The algebraic definition is easy:
    $ bf(v) dot bf(w) = - 5 dot 7 sqrt(3) + 5 sqrt(3) dot (-7) = -70 sqrt(3). $

  - The geometric definition is a bit more work, see @fig-dot-ex1.
    In this picture, you can see there are two $30 degree$ angles between the axes,
    and the lengths of the vectors are $10$ and $14$.
    Hence, the angle $theta$ between them is $theta = 90 degree + (30 degree + 30 degree) = 150 degree$.
    So the geometric definition gives that
    $ bf(v) dot bf(w) = |bf(v)| |bf(w)| cos theta = 10 dot 14 dot cos(150 degree)
      = 140 dot - sqrt(3)/2 = -70sqrt(3). $
]

#figure(
  image("figures/dotprod-ex1.png", width: auto),
  caption: [The dot product of  $bf(v) = vec(-5, 5 sqrt(3))$
  and $bf(w) = vec(7sqrt(3), -7)$ is $-70sqrt(3)$.]
) <fig-dot-ex1>


#tip[
  You can see from this example that computing the dot product
  of two given vectors with coordinates is
  way easier to do with the algebraic definition.
  This will be true in general throughout this class:

  - Use the algebraic definition when you need to do practical calculation.
  - Use the geometric definition to interpret the result in some way.
]

#example[
  Let's find the dot product of $bf(v) = vec(1, 2)$ and $bf(w) = vec(-6, 3)$ both ways.
  See @fig-dot-ex2.

  - The algebraic definition is easy:
    $ bf(v) dot bf(w) = 1 dot (-6) + 2 dot (3) = 0. $

  - In this case the two vectors $bf(v)$ and $bf(w)$ form a $90 degree$ angle between them.
    You should know this from high school, since the two blue rays in @fig-dot-ex2
    have slopes $2$ and $-1/2$ respectively.
    So the cosine of the angle is $0$, and the whole dot product is $0$.
    (The lengths are $|bf(v)| = sqrt(5)$ and $|bf(w)| = 3sqrt(5)$,
    but there's no need to actually calculate these.)
]

#figure(
  image("figures/dotprod-ex2.png", width: auto),
  caption: [Two perpendicular dot products],
) <fig-dot-ex2>

This example shows something new:
#memo[Two nonzero vectors have perpendicular directions
  if and only if their dot product is $0$.]

This might seem stupid in two dimensions,
because it's doing something you already knew how to do with slope.
But in $RR^3$ there isn't a concept of slope,
so if you want to see whether two vectors are perpendicular in $RR^3$,
you'll want to use the dot product.

#sample[
  Find the real number $t$ such that $vec(1,2,3)$ and $vec(4,5,t)$ are perpendicular.
]
#soln[
  We need $1 dot 4 + 2 dot 5 + 3 dot t = 0$, so $t = -14/3$.
]

#example[
  If one takes the dot product of a vector $bf(v) = vec(x_1, dots.v, x_n)$ with itself,
  one gets the *squared length*.
  - To see this from the algebraic definition, note that
    $ bf(v) dot bf(v) = x_1^2 + ... + x_n^2 = |bf(v)|^2. $
  - To see this from the geometric definition, note that
    $ bf(v) dot bf(v) = |bf(v)| |bf(v)| cos(0) = |bf(v)|^2. $
]

== [TEXT] Projection

Suppose $bf(v)$ and $bf(w)$ are two nonzero vectors in $RR^n$.
Let $theta$ denote the angle between them.
Imagine projecting the vector $bf(v)$ onto the line through $bf(w)$,
to get the purple vector shown in @fig-project1.

#figure(
  image("figures/dot-proj1.png", width: auto),
  caption: [The projection of $bf(v)$ along $bf(w)$],
) <fig-project1>


Let's do an example to see how the dot product lets us compute this.
#example[
  Suppose $bf(w) = vec(3,1)$ and $bf(v) = vec(1,3)$, as in @fig-project1.
]

#definition(title: [Definition of vector projection])[
  The *vector projection* of $bf(v)$ along the direction of $bf(w)$,
  which we denote $op("proj")_(bf(w))(bf(v))$,
  is the vector you get when you take the perpendicular from $bf(v)$ down to $bf(w)$.
]
#typesig[
  The vector projection $op("proj")_(bf(w))(bf(v))$
  is a vector that points in the same direction as $bf(w)$.
]

The most direct way to get the purple vector is to first figure out its length.
#definition(title: [Definition of scalar component])[
  The *scalar component* is defined by
  $  op("comp")_(bf(w))(bf(v)) := |v| cos theta. $
]
#typesig[
  The scalar projection is a number, and can be either positive, negative, or zero.
]


== [RECIPE] Projection of one vector along the direction along another

#recipe(title: [Recipe for projecting one vector along another])[
  Suppose $bf(v)$ and $bf(w)$ are given vectors in $RR^n$.
  To find the *length* of the projection of $bf(v)$ along $bf(w)$:

  1. Output the absolute value of $(bf(v) dot bf(w)) / (|bf(w)|)$.

  To find the actual *projection* itself $bf(v)$ along $bf(w)$:

  1. Output $(bf(v) dot bf(w)) / (|bf(w)|) (bf(w)) / (|bf(w)|)$.
]

#todo[define it]

== [EXER] Exercises

#exer[
  In four-dimensional space $RR^4$, the vectors $vec(1,2,3,4)$
  and $vec(5,6,7,t)$ are perpendicular. Compute $t$.
]
