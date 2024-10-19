#import "@local/evan:1.0.0":*

= Parametric equations

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

#typesig[
  When you see $bf(r)(t)$ or similar notation,
  the time variable $t$ has type scalar, and the output is a vector.
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
  would be drawn as the unit circle circle.
  You can imagine a particle starting at $bf(r)(0) = vec(1,0)$ and then moving around
  the unit circle counterclockwise with constant speed.
  It completes a full revolution in $2 pi$ time: $bf(r)(2 pi) = vec(1,0)$.
]

== [TEXT] Just always use components

Why is $bf(r) : RR -> RR^n$ so easy that Part Delta is one section?
Because there's pretty much only one thing you need to ever do:
#memo[
  TLDR Just always use components.
]
That is, if $bf(r) : RR -> RR^3$ (say), basically 90%+ of the time what you do is write
$ bf(r)(t) = angle.l x(t), y(t), z(t) angle.r
  = x(t) bf(e)_1 + y(t) bf(e)_2 + z(t) bf(e)_3 $
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

#recipe(title: [Recipes for parametric stuff])[
  - To find the *velocity vector* at a time $t$, it's the derivative $ bf(r)'(t) = vec(x'(t), y'(t)). $
  - To find the *speed* at a time $t$, it's the absolute value of the velocity:
  $ |bf(r')(t)| = sqrt(x'(t)^2 + y'(t)^2). $
  - To find the *acceleration vector* at a time $t$, it's the second derivative
    of each component: $ bf(r)''(t) = vec(x''(t), y''(t)). $
]
I don't know if there's a word for the absolute value of the acceleration vector
(the way speed is the absolute value of the velocity vector).

#recipe(title: [Recipe for parametric integration])[
  - To integrate $bf(r)(t)$ between two times, take the integral of each component:
    $ integral_("start time")^("stop time") bf(r)(t) dif t =
    vec(
      integral_("start time")^("stop time") x(t) dif t,
      integral_("start time")^("stop time") y(t) dif t
    ). $
]
#recipe(title: [Recipe for arc length])[
  The *arc length* from time $t_"start"$ to $t_"stop"$ is the integral of the speed:
  $ "arc length" = integral_("start time")^("stop time") |bf(r)'(t)| dif t. $
]
(Technically, I should use "definition" boxes rather than "recipe" boxes here,
since these are really the _definition_ of the terms involved,
and the recipes are "use the definition verbatim".)

#typesig[
  - Velocity $bf(r)'(t)$, acceleration $bf(r)''(t)$, and integrals $integral bf(r)(t) dif t$ are vectors.
  - But speed $|bf(r)'(t)|$ and arc length are scalars.
]

#sample[
  Let $ bf(r)(t) = vec(cos(t), sin(t)). $
  Calculate:

  - The velocity vector at time $t = pi/3$.
  - The speed at time $t = pi/3$.
  - The acceleration vector at time $t = pi / 3$.
  - The integral $ integral_(0)^(pi/3) bf(r)(t) dif t$.
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
/ Integral:
  The integral of $bf(r) (t)$ is computed component-wise:
  $ integral_0^(pi / 3) bf(r) (t) dif t = integral_0^(pi / 3) vec(cos (t) , sin (t)) dif t = vec(integral_0^(pi / 3) cos (t) dif t , integral_0^(pi / 3) sin (t) dif t) . $

  Compute the integrals, using $integral cos(t) dif t = sin(t) + C$
  and $integral sin(t) dif t = cos(t) + C$:
  $ integral_0^(pi / 3) cos (t) dif t = sin (pi / 3) - sin (0) = sqrt(3) / 2 \
  integral_0^(pi / 3) sin (t) dif t = - cos (pi / 3) + cos (0) = - 1 / 2 + 1 = 1 / 2 . $
  Thus, the integral is:
  $ integral_0^(pi / 3) bf(r) (t) dif t = vec(sqrt(3) / 2 , 1 / 2) . $

/ Arc length:
  The arc length of a parametric curve is given by:
  $ L = integral_0^(pi / 3) lr(|bf(r)' (t)|) dif t = integral_0^(pi / 3) 1 dif t = pi / 3 . $
  Thus, the arc length from $t = 0$ to $t = pi / 3$ is:
  $ L = pi / 3. #qedhere $
]

== [TEXT] Constant velocity and angular velocity

#definition[
  An object is said to have _angular velocity_ $omega$
  if it rotates at a rate of $omega$ radians per unit time.
  For example, an angular velocity of "$10 pi$ per second"
  means the object completes five rotations (of $2 pi$ radians each) every second.
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
#todo[draw a figure]

#sample[
  A planet orbits the sun in a circular path with radius $R_s$ and _counterclockwise_ angular velocity $omega_s$.
  A moon orbits the planet in a circular path with radius $R_m$ and _clockwise_ angular velocity $omega_m$.
  Parametrize the motion $bf(M)(t)$ of the moon relative to the sun,
  assuming the sun is at the origin, the planet starts at $(R_s , 0)$,
  and the moon starts at $(R_s , -R_m)$.
]
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
    $angle.l 0 , - R_m angle.r$ relative to the planet (due south)
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
  and moves in the $+x$ direction with posit constant velocity $v$.
  At the same time, a point $P$ on the rim of the wheel
  traces a circular path relative to the center of the wheel starting from $(0, 0)$.
  Parametrize the trajectory of the point $bf(P)(t)$.
]

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

    - On the one hand, after time $t$, the length of the tire track is
      $ L_("tire track") = v t $
      because the wheel covers that much distance on the ground.
    - On the other hand, after time $t$ the length of the tire track should also be
      $ L_("tire track") = omega t dot r. $
      (It might be more natural for some of you if I write this as
      $((omega t) / (2 pi)) dot (2 pi r)$ instead.
      Because $(omega t) / (2 pi)$ is the number of full rotations made;
      while $2 pi r$ is the total circumference of the wheel.)

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

#sample[
  Find the total arc length of the trajectory of the point $P$
  in the previous sample question
  between the time $t = 0$ and $t = 2 pi$.
]
#todo[Write the solution for this]

#remark[
  The shape of $bf(P)$ is called a _cycloid_, and it's shown in Figure.
  The shape looks quite scary!
  However, you don't actually need to know anything about the shape
  to compute things like the arc length, as we just saw.
  The geometry picture is only used to extract the algebraic expression of $bf(P)(t)$.
  After that, you can just forget about the picture
  and do calculus on the expression you extracted.
]

#todo[Draw cycloid, and add figure reference]

== [EXER] Exercises

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
    the toddler is positioned at the rightmost point on the edge of the
    teacup relative to its center.

  Compute the _velocity_ vector of the toddler at time $t$.
] <exer-teacup>

#figure(
  image("media/teacups.jpg", width: 60%),
  caption: [You know, one of these teacup ride things.],
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
] <exer-helicopter>


#figure(
  image("figures/parametric-clockblock.png", width: auto),
  caption: [The clock problem from the AMC 10A in 2015.],
) <fig-clockblock>

#exerstar[AMC 10A Problem 2015][
  In @fig-clockblock, there's a circular clock with radius 20 cm
  and a circular disk of radius 10 cm externally tangent at the 12 o'clock position.
  The disk has an arrow painted that points directly up and rolls clockwise.
  It takes twelve hours for the smaller disk to complete a rotation so that it returns to the top.

  - Find a parametric equation $bf(P)(t)$ for the point at the tip of the arrow at time $t$ in hours.
    Assume the clock is centered at the origin and $bf(P)(0) = (0,30)$.
  - At what point on the clock face will the disk be tangent
    when the arrow is next pointing in the upward vertical direction?
] <exer-clockblock>
