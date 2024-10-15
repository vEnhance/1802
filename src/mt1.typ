#import "@local/evan:1.0.0":*

= Challenge review problems up to Midterm Exam 1 <ch-mt1>

This is a set of six more difficult problems that I crafted for my students
to help them prepare for their first midterm exam
(which covered all the linear algebra parts and complex numbers).
You can try them here if you want, but don't be discouraged if you find the problems tricky.
All of these are much harder than anything that showed up on their actual midterm.

Suggested usage: think about each for 15-30 minutes, then read the solution.
I hope this helps you digest the material; I tried to craft problems
that teach deep understanding and piece together multiple ideas,
rather than just using one or two isolated recipes.
Solutions to these six problems are in @ch-sol-mt1.

#prob[
  In $RR^3$, compute the projection of the vector $vec(4,5,6)$ onto the plane $x+y+2z=0$.
] <prob-mt1p1>

#prob[
  Suppose $A$, $B$, $C$, $D$ are points in $RR^3$.
  Give a geometric interpretation for this expression:
  $ |arrow(D A) dot (arrow(D B) times arrow(D C))|. $
] <prob-mt1p2>

#prob[
  Fix a plane $cal(P)$ in $RR^3$ which passes through the origin.
  Consider the linear transformation $f : RR^3 -> RR^3$
  where $f(bf(v))$ is the projection of $bf(v)$ onto $cal(P)$.
  Let $M$ denote the $3 times 3$ matrix associated to $f$.
  Compute the determinant of $M$.
] <prob-mt1p3>

#prob[
  Let $bf(a)$ and $bf(b)$ be two perpendicular unit vectors in $RR^3$.
  A third vector $bf(v)$ in $RR^3$ lies in the span of $bf(a)$ and $bf(b)$.
  Given that $bf(v) dot bf(a) = 2$ and $bf(v) dot bf(b) = 3$,
  compute the magnitudes of the cross products $bf(v) times bf(a)$ and $bf(v) times bf(b)$.
] <prob-mt1p4>

#prob[
  Compute the trace of the $2 times 2$ matrix $M$ given the two equations
  $ M vec(4,7) = vec(5,9) " and " M vec(5,9) = vec(4,7). $
] <prob-mt1p5>

#prob[
  There are three complex numbers $z$ satisfying $z^3 = 5 + 6 i$.
  Suppose we plot these three numbers in the complex plane.
  Compute the area of the triangle they enclose.
] <prob-mt1p6>
