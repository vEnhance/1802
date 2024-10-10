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
  When we draw pictures of vectors, we always draw them as _dots_.
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

In a lot of geometry situations we only care about the direction,
and we want to ignore the magnitude.
When that happens, one convention is to just set the magnitude equal to $1$.
To that end, a *unit vector* will be a vector that has magnitude $1$.

== [RECIPE] Areas and volumes

If $bf(v)_1 = vec(x_1, y_1)$ and $bf(v)_2 = vec(x_2, y_2)$ are vectors,
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

== [RECIPE] Projection of one vector along the direction of another

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
