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

== Miscellaneous practice questions without solutions

#exer[
  Let $bf(v) = vec(8, 9, 10)$. Suppose that
  $ op("proj")_(bf(w)) (bf(v)) = vec(3,5,t) $
  for some real number $t$.
  Compute $t$, and compute all possibilities for the vector $bf(w)$.
]

#exer[
  Compute the unique $2 times 2$ matrix $A$ for which
  $vec(1,1)$ is an eigenvector with eigenvalue $3$
  and $vec(2,1)$ is an eigenvector with eigenvalue $4$.
]

#exer[
  Let $A = mat(4,3;4,8)$.
  - Compute the eigenvalues and eigenvectors for $A$.
  - Compute the eigenvalues and eigenvectors for $A^2$.
  - Compute the eigenvalues and eigenvectors for $A^(100)$.
]

#exer[
  Let $cal(S)$ be the level surface of $f(x,y,z) = e^x + e^(2y) + e^(3z)$
  that passes through the origin.
  Compute all real numbers $t$ such that the vector $angle.l t+4, t+5, t+6 angle.r$
  is tangent to $cal(S)$ at the origin.
]

#exer[
  Let $f(x,y,z)$ be a differentiable function, and let $g(x,y,z) = e^(f(x,y,z))$.
  Let $P$ be any point in $RR^3$.
  Suppose $f(P) = 2$, and $nabla f(P)$ is a unit vector.
  Compute the magnitude of $nabla g(P)$.
]

#exer[
  Show that
  $ f(x,y) = (x+y)^(100) - (x-y)^(100) $
  has exactly one critical point, and that critical point is a saddle point.
]

#exer[
  Let $cal(R)$ denote the region in the $x y$-plane cut out by
  $y = x + 2$, $y = x + 20$, and $y = x^2$.
  Compute the area of $cal(R)$.
]

#exer[
  Compute $ int_(x=-oo)^(+oo) int_(y=-oo)^(+oo) e^(-x^2-y^2) dif y dif x $
  by changing to polar coordinates.
  Then determine the value of $int_(x=-oo)^(+oo) e^(-x^2) dif x$.
]
