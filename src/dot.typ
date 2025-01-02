#import "@local/evan:1.0.0":*

= The dot product <ch-dot>

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

== [TEXT] Two different definitions of the dot product <sec-dot>

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

It's totally not obvious that these two definitions are the same!
I know two reasonable proofs, both of which I've typed in the appendix:

- The standard proof uses the law of cosines; it's documented in @appendix-dotpf-alg.
  It's short but seems somewhat magical.
- I came up with a geometric proof without trigonometry; it's documented in @appendix-dotpf-geo.
  It's longer but easier to come up with.

I won't dwell on this proof too much in the interest of moving these notes forward.

#typesig[
  Remember, the dot product takes two vectors _of equal dimensions_ as inputs
  and outputs a _scalar_ (i.e. a real number).
  *It does not output a vector!*
  This is the mistake every calculus or linear algebra
  instructor dreads for the first few weeks of class.

  Repeat: dot product output type is *number*! Not a vector!
]

#warning(title: [Warning: There are a lot of dots, aren't there?])[
  Confusingly, the multiplication $dot$ is also used for normal multiplication
  (as we saw in @exer-tsafe).
  This is why you need to always look at the types of objects
  so you know which $dot$ is happening.
  To spell this out:

  - If $a$ and $b$ are two numbers, $a dot b = a b$ is _grade-school multiplication_,
    e.g. $3 dot 5 = 15$.
  - If $a$ is a number and $bf(v)$ is a vector, $a dot bf(v)$ is _scalar multiplication_,
    e.g. $3 dot vec(5,7) = vec(15, 21)$.
  - If $bf(v)$ and $bf(w)$ are vectors, then $bf(v) dot bf(w)$ is _dot product_,
    e.g. $vec(5,7) dot vec(9,11) = 5(9)+7(11) = 122$.
]

#example[
  Let's compute the dot product of $bf(v) = vec(-5, 5 sqrt(3))$
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
  image("figures/dot-ex1.svg", width: auto),
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
  Let's compute the dot product of $bf(v) = vec(1, 2)$ and $bf(w) = vec(-6, 3)$ both ways.
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
  image("figures/dot-ex2.svg", width: auto),
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
  Compute the real number $t$ such that $vec(1,2,3)$ and $vec(4,5,t)$ are perpendicular.
]
#soln[
  We need $1 dot 4 + 2 dot 5 + 3 dot t = 0$, so $#boxed[$ t = -14/3 $]$.
]

#example(title: [Example: $bf(v) dot bf(v) = |bf(v)|^2$])[
  If one takes the dot product of a vector $bf(v) = vec(x_1, dots.v, x_n)$ with itself,
  one gets the *squared length*.
  - To see this from the algebraic definition, note that
    $bf(v) dot bf(v) = x_1^2 + ... + x_n^2 = |bf(v)|^2$.
  - To see this from the geometric definition, note that
    $bf(v) dot bf(v) = |bf(v)| |bf(v)| cos(0) = |bf(v)|^2$.
]

== [TEXT] Properties of the dot product

If you look at the algebraic definition, you should be able to see easily that:
- $bf(v) dot bf(w) = bf(w) dot bf(v)$, i.e., dot product is commutative.
- $bf(v) dot (bf(w)_1 + bf(w)_2) = bf(v) dot bf(w)_1 + bf(v) dot bf(w)_2$,
  i.e., the dot product is distributive.

I point this out briefly so it's on the record,
but you'll probably also internalize it automatically as you get
more practice with actually computing the dot product.

== [TEXT] Projection

Suppose $bf(v)$ and $bf(w)$ are two nonzero vectors in $RR^n$.
Let $theta$ denote the angle between them.
Imagine projecting the vector $bf(v)$ onto the line through $bf(w)$,
to get the purple vector shown in @fig-dot-project1.
This purple vector is typically written $op("proj")_(bf(w))(bf(v))$.

#typesig[
  The vector projection $op("proj")_(bf(w))(bf(v))$
  is a vector that points in either the same or opposite direction as $bf(w)$.
]

Let's do an example to see how the dot product lets us compute this.
#example[
  Suppose $bf(v) = vec(2,3)$ and $bf(w) = vec(4,1)$, as in @fig-dot-project1.
  How can we find the purple vector $op("proj")_(bf(w))(bf(v))$?
]

#figure(
  image("figures/dot-proj1.svg", width: auto),
  caption: [The projection of $bf(v) = vec(2,3)$ along $bf(w) = vec(4,1)$.],
) <fig-dot-project1>


#soln[
  First, let's figure out the _length_ of the purple vector.
  For trigonometry reasons, we know the _length_ of the purple vector is
  $ "length of purple vector" = bf(v) cos theta. $
  However, we don't really want to go to the work of figuring out what $theta$ is.

  This is where the dot product comes in.
  It's easy to compute the dot product:
  $ 11 = 2 dot 4 + 3 dot 1 = bf(v) dot bf(w) = |bf(v)| |bf(w)| cos theta. $
  This is almost what we want, except there's an unneeded $|bf(w)|$ we want to strip out.
  We know $|bf(w)| = sqrt(4^2+1^2) = sqrt(17)$, and hence we get
  $ "length of purple vector" = (bf(v) dot bf(w)) / (|bf(w)|) = 11 / sqrt(17). $

  Now how do we get the purple vector itself?
  Well, the direction along $bf(w)$ is the unit vector
  $ bf(w) / (|bf(w)|) = vec(4/sqrt(17), 1/sqrt(17)) $
  and so multiplying by the length gives the desired result:
  $ op("proj")_(bf(w))(bf(v)) = ("length of purple vector") (bf(w)) / (|bf(w)|)
    = 11/sqrt(17) vec(4/sqrt(17), 1/sqrt(17)) = vec(44/17, 11/17). #qedhere $
]

#remark[
  The projection only depends on the direction of $bf(w)$.
  So if one had re-done the problem above with $bf(w) = vec(200, 300)$
  instead of $vec(2,3)$, the answer would be the same.
]

== [RECIPE] Projection <sec-recipe-proj>

This procedure last section works in general for any vectors, in any number of dimensions.
The only catch is that we have to pay a bit of attention to $theta < 90 degree$
and $theta > 90 degree$ behaving slightly differently.
An example of a situation of that shape is shown in @fig-dot-project2.

#figure(
  image("figures/dot-proj2.svg", width: auto),
  caption: [The projection of $bf(v) = vec(-3,3)$ along $bf(w) = vec(4,1)$.],
) <fig-dot-project2>

Here, the purple vector points _away_ opposite $bf(w)$.

In the previous example, we used the word "length" and it was fine.
In the new figure @fig-dot-project2, we would end up taking negative length instead.
That works fine, but it's annoying;
and so we introduce a new word that works in _both_ cases $theta < 90 degree$
and $theta > 90 degree$:

#definition(title: [Definition of scalar component])[
  The *scalar component* of $bf(v)$ in the direction of $bf(w)$ is the number defined by
  $  op("comp")_(bf(w))(bf(v)) := |v| cos theta = (bf(v) dot bf(w)) / (|bf(w)|). $
]
This is the analog of purple length from before,
but now we allow it to be positive, negative, or zero according to $theta < 90 degree$,
$theta > 90 degree$, and $theta = 90 degree$, respectively.
But the point is that the cosine can take care of this automatically,
and because the cosine is baked into the dot product, life is great:
*we just don't have to think about the sign issue at all*.
That is, the formula with the new notation
$ op("proj")_(bf(w))(bf(v))
  = op("comp")_(bf(w))(bf(v)) (bf(w)) / (|bf(w)|) $
is just always true.

#typesig[
  The scalar component is a number, and can be either positive, negative, or zero.
]

#recipe(title: [Recipe for projecting one vector along another])[
  Suppose $bf(v)$ and $bf(w)$ are given vectors in $RR^n$.

  1. To compute the *scalar component*, use the formula
    $ op("comp")_(bf(w))(bf(v)) = (bf(v) dot bf(w)) / (|bf(w)|). $
  2. To compute the *vector projection*, use the formula
    $ op("proj")_(bf(w))(bf(v))
      = op("comp")_(bf(w))(bf(v)) (bf(w)) / (|bf(w)|). $
]
#typesig[
  Pay attention to type safety when carrying out the recipe to avoid shooting
  yourself in the foot:
  - In the formula $(bf(v) dot bf(w)) / (|bf(w)|)$,
    the numerator is a number (it's a dot product),
    the denominator is a number (it's a length), and we're dividing two numbers.
  - The formula $(bf(v) dot bf(w))/(|bf(w)|^2) bf(w)$ is more complicated.
    Focus on just the fraction in front first:
    the numerator is a number (it's a dot product),
    and the denominator is a number (it's a squared length),
    so the entire fraction is a number.
    This fraction then gets multiplied onto a vector $bf(w)$, so the output type
    is a vector (actually a multiple of $bf(w)$).
]
#warning[
  It's possible to write the projection formula written in other equivalent ways, e.g.
  $ op("proj")_(bf(w))(bf(v))
    = op("comp")_(bf(w))(bf(v)) (bf(w)) / (|bf(w)|)
    = ( (bf(v) dot bf(w)) / (|bf(w)|) ) (bf(w)) / (|bf(w)|)
    = (bf(v) dot bf(w))/(|bf(w)|^2) bf(w)
    = (bf(v) dot bf(w))/(bf(w) dot bf(w)) bf(w). $
  I don't like the last few as much because I think they make it harder to see
  where the formula comes from, but if you know what you're doing, feel free to use them.
]

To show you the recipe isn't doing anything you haven't seen before,
we redo the earlier example using the new notation.
You should notice we get the same numbers as before.
#sample[
  Suppose $bf(v) = vec(2,3)$ and $bf(w) = vec(4,1)$, as in @fig-dot-project1.
  Calculate $op("proj")_(bf(w))(bf(v))$.
]
#soln[
  First, compute
  $ op("comp")_(bf(w))(bf(v)) = (bf(v) dot bf(w)) / (|bf(w)|)
    = (2 dot 4 + 3 dot 1) / (sqrt(4^2+1^2)) = 11/sqrt(17). $
  Then,
  $ op("proj")_(bf(w))(bf(v))
    = op("comp")_(bf(w))(bf(v)) (bf(w)) / (|bf(w)|)
    = 11/sqrt(17) vec(4/sqrt(17), 1/sqrt(17)) = vec(44/17, 11/17). #qedhere $
]

Let's also do the example in @fig-dot-project2.
#sample[
  Suppose $bf(v) = vec(-3,3)$ and $bf(w) = vec(4,1)$, as in @fig-dot-project1.
  Calculate $op("proj")_(bf(w))(bf(v))$.
]
#soln[
  First, compute
  $ op("comp")_(bf(w))(bf(v)) = (bf(v) dot bf(w)) / (|bf(w)|)
    = (-3 dot 4 + 3 dot 1) / (sqrt(4^2+1^2)) = (-9)/sqrt(17). $
  Then,
  $ op("proj")_(bf(w))(bf(v))
    = op("comp")_(bf(w))(bf(v)) (bf(w)) / (|bf(w)|)
    = (-9)/sqrt(17) vec(4/sqrt(17), 1/sqrt(17)) = vec(-36/17, -9/17). #qedhere $
]

== [EXER] Exercises

#exer[
  In four-dimensional space $RR^4$, the vectors $angle.l 1,2,3,4 angle.r$
  and $angle.l 5,6,7,t angle.r$ are perpendicular. Compute $t$.
] <exer-dot-perp4d>

#exer[
  - Compute the vector projection of $angle.l 123,456,789 angle.r$ in the direction of $ee_1$.
  - Compute the scalar component and vector projection of $bf(v) = angle.l 1,2,3 angle.r$
    along the direction of $bf(w) = angle.l -3000, -4000, 0 angle.r$.
] <exer-dot-proj>

#exer[
  Let $bf(w) = angle.l 3,4 angle.r$.
  Compute all unit vectors $bf(v)$ in $RR^2$ for which $bf(v) dot bf(w) = 3$.
] <exer-dot-reverse>
