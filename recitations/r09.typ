#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Notes for 18.02 Recitation 9],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [1 October 2024],
)

#quote(attribution: [Ozpin, in RWBY])[You brought your army to my kingdom, James. Use it.]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

= Keep doing everything component-wise

As I promised pretty much nothing happened yesterday
and you still do everything componentwise.
(Don't worry about Kepler's law.)
There's one additional theorem you need.

#thm[Arc length][
  $L = integral_(t="start time")^("stop time") ||bf(v)(t)|| dif t$.
]


= Preview of Thursday/Friday's lecture

== Level curves replace $x y$-graphs

In high school algebra, you drew 2D graphs of one-variable functions like $y = 2 x + 5$ or $y = x^2 + 7$.
So it might have seemed a bit weird to you that in R01/R02, our planes were usually written
like $2 x + 5 y + 3 z = 7$ rather than, say, $z = (7 - 2 x - 5 y) / 3$.
But this form turned out to be better, because it let us easily access the normal vector
(which here is $chevron.l 2, 5, 3 chevron.r$).

We'll keep up this trend often with multivariate functions; prefer constant RHS's.
That is, suppose we want to draw a _two_ variable function like $f(x,y) = x^2 + 3 y$.
Either do a 2D level curve $x^2 + 3y = c$, or think of it as the 3D level curve $x^2 + 3 y - z = 0$.

== Gradients

There are two important pieces of philosophy.
First: the goal of the first-order derivative is to approximate a function by a linear one.
Second (from R01): _everything you used slopes for before, you should use normal vectors instead_.
Here's how this plays out:

- In 18.01, when $f : RR -> RR$, you defined a *derivative* $f'(p)$ at each input $p in RR$,
  which you thought of as the *slope* of the *tangent line* at $p$.
  Think $f(5.01) approx f(5) + f'(5) dot 0.01$.
- In 18.02, when $f : RR^n -> RR$, you will instead define the *gradient*
  $nabla f(P)$ for each $P in RR^n$.
  (For _level-curve pictures_, this is a normal vector to the tangent line/plane/hyperplane.)
  So $nabla f$ carries much _more_ information: there are $n$ directions to move in.

(To spell out type signatures:
$nabla f$ is a function accepting points in $RR^n$ and outputting vectors in $RR^n$;
$nabla f(P)$ is a vector in $RR^n$.)

The *dot product* is now going to be really important.#footnote[You
  might have thought it was weird that back in R01 and R02,
  every time used the dot product $bf(a) dot bf(b) = |bf(a)| |bf(b)| cos theta$,
  there was almost always this "unwanted" absolute value that we would immediately strip off.
  But in the gradient, we'll actually use both the absolute values.]
Here's how.
- In 18.01, if you know $f(5)$ and $f'(5)$, then $f(5.01) approx f(5) + f'(5) dot 0.01$,
  because we think of $f'(5)$ as a slope ("rise/run") and $0.01$ as the run.
- In 18.02, if you know $f(5,8)$ and $nabla f(5,8)$, then the analogy goes
  $ f(5.01, 7.996) approx f(5,8) + nabla f(5,8) dot chevron.l 0.01, -0.004 chevron.r. $
  Yes, the dot is a dot product; both $nabla f(5,8)$ and $chevron.l 0.01, -0.004 chevron.r$
  have type "vector in $RR^2$".
  This will take a lot of time to get used to, but everything afterwards depends on it,
  so do whatever you can to get this into your instincts.
  I'll draw you a picture next recitation.

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Thing], [18.01], [18.02]),
    [Function], [$f: RR -> RR$], [$f: RR^n -> RR$],
    [Differentiate], [$f': RR -> RR$], [$nabla f: RR^n -> RR^n$],
    [Think of as], [Slope (rise/run)], [Gradient (measures change in $n$ directions)],
    [Approximation], [Multiply by small run], [Dot product with small displacement]
  ),
  kind: table
)

(In math-major classes like 18.100, the *total derivative* replaces the gradient.
I don't know remember if total derivative appears in 18.02 as well,
but if it does, I'll talk more about it.)

== Advice for this week

- Honestly, just ignore all this parametric stuff until MT2-ish,
  because basically nothing substantial happens (you just do everything component-wise)
  and also it won't be reused until after MT2.
- *Start early on PSet 4B*, it's long and introduces a lot of new concepts
  compared to PSet 1-3.
- *Skim through section 8 of Poonen* before Thursday and Friday lecture and thank me after.
  If you're seeing this stuff for the first time,
  it'll be almost impossible to keep up without pre-reading.

= Recitation problems from official course

/ 1: (Example 10 from 12.5 of EP) A ball is thrown in the air from the origin
  in $x y z$-space. The initial velocity of the ball is
  $upright(bold(v)) (0) = 80 upright(bold(j)) + 80 upright(bold(k))$,
  measured in feet per second. The spin of the ball causes acceleration in
  the $x$-direction in addition to gravitational acceleration downward in
  the $z$-direction. The acceleration is constant:
  $ upright(bold(a)) (t) = 2 upright(bold(i)) - 32 upright(bold(k)) . $
  Find $upright(bold(v)) (t)$ and $upright(bold(r)) (t)$. What is the
  speed of the ball when it hits the ground?

/ 2: Suppose a particle moves along trajectory
  $upright(bold(r)) (t) = chevron.l t^2 , t^3 chevron.r$ where $0 lt.eq t lt.eq 2$.
  Calculate the total distance travelled by the particle. Do the same for
  the trajectory $upright(bold(r)) (t) = chevron.l 2 cos (3 t) , 2 sin (3 t) chevron.r$,
  $0 lt.eq t lt.eq 2 pi$. In the second case, compare this with the length
  of the curve on the $x y$-plane.

/ 3a: Show that a particle moves at constant speed if and only if its
  velocity vector and acceleration vector are always perpendicular.

/ 3b: (from lecture) Suppose that the position vector and acceleration
  vector are always proportional to each other; show that
  $upright(bold(r)) (t) times upright(bold(v)) (t)$ is a constant
  vector.
