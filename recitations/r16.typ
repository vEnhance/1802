#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Notes for 18.02 Recitation 16],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [4 November 2024],
)


#quote(attribution: [Joy to Anxiety in Inside Out 2])[
  You don't get to choose who Riley is. Anxiety, you need to let her go.]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

= Announcements

- My LAMV notes should be basically complete up to midterm 3 now.
  - I encourage you to read Part Golf and Part Hotel up to 2D flux.
  - Section 16, "anti-gradient", is also relevant.
    It was retroactively added to Part Echo.
- I will have *extra office hours* today at
  - 3:30pm-4:00pm in 2-131
  - 4:00pm-5:00pm in 2-135.
- The *mock midterm 3* is scheduled for *Wed Nov 13, 6pm-8pm, in 1-190*.
  Email me if you want to try the problems early.

= Shorthands introduced thus far

In $RR^2$, suppose $bf(F)(x,y) = vec(p(x,y), q(x,y))$.
Let path $bf(r) : RR -> RR^n$ trace out a curve $cal(C)$.
All of the following notations mean the same thing:
$ int_(t="start time")^("stop time") bf(F)(bf(r)(t)) dot bf(r)'(t) dif t
  = int_(cal(C)) bf(F) dot dif bf(r) = int_(cal(C)) (p dif x + q dif y). $
These are called the *work* of $bf(F)$ on $cal(C)$, aka the *line integral*.
The work is a scalar quantity (there is a dot product inside the integrand, so it returns a number).

= Computing line integrals in general

#recipe(title: [Recipe for computing line integrals in general])[
  Suppose we want to evaluate $ int_(cal(C)) bf(F) dot dif bf(r)$.

  1. First, check if the vector field is conservative
    by seeing if the curl is zero.
    - If so, don't bother parametrizing $cal(C)$.
      Find a potential function $f$ for the vector field $bf(F)$
      and use the FTC as a shortcut.
  2. *Not yet covered in class*: If $cal(C)$ is a closed loop in $RR^2$, use Green's theorem instead.
  3. If both of these fail, fall back to the parametrization recipe.
]

#memo(title: [Memorize: FTC for line integrals])[
  Suppose $bf(F) : RR^n -> RR^n$ is a conservative vector field,
  given by $bf(F) = nabla f$ for some potential function $f : RR^n -> RR$.
  Then for any curve $cal(C)$ from a point $P$ to a point $Q$ we have
  $ int_(cal(C)) bf(F) dot dif bf(r) = f(Q)-f(P). $
]

= Massive spoilers

I'm just gonna spoil the answers to all three of Maulik's questions from his notes:

1. *Are all conservative fields gradients?* \
  Answer: Heck yes! One fewer word to remember 🎉
2. *Given $bf(F)$, how can we tell if it's a gradient?*
  #memo(title: [Memorize: Conservative $<==>$ 2D scalar curl is zero])[
    Assume here the vector field is continuously differentiable and defined everywhere on $RR^2$.
    A vector field $bf(F) : RR^2 -> RR^2$
    given by $bf(F)(x,y) = vec(p(x,y), q(x,y))$ is conservative if and only if
    $ (partial q) / (partial x) = (partial p) / (partial y) . $
  ]
  When $bf(F) = nabla f$, that condition is just saying $f_(x y) = f_(y x)$,
  which is something you already saw back when doing the second derivative test.
  If you like $partial$ notation better, this could also be written as
  $ (partial)/(partial y) (partial f) / (partial x)
    = (partial)/(partial x) (partial f) / (partial y). $

3. *If it is, how can we find a potential function?*\
  Answer: read section 16 of LAMV for the recipe.

= Recitation questions from official course

/ 1a: Sketch the vector field $angle.l x , - y angle.r$ on the $x y$-plane. On the same
  picture, draw the oriented path $C$ from $(- 1 , 0)$ to $(0 , - 1)$
  given by the unit circle in the quadrant $x <= 0 , y <= 0$.

/ 1b: Using the picture as a guide, is $int_C x dif x - y dif y$ positive,
  negative, or zero?

/ 1c: Using a parametrization of $C$, calculate the line integral
  $int_C x dif x - y dif y$ exactly.

/ 1d: Find a function $f (x , y)$ whose gradient is $angle.l x , - y angle.r$, and use
  the fundamental theorem of calculus to calculate
  $int_C x dif x - y dif y$ in another way.

/ 2a: Calculate the line integral $int_C bf(F) dot dif bf(r)$
  where $bf(F)$ is the vector field
  $(x+y) bf(i) + x y bf(j)$ and $C$ is the broken line running
  from $(0 , 0)$ to $(2 , 2)$ to $(0 , 2)$.

/ 2b: Calculate the line integral $int_C (x^2 - y) dif x + 2 x dif y$ where
  $C$ is the path from $(- 1 , 0)$ to $(1 , 0)$ along the parabola
  $y = 1 - x^2$.

/ 3: Let $f (x , y) = sin (x) cos (y)$. Find the gradient vector field $bf(F) = nabla f(x,y)$.
  What is the maximum possible value of $int_C bf(F) dot dif bf(r)$
  as $C$ ranges over all possible paths in the plane?
