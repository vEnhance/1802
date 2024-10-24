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

#pagebreak()

= Planes and their normal vectors

== [TEXT] Planes in $RR^3$

== [TEXT] Normal vectors to lines in $RR^2$

Before we get to normal vectors to planes in $RR^3$, I want to do everything in $RR^2$ first.

If you are confused about normal vectors in the plane, it might help to first do the $RR^2$ case,
which is easier to draw and for which you might have better intuition from eighth or ninth
grade algebra.

Here's a question: which vectors in $RR^2$ are perpendicular to $vec(1,2)$?
They're the vectors lying on a line of slope $-1/2$ through the origin, namely
$ 0 = vec(x,y) dot vec(1, 2) <==> 0 = x + 2 y. $

#figure(
  image("figures/r02-x-plus-2y.png", width: 12cm),
  caption: [Plots of $x+2y=0$ and $x+2y=pi$.],
)

Okay, in that case what does the line
$ x + 2 y = pi $
look like? Well, it's a parallel line, the slope is still the same.

Equivalently, you could also imagine it as the points $vec(x,y)$ such that
$ vec(x,y) - vec(pi,0) " is perpendicular to " (1,2) $
or do the same thing for any point on the line, like
$ vec(x,y) - vec(0, pi slash 2) " is perpendicular to " (1,2) $
or even
$ vec(x,y) - vec(0.218 pi, 0.564 pi) " is perpendicular to " (1,2) $
But that's silly. Most of the time you don't care about base points.
All you care is the line has slope $-1/2$,
and for that the LHS just needs to be $x + 2y$ (or even $100 x + 200 y$).
The RHS can be whatever you want.

In $RR^3$, the exact same thing is true for the expression $a x + b y + c z = d$.
The only difference is that the word "slope" is banned (or at least needs a new type;
it won't be a single number).
Nevertheless, even if we can't talk about slope, we can still talk about parallel planes,
and now the whole discussion carries over wholesale.


== [RECIPE] Normal vectors to a plane

#idea[
  Everything we used slope for in 18.01,
  we should rephrase in terms of normal vectors for 18.02.
]

#recipe(title: [Recipe for calculating normal vector to a plane])[
  To find the normal vector of a plane given in the form $a x + b y + c z = d$:

  1. Output $vec(a,b,c)$ (or any other multiple of $vec(a,b,c)$).
]

== [RECIPE] Finding a plane through a point with a direction <recipe-plane-known-dir>

#recipe(title: [Recipe for finding a plane given a normal vector and a point on it])[
  Suppose the given normal vector is $vec(a,b,c)$, and $P in RR^3$ is a given point.

  1. Write $a x + b y + c z$ for the left-hand side.
  2. Evaluate the left-hand side at $P$ to get a number $d$.
  3. Output $a x + b y + c z = d$.
]

#sample[
  Find the equation of the plane parallel to $x + 2 y + 3 z = 100$
  which passes through the point $(1, 4, 9)$.
]
#solution[
  Planes are parallel when they have the same normal vector,
  so we know the normal vector is $vec(1,2,3)$ for both.
  Hence the answer should take the form $x + 2 y + 3 z = d$ for some $d$.
  In order to pass through $(1, 4, 9)$ we should choose $d = 1 + 2 dot 4 + 3 dot 9 = 36$.
  So output $ x + 2 y + 3 z = 36$.
]

== [TEXT] Calculating distance to a plane

== [RECIPE] Distance to a plane <sec-distance-plane>

== [EXER] Exercises

#exer[
  Find all possible values of $a x + b y + c z$
  over real numbers $a$, $b$, $c$, $x$, $y$, $z$
  satisfying $a^2 + b^2 + c^2 = 2$ and $x^2 + y^2 + z^2 = 5$.
]

#pagebreak()
