#import "@local/evan:1.0.0":*

= Practice questions <ch-practice>

Some practice questions from topics through the entire course.
Solutions are in @ch-sol-kilo.

== Practice half-final

This was a cumulative practice exam given on December 18, 2024 covering the whole course.
It was about half the length of the final exam (which was 14 questions long).

#exer[
  Give an example of a complex number $z$ whose
  real and imaginary part are both negative such that $z^3 = - 1000 i$.
  Write your answer in rectangular form.
] <exer-mf-1>

#exer[
  Compute the unique real number $a$ for which the matrix
  $M = mat(1,1;a,6)$ has an eigenvalue of $2$.
  For this value of $a$, compute the other eigenvalue of $M$,
  and a (nonzero) eigenvector for that eigenvalue.
] <exer-mf-2>

#exer[
  The four points $(b,0,0)$, $(0,b,0)$, $(0,0,b)$, and $(2,3,6)$ lie on a plane $cal(P)$.
  Compute $b$, and compute the distance from $(1,2,3)$ to $cal(P)$.
] <exer-mf-3>

#exer[
  Let $f(x,y) = cos(x) + sin(y)$.
  Give an example of a saddle point of $f$, and an example of a local maximum of $f$.
  Pick either of these two points and sketch the level curve of $f$ passing through it.
] <exer-mf-4>

#exer[
  Compute the maximum and minimum value of $x^2+2y^2+4x$ over the region $x^2+y^2 <= 9$.
] <exer-mf-5>

#exer[
  Use any method (recommended approach: change order of integration) to compute
  $ int_(x=0)^1 int_(y=x)^1 int_(z=y)^1 e^(z^3) dif z dif y dif x. $
] <exer-mf-6>

#exer[
  Compute the real number $c$ for which
  $ bf(F)(x,y,z) = angle.l 7 cos(x), thin cos(y) cos(2z), thin c sin(y) sin(2z) angle.r $
  is conservative.
  For that $c$, compute the maximum possible value of a line integral
  $int_(cal(C)) bf(F) dot dif bf(r)$ across all possible choices of some curve $cal(C)$ in $RR^3$.
] <exer-mf-7>

#exer[
  Let $ bf(F)(x,y,z) = angle.l x + e^y + z^3, thin e^x + y + z^3, thin z angle.r. $
  Let $cal(S)$ be the surface defined by $x^2+y^2=100$ and $7 <= z <= 9$,
  with normal vector oriented outwards (thus $cal(S)$ is the curved part of a cylinder).
  Compute the divergence of $bf(F)$.
  Then compute the flux of $bf(F)$ through $cal(S)$.
  (Recommended approach: add two "lids" to $cal(S)$, calculate flux through the lids by hand,
  then use the divergence theorem.)
] <exer-mf-8>

== Miscellaneous practice questions

#exerstar[
  Find all possible values of $a x + b y + c z$
  over real numbers $a$, $b$, $c$, $x$, $y$, $z$
  satisfying $a^2 + b^2 + c^2 = 2$ and $x^2 + y^2 + z^2 = 5$.
]

#exer[
  Find the unique $2 times 2$ matrix $A$ for which
  $vec(1,1)$ is an eigenvector with eigenvalue $3$
  and $vec(2,1)$ is an eigenvector with eigenvalue $4$.
]

#exer[
  Let $cal(S)$ be the level surface of $f(x,y,z) = e^x + e^(2y) + e^(3z)$
  that passes through the origin.
  Find all real numbers $t$ such that the vector $angle.l t+4, t+5, t+6 angle.r$
  is tangent to $cal(S)$ at the origin.
]

#exer[
  Let $a$, $b$, $c$ be real numbers and
  consider the function $ f(x,y) = a e^(x+y) + b e^(x-y). $
  It turns out that the level curve of $f$ for the value $c$
  is tangent to the line $y = 5x$ at the origin,
  and also passes through the point $(log 6, log 3)$.
  Compute $a$, $b$, and $c$.
]

#exerstar[
  Does there exist a differentiable function $f : RR^2 -> RR$
  such that _every_ point in $RR^2$ is a saddle point?
]

#exer[
  Let $cal(R)$ denote the region in the $x y$-plane cut out by
  $y = x + 2$, $y = x + 20$, and $y = x^2$.
  Compute the area of $cal(R)$.
]

#exer[
  Suppose the real numbers $a < b$ and $c < d$ are chosen such that
  $int_(x=a)^b e^(-x^2) dif x = 0.3$ and $int_(y=c)^d e^(-y^2) dif x = 0.7$.
  What are all the values that
  $ int_(x=a)^b int_(y=c)^d e^(-x^2 - y^2) dif x dif y $
  can take?
]

#exer[
  Compute $ int_(x=-oo)^(+oo) int_(y=-oo)^(+oo) e^(-x^2-y^2) dif y dif x. $
]

#exer[
  Combine the previous two exercises to figure out what $int_(x=-oo)^(+oo) e^(-x^2) dif x$ is.
]

#exerstar[
  Prove that $ int_(x=0)^(999^5) root(3, root(5,x) + 1) $ is a rational number.
] <exer-rat-slice>
