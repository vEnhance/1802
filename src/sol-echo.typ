#import "@local/evan:1.0.0":*

= Solutions to Part Echo

== Solution to @exer-grad-abc

The gradient of $f$ is given by
$ nabla f = vec( a e^(x + y) + b e^(x - y),  a e^(x + y) - b e^(x - y) ). $
At the origin $(x,y) = (0,0)$ we get
$ nabla f (0,0) = vec(a+b, a-b). $
The condition that the level curve is tangent to the line $y = 5 x$ at
the origin means the gradient vector $nabla f (0, 0)$ must be a multiple
of the normal vector to $-5x + y = 0$, which is $vec(-5,1)$.
In other words, we should have
$ (a+b)/(a-b) = -5 ==> 3a=2b ==> b = 3/2 a. $

We also know that $c = f(0,0) = f(0,d)$.
We compute
$ f(0,0) &= a dot e^(0+0) + b e^(0-0) = a + b = 5/2 a \
  f(0,d) &= a e^d + b e^(-d) = (e^d + 3/2 e^(-d)) a. $
As $a != 0$, we conclude
$ e^d + 3/2 e^(-d) = 5/2 <==> (e^d-1)(e^d-3/2) = 0  $
and so $#boxed[$ d = log(3/2) $]$.
