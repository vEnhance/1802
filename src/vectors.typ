#import "@local/evan:1.0.0":*

= Review of vectors

== [TEXT] Notation for scalars, vectors, points

If you haven't seen $RR$ before, let's introduce it now:
#definition[
  We denote by $RR$ the set of real numbers, so $3, sqrt(2), -pi$ are elements of $RR$.
  Sometimes we'll also refer to a real number as a *scalar*.
]
The symbol "$in$", if you haven't seen it before, means "is a member of".
So $3 in RR$ is the statement "$3$ is a real number".
Or $x in RR$ means that $x$ is a real number.

Unfortunately, right off the bat I have to mention that the notation $RR^n$ could mean two things:
#definition[
  By $RR^n$ we could mean one of two things, depending on context:

  - The set of vectors of length $n$, e.g. the vector $vec(pi, 5)$ is a vector in $RR^2$.
  - The set of points in $n$-dimensional space, e.g. $(sqrt(2), 7)$ is a point in $RR^2$.
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
    are all $vec(1,0)$, thought of as *due east*.
  - But the direction along the vectors $vec(-1,0)$ or $vec(-9,0)$
    are both $vec(1,0)$, thought of as *due east*.
  - The direction along the vectors $vec(0,-2)$, $vec(0,-17)$
    are all $vec(0,-1)$, thought of as *due south*.
]

#example[
  How about the direction along $vec(3, -4)$?
  We need to first find the length of the vector so we can scale it down.
  That's given by the Pythagorean theorem, of course: $ lr(|vec(3,-4)|) = sqrt(3^2+4^2) = 5. $
  So the direction along $vec(3,-4)$ would be
  $ 1/5 vec(3,-4) =  vec(3/5, -4/5). $
  See @fig-vec-3-4.
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

#recipe[
  The area of the parallelogram formed by $bf(v)_1 = vec(x_1, y_1)$ and $bf(v)_2 = vec(x_2, y_2)$ is equal to
  the absolute value of the determinant
  $ det mat(x_1, x_2; y_1, y_2) = x_1 y_2 - x_2 y_1. $
]

A similar theorem is true for the parallelepiped#footnote[I hate trying to spell this word.]
with three vectors in $RR^3$; see @fig-parallelepiped.

#recipe[
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
  and their $n$-dimensional generalizations, the tool needed is the *wedge product*.
  You can see chapter 12 of #link("https://web.evanchen.cc/napkin.html")[Napkin]
  if you want to see the proof-based version of the determinant.
]

== [EXER] Exercises

#exer[
  Calculate the unit vector along the direction of the
  $ vec(-0.0008 pi, -0.0009 pi, -0.0012 pi). $
]

#pagebreak()

= The dot product

== [TEXT] Two different definitions of the dot product

#todo[define it]

== [TEXT] Normal vectors to lines in $RR^2$

#todo[work this in]
If you are confused about normal vectors in the plane, it might help to first do the $RR^2$ case,
which is easier to draw and for which you might have better intuition from eighth or ninth
grade algebra.

Here's a question: what's the set of vectors in $RR^2$ perpendicular to $vec(1,2)$?
It's a line of slope $-1/2$ through the origin, namely
$ 0 = vec(x,y) dot vec(1, 2) <==> 0 = x + 2 y. $

#figure(
  image("figures/r02-x-plus-2y.png", width: 12cm),
  caption: [Plots of $x+2y=0$ and $x+2y=pi$.],
)

Okay, in that case what does the line
$ x + 2 y = pi $
look like? Well, it's a parallel line, the slope is still the same.

Equivalently, you could also imagine it as the set of points $vec(x,y)$ such that
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

== [RECIPE] Normal vectors to a plane

#memo[
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

#todo[To be written]
