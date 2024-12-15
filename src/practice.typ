#import "@local/evan:1.0.0":*

= Practice questions

Some practice questions from topics through the entire course.

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
  Combine the previous two exercises to figure out what $int_(x=-oo)^(x+oo) e^(-x^2) dif x$ is.
]

#exerstar[
  Prove that $ int_(x=0)^(999^5) root(3, root(5,x) + 1) $ is a rational number.
] <exer-rat-slice>
