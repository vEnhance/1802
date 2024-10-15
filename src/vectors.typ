#import "@local/evan:1.0.0":*

= Review of vectors

== [TEXT] Notation for scalars, vectors, points

If you haven't seen $RR$ before, let's introduce it now:
#definition[
  We denote by $RR$ the real numbers, so $3, sqrt(2), -pi$ are elements of $RR$.
  Sometimes we'll also refer to a real number as a *scalar*.
]
The symbol "$in$", if you haven't seen it before, means "is a member of".
So $3 in RR$ is the statement "$3$ is a real number".
Or $x in RR$ means that $x$ is a real number.

Unfortunately, right off the bat I have to mention that the notation $RR^n$ could mean two things:
#definition[
  By $RR^n$ we could mean one of two things, depending on context:

  - The vectors of length $n$, e.g. the vector $vec(pi, 5)$ is a vector in $RR^2$.
  - The points in $n$-dimensional space, e.g. $(sqrt(2), 7)$ is a point in $RR^2$.
]

To work around the awkwardness of $RR^n$ meaning two possible things,
this book will adopt the following conventions for variable names:

#typesig[
- Bold lowercase letters like $bf(u)$ and $bf(v)$ will be used for vectors.
  When we draw pictures of vectors, we always draw them as _arrows_.

- Capital letters like $P$ and $Q$ are used for points.
  When we draw pictures of points, we always draw them as _dots_.
]

We'll also use different notation for actual elements:

#typesig[
- A vector will either be written in column format like $vec(1,2,3)$,
  or with angle brackets as $angle.l 1,2,3 angle.r$ if the column format is too tall to fit.
- But a point will always be written with parentheses like $(1,2,3)$.
]

Some vectors in $RR^3$ are special enough to get their own shorthand.
(The notation "$:=$" means "is defined as".)
#definition[
  When working in $RR^2$, we define
  $ bf(e)_1 := vec(1,0), #h(1em) bf(e)_2 := vec(0,1) $
  and $ bf(0) = vec(0,0). $
]
#definition[
  When working in $RR^3$, we define
  $ bf(e)_1 := vec(1,0,0), #h(1em) bf(e)_2 := vec(0,1,0), #h(1em) bf(e)_3 := vec(0,0,1). $
  We also let $ bf(0) := vec(0,0,0). $

  In other places, you'll sometimes see $bf(i)$, $bf(j)$, $bf(k)$ instead,
  but this book will always use $bf(e)_i$.
]

== [TEXT] Length

#definition[
  The *length* of a vector is denoted by $|bf(v)|$
  and corresponds to the length of the arrow drawn.
  It is given by the Pythagorean theorem.

  - In two dimensions:
    $ bf(v) = vec(x,y) ==> |bf(v)| := sqrt(x^2+y^2). $
  - If three dimensions:
    $ bf(v) = vec(x,y,z) ==> |bf(v)| := sqrt(x^2+y^2+z^2). $

  In $n$ dimensions, if $bf(v) = angle.l x_1, ..., x_n angle.r$,
  the length is $|bf(v)| := sqrt(x_1^2 + ... + x_n^2)$.
]

#typesig[
  The length $|bf(v)|$ has type scalar. It is always positive unless $bf(v) = bf(0)$,
  in which case the length is $0$.
]

== [TEXT] Directions and unit vectors

Remember that a vector always has

- both a *magnitude*, which is how long the arrow is in the picture
- a *direction*, which refers to which way the arrow points.

In other words, the geometric picture of a vector always carries two pieces of information.
(Here, I'm imagining we've drawn the vector as an arrow
with one endpoint at the origin and pointing some way.)

In a lot of geometry situations we only care about the direction,
and we want to ignore the magnitude.
When that happens, one convention is to just set the magnitude equal to $1$:
#definition[
  A *unit vector* will be a vector that has magnitude $1$.
]
Thus we use the concept of unit vector to capture direction.
So in $RR^2$, $vec(1,0)$ is thought of as "due east"
and $vec(-1,0)$ is "due west", while $vec(0,1)$ is "due north"
and $vec(1/sqrt(2), 1/sqrt(2))$ is "northeast".

#definition[
  Given any vector $bf(v)$ in $RR^n$ besides the zero vector,
  the *direction along $bf(v)$* is the unit vector
  $ bf(v) / (|bf(v)|) $
  which is the unit vector that points the same way that $bf(v)$ does.
]
We will avoid referring to the direction of the zero-vector $bf(0)$, which doesn't make sense.
(If you try to apply the formula here, you get division by $0$,
since $bf(0)$ is the only vector with length $0$)
If you really want, you could say it has _every_ direction, but this is a convention.

#warning[
  Depending on what book you're following,
  more pedantic authors might write "the unit vector in the direction of $bf(v)$"
  or even "the unit vector in the same direction as $bf(v)$"
  rather than "direction along $bf(v)$".
  This is too long to type, so I adopted the shorter phrasing.
  I think everyone will know what you mean.
]

#typesig[
  If $bf(v)$ is a nonzero vector of length $n$,
  then the direction along $bf(v)$ is also a vector of length $n$.
]

#example[
  Let's first do examples in $RR^2$ so we can drawn some pictures.

  - The direction along the vectors $vec(1,0)$, $vec(5,0)$ or $vec(1337,0)$
    are all $vec(1,0)$, thought of as _due east_.
  - But the direction along the vectors $vec(-1,0)$ or $vec(-9,0)$
    are both $vec(1,0)$, thought of as _due east_.
  - The direction along the vectors $vec(0,-2)$, $vec(0,-17)$
    are all $vec(0,-1)$, thought of as _due south_.
]

#example[
  How about the direction along $vec(3, -4)$?
  We need to first find the length of the vector so we can scale it down.
  That's given by the Pythagorean theorem, of course: $ lr(|vec(3,-4)|) = sqrt(3^2+4^2) = 5. $
  So the direction along $vec(3,-4)$ would be
  $ 1/5 vec(3,-4) =  vec(3/5, -4/5). $
  See @fig-vec-3-4. The direction is somewhere between south and southeast.
]

#figure(
  image("figures/vectors-vec-3-4.png", width: auto),
  caption: [The direction along $vec(3,-4)$ (blue) is $vec(3 slash 5, -4 slash 5)$ (red).
  Unit vectors always lie on the grey circle (unit circle) by definition.],
) <fig-vec-3-4>

When drawn like @fig-vec-3-4 in the two-dimensional picture $RR^2$,
the notion of direction along $vec(x,y)$
is _almost_ like the notion of slope $y / x$ in high school algebra
(so the slope of the blue ray in @fig-vec-3-4).
But there are a few reasons our notion of direction is more versatile
than just using the slope of the blue ray.

- The notion of direction can tell the difference between $vec(3,-4)$, which goes southeast,
  and $vec(-3,4)$, which goes northwest.
  Slope cannot; it would assign both of these "slope $-4/3$.
- The due-north and due-south directions $vec(0,1)$ and $vec(0,-1)$ would have
  undefined slope due to division-by-zero,
  so you always have to worry about this extra edge case.
  With unit vectors, due-north and due-south don't cause extra headache.
- Our definition of direction works in higher dimension $RR^3$.
  There isn't a good analog of slope there;
  a single number cannot usefully capture a notion of direction in $RR^n$ for $n >= 3$.

#example[
  The direction along the three-dimensional vector $vec(12, -16, 21)$
  is $ vec(12 slash 21, -16 slash 29, 21 slash 29). $
  See if you can figure out where the $13$ came from.
]

== [RECIPE] Areas and volumes

If $bf(v)_1 = vec(x_1, y_1)$ and $bf(v)_2 = vec(x_2, y_2)$ are vectors,
drawn as arrows with a common starting point,
then their sum $bf(v)_1 + bf(v)_2$ makes a parallelogram in the plane with $bf(0)$
as shown in @fig-parallelogram.

#figure(
  image("figures/vectors-area.png", width: auto),
  caption: [Vector addition in $RR^2$.],
) <fig-parallelogram>

The following theorem is true, but we won't be able to prove it in 18.02.

#recipe(title: [Recipe: Area of a parallelogram])[
  The area of the parallelogram formed by $bf(v)_1 = vec(x_1, y_1)$ and $bf(v)_2 = vec(x_2, y_2)$ is equal to
  the absolute value of the determinant
  $ det mat(x_1, x_2; y_1, y_2) = x_1 y_2 - x_2 y_1. $
]

A similar theorem is true for the parallelepiped#footnote[I hate trying to spell this word.]
with three vectors in $RR^3$; see @fig-parallelepiped.

#recipe(title: [Recipe: Volume of a parallelepiped])[
  The volume of the parallelepiped formed by
  $bf(v)_1 = vec(x_1, y_1, z_1)$,
  $bf(v)_2 = vec(x_2, y_2, z_2)$,
  $bf(v)_3 = vec(x_3, y_3, z_3)$
  is equal to the absolute value of the determinant
  $ det mat(x_1, x_2, x_3; y_1, y_2, y_3; z_1, z_2, z_3). $
]

#figure(
  image("figures/vectors-parallelepiped.png", width: auto),
  caption: [Three vectors in $RR^3$ making a parallelepiped.],
) <fig-parallelepiped>

#digression[
  If you're interested in the proof of these results
  and their $n$-dimensional generalizations, the tool needed is the *wedge product*,
  which is denoted $and.big^k(RR^n)$.
  This is well beyond the scope of 18.02,
  but it's documented in Chapter 12 of my #link("https://web.evanchen.cc/napkin.html")[Napkin]
  for those of you that want to read about it.

  Alternatively, I think Wikipedia and Axler#footnote[Who
    has a paper called #link("https://www.axler.net/DwD.html")[Down with Determinants!],
    that I approve of.
  ], among others,
  use a definition of the determinant as
  the unique multilinear alternating map on $n$-tuples of column vectors in $RR^n$
  that equals $1$ for the identity.
  This definition will work, and will let you derive the formula for determinant,
  and gives you a reason to believe it should match your concept of area and volume.
  It's probably also easier to understand than wedge products.
  However, in the long term I think wedge products are more versatile,
  even though they take much longer to setup.
]

== [EXER] Exercises

#exer[
  Calculate the unit vector along the direction of the
  $ vec(-0.0008 pi, -0.0009 pi, -0.0012 pi). $
]

#pagebreak()

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
The standard proof uses the law of cosines, and it's in Poonen's notes;
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

#todo[an example of perpendicular in 2D]

This example shows something new:
#memo[Two nonzero vectors have perpendicular directions
  if and only if their dot product is $0$.]

#todo[an example of perpendicular in 3D]

#todo[an example of lengths]

#memo[The dot product of a vector with itself is the squared length.]

#tip[
  You can see from this example that computing the dot product
  of two given vectors with coordinates is
  way easier to do with the algebraic definition.
  This will be true in general throughout this class:

  - Use the algebraic definition to actually calculate the dot product.
  - Use the geometric definition to interpret the result in some way.
]



#figure(
  [TODO],
  // image("<+Path+>", width: auto),
  caption: [Some pictures of dot product.],
) <fig-vectors-example>

== [RECIPE] Checking whether two vectors are perpendicular

== [TEXT] Projection

== [RECIPE] Projection of one vector along the direction along another

#recipe(title: [Recipe for projecting one vector along another])[
  Suppose $bf(v)$ and $bf(w)$ are given vectors in $RR^n$.
  To find the length of the projection of $bf(v)$ along $bf(w)$:

  1. Output $(bf(v) dot bf(w)) / (|bf(w)|)$.

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

Here's a question: which vectors in $RR^2$ perpendicular to $vec(1,2)$?
It's a line of slope $-1/2$ through the origin, namely
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
  we should rethink in terms of normal vectors for 18.02.
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

== [RECIPE] Distance to a plane

#pagebreak()

= The cross product

The cross product is the last major linear algebra tool we'll need to introduce
(together with determinants and the dot product).
Like the dot product, the cross product also has two definitions, one algebraic and one geometric.

== [TEXT] The two definitions of the cross product


== [SIDENOTE] The cross product sucks

Compared to dot products and determinants,
the cross product might feel the most unnatural, for good reason ---
it's used much less frequently by serious mathematicians than the other tools you see.

#figure(
  image("media/cross-products.png", width: 80%),
  caption: [How to think of cross products.],
)

The reason that the cross product isn't popular with mathematicians is
the definition of the cross product is *really quite brittle*.
For example, the cross product can't be defined for any number of dimensions,#footnote[Just kidding,
  apparently there's a
  #link("https://w.wiki/BVNL")[seven dimensional cross product]?
  Today I learned.
  Except that there are apparently $480$ different ways to define it in seven dimensions,
  so, like, probably not a great thing.]
and you have to remember this weird right-hand rule that adds one more arbitrary convention.
So the definition is pretty unsatisfying.

To replace the cross product, mathematicians use a different
kind of object called a _bivector_, an element of a space called $and.big^2(RR^n)$.
(They might even claim that bivectors do everything cross products can do, but better.)
Again, this new kind of object is well beyond the scope of 18.02
but it's documented in Chapter 12 of my #link("https://web.evanchen.cc/napkin.html")[Napkin]
if you do want to see it.

I'll give you a bit of a teaser though.
In general, for any $n$, bivectors in $RR^n$ are specified by $(n(n-1))/2$ coordinates.
So for $n=3$ you _could_ translate every bivector in $RR^3$ into a vector in $RR^3$
by just reading the coordinates (although you end up with the right-hand rule
as an artifact of the translation), and the cross product is exactly what you get.
But for $n=4$, a bivector in $RR^4$ has six numbers,
which is too much information to store in a vector in $RR^4$.
Similarly, for $n > 4$, this translation can't be done.
That's why the cross product is so brittle and can't work past $RR^3$.
