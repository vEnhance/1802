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

  - The geometric definition is a bit more work, see @fig-vectors-example.
    In this picture, you can see there are two $30 degree$ angles between the axes,
    and the lengths of the vectors are $10$ and $14$.
    Hence, the angle $theta$ between them is $theta = 90 degree + (30 degree + 30 degree) = 150 degree$.
    So the geometric definition gives that
    $ bf(v) dot bf(w) = |bf(v)| |bf(w)| cos theta = 10 dot 14 dot cos(150 degree)
      = 140 dot - sqrt(3)/2 = -70sqrt(3). $
]
#figure(
  [TODO],
  // image("<+Path+>", width: auto),
  caption: [Some pictures of dot product.],
) <fig-vectors-example>


#tip[
  You can see from this example that computing the dot product
  of two given vectors with coordinates is
  way easier to do with the algebraic definition.
  This will be true in general throughout this class:

  - Use the algebraic definition when you need to do practical calculation.
  - Use the geometric definition to interpret the result in some way.
]

#todo[an example of perpendicular in 2D]

This example shows something new:
#memo[Two nonzero vectors have perpendicular directions
  if and only if their dot product is $0$.]

#todo[an example of perpendicular in 3D]

#todo[an example of lengths]

#memo[The dot product of a vector with itself is the squared length.]
== [SIDENOTE] The proof of the equivalence of the dot product properties

== [RECIPE] Checking whether two vectors are perpendicular

== [TEXT] Projection

== [RECIPE] Projection of one vector along the direction along another

#recipe(title: [Recipe for projecting one vector along another])[
  Suppose $bf(v)$ and $bf(w)$ are given vectors in $RR^n$.
  To find the length of the projection of $bf(v)$ along $bf(w)$:

  1. Output the absolute value of $(bf(v) dot bf(w)) / (|bf(w)|)$.

  To find the actual vector $bf(v)$ along $bf(w)$:

  1. Output $(bf(v) dot bf(w)) / (|bf(w)|) (bf(w)) / (|bf(w)|)$.
]

#todo[define it]
