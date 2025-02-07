#import "@local/evan:1.0.0":*

= Solutions to Part Hotel

== Solution to @exer-napkin-ring (the napkin-ring problem)

#recall-thm(<exer-napkin-ring>)

This is a famous exercise with its own page on Wikipedia at #url("https://w.wiki/CarU").
We give one solution using spherical coordinates below,
but this is far from the only possible solution.

Using cylindrical coordinates the equation of the sphere is: $ x^2 + y^2 + z^2 = R^2 . $
Since the hole is along the $z$-axis with radius $a$,
we impose $ a <= r <= R $
that is, the bead consists of those points whose distance from the $z$-axis is at least $a$.

As for $z$, we require $r^2 + z^2 <= R^2$. That is, for each given $r$,
the possible values of $z$ are those with
$  - sqrt(R^2 - r^2) <= z <= sqrt(R^2 - r^2). $

The volume element in cylindrical coordinates is:
$ dif V = r dif r dif theta dif z . $
Putting this all together, the volume integral is:
$ V = int_(theta=0)^(2 pi) int_(r=a)^R int_(z=- sqrt(R^2 - r^2))^(sqrt(R^2 - r^2))
  r dif z dif r dif theta . $
Evaluating the inner integral gives:
$ int_(z=- sqrt(R^2 - r^2))^(sqrt(R^2 - r^2)) dif z = 2 sqrt(R^2 - r^2) . $
Thus, the volume integral simplifies to:
$ V &= int_(theta=0)^(2 pi) int_(r=a)^R 2 r sqrt(R^2 - r^2) dif r dif theta \
  &= (int_(theta=0)^(2 pi) dif theta)(int_(r=a)^R 2 r sqrt(R^2 - r^2) dif r) \
  &= 2 pi (int_(r=a)^R 2 r sqrt(R^2 - r^2) dif r). $
To evaluate the integral,
we substitute $u = R^2 - r^2$, so that $dif u = - 2 r dif r$, we rewrite:
$ int_(r=a)^R 2 r sqrt(R^2 - r^2) dif r &= int_(u=R^2 - R^2)^(R^2 - a^2) sqrt(u) (- dif u) \
  &= int_(u=0)^(R^2 - a^2) sqrt(u) dif u \
  &= [2/3 u^(3 \/ 2)]_(u=0)^(R^2-a^2) \
  &= 2/3 (R^2 - a^2)^(3/2). $
Multiplying by $2 pi$, we obtain:
$ V = 2 pi dot 2 / 3 (R^2 - a^2)^(3 \/ 2) = (4 pi) / (3) (R^2 - a^2)^(3 \/ 2) . $
Since $h = 2 sqrt(R^2 - a^2)$, we have: $R^2 - a^2 = h^2 / 4$, so
$ V = #boxed[$ pi / 6 h^3 $]. $

== Solution to @exer-sphere-line-distance (average distance of sphere to line)


#recall-thm(<exer-sphere-line-distance>)

We choose the $z$-axis to be aligned with the line $ell$.
Hence the distance from a point $P = (r , theta , phi)$ to $ell$ is simply the
perpendicular distance from $P$ to the $z$-axis, which is:
$ d(P) = r sin phi . $

We integrate over the entire sphere with coordinates
$ 0 <= r <= 1 , quad 0 <= theta <= 2 pi , quad 0 <= phi <= pi . $
The total volume of the ball is:
$ op("Vol")(cal(T)) = 4 / 3 pi (1)^3 = (4 pi) / (3) . $

We now set up the integral $iiint_(cal(T)) d(P) dif V$.
The volume element is:
$ dif V = r^2 sin phi dif r dif phi dif theta . $
Hence
$ iiint_(cal(T)) d(P) dif V
  &= iiint_(cal(T)) r sin phi dot r^2 sin phi dif r dif phi dif theta \
  &= int_(theta=0)^(2 pi) dif theta int_(phi=0)^pi sin^2 phi dif phi int_(r=0)^1 r^3 dif r. $
The center integral needs the following trig identity:
$ sin^2 phi &= (1 - cos(2 phi))/2 \
  ==> int sin^2 phi dif phi &= phi / 2 - sin(2 phi) / 4. $
Hence,
$ iiint_(cal(T)) d(P) dif V
  &= int_(theta=0)^(2 pi) dif theta int_(phi=0)^pi sin^2 phi dif phi int_(r=0)^1 r^3 dif r
  &= (2 pi) dot (pi / 2) dot (1/4) \
  &= pi^2 / 4. $
So the final answer is
$ 1/(op("Vol")(cal(T))) iiint_(cal(T)) d(P) dif V
  &= (pi^2 \/ 4) / (4 pi \/ 3) = #boxed[$ 3/16 pi $]. $

== Solution to @exer-sphere-gravity (gravity on hemisphere)

#recall-thm(<exer-sphere-gravity>)

We orient the hemisphere so it rests on the $x y$-plane with the point $P$ at $(0,0,0)$
(so the hemisphere is $x^2 + y^2 + z^2 <= 1$ and $z >= 0$).
Then this is basically the same as the example in @sec-sph-gravity,
except the bounds of integration change.

To be precise, we have $G_1 = G_2 = 0$, and @eqn-sph-G3 and again
$ G_3 = G m iiint_(cal(T)) sin phi cos phi dif rho dif phi dif theta $
after setting the density to $1$.
The only change is the bounds of integration: for the hemisphere we should have
$ 0 <= rho <= 1 , quad 0 <= theta <= 2 pi , quad 0 <= phi.alt <= pi / 2 . $

So, when we integrate to compute $G_3$ we have
$ G_3 &= G m int_(theta=0)^(2 pi) int_(phi=0)^(pi / 2) int_(rho=0)^(1)
    sin phi cos phi dif rho dif phi dif theta \
  &= G m (int_(theta=0)^(2 pi) dif theta)
    (int_(phi=0)^(pi / 2) sin phi cos phi dif phi)
    (int_(rho=0)^(1) dif rho) \
  &= G m (2 pi) (int_(phi=0)^(pi / 2) sin phi cos phi dif phi) (1). $
To evaluate the integral with $phi$, write
$ int_(phi=0)^(pi \/ 2) sin phi cos phi dif phi
  = 1 / 2 int_0^(pi \/ 2) sin 2 phi dif phi
  = 1 / 2 [- 1 / 2 cos 2 phi]_(phi=0)^(pi \/ 2)
  = 1/2. $
Hence,
$ G_3 = (G m) dot (2 pi) dot 1/2 dot 1 = G m pi. $
In other words, in the coordinate system we chose, gravity is given by
$ bf(G) = lr(angle.l 0, 0, G m pi angle.r). $
The magnitude is $|bf(G)| = #boxed[$ G m pi $]. $

== Solution to @exer-psurf (find point on parametrized surface)

#recall-thm(<exer-psurf>)

For $P = (2 , 8 , k)$ to lie on $cal(S)$, there must exist $u$, and $v$
such that: $ u - v = 2 , quad u + v = 8 , quad u v = k . $
Adding the first two equations:
$ (u - v) + (u + v) = 2 + 8 ==> 2 u = 10 ==> u = 5. $
Subtracting the first equation from the second:
$ (u + v) - (u - v) = 8 - 2 ==> 2 v = 6 ==> v = 3. $
Hence $k = u v = #boxed[$ 15 $]. $

== Solution to @exer-surf-tangent (find tangent plane to parametrized surface)

#recall-thm(<exer-surf-tangent>)

The first step is to solve for $(u,v)$, much like in the preceding @exer-psurf.
The point $(3 , 7 , 10)$ must satisfy the parametrization equations:
$ u - v = 3 , quad u + v = 7 , quad u v = 10 . $
Solving gives $(u,v) = (5,2)$.

Now, from the discussion in @sec-surface-area-explanation,
the idea is that the normal vector for our tangent plane ought to be given by
$ (partial bf(r))/(partial u) times (partial bf(r))/(partial v) $
at every point of the surface.

So, we first compute the derivatives:
$ (partial bf(r))/(partial u)
  &= ((partial) / (partial u) (u - v) , (partial) / (partial u) (u + v) , (partial) / (partial u) (u v)) \
  &= angle.l 1 , 1 , v angle.r \
  (partial bf(r))/(partial v)
  &= ((partial) / (partial v) (u - v) , (partial) / (partial v) (u + v) , (partial) / (partial v) (u v)) \
  &= angle.l - 1 , 1 , u angle.r. $
At $(u,v) = (5,2)$ we get
$ (partial bf(r))/(partial u)(5,2)
  &= angle.l 1 , 1 , 2 angle.r \
  (partial bf(r))/(partial v)(5,2)
  &= angle.l - 1 , 1 , 5 angle.r. $
The cross product is then given by
$ (partial bf(r))/(partial u)(5,2)
  times (partial bf(r))/(partial v)(5,2)
  &= detmat(bf(e)_1, bf(e)_2, bf(e)_3;
  1, 1, 2;
  -1, 1, 5
  )
  &= 3 bf(e)_1 - 7 bf(e)_2 + 2 bf(e)_3. $
Thus, the normal vector is $angle.l 3, -7, 2 angle.r$.
So the equation of the tangent plane should be
$ 3 x - 7 y + 2 z = k $
for some number $k$.
To pass through $(3,7,10)$, we take $k = 3 dot 3 - 7 dot 7 + 2 dot 10 = - 20$.
Hence the final answer is $ #boxed[$ 3 x - 7 y + 2 z = - 20 $]. $

/*
== Solution to @exer-sphere-avg-distance (average sphere distance)

#recall-thm(<exer-sphere-avg-distance>)

We need the offset sphere from @sec-offset-sphere again,
but this time the sphere is hollow, which makes things quite a bit different.

To set up the coordinate system, we set $A = (0,0,0)$
and we consider the sphere $cal(S)$ as the surface $x^2 + y^2 + (z-1)^2 = 1$.
If we use spherical coordinates, then $cal(S)$ consists of those points with
$ 0 <= theta < 2 pi , quad 0 <= phi.alt <= pi / 2 , quad rho = 2 cos phi. $
This is the same equation as in @sec-offset-sphere
except that now we have $rho = 2 cos phi$ rather than $0 <= rho <= 2 cos phi$,
because $cal(S)$ is hollow, not a 3D region.

Thus, we get the following parametrization of the surface of the offset sphere:
$ bf(r)(phi, theta)
  &= (rho sin phi cos theta, rho sin phi sin theta, rho cos theta) \
  &= (2 cos phi sin phi cos theta, 2 cos phi sin phi sin theta, 2 cos phi cos phi). $
And the function we're integrating is
$ lr(|P A|) = rho = 2 cos phi. $

... oh geez this is gross.
I think by symmetry we should do the problem for a great circle through A
but that defeats the purpose of putting this in scalint section
*/


== Solution to @exer-surface-area-paraboloid (surface area of paraboloid)

#recall-thm(<exer-surface-area-paraboloid>)

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
  &= (0 dot 2 y - 1 dot 2 x) ee_1 - (1 dot 2 y - 0 dot 2 x) ee_2 + (1 dot 1 - 0 dot 0) ee_3 \
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

== Solution to @exer-archimedes (Archimedes hat-box theorem)

The area of the cylinder part is straightforward and does not need calculus:
it's a cylinder whose base has circumference $2 pi$
and which has height $b - a$, so the surface area is
$ 2 pi (b-a). $
So the main part of the problem is to show that the blue part of the sphere
in @fig-surfcross-archimedes has the same surface area.

It's sufficeint to solve the problem in the case $0 <= a <= b <= 1$.
(If $a$ and $b$ are both negative, then you can do a reflection argument.
And if $a < 0 < b$, then one should split the surface area at the equator of the sphere
(along $z = 0$) into two parts; then add them together.)

We'll adopt the calculation in @sec-surf-grad-magic for our purposes.
In that section, we were able to calculate the surface of the unit hemisphere
by viewing the sphere as the level surface of $g(x,y,z) = x^2+y^2+z^2 = 1$,
and using the formula
$ (nabla g) / (partial g slash partial z) = lr(angle.l 2x, 2y, 2z angle.r) / (2z)
  = lr(angle.l x/z, y/z, 1 angle.r). $
to derive that
$ op("SurfArea")("hemisphere") = iint_(x^2+y^2<=1) 1/sqrt(1-(x^2+y^2)) dif x dif y. $
For Archimedes hat-box theorem, the integral itself stays the same;
the change is that rather than integrating along the entire $x^2+y^2 <= 1$
(which would give the surface area of the hemisphere),
we instead integrate along the annulus
$ 1-b^2 <= x^2 + y^2 <= 1-a^2. $
Indeed, this is the shadow of the surface area in @fig-surfcross-archimedes onto the $x y$-plane.
(Indeed, the bottom disk has radius $sqrt(1-a^2)$ and the top disk has radius $sqrt(1-b^2)$.)

Getting back to integration, the surface area we seek for the sphere is thus
$ S = iint_(1-b^2 <= x^2+y^2 <= 1-a^2) 1/sqrt(1-(x^2+y^2)) dif x dif y. $
Now we just have to redo the calculation in @sec-surface-area-explanation with only
slight modifications.
We use polar coordinates to change this to
$ S &= int_(theta=0)^(2pi) int_(r=sqrt(1-b^2))^(sqrt(1-a^2)) 1/(sqrt(1-r^2)) (r dif r dif theta) \
  &= (int_(theta=0)^(2pi) dif theta) (int_(r=sqrt(1-b^2))^(sqrt(1-a^2)) r/(sqrt(1-r^2)) dif r). $
The left integral is $2pi$.
For the inner integral, use the $u$-substitution $u=1-r^2 ==> (dif u) / (dif r) = -2r$ to get
$ int_(r=sqrt(1-b^2))^(sqrt(1-a^2)) r/(sqrt(1-r^2)) dif r
  = int_(u=b^2)^(a^2) -1/2 u^(-1/2) dif u
  = int_(u=a^2)^(b^2) 1/2 u^(-1/2) dif u
  = [u^(1/2)]_(u=a^2)^(b^2) = b-a. $
Thus we get
$ S = 2 pi (b - a) $
as we needed.
