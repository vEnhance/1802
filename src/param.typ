#import "@local/evan:1.0.0":*

= Parametric equations <ch-param>

== [TEXT] Multivariate domains vs multivariate codomains

In 18.01, you did calculus on functions $F : RR -> RR$.
So "multivariable calculus" could mean one of two things to start:

- Work with $F : RR -> RR^n$ instead (i.e. make the codomain multivariate).
- Work with $F : RR^n -> RR$ instead (i.e. make the domain multivariate).

What you should know now is *the first thing is WAY easier than the second*.
This Part Delta is thus really short.

== [TEXT] Parametric pictures

From now on, we're going to usually change notation
$ bf(r) : RR &-> RR^n \
  bf(r)(t) &= vec("function in " t, dots.v, "function in " t). $
The choice of letter $t$ for the input variable usually means "time";
and we use $bf(r)$ for the function name to remind that the output is a vector.
A cartoon of this is shown in @fig-param-timeline.

#typesig[
  When you see $bf(r)(t)$ or similar notation,
  the time variable $t$ has type scalar.
  The output is in $RR^n$, and depending on context,
  you can think of it as either a point or a vector.
]

#figure(
  image("figures/param-timeline.svg", width: auto),
  caption: [We think of $bf(r)(t)$ as using a timeline in some variable $t$
    to trace out a path of some sort in $RR^n$.],
) <fig-param-timeline>


#warning(title: [Warning: $bf(r)(t)$ can be drawn as either a dot or arrow,
  but we still use vector notation anyway in Part Delta])[
  Unfortunately, even in cases where we think of $bf(r)(t)$ as a point like $(3,5)$,
  we still use boldface letter $bf(r)$ and write $vec(3,5)$.
  Type enthusiasts may rightfully object to this,
  but this is so entrenched that it will cause confusion with other sources
  if I'm too pedantic.

  So, don't worry too much about the difference between dot and arrow in this chapter.
  Throughout all of Part Delta we will not treat $(3,5)$ and $vec(3,5)$ as different.
]

If you're drawing a picture of a parametric function,
usually all the axes are components of $bf(r)(t)$ and the time variable doesn't have an axis.
In other words, in the picture, *all the axis variables are output components,
and we treat them all with equal respect*.
The input time variable doesn't show up at all.
(This is in contrast to 18.01 $x y$-graphs, where one axis was input and one axis was output.
In the next section when we talk about _level curves_,
it will be the other way around, where the output variable is anonymous
and every axis is an input variable we treat with equal respect.)

#example[
  The classic example
  $ bf(r)(t) = vec(cos(t), sin(t)) $
  would be drawn as the unit circle.
  You can imagine a particle starting at $bf(r)(0) = vec(1,0)$ and then moving around
  the unit circle counterclockwise with constant speed.
  It completes a full revolution in $2 pi$ time: $bf(r)(2 pi) = vec(1,0)$.
]

== [TEXT] Just always use components

Why is $bf(r) : RR -> RR^n$ so easy that Part Delta is one chapter?
Because there's pretty much only one thing you need to ever do:
#idea[
  TLDR Just always use components.
]
That is, if $bf(r) : RR -> RR^3$ (say), basically 90%+ of the time what you do is write
$ bf(r)(t) = chevron.l x(t), y(t), z(t) chevron.r
  = x(t) ee_1 + y(t) ee_2 + z(t) ee_3 $
and then just do single-variable calculus or calculations on each $f_i$.

- Need to differentiate $bf(r)$? Differentiate each component.
- Need to integrate $bf(r)$? Integrate each component.
- Need the absolute value of $bf(r)$? Square root of sum of squares of components.

And so on. An example of Evan failing to do this is shown in @fig-brainfart.

#figure(
  rect[#image("media/brainfart.png", width: 95%)],
  caption: [Seriously, just do everything componentwise.],
) <fig-brainfart>

== [RECIPE] Parametric things

I'll write this recipe with two variables, but it works equally well for three.
Suppose you're given an equation $bf(r)(t) = vec(x(t), y(t))$.
There are some things you could be asked:

#recipe(title: [Recipe/definitions for parametric stuff])[
  - The *velocity vector* at a time $t$ is defined as the derivative $ bf(r)'(t) = vec(x'(t), y'(t)). $
  - The *speed* at a time $t$ is defined as the absolute value of the velocity:
    $ |bf(r')(t)| = sqrt(x'(t)^2 + y'(t)^2). $
  - The *acceleration vector* at a time $t$ is defined as the second derivative
    of each component: $ bf(r)''(t) = vec(x''(t), y''(t)). $
  For three-variable $bf(r)(t) = chevron.l x(t), y(t), z(t) chevron.r$, do the same thing with three components.
]
I don't know if there's a word for the absolute value of the acceleration vector
(the way speed is the absolute value of the velocity vector).

One more thing to mention now:
#recipe(title: [Recipe/definition for arc length])[
  The *arc length* from time $t_"start"$ to $t_"stop"$ is defined as the integral of the speed:
  $ "arc length" = integral_(t="start time")^("stop time") |bf(r)'(t)| dif t. $
]
(Technically, I should use "definition" boxes rather than "recipe" boxes here,
since these are really the _definition_ of the terms involved,
and the recipes are "use the definition verbatim".)

#typesig[
  - Velocity $bf(r)'(t)$ and acceleration $bf(r)''(t)$, are vectors.
    In these cases, you should _always_ draw them as arrows (vectors) rather than dots.
    That is, you should never draw velocity or acceleration as a dot.

  - However, speed $|bf(r)'(t)|$ and arc length are scalars (numbers).
]

#sample[
  Let $ bf(r)(t) = vec(cos(t), sin(t)). $
  Calculate:

  - The velocity vector at time $t = pi/3$.
  - The speed at time $t = pi/3$.
  - The acceleration vector at time $t = pi / 3$.
  - The arc length from $t = 0$ to $t = pi / 3$.
]
#soln[
Let $bf(r) (t) = vec(cos (t) , sin (t))$.
We will compute the following quantities.

/ Velocity vector at $t = pi / 3$:
  The velocity vector is the derivative of the position vector
  $bf(r) (t)$ with respect to $t$:
  $ bf(v) (t) = bf(r)' (t) = vec(- sin (t) , cos (t)) . $
  At $t = pi / 3$, we have:
  $ bf(v) (pi / 3) = vec(- sin (pi / 3) , cos (pi / 3)) = vec(- sqrt(3) / 2 , 1 / 2) . $
  Thus, the velocity vector at $t = pi / 3$ is:
  $ bf(v) (pi / 3) = vec(- sqrt(3) / 2 , 1 / 2) . $
/ Speed at $t = pi / 3$:
  The speed is the magnitude of the velocity vector:
  $ lr(|bf(v) (t)|) = sqrt((- sin (t))^2 + (cos (t))^2) = sqrt(sin^2 (t) + cos^2 (t)) = 1 . $
  Thus, the speed at $t = pi / 3$ (or in fact any time) is:
  $ lr(|bf(v) (pi / 3)|) = 1 . $
/ Acceleration vector at $t = pi / 3$:
  Differentiate the velocity vector we got earlier:
  $ bf(a) (t) = bf(v)' (t) = vec(- cos (t) , - sin (t)) . $
  At $t = pi / 3$, we have:
  $ bf(a) (pi / 3) = vec(- cos (pi / 3) , - sin (pi / 3)) = vec(- 1 / 2 , - sqrt(3) / 2) . $
  Thus, the acceleration vector at $t = pi / 3$ is:
  $ bf(a) (pi / 3) = vec(- 1 / 2 , - sqrt(3) / 2) . $
/ Arc length:
  The arc length of a parametric curve is given by:
  $ L = integral_0^(pi / 3) lr(|bf(r)' (t)|) dif t = integral_0^(pi / 3) 1 dif t = pi / 3 . $
  Thus, the arc length from $t = 0$ to $t = pi / 3$ is:
  $ L = pi / 3. #qedhere $
]

== [TEXT] Constant velocity and angular velocity

In 18.02, we will see some complicated trajectories
which are actually the sum of two simpler ones.
So we start by describing some examples of simple trajectories in this section;
then in the next section we start adding some of them together.

Constant velocity is easy:
if you have a point that starts from a point $A_0$ and
moves in a straight line with velocity $bf(v)$,
then the parametrization is $ bf(A)(t) = A_0 + t bf(v). $

#sample[
  A point $P$ starts at $(1,2,3)$ and moves with constant velocity $5$ in the $+x$ direction.
  Parametrize the position $bf(P)(t)$.
]
#soln[
  Just write
  $ bf(P)(t) = vec(1,2,3) + t vec(5,0,0) = vec(5t+1, 2, 3). #qedhere $
]

Rotation is actually also pretty simple,
but it uses the term "angular velocity" instead.
If you haven't seen the term angular velocity, we describe it now.
#definition[
  An object is said to have _angular velocity_ $omega$
  if it rotates at a rate of $omega$ radians per unit time.
  For example, an angular velocity of "$10 pi$ per second"
  means the object completes five rotations (of $2 pi$ radians each) every second.
]

Suppose a point $P$ moves in a circle of radius $r$ around $(0,0)$
with constant angular velocity $omega$.
Then the point can always be written as
$ (r cos(theta), r sin(theta)) $
for some angle $theta$ that varies with $t$.
A counterclockwise angular velocity corresponds to $theta$
increasing by $omega$ per unit time
(hence the angle at time $t$ is $theta + t omega$);
clockwise is decreasing by $omega$ per unit time instead
(hence the angle at time $t$ is $theta - t omega$).
See @fig-angular.

#figure(
  image("figures/param-angular.svg", width: auto),
  caption: [Rotation of a point with constant angular velocity.],
) <fig-angular>

#recipe(title: [Recipe for motion with constant angular velocity])[

  1. Find the initial angle $theta_0$ corresponding to the position at time $t = 0$.
  2. If the motion is counterclockwise, output
    $ bf(P)(t) = vec(r cos(theta_0 + omega t), r sin(theta_0 + omega t)). $
    If it's clockwise instead output
    $ bf(P)(t) = vec(r cos(theta_0 - omega t), r sin(theta_0 - omega t)). $
    (Note the change from $+$ to $-$.)
]


#sample[
  A point $P$ moves along a circle $x^2+y^2=4$ of radius $2$ centered at $(0,0)$.
  It starts at $(sqrt(3), 1)$ and moves clockwise with angular velocity $omega$.
  Parametrize the position $bf(P)(t)$.
]
#soln[
  The point starts at a $pi/6 = 30 degree$ angle.
  So
  $ bf(P)(t) = vec(2cos(pi/6 - omega t), 2sin(pi / 6 - omega t)). $
  Note that when $t = 0$ this indeed gives the starting point we originally had.
]

== [RECIPE] Finding the parametrization of complicated-looking trajectories by adding two simpler ones

Since everything is so mechanical once you have an equation for $bf(r)(t)$,
there's a shape of exam question that comes up in 18.02
where you're given some weird-looking path and need to get its equation $bf(r)(t)$
yourself in order to unlock things like velocity/speed/etc.

Something like 90%+ of the time if the shape is weird it's
because it's the sum of two other vectors and you just add them.
I'll write a recipe just for comedic value:
#recipe(title: [Recipe for decomposing paths as a sum of two things])[
  Suppose $P$ is a point following some weird trajectory.
  To parametrize $bf(P)(t)$, one common approach is:

  1. Find an expression for some other point of interest $Q$, say $bf(Q)(t)$.
  2. Find an expression for $bf(v)(t)$, the vector pointing from $Q$ to $P$.
  3. Output $bf(P)(t) = bf(Q)(t) + bf(v)(t)$.
]

We give a bunch of examples of this to follow.
In this section of the notes only, if $P$ is a point,
I write $bf(P)(t)$ for the corresponding parametric curve.
#tip[
  This section will feel repetitive.
  Pretty much all the examples look the same after a while.
  You have an amusement park ride, or a frisbee, or a planet rotating or something,
  or a wheel rolling some way or other...
  they're all thin flavor-text on the exact same thing over and over.
]

Okay, here are some examples.

#figure(
  image("figures/param-frisbee.svg", width: auto),
  caption: [Spinning frisbee.],
) <fig-param-frisbee>

#sample[
  A frisbee has the shape of a circle of radius $r$, and one point $P$
  on the edge of the frisbee is marked.
  It’s spinning in a circular motion with angular velocity $omega$ counterclockwise
  and radius $r$ about its center,
  while simultaneously moving in a straight line with constant
  velocity $vec(v_x , v_y)$ in the plane.
  The frisbee initially starts at $(0 , 0)$ with the marked point at $(0 , r)$.

  Parametrize the position of the marked point $bf(P)(t)$
  on the edge of the frisbee as a function of time.
  (See @fig-param-frisbee.)
]

#soln[
  The frisbee is moving with constant velocity $vec(v_x , v_y)$.

  1. The position of the center of the frisbee as a function of time is:
    $ bf(O) (t) = vec(v_x t , v_y t) . $
    This gives the trajectory of the center of the frisbee in the plane.

  2. The frisbee is also rotating about its center with angular velocity
    $omega$. The marked point on the edge of the frisbee follows a circular
    path around the center of the frisbee with radius $r$.

    Since the marked point starts at $(0 , r)$ at $t = 0$, its rotational
    motion around the center can be described parametrically as:
    $ bf(v) (t) = vec(r cos(pi / 2 + omega t), r sin(pi / 2 + omega t))
      = vec(- r sin (omega t) , r cos (omega t)) . $
    Here, $omega$ is the angular velocity (in radians per second), and the
    sine and cosine terms describe the counterclockwise circular motion of
    the marked point around the center.
    (Note for $t = 0$ we get $vec(0, r)$ which is what we want.)

  3. To find the total position of the marked point as a function of time, we
    need to combine the translational motion of the frisbee’s center
    $bf(O) (t)$ with the rotational motion $bf(v) (t)$.
    Thus, the position of the marked point at time $t$ is the sum of the two:
    $ bf(P) (t) = bf(O) (t) + bf(v) (t) . $

    Substituting the expressions for $bf(O) (t)$ and $bf(v) (t)$, we get:
    $ bf(P) (t) = vec(v_x t , v_y t) + vec(- r sin (omega t) , r cos (omega t)) . $
  Simplifying, we have:
  $ bf(P) (t) = vec(v_x t - r sin (omega t) , v_y t + r cos (omega t)) . #qedhere $
]

#sample[
  A planet orbits the sun in a circular path with radius $R_s$ and _counterclockwise_ angular velocity $omega_s$.
  A moon orbits the planet in a circular path with radius $R_m$ and _clockwise_ angular velocity $omega_m$.
  Parametrize the motion $bf(M)(t)$ of the moon relative to the sun,
  assuming the sun is at the origin, the planet starts at $(R_s , 0)$,
  and the moon starts at $(R_s , -R_m)$.
  (See @fig-param-planet.)
]

#figure(
  image("figures/param-planet.svg", width: auto),
  caption: [A planet orbits a moon in circular motion.
    (In real life, I think they're probably ellipses and not circles.)],
) <fig-param-planet>

#soln[
  1. The planet moves in a counterclockwise orbit around the sun with radius
    $R_s$ and angular velocity $omega_s$. The position of the planet as a
    function of time is:
    $ bf(P) (t) = vec(R_s cos (omega_s t) , R_s sin (omega_s t))  $
    since the planet starts due east of the sun and spins counterclockwise.
    This describes a counterclockwise circular motion of the planet with
    period $(2 pi) / (omega_s)$.

  2. Since the moon is orbiting the planet clockwise, the direction of its
    motion is reversed compared to the planet’s orbit. The moon starts at
    $chevron.l 0 , - R_m chevron.r$ relative to the planet (due south)
    and moves with angular velocity $omega_m$.

    The position of the moon relative to the planet, moving clockwise, is
    given by:
    $ bf(v) (t) = vec(R_m cos (3 pi / 2 - omega_m t) , R_m sin (3 pi / 2 - omega_m t))
      = vec(- R_m sin (omega_m t) , - R_m cos (omega_m t)) . $
    This describes the clockwise motion of the moon around the planet.

  3. To find the total position of the moon relative to the sun, we combine
    the position of the planet $bf(P) (t)$ and the moon’s
    position relative to the planet
    $bf(v) (t)$. Thus, the position of the
    moon relative to the sun is:
    $ bf(M) (t) = bf(P) (t) + bf(v) (t) . $
    Substituting the expressions for $bf(P) (t)$ and
    $bf(v) (t)$, we get:
    $ bf(M) (t) = vec(R_s cos (omega_s t) , R_s sin (omega_s t)) + vec(- R_m sin (omega_m t) , - R_m cos (omega_m t)) . $
  Simplifying, we have:
  $ bf(M) (t) = vec(R_s cos (omega_s t) - R_m sin (omega_m t) , R_s sin (omega_s t) - R_m cos (omega_m t)). #qedhere $
]

#sample[
  A wheel of radius $r$ starts centered at $(0,r)$
  and moves in the $+x$ direction with constant speed $v$.
  Let $P$ be a point on the rim of the wheel initially at $(0,0)$.
  Parametrize the trajectory of the point $bf(P)(t)$.
  (A picture is shown in @fig-cycloid.)
]

#figure(
  image("figures/param-cycloid.svg", width: auto),
  caption: [The cycloid formed as the wheel rolls to the right.],
) <fig-cycloid>

#soln[
  This problem is a little trickier because although it's easy to
  write the motion of the center of the wheel,
  it's not obvious what the angular velocity of the wheel $omega$ should be.
  That will require one idea: write the length of the tire track on the ground in two ways.

  1. Easy step: The wheel rolls along a straight line with constant velocity $v$. The
    position of the center of the wheel at time $t$ is: $ bf(C) (t) = vec(v t , r) . $
    This describes the translational motion of the center of the wheel along
    the horizontal axis.

  2. The tricky part of the problem is determining the angular velocity of the wheel.
    The key idea is to look at the length of the tire track made on the ground.
    See @fig-param-tire-track-cycloid.

    - On the one hand, after time $t$, the length of the tire track is
      $ L_("tire track") = v t $
      because the wheel covers that much distance on the ground.
      This is drawn in brown on @fig-param-tire-track-cycloid.

    - On the other hand, after time $t$ the length of the tire track should also be
      $ L_("tire track") = omega t dot r. $
      (It might be more natural for some of you if I write this as
      $((omega t) / (2 pi)) dot (2 pi r)$ instead,
      because $(omega t) / (2 pi)$ is the number of full rotations made,
      while $2 pi r$ is the total circumference of the wheel.)
      This is drawn in dark blue in @fig-param-tire-track-cycloid.

    #figure(
      image("figures/param-tire-track-cycloid.svg", width: auto),
      caption: [Calculating the length of the tire track on the ground
      in order to determine the angular velocity $omega$.],
    ) <fig-param-tire-track-cycloid>

    Setting $L_("tire track")$ equal in the two expressions gives
    $ v t = omega t dot r ==> omega = v / r. $
    (We now forget about $L_("tire track")$.
    Its only purpose was to give us a way to get our hands on $omega$.)

    Now that we've cleared this hurdle, the rest of the sample question is just like the earlier two.
    The point on the rim starts at the bottom point of the wheel at $t = 0$, due south.
    The rotation of the wheel is clockwise (imagine actually rolling the wheel).
    Therefore, the position of the point on the rim relative to the center of the wheel
    at time $t$ can be parametrized as:
    $ bf(R) (t) = vec(r cos(3 pi / 4 - omega t), r sin(3 pi / 4 - omega t))
      = vec(-r sin (v / r t) , -r cos (v / r t)) . $
    This describes the circular motion of the point on the rim around the
    center of the wheel with radius $r$ and angular velocity $v / r$.

  3. To find the total position of the point on the rim of the wheel, we
    combine the translational motion of the center of the wheel
    $bf(C) (t)$ with the rotational motion of the point on the
    rim $bf(R) (t)$. The total position of the point on the rim
    at time $t$ is:
    $ bf(P) (t) = bf(C) (t) + bf(R) (t) . $
    Substituting the expressions for $bf(C) (t)$ and $bf(R) (t)$, we get:
    $ bf(P) (t) = vec(v t , r) + vec(-r sin (v / r t) , -r cos (v / r t)) . $
  Simplifying, we have:
  $ bf(P) (t) = vec(v t - r sin (v / r t) , r - r cos (v / r t)) . #qedhere $
]

Now that you have parametric equations for each of these,
you can also answer any questions solved by the methods earlier like
"what is the total distance traveled" or "what is the speed at this time" or so on.
Example:

#remark[
  The shape of $bf(P)$ is called a _cycloid_, and it's shown in @fig-cycloid.
  The shape looks quite scary!
  However, you don't actually need to know anything about the shape
  to compute things like the arc length (see next sample question).
  The geometry picture is only used to extract the algebraic expression of $bf(P)(t)$.
  After that, you can just forget about the picture
  and do calculus on the expression you extracted.
]

Let's see this.
#sample[
  A wheel of radius $1$ starts centered at $(0,1)$
  and moves in the $+x$ direction with constant speed $1$.
  Let $P$ be a point on the rim of the wheel initially at $(0,0)$.
  Compute the total arc length of the trajectory of the point $P$
  from time $t = 0$ to $t = 2 pi$.
]
#soln[
  We just got the general equation
  $ bf(P) (t) = vec(v t - r sin (v / r t) , r - r cos (v / r t)) $
  for a cycloid.
  For $v = 1$ and $r = 1$ this is
  $ bf(P) (t) = vec(t - sin (t) , 1 - cos (t)). $
  We differentiate to get the velocity vector
  $ bf(P)' (t) = vec(1 - cos (t) , sin (t)). $
  Ergo, the arc length is given by the formula
  $ L = int_0^(2pi) sqrt((1-cos(t))^2 + sin(t)^2) dif t. $

  This is now an 18.01 integral question.
  In this particular case, the square root can be simplified using trig calculation.
  We can expand the terms inside the square root:
  $ (1 - cos (t))^2 + sin^2 (t) = 1 - 2 cos (t) + cos^2 (t) + sin^2 (t) . $
  Using the identity $sin^2 (t) + cos^2 (t) = 1$, this simplifies to:
  $ 1 - 2 cos (t) + 1 = 2 - 2 cos (t) . $
  The trick is to use the half-angle formula to convert this to
  $ 1 - cos(t) = 2sin^2(t/2) ==> sqrt(2 - 2 cos(t)) = sqrt(4sin^2(t/2)) = lr(|2 sin(t/2)|). $
  Hence, the integral now becomes:
  $ L = int_0^(2 pi) sqrt(2 (1 - cos (t))) dif t
    = int_0^(2 pi) lr(|2 sin(t/2)|) dif t. $
  Over the interval $0 <= t <= 2 pi$ we always have $sin(t/2) >= 0$,
  so we drop the absolute value:
  $ L = int_0^(2 pi) 2 sin(t/2) dif t = lr([-4cos(t/2)])_0^(2pi)
    = -4cos(pi) + 4cos(0) = 8. #qedhere $
]

== [TEXT] Parametrizations with flexible time <sec-flex-param>

Sometimes you'll be asked to parametrize some path but not required to follow an exact time.
(This happens a lot in @ch-work, when we introduce work integrals.)
In that case, you're welcome to pick any parametrization that traces out the requested path,
even the start and end time.
Usually the strategy is to pick one that makes subsequent calculation easier.

#sample[
  Let $cal(C)$ be the line segment starting at $(0,0,0)$ and ending at $(100, 200, 300)$.
  Give any parametrization $bf(r)(t)$ for $cal(C)$.
]
#soln[
  The parametrization should start at $(0,0,0)$, end at $(100, 200, 300)$
  and pass through the segment.
  A snapshot of some examples points on its trajectory are
  $ (0,0,0) --> (1,2,3) --> (10, 20, 30) --> (50, 100, 150) --> (100, 200, 300) $
  among many others (like $(8pi, 16pi, 24pi)$, etc.).
  Anyway, all the following are acceptable parametrizations:

  - $bf(r)(t) = (t, 2t, 3t)$ for $0 <= t <= 100$
  - $bf(r)(t) = (100t, 200t, 300t)$ for $0 <= t <= 1$
  - $bf(r)(t) = (100t^7, 200t^7, 300t^7)$ for $0 <= t <= 1$,
    if you enjoy making life hard for yourself.

  Again, this is easiest to internalize by example:
  in the first one, try writing down the location of the point
  at $t = 0$, $t = 1$, $t = 2$, ..., $t = 100$
  and verify that it's tracing out the correct thing.

  In practice most people would prefer to work with the first or second one.
]

#sample[
  Let $cal(C)$ be the line segment starting at $(7,8,9)$ and ending at $(107, 208, 309)$.
  Give any parametrization $bf(r)(t)$ for $cal(C)$.
]
#soln[
  For example, the parametrization should start at $(7,8,9)$, end at $(107, 208, 309)$.
  Some examples of points along the path:
  $ (7,8,9) --> (8,10,12) --> (17, 28, 39) --> (57, 108, 159) --> (107, 208, 309). $
  So all the following are examples of acceptable parametrizations:

  - $bf(r)(t) = (t+7, 2t+8, 3t+9)$ for $0 <= t <= 100$
  - $bf(r)(t) = (100t+7, 200t+8, 300t+9)$ for $0 <= t <= 1$
  - $bf(r)(t) = (100sin(t)+7, 200sin(t)+8, 300sin(t)+9)$ for $0 <= t <= pi/2$,
    if you really like trig functions.

  I recommend the first one.
]

#sample[
  Let $cal(C)$ denote the arc of the parabola $y = x^2$ starting from $(-1,1)$
  and moving right to $(1,1)$.
  Give any parametrization $bf(r)(t)$ for $cal(C)$.
]
#soln[
  Just to make things concrete, examples of points we expect to pass through in our path are
  $ (-1,1) --> (-1/2, 1/4) --> (-1/3, 1/9) --> (0,0) --> (1/3, 1/9) --> (1/2, 1/4) --> (1,1). $
  All of the following are thus examples:

  - $bf(r)(t) = (t, t^2)$ for $-1 <= t <= 1$. (Yes, negative time is okay!)
  - $bf(r)(t) = (t-1, (t-1)^2)$ for $0 <= t <= 2$
    if you're allergic to negative times.
  - $bf(r)(t) = (2t-1, (2t-1)^2)$ for $0 <= t <= 1$.
  - $bf(r)(t) = (log(t), log(t)^2)$ for $1/e <= t <= e$ if you have nothing better to do with your day.

  I recommend the first one.
]

#sample[
  Let $cal(C)$ be the path traced out by following the parabola $y = x^2 / 10 + 1$
  starting from $(-2,1.4)$ and ending at $(3,1.9)$.
  (See @fig-param-parabola.)
  Give any parametrization $bf(r)(t)$ for $cal(C)$.
]
#figure(
  image("figures/param-parabola.svg", width: auto),
  caption: [Walking along the parabola $y = x^2 / 10 + 1$.
    I recommend the parametrization $bf(r)(t) = (t, t^2/10+1)$ for $-2 <= t <= 3$.],
) <fig-param-parabola>

#soln[
  Examples of points passed through in this trajectory are:
  $ (-3,1.9) --> (-2,1.4) --> (-1, 1.1) --> (0,1) --> (1,1.1) --> (2,1.4) --> (3,1.9). $
  In situations like this where the one coordinate just moves from one end to the other
  along the path, one common strategy is to just use that coordinate as $t$
  and then figure out the other coordinates from there.

  All of the following are examples of acceptable parametrizations:

  - $bf(r)(t) = (t, t^2 / 10 + 1)$ for $-2 <= t <= 3$.
  - $bf(r)(t) = (t-2, (t-2)^2 / 10 + 1)$ for $0 <= t <= 5$ if you're allergic to negative times.
  - $bf(r)(t) = (5t-2, (5t-2)^2 / 10 + 1)$ for $0 <= t <= 1$ if you really like the end time to be $1$.
  - $bf(r)(t) = (5 dot 2^t - 7, (5 dot 2^t - 7)^2 / 10 + 1)$ for $0 <= t <= 1$ if you want to torment graders.

  I think most people in practice would prefer the first one.
]

#sample[
  Let $cal(C)$ be the $120 degree$ arc of the unit circle starting from $(0, -1)$
  and ending at $(sqrt(3)/2, 1/2)$, going counterclockwise.
  (See @fig-param-arc.)
  Give any parametrization $bf(r)(t)$ for $cal(C)$.
]
#figure(
  image("figures/param-circle.svg", width: auto),
  caption: [An $120 degree$ arc of the unit circle parametrized by
    $bf(r)(t) = (cos t, sin t)$ for $-pi/2 <= t <= pi/6$.],
) <fig-param-arc>

#soln[
  All the following are examples of acceptable parametrizations:
  - $bf(r)(t) = (cos t, sin t)$ for $-pi/2 <= t <= pi/6$.
  - $bf(r)(t) = (cos t, sin t)$ for $3/2 pi <= t <= 13/6 pi$,
    if you insist on using nonnegative $t$.
  - $bf(r)(t) = (cos(t + 3/2 pi), sin (t + 3/2 pi))$ for $0 <= t <= 2/3 pi$.
  - $bf(r)(t) = (sqrt(1-t^2), t)$ for $-1 <= t<= 1/2$ (not recommended).

  Again, I recommend the simplest (first) one.
]

== [EXER] Exercises

#exer[
  Compute the arc length of the part of the parabola $y = x^2 - x - 12$
  between $(-3,0)$ and $(4,0)$.

  You will probably need the following antiderivative fact not commonly seen in 18.01:
  $ int sqrt(u^2+1) dif u = u/2 sqrt(u^2+1) + log(u + sqrt(u^2+1))/2 + C. $
] <exer-param-parabola>

#exer[
  At an amusement park, a teacup ride consists of teacups
  rotating clockwise around a fixed center while each individual teacup rotates counterclockwise.
  (See @fig-teacups if you've never seen one of these before.)
  The teacup ride is specified in $RR^2$ as follows:

  - The teacup ride revolves around $(0,0)$ with radius $R$ and
    angular velocity $omega_(upright("ride"))$ _clockwise_.
  - Each individual teacup rotates _counterclockwise_ with angular velocity
    $omega_(upright("cup"))$ and radius $r$.
  - Initially, at $t = 0$, the center of the teacup is at $(R , 0)$, and
    a toddler is positioned at the rightmost point on the edge of the
    teacup relative to its center.

  Compute the _velocity_ vector of the toddler at time $t$.
] <exer-param-teacup>

#figure(
  image("media/teacups.jpg", width: 60%),
  caption: [You know, one of these teacup ride things.
  Image from #link("https://dreamlandamusements.com/carnival-ride-rentals/tea-cups/")[Dreamland Amusements].],
) <fig-teacups>

#exer[
  A helicopter in $RR^3$ is moving upward with constant speed $5$ in the $+z$ direction
  while its rotor blades
  are spinning with _clockwise_ angular velocity $pi /3$
  and radius $2$ in the horizontal plane.
  Let $P$ be a point on the tip of the blade, initially at $(r,0,0)$.

  - Parametrize the motion of a point on the tip of
    one of the blades as a function of time,
    assuming the helicopter starts at height $z = 0$
    and the blade points along the positive $x$-axis at $t = 0$.
  - Calculate the distance traveled by $P$ from time $t = 0$ to time $t = 18$.
] <exer-param-helicopter>

#figure(
  image("figures/param-clockblock.svg", width: auto),
  caption: [The clock problem from the AMC 10A in 2015.],
) <fig-clockblock>

#exerstar[#link("https://aops.com/community/p3734621")[AMC 10A 2015]][
  In @fig-clockblock, there's a circular clock with radius 20 cm
  and a circular disk of radius 10 cm externally tangent at the 12 o'clock position.
  The disk has an arrow painted that points directly up and rolls clockwise.
  At what point on the clock face will the disk be tangent when the arrow
  is next pointing in the upward vertical direction?
] <exer-param-clockblock>
