#import "@local/evan:1.0.0":*

= Practice midterm 2 <ch-mt2>

Here is a practice midterm that I wrote to help students prepare for the actual exam.
(It was given on October 21, 2024 from 3:05pm-3:55pm.)
Unlike @ch-mt1, these are meant to be normal-ish difficulty questions,
not special hand-crafted challenges.

#exer[
  A butterfly is fluttering in the $x y$ plane with position given by
  $bf(r)(t) = angle.l cos(t), cos(t) angle.r$, starting from
  time $t = 0$ at $bf(r)(0) = angle.l 1,1 angle.r$.
  - Compute the speed of the butterfly at $t = pi/3$.
  - Compute the arc length of the butterfly's trajectory from $t = 0$ to $t = 2 pi$.
  - Sketch the butterfly's trajectory from $t = 0$ to $t = 2pi$ in the $x y$ plane.
] <exer-mt2p1>

#exer[
  Let $k > 0$ be a fixed real number and let $f(x,y) = x^3 + k y^2$.
  Assume that the level curve of $f$ for the value $21$ passes through the point $P = (1,2)$.
  Compute the equation of the tangent line to this level curve at the point $P$.
] <exer-mt2p2>

#exer[
  Let $f(x,y) = x^(5y)$ for $x,y > 0$.
  Use linear approximation to estimate $f(1.001, 3.001)$ starting from the point $(1,3)$.
] <exer-mt2p3>

#exer[
  Consider the function $f : RR^2 -> RR$ defined by
  $ f(x,y) = cos(pi x) + y^4/4 - y^3/3 - y^2. $
  - Compute all the critical points and classify them as saddle point, local minimum, or local maximum.
  - Find the global minimums and global maximums of $f$, if they exist.
] <exer-mt2p4>

#exer[
  Compute the minimum and maximum possible value of $x + 2 y + 2 z$
  over real numbers $x$, $y$, $z$ satisfying $x^2 + y^2 + z^2 <= 100$.
] <exer-mt2p5>

#exer[
  Consider the level surface of $f(x,y,z) = (x-1)^2 + (y-1)^3 + (z-1)^4$
  that passes through the origin $O = (0,0,0)$.
  Let $cal(H)$ denote the tangent plane to this surface at $O$.
  Give an example of two nonzero tangent vectors to this surface at $O$ whose span is $cal(H)$.
] <exer-mt2p6>

Solutions are in @ch-sol-mt2.
