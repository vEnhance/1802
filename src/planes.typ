#import "@local/evan:1.0.0":*

= Planes and their normal vectors <sec-planes>

In general, the equation of a plane in $RR^3$ takes the shape
$ a x + b y + c z = d $
where $a$, $b$, $c$, $d$ are real numbers (and $a$, $b$, $c$ are not all zero).

== [TEXT] Normal vectors to planes in $RR^3$

In 18.01, we had lines in $RR^2$, and we used the notion of slope of the line often.
For 18.02, planes don't have a "slope"; not a single number, anyway.
So the thing I want to communicate is:
#idea[
  Everything we used slope for in 18.01,
  we should rephrase in terms of normal vectors for 18.02.
]

So what's that?
A *normal vector* $bf(v)$ to a plane is a vector such that,
if you pick any point $P$ on the plane, then the arrow joining $P$ to $P + bf(v)$
--- that is, the arrow $bf(v)$ when you draw the starting point as $P$ ---
is perpendicular to that plane.

#todo[figure]

(Note that it doesn't matter which point $P$ you pick.
You could equally well even ignore $P$ together, imagine drawing $bf(v)$ as an arrow
starting from some random point not necessarily on the plane --- like the origin ---
and requiring that $bf(v)$ punctures the plane at a right angle.)

The main goal of this chapter is to prove the following result:
#memo(title: [Memorize: Normal vectors of plane])[
  Given a plane $a x + b y + c z = d$, the normal vectors to it
  are the multiples of $vec(a,b,c)$.
]

Keep in mind that normal vectors only matter up to scaling:
if $vec(1,2,3)$ is a normal vector, then so are $vec(10,20,30)$, $vec(-100, -200, -300)$, etc.

== [TEXT] Normal vectors to lines in $RR^2$

Before explaining why this is true in $RR^3$,
I want to do everything in $RR^2$ first for comparison,
where pictures are easier to draw and you have intuition from high school.

If you are confused about normal vectors in the plane, it might help to first do the $RR^2$ case,
which is easier to draw and for which you might have better intuition from eighth or ninth
grade algebra.

Here's a question: which vectors in $RR^2$ are perpendicular to $vec(1,2)$?
They're the vectors lying on a line of slope $-1/2$ through the origin, namely
$ 0 = vec(x,y) dot vec(1, 2) <==> 0 = x + 2 y. $

#figure(
  image("figures/r02-x-plus-2y.svg", width: 12cm),
  caption: [Plots of $x+2y=0$ and $x+2y=pi$.],
)

Okay, in that case what does the line
$ x + 2 y = pi $
look like? Well, it's a parallel line, the slope is still the same.

Equivalently, you could also imagine it as the points $vec(x,y)$ such that
$ vec(x,y) - vec(pi,0) " is perpendicular to " vec(1,2) $
or do the same thing for any point on the line, like
$ vec(x,y) - vec(0, pi slash 2) " is perpendicular to " vec(1,2) $
or even
$ vec(x,y) - vec(0.218 pi, 0.564 pi) " is perpendicular to " vec(1,2) $
But that's silly. Most of the time you don't care about base points.
All you care is the line has slope $-1/2$,
and for that the LHS just needs to be $x + 2y$ (or even $100 x + 200 y$).
The RHS can be whatever you want.

== [TEXT] Normal vectors to a plane

In $RR^3$, the exact same thing is true for the expression $a x + b y + c z = d$.
The only difference is that the word "slope" is banned.
Nevertheless, even if we can't talk about slope, we can still talk about parallel planes,
and now the whole discussion carries over wholesale.

For example, what's the set of vectors perpendicular to $vec(1,2,3)$?
That's the same as requiring
$ 0 = vec(x,y,z) dot vec(1,2,3) = x + 2 y + 3 z. $
So the plane $x + 2 y + 3 z = 0$ passes through the origin and has
normal vector is $vec(1,2,3)$.

What about something like $x + 2 y + 3 z = 6$?
Analogous to last section different ways to write it are:

- Rewriting the equation as $1 (x-6) + 2 (y-0) + 3 (z-0) = 0$,
  the plane can be thought of as the points $(x,y,z)$ such that
  $ vec(x,y,z) - vec(6,0,0) " is perpendicular to " vec(1,2,3). $
- Rewriting the equation as $1 (x-0) + 2 (y-3) + 3 (z-0) = 0$,
  the plane can be thought of as the points $(x,y,z)$ such that
  $ vec(x,y,z) - vec(0,3,0) " is perpendicular to " vec(1,2,3). $
- Rewriting the equation as $1 (x-0) + 2 (y-0) + 3 (z-2) = 0$,
  the plane can be thought of as the points $(x,y,z)$ such that
  $ vec(x,y,z) - vec(0,0,2) " is perpendicular to " vec(1,2,3). $
- Rewriting the equation as $1 (x-0.753) + 2 (y-0.618) + 3 (z-1.337) = 0$,
  the plane can be thought of as the points $(x,y,z)$ such that
  $ vec(x,y,z) - vec(0.753, 0.618, 1.337) " is perpendicular to " vec(1,2,3). $

But again, like last time, the base point doesn't really matter.
The end story is the same: the coefficients control the direction of the plane
via the normal vector.

#todo[figure]

== [RECIPE] Finding a plane through a point with a direction <recipe-plane-known-dir>

Sometimes you know the direction the plane goes,
and you need to get one point to lie on it.
This just means you have to pick the number $d$ to match:

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
  Planes are parallel when they have normal vectors in the same direction,
  so we use the normal vector $vec(1,2,3)$ for both.
  Hence the answer should take the form $ x + 2 y + 3 z = d $ for some $d$.
  In order to pass through $(1, 4, 9)$ we should choose $d = 1 + 2 dot 4 + 3 dot 9 = 36$.
  So output $ x + 2 y + 3 z = 36$.
]

== [TEXT] Calculating the distance from a point to a plane

There's a classical exercise that's used to test understanding of normal vectors to plane
and projections, which is to find the distance from a point to a plane.

#sample[
  Find the distance from the point $(7, 8, 9)$ to the plane $x + 2 y + 3 z = 0$.
]
#soln[
  The plane $x + 2 y + 3 z = 0$ has a normal vector $bf(n)$
  given by the coefficients of $x$, $y$, and $z$:
  $ bf(n) = (1 , 2 , 3) . $

  Now consider the vector $bf(v) = vec(7,8,9)$
  pointing from the origin (which lies on the plane) to the given point $(7,8,9)$.
  The main insight is that the scalar component of $bf(v)$ to the vector $bf(n)$
  coincides with the distance we're trying to compute;
  look at the figure TODO to see why this is true.
  #todo[draw fig]

  Calculate the dot product:
  $ bf(v) dot bf(n) = (7) (1) + (8) (2) + (9) (3) = 7 + 16 + 27 = 50 . $
  Calculate the magnitude:
  $ |bf(n)| = sqrt((1)^2 + (2)^2 + (3)^2) = sqrt(1 + 4 + 9) = sqrt(14) . $
  Hence, the scalar component is:
  $ op("comp")_(bf(n)) bf(v) = frac(bf(v) dot bf(n), |bf(n)|) = 50 / sqrt(14) . $
  This is the answer.
]

Here's the same exercise with one change: we change to $x + 2 y + 3 z = 60$.
This means we'll have to pick a point on the plane.
#sample[
  Find the distance from the point $(7, 8, 9)$ to the plane $x + 2 y + 3 z = 60$.
]
#soln[
  As before, the plane $x + 2 y + 3 z = 60$ has a normal vector $bf(n)$
  given by the coefficients of $x$, $y$, and $z$:
  $ bf(n) = (1 , 2 , 3) . $

  Now we can't use the origin $(0,0,0)$ this time,
  but we can pick any other point on the plane; we'll chose $(0,0,20)$.
  (You could do the problem with $(60,0,0)$ or $(0,30,0)$ or even $(-77,13,37)$ if you prefer;
  they all give the same answer.)

  The vector $bf(v)$ from $(0 , 0 , 20)$ to $(7 , 8 , 9)$ is:
  $ bf(v) = (7 - 0 , thin 8 - 0 , thin 9 - 20) = (7 , thin 8 , thin - 11) . $

  Now we can just repeat the steps from before, where
  $ bf(v) dot bf(n) &= (7) (1) + (8) (2) + (- 11) (3) = 7 + 16 - 33 = - 10 \
    |bf(n)| &= sqrt((1)^2 + (2)^2 + (3)^2) = sqrt(1 + 4 + 9) = sqrt(14) . $
  Hence
  $ op("comp")_(bf(n)) bf(v) = frac(bf(v) dot bf(n), |bf(n)|) = frac(- 10, sqrt(14)) . $
  The distance is the absolute value $10/sqrt(14)$.
]
#remark[
  It's fine that you get a negative number for the scalar component.
  This corresponds to the fact that the point $(7,8,9)$ is sandwiched
  between the two planes $x+2y+3z=0$ and $x+2y+3z=60$.
  Depending on which way you choose to point $bf(n)$,
  one of the components will be positive and the other negative.
]
#todo[figure]

The thing about this exercise is that you can just do it with symbols instead of
numbers and get a general formula, which means that doing it with specific numbers
is sort of a fool's errand. Let's just do them all at once.

#sample[
  Find the distance from a point $(x_0 , y_0 , z_0)$ to the plane
  defined by the equation $ a x + b y + c z = d. $
  Give the answer in terms of $a$, $b$, $c$, $d$, $x_0$, $y_0$, $z_0$.
]
#soln[
  The normal vector $bf(n)$ to the plane is given by the
  coefficients of $x$, $y$, and $z$ in the plane equation:
  $ bf(n) = (a , b , c) . $

  Now we select any base point $(x_1 , y_1 , z_1)$ that lies on the plane $cal(P)$.
  We'll do the case $c != 0$ and use
  $ (x_1 , y_1 , z_1) = (0 , 0 , d / c) $
  but the other cases $a != 0$ and $b != 0$ are done in the same way.
  (In fact, you don't really need to pick the base point either,
  it just makes the calculation a bit easier to think about in what follows.)

  The vector $bf(v)$ from $(x_1 , y_1 , z_1)$ to $(x_0 , y_0 , z_0)$ is:
  $ bf(v) = (x_0 - x_1 , y_0 - y_1 , z_0 - z_1) = (x_0 , y_0 , z_0 - d / c) . $

  Now, the scalar component of $bf(v)$ along $bf(n)$ is given by
  $ op("comp")_(bf(n)) bf(v) = frac(bf(v) dot bf(n), |bf(n)|) . $
  We compute it.
  Compute the dot product $bf(v) dot bf(n)$:
  $ bf(v) dot bf(n) = a x_0 + b y_0 + c (z_0 - d / c) = a x_0 + b y_0 + c z_0 - d . $
  Compute the magnitude of $bf(n)$:
  $ |bf(n)| = sqrt(a^2 + b^2 + c^2) . $
  Therefore, the scalar component is:
  $ op("comp")_(bf(n)) bf(v) = frac(a x_0 + b y_0 + c z_0 - d, sqrt(a^2 + b^2 + c^2)) . $

  Finally, the distance from the point to the plane is the absolute value of the scalar component:
  $ lr(|op("comp")_(bf(n)) bf(v)|) = lr(|frac(a x_0 + b y_0 + c z_0 - d, sqrt(a^2 + b^2 + c^2))|) . #qedhere $
]

== [RECIPE] Distance to a plane <sec-distance-plane>

If you just want to memorize the final result, here it is:

#recipe(title: [Recipe for distance from point to plane])[
  If asked to find the distance from a point $(x_0 , y_0 , z_0)$ to the plane
  defined by the equation $a x + b y + c z = d$, output the answer
  $ frac(|a x_0 + b y_0 + c z_0 - d|, sqrt(a^2 + b^2 + c^2)) . $
]
(We've moved the absolute value to the numerator, since the square root is always positive.)


== [EXER] Exercises

#exer[
  A cube is drawn somewhere in $RR^3$ (its faces are not parallel to the coordinate axes).
  Two of the faces of the cube are contained in the planes
  $x + 2 y + 3 z = 4$ and $5 x + 6 y + k z = 7$, respectively,
  for some real number $k$.
  Given this information, compute $k$.
]

#exer[
  The distance from a certain point $P$ to the plane $3x+4y+12z=-1$ is $42$.
  What are the possible distances from $P$ to the plane $3x+4y+12z=1000$?
]
