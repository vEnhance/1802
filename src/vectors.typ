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
since $bf(0)$ is the only vector with length $0$.)
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
    are both $vec(-1,0)$, thought of as _due west_.
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
  is $ vec(12 slash 29, -16 slash 29, 21 slash 29). $
  See if you can figure out where the $29$ came from.
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

#recipe(title: [Recipe for area of a parallelogram])[
  The area of the parallelogram formed by $bf(v)_1 = vec(x_1, y_1)$ and $bf(v)_2 = vec(x_2, y_2)$ is equal to
  the absolute value of the determinant
  $ det mat(x_1, x_2; y_1, y_2) = x_1 y_2 - x_2 y_1. $
]

A similar theorem is true for the parallelepiped#footnote[I hate trying to spell this word.]
with three vectors in $RR^3$; see @fig-parallelepiped.

#recipe(title: [Recipe for volume of a parallelepiped])[
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
  which is denoted $and.big^k (RR^n)$.
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
  Calculate the unit vector along the direction of the vector
  $ vec(-0.0008 pi, -0.0009 pi, -0.0012 pi). $
]
