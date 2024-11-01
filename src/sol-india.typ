#import "@local/evan:1.0.0":*

= Solutions to Part India

== Solution to @exer-rat-slice

For brevity, let $N := 999^5$.

At face value, this looks like an 18.01 integral,
but we know from 18.01 that this integral is actually measuring the area under some curve.
The idea is that, to avoid having to deal with the hideous roots,
we are going to use horizontal slicing for the region under the curve shown in the figure.

#figure(
  image("figures/practice-undergraph.png", width: auto),
  caption: [The region $0 <= y <= root(5, root(3,x) + 1)$ for $0 <= x <= N$. Not at all to scale.],
)

Let's first convert the region into inequality format: we have $0 <= x <= N$, $y >= 0$ and
$ y <= root(3, root(5, x) + 1) <==> x >= (y^3-1)^5. $
Hence, the area under the curve can be split into two parts.
In the range $0 <= y <= 1$ we get the light blue rectangle shown above (bottom half of figure),
which goes from $0 <= x <= N$ to $0 <= y <= 1$, and has area $N$.
Then from $1 <= y <= 10$ the bounds on $x$ are instead given by
$ (y^3-1)^5 <= x <= N. $
This is the dark blue region (top half of figure) and it has area
$ int_(y=1)^2 int_(x = (y^3-1)^5)^N 1 dif x dif y = int_(y=1)^N (N - (y^3-1)^5) dif y. $
The total area is thus
$ N + int_(y=1)^(10) (N - (y^3-1)^5) dif y
  = N + N(N-1) - int_(y=1)^(10) (y^3-1)^5 dif y. $
This is a easily seen to be a rational number.
#remark[
  Using a calculator, one could explicitly compute
  $ int_(y=1)^(10) (y^3-1)^5 dif y
  = int_(y=1)^(10) (y^(15) - 5y^(12) + 10y^9 - 10y^6 + 5y^3 - 1) dif y
  = 904414539218186169/1456 $
  if one is so inclined.
]

#digression[
  It is possible to evaluate the integral using 18.01 methods
  by making the $u$-substitution $u = sqrt(sqrt(x)+1)$, but this is extremely tedious.
]
