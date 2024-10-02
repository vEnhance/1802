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
