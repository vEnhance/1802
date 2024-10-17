= Solutions to Part Foxtrot

== Solution to @exer-lm-sin

We want to minimize the function $ f (x , y) = x + y $ subject to the
constraint $ g (x , y) = sin (x) + sin (y) = 1 $ and $x,y >= 0$.

0. The region $cal(R)$ has boundary whenever $x = 0$ or $y = 0$.
  It also has limit cases when $x -> +oo$ or $y -> +oo$.

1. We find the LM-critical points.
  The gradients are $ nabla f = vec(1,1) $ and $ nabla g = vec(cos(x), cos(y)). $

  From the first two equations, we have:
  $ lambda = 1 / (cos (x)) quad upright("and") quad lambda = 1 / (cos (y)) . $
  Equating these expressions for $lambda$, we get:
  $ frac(1, cos (x)) = frac(1, cos (y)) ==> cos (x) = cos (y) . $
  Thus, we get an LM-critical point whenever
  $ cos(x) &= cos(y) \
    sin(x) + sin(y) &= 1 $
  Note that $sin(x)^2 = 1 - cos(x)^2 = 1 - cos(y)^2 = sin(y)^2$.
  Since $sin(x)+sin(y) = 1 != 0$, we conclude $sin(x) = sin(y) = 1/2$.
  Together with $cos(x) = cos(y)$,
  that means $x$ and $y$ must differ by a multiple of $2 pi$.

  Since we want $x+y$ to be as small as possible, we might as well take $x=y$.
  The smallest $x$ for which $sin(x) = 1/2$ is $x = pi/6$.
  So of all the LM-critical points, the lowest value occurs when
  $ f (pi / 6 , pi / 6) = pi / 6 + pi / 6 = pi / 3 . $

2. In the limit cases if either $x -> +oo$ or $y -> +oo$ then $f -> +oo$
3. Suppose $x = 0$. Then $sin(y) = 1$.
  So this part of the boundary consists of the points $(0,pi)$, $(0,3pi)$, $(0,5pi)$, ....
  All of these have $x+y >= pi$, so they do worse than the point $(pi/6, pi/6)$ from before.

  Similarly, if $y=0$, we get boundary points $(pi,0)$, $(3pi,0)$, $(5pi,0)$, ....
  Again all of these have $x+y >= pi$, so they do worse than the point $(pi/6, pi/6)$ from before.

In conclusion the minimum possible value occurs at
$ f (pi / 6 , pi / 6) = pi / 3 . $
