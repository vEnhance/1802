#import "@local/evan:1.0.0":*

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
