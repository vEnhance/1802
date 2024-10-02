#import "@local/evan:1.0.0":*
#import "@local/svg-emoji:0.1.0": setup-emoji // only if you want to use GH names for emojis
#show: setup-emoji

#show: evan.with(
  title: [Notes for 18.02 Recitation 9],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [1 October 2024],
)

#quote(attribution: [Ars Brevis, by Piet Hein])[
There is \
one art, \
no more, \
no less: \
to do \
all things \
with art- \
lessness. \
]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

= Keep doing everything component-wise

As I promised pretty much nothing happens these lectures
and all you need to do is do everything componentwise.
There's only one additional theorem you should remember that was introduced in lecture:

#theorem[Arc length][
  $ L = integral_("start time")^("stop time") ||bf(v)(t)|| dif t. $
]

Don't worry about Kepler's law.

= Preview of Thursday/Friday's lecture

In R01, I told you something really important that's going to come back again later this week:
_everything you used slopes for before, you should use normal vectors instead_.

This is exactly what's going to happen tomorrow and Friday when Maulik introduces the gradient.
I want to prepare you by writing out the full analogy now:

- In 18.01, when $f : RR -> RR$, you defined a *derivative* $f'(p)$ at each input $p in RR$,
  which you thought of as the *slope* of the *tangent line* at $p$.
- In 18.02, when $f : RR^n -> RR$, you will instead define the *gradient*
  $nabla f(bf(v))$ for each $bf(v) in RR^n$.
  This is thought of as a *normal vector* to the *tangent (hyper)plane* at $bf(v)$.

The type signature is not intuitive, so to spell it out:

- $nabla f$ is a function accepting vectors in $RR^n$ and outputting vectors in $RR^n$,
- $nabla f(bf(v))$ is a vector in $RR^n$.

The *dot product* is going to be really important.
You might have thought it was weird that back in R01 and R02,
every time used the dot product $bf(a) dot bf(b) = |bf(a)| |bf(b)| cos theta$,
there was almost always this "unwanted" absolute value that we would immediately strip off.
But in the gradient, we'll actually use both the absolute values.

Here's how.
- In 18.01, if you know $f(5)$ and $f'(5)$, then $f(5.01) approx f(5) + f'(5) dot 0.01$,
  because we think of $f'(5)$ as a slope ("rise/run") and $0.01$ as the run.
- In 18.02, if you know $f(5,8)$ and $nabla f(5,8)$, then the analogy goes
  $ f(5.01, 7.996) approx f(5,8) + nabla f(5,8) dot angle.l 0.01, -0.004 angle.r. $
  Yes, the dot is a dot product; both $nabla f(5,8)$ and $angle.l 0.01, -0.004 angle.r$
  have type "vector in $RR^2$". This will take a bit of time to get used to.
  I'll draw you a picture next recitation.

To summarize this section.

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Thing], [18.01], [18.02]),
    [Function], [$f: RR -> RR$], [$f: RR^n -> RR$],
    [Differentiate], [$f': RR -> RR$], [$nabla f: RR^n -> RR^n$],
    [Think of as], [Slope (rise/run)], [Gradient],
    [Approximation], [Multiply by run], [Dot product with displacement]
  ),
  kind: table
)

= Advice for this week

- Honestly, just ignore all this parametric stuff until MT2-ish,
  because basically nothing happens (you just do everything component-wise)
  and also it won't be reused until after MT2.
- Start early on PSet 4B, it's long and introduces a lot of new concepts
  compared to PSet 1-3.
- Skim through section 8 of Poonen before this Thursday and Friday lecture and thank me after.
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
  $upright(bold(r)) (t) = angle.l t^2 , t^3 angle.r$ where $0 lt.eq t lt.eq 2$.
  Calculate the total distance travelled by the particle. Do the same for
  the trajectory $upright(bold(r)) (t) = angle.l 2 cos (3 t) , 2 sin (3 t) angle.r$,
  $0 lt.eq t lt.eq 2 pi$. In the second case, compare this with the length
  of the curve on the $x y$-plane.

/ 3a: Show that a particle moves at constant speed if and only if its
  velocity vector and acceleration vector are always perpendicular.

/ 3b: (from lecture) Suppose that the position vector and acceleration
  vector are always proportional to each other; show that
  $upright(bold(r)) (t) times upright(bold(v)) (t)$ is a constant
  vector.
