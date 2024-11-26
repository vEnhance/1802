#import "@local/evan:1.0.0":*

= Solutions to Part Hotel

== Solution to @exer-surface-area-paraboloid

The surface $cal(S)$ is parametrized by
$ bf(r) (x , y) = vec(x ,y ,z) = vec(x ,y ,x^2 + y^2) $
where $(x , y)$ lies within the disk $x^2 + y^2 <= 1$.
Compute the partial derivatives of $bf(r)$ with respect to
$x$ and $y$:
$ frac(partial bf(r), partial x) &= vec((partial x) / (partial x) ,(partial y) / (partial x) ,(partial z) / (partial x)) = vec(1 ,0 ,2 x) \
  frac(partial bf(r), partial y) &= vec((partial x) / (partial y) ,(partial y) / (partial y) ,(partial z) / (partial y)) = vec(0 ,1 ,2 y). $
Hence, the cross product is given by
$frac(partial bf(r), partial x) times frac(partial bf(r), partial y)$:
$ frac(partial bf(r), partial x) times frac(partial bf(r), partial y)
  &= (0 dot 2 y - 1 dot 2 x) bf(e)_1 - (1 dot 2 y - 0 dot 2 x) bf(e)_2 + (1 dot 1 - 0 dot 0) bf(e)_3 \
  &= vec(-2x, 2y, 1). $
Hence the magnitude of this cross product is:
$ lr(|frac(partial bf(r), partial x) times frac(partial bf(r), partial y)|) = sqrt((- 2 x)^2 + (- 2 y)^2 + (1)^2) = sqrt(4 x^2 + 4 y^2 + 1). $

Hence, the surface area of the surface in question is given by
$ op("SurfArea")(cal(S)) &= iint_(x^2 + y^2 <= 1) lr(|frac(partial bf(r), partial x) times frac(partial bf(r), partial y)|) dif x dif y \
  &= iint_(x^2 + y^2 <= 1) sqrt(4 x^2 + 4 y^2 + 1) dif x dif y $
Due to the circular symmetry, it is convenient to switch to polar coordinates; we write
$ op("SurfArea")(cal(S)) &= int_(theta=0)^(2 pi) int_(r=0)^1 sqrt(4 r^2 + 1) dot r dif r dif theta \
  &= (int_(theta=0)^(2 pi) dif theta) (int_(r=0)^1 sqrt(4 r^2 + 1) dot r dif r). $
The integral over $r$ can be evaluated by using $u$-substitute according to
$ u := 4 r^2 + 1 ==> dif u = 8 r dif r ==> r dif r = (dif u) / (8) $
so
$ int_(r=0)^1 sqrt(4 r^2 + 1) dot r dif r &= int_(u=1)^5 (sqrt(u)/8) dif u \
  &= 1/8 int_1^5 sqrt(u) dif u = [1 / 8 dot 2 / 3 u^(3 \/ 2)]_(u=1)^5
  = 1 / 12 (5^(3 \/ 2) - 1^(3 \/ 2)) \
  &= 1 / 12 (5 sqrt(5) - 1). $
And of course $int_(theta=0)^(2 pi) dif theta = 2pi$.
Hence the answer $ #boxed[$ frac(5 sqrt(5) - 1, 6) pi $]. $
