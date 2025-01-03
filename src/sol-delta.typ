#import "@local/evan:1.0.0":*

= Solutions to Part Delta

== Solution to @exer-param-parabola (parabola arc length)

#recall-thm(<exer-param-parabola>)

We take the parametrization
$ bf(r)(t) = (t, t^2-t-12) quad -3 <= t <= 4. $
The derivative is
$ bf(r)'(t) = angle.l 1, 2t-1 angle.r quad -3 <= t <= 4. $
Hence, the arc length in the problem is given by
$ L = int_(t=-3)^4 sqrt(1 + (2t-1)^2) dif t. $

To use the hint in the exercise,
we perform the $u$-substitution
$ u = 2t-1 = 2 (t - 1 / 2) ==> dif u = 2 dif t ==> dif t = (d u) / (2). $
When $t=-3$ we get $u=-7$ and when $t=4$ we get $u=7$.
Thus we get
$ L = 1/2 int_(u=-7)^7 sqrt(u^2+1) dif u. $
Now using the hint we get that
$ L &= 1/4 [u sqrt(u^2+1) + log(u + sqrt(u^2+1))]_(u=-7)^7 \
  &=  1/4 (14 sqrt(50) + log(7 + sqrt(50)) - log(-7 + sqrt(50)))) \
  &= 35/2 sqrt(2) + 1/4 log((7 + 5 sqrt(2)) / (-7 + 5 sqrt(2))) \
  &= 35/2 sqrt(2) + 1/4 log((7 + 5 sqrt(2))^2 / ((7 + 5 sqrt(2))(-7 + 5 sqrt(2)))) \
  &= 35/2 sqrt(2) + 1/4 log((7 + 5 sqrt(2))^2) \
  &= #boxed[$ 35/2 sqrt(2) + 1/2 log(7 + 5 sqrt(2)) $]. $

== Solution to @exer-param-teacup (teacups)

#recall-thm(<exer-param-teacup>)

We will first parametrize the motion of the toddler and then compute the
distance traveled after one full revolution of the ride.

1. The teacup center rotates clockwise with angular velocity
  $omega_(upright("ride"))$ in a circular path of radius $R$ around a
  fixed center. The position of the teacup center as a function of time
  $t$ is:
  $ bf(C) (t) = vec(R cos (omega_(upright("ride")) t) , - R sin (omega_(upright("ride")) t)) . $
  This describes the circular motion of the teacup center around the fixed
  center of the ride, with the negative sign on the sine term indicating
  clockwise rotation.

2. The toddler is sitting on the edge of the teacup, which rotates
  counterclockwise with angular velocity $omega_(upright("cup"))$ and
  radius $r$. Initially, at $t = 0$, the toddler is positioned at
  $(r , 0)$ relative to the center of the teacup. The position of the
  toddler relative to the center of the teacup is:
  $ bf(T)_(upright("relative")) (t) = vec(r cos (omega_(upright("cup")) t) , r sin (omega_(upright("cup")) t)) . $
  This describes the counterclockwise circular motion of the toddler
  relative to the center of the teacup.

3. To find the total position of the toddler as a function of time, we sum
  the position of the teacup center $bf(C) (t)$ and the
  position of the toddler relative to the teacup
  $bf(T)_(upright("relative")) (t)$. The total position of the
  toddler is:
  $ bf(T) (t) = bf(C) (t) + bf(T)_(upright("relative")) (t) . $
  Substituting the expressions for $bf(C) (t)$ and
  $bf(T)_(upright("relative")) (t)$, we get:
  $ bf(T) (t) = vec(R cos (omega_(upright("ride")) t) , - R sin (omega_(upright("ride")) t)) + vec(r cos (omega_(upright("cup")) t) , r sin (omega_(upright("cup")) t)) . $
  Simplifying, we have:
  $ bf(T) (t) = vec(R cos (omega_(upright("ride")) t) + r cos (omega_(upright("cup")) t) , - R sin (omega_(upright("ride")) t) + r sin (omega_(upright("cup")) t)) . $
  This gives the parametrization of the toddler’s position as a function
  of time.

The velocity vector $bf(T)' (t)$ is the derivative of the
position vector $bf(T) (t)$ with respect to time:
$ #boxed[$ bf(T)' (t) =
  vec(- R omega_(upright("ride")) sin (omega_(upright("ride")) t)
  - r omega_(upright("cup")) sin (omega_(upright("cup")) t),
  - R omega_(upright("ride")) cos (omega_(upright("ride")) t)
  + r omega_(upright("cup")) cos (omega_(upright("cup")) t)) $] . $

== Solution to @exer-param-helicopter (helicopter)

#recall-thm(<exer-param-helicopter>)

Let's first parametrize $bf(P)(t)$:
1. Since the helicopter is moving upward with constant speed $v = 5$, the
  height of the helicopter at time $t$ is given by:
  $ z (t) = v t = 5 t . $
2. The point $P$ is on the tip of the rotor blade, which is spinning
  clockwise with angular velocity $omega = pi / 3$. In the horizontal
  plane, the position of $P$ relative to the center of the rotor can be
  parametrized as:
  $ bf(v) (t) = vec(r cos (omega t) , - r sin (omega t)) , $
  where $r = 2$ is the radius of the blade, and the negative sign in the
  $y$-coordinate reflects the clockwise rotation.
  Thus, the position of $P$ in the $x y$-plane is:
  $ bf(v) (t) = vec(2 cos (pi / 3 t) , - 2 sin (pi / 3 t)) . $
3. The total position of the point $P$ as a function of time is the
  combination of the upward motion in the $z$-direction and the rotational
  motion in the $x y$-plane. Thus, the position of $P$ is:
  $ #boxed[$ bf(P) (t) = vec(2 cos (pi / 3 t) , - 2 sin (pi / 3 t) , 5 t) $]. $

As for the distance, we first compute the velocity vector by differentiating:
$ bf(P)' (t) &= (d) / (dif t) vec(2 cos (pi / 3 t) , - 2 sin (pi / 3 t) , 5 t)
  = vec(- (2 pi) / (3) sin (pi / 3 t) , - (2 pi) / (3) cos (pi / 3 t) , 5) . $
The speed is the magnitude of the velocity vector:
$ lr(|bf(P)' (t)|) = sqrt((- (2 pi) / (3) sin (pi / 3 t))^2 + (- (2 pi) / (3) cos (pi / 3 t))^2 + 5^2) . $
Using the trigonometric identity $sin^2 (theta) + cos^2 (theta) = 1$,
this simplifies to:
$ lr(|bf(P)' (t)|) &= sqrt(((2 pi) / (3))^2 + 5^2) = sqrt((4 pi^2) / (9) + 25) \
  &= sqrt((4 pi^2) / (9) + 225 / 9) = sqrt((4 pi^2 + 225) / (9)) = sqrt(4 pi^2 + 225) / 3 $
which is a constant!
Hence the total distance traveled is simply
$ upright("Distance") = int_0^(18) sqrt(4 pi^2 + 225) / 3 dif t
  = 18 dot sqrt(4 pi^2 + 225) / 3  = #boxed[$ 6 sqrt(4 pi^2 + 225) $]. $

== Solution to @exer-param-clockblock (clock)

#recall-thm(<exer-param-clockblock>)

The answer is $#boxed[4 o'clock]$!
In other words, the red circle makes _three_ complete revolutions
around the blue circle when it goes all the way around.

This is a variation on what's called the _coin rotation paradox_
(see #link("https://w.wiki/CBUS")[Wikipedia]) where $R = 20$ and $r = 10$.
See the description there for details and an animation.
