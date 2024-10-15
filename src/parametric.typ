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

Why is $bf(r) : RR -> RR^n$ so much easier?
Because there's pretty much only one thing you need to ever do:
#memo[
  *TLDR Just always use components.*
]
That is, if $bf(r) : RR -> RR^3$ (say), basically 90%+ of the time what you do is write
$ bf(r)(t) = angle.l x(t), y(t), z(t) angle.r
  = x(t) bf(e)_1 + y(t) bf(e)_2 + z(t) bf(e)_3 $
and then just do single-variable calculus or calculations on each $f_i$.

- Need to differentiate $bf(r)$? Differentiate each component.
- Need to integrate $bf(r)$? Integrate each component.
- Need the absolute value of $bf(r)$? Square root of sum of squares of components. And so on.

An example of Evan failing to do this is shown in @fig-brainfart.

#figure(
  image("media/brainfart.png", width: 95%),
  caption: [Seriously, just do everything componentwise.],
) <fig-brainfart>

== [RECIPE] Parametric things

I'll write this recipe with two variables, but it works equally well for three.
#recipe(title: [Recipes for parametric stuff])[
  Suppose you're given an equation $bf(r)(t) = vec(x(t), y(t))$.
  There are some things you could be asked:

  - To find the *velocity vector* at a time $t$, it's the derivative $ bf(r)'(t) = vec(x'(t), y'(t)). $
  - To find the *speed* at a time $t$, it's the absolute value of the velocity:
  $ |bf(r')(t)| = sqrt(x'(t)^2 + y'(t)^2). $
  - To find the *acceleration vector* at a time $t$, it's the second derivative
    of each component: $ bf(r)''(t) = vec(x''(t), y''(t)). $
]
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

== [TEXT] Adding two vectors

Since everything is so mechanical once you have an equation for $bf(r)(t)$,
there's a shape of exam question that comes up in 18.02
where you're given some weird-looking path and need to get its equation
in order to unlock things like velocity/speed/etc.

Something like 90%+ of the time if the shape is weird it's
because it's the sum of two other vectors and you just add them.

The cycloid you saw in class was one hard-ish example of this.
The curve looked scary.
But you just ignore the shape, and just think about the equation
$ bf(r)(t) = angle.l t v , a angle.r + angle.l a cos theta(t), a sin theta(t) angle.r. $
Working out the angle is a bit annoying;
but the point is no calculus or theory is involved, just work out the geometry.
Then when you want the velocity, just differentiate $bf(r)(t)$, and so on.

#todo[flesh this section out]

== [TEXT] Eliminating the parameter $t$

For two-dimensional parametric pictures,
the other shape of question that occasionally pops up is to get rid of $t$.

#todo[flesh this section out]
