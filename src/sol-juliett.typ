#import "@local/evan:1.0.0":*

= Solutions to Part Juliett

== Solution to @exer-divthm-1

#todo[clean this up]

Given $bf(F) (x , y , z) = vec(x^2 y , y z^2 , e^x)$,
compute the divergence:
$ nabla dot bf(F) = (partial) / (partial x) (x^2 y) + (partial) / (partial y) (y z^2) + (partial) / (partial z) (e^x) = 2 x y + z^2 + 0 = 2 x y + z^2 $

The region $cal(T)$ is bounded by the upper hemisphere
$z = sqrt(1 - x^2 - y^2)$ and the base $z = 0$, with $x^2 + y^2 <= 1$.
We convert to spherical coordinates for symmetry:
$ x = rho sin phi cos theta , quad y = rho sin phi sin theta , quad z = rho cos phi $
$ dif V = rho^2 sin phi dif rho dif phi dif theta. $
The bounds are:
$ 0 <= rho <= 1 , quad 0 <= theta <= 2 pi , quad 0 <= phi <= pi / 2 $

#strong[Step 4: Express $nabla dot bf(F)$ in Spherical
Coordinates]

$ 2 x y + z^2 = 2 (rho sin phi cos theta) (rho sin phi sin theta) + (rho cos phi)^2 = 2 rho^2 sin^2 phi cos theta sin theta + rho^2 cos^2 phi $

Simplify: $ = rho^2 (sin^2 phi sin (2 theta) + cos^2 phi) $

#strong[Step 5: Compute the Volume Integral]

$ iiint_(cal(T)) (2 x y + z^2) dif V = int_0^(2 pi) int_0^(pi / 2) int_0^1 rho^2 (sin^2 phi sin (2 theta) + cos^2 phi) rho^2 sin phi dif rho dif phi dif theta $
$ = int_0^(2 pi) int_0^(pi / 2) int_0^1 rho^4 (sin^3 phi sin (2 theta) + cos^2 phi sin phi) dif rho dif phi dif theta $

Separate the integral:
$ = int_0^(2 pi) int_0^(pi / 2) (sin^3 phi sin (2 theta) int_0^1 rho^4 dif rho + cos^2 phi sin phi int_0^1 rho^4 dif rho) dif phi dif theta $
$ = int_0^(2 pi) int_0^(pi / 2) (sin^3 phi sin (2 theta) dot 1 / 5 + cos^2 phi sin phi dot 1 / 5) dif phi dif theta $
$ = 1 / 5 int_0^(2 pi) sin (2 theta) dif theta int_0^(pi / 2) sin^3 phi dif phi + 1 / 5 int_0^(2 pi) dif theta int_0^(pi / 2) cos^2 phi sin phi dif phi $

Evaluate the angular integrals:

1. $int_0^(2 pi) sin (2 theta) dif theta = 0$ (since
$sin (2 theta)$ is periodic and symmetric).

2. $int_0^(2 pi) dif theta = 2 pi$

Now, compute the radial integrals:

1.
$int_0^(pi / 2) sin^3 phi dif phi = int_0^(pi / 2) sin^2 phi sin phi dif phi = int_0^(pi / 2) (1 - cos^2 phi) sin phi dif phi$
$ = int_0^(pi / 2) sin phi dif phi - int_0^(pi / 2) cos^2 phi sin phi dif phi = [- cos phi]_0^(pi / 2) - [(cos^3 phi) / (3)]_0^(pi / 2) = (0 - (- 1)) - (0 - 1 / 3) = 1 + 1 / 3 = 4 / 3 $

2. $int_0^(pi / 2) cos^2 phi sin phi dif phi$ Let
$u = cos phi$, then $dif u = - sin phi dif phi$:
$ = - int_1^0 u^2 dif u = int_0^1 u^2 dif u = 1 / 3 $

Thus, the volume integral becomes:
$ iiint_(cal(T)) (2 x y + z^2) dif V = 1 / 5 dot 0 + 1 / 5 dot 2 pi dot 1 / 3 = (2 pi) / (15) $
