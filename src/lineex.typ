#import "@local/evan:1.0.0":*

= Way too many examples of work and 2D flux <sec-lineex>

This entire section is *review and examples only* and *can be skipped* if you know what you're doing.

The goal of this chapter is to flesh out @tab-work-vs-flux.
We'll show the entire table with four situations:

- The conservative field $bf(F) = vec(2x+y, x+2y)$
  over the unit circle oriented counterclockwise (a closed loop).
- The conservative field $bf(F) = vec(2x+y, x+2y)$
  over the line segment from $(1,4)$ to $(3,9)$.
- The non-conservative field $bf(F) = vec(x^2+3y,5y)$
  over the unit circle oriented counterclockwise (a closed loop).
- The non-conservative field $bf(F) = vec(x^2+3y,5y)$
  over the line segment from $(1,4)$ to $(3,9)$.

== Example with $bf(F) = vec(2x+y, x+2y)$ and $cal(C)$ the unit circle

#sample[
  Let $bf(F) = vec(2x+y, x+2y)$
  and let $cal(C)$ be the unit circle oriented counterclockwise.
  Evaluate $int bf(F) dot dif bf(r)$ and $int bf(F) dot bf(n) dif s$.
]

We use the parametrization
$ bf(r)(t) = vec(cos(t), sin(t)) quad 0 <= t <= 2pi $
so
$ bf(r)'(t) = vec(-sin(t), cos(t)) quad 0 <= t <= 2pi. $

In this case all five methods are applicable, see the table below.

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Method],
      [Work $int_(cal(C)) bf(F) dot bf(r)$\ (see @sec-recipe-work)],
      [2D Flux $int_(cal(C)) bf(F) dot bf(n) dif s$ \ (see @sec-recipe-2d-flux)]),
    [$bf(F)$ is conservative \ $==>$ FTC],
      [$f(1,0)-f(1,0)=0$], [_Not applicable_],
    [$cal(C)$ is a closed loop \ $==>$ Green],
      [$iint_(cal(R)) underbrace(1-1, "2D scalar curl") dif A = 0$],
      [Output $iint_(cal(R)) underbrace(2+2, "Div" = nabla dot bf(F)) dif A = 4pi$],
    [Bare-hands definition \ Use parametrization],
      [$int_(t=0)^(2pi) vec(2cos(t)+sin(t), cos(t)+2sin(t)) dot vec(-sin(t), cos(t)) dif t$],
      [$int_(t=0)^(2pi) vec(-(cos(t)+2sin(t)), 2cos(t)+sin(t), ) dot vec(-sin(t), cos(t)) dif t$],
  ),
  caption: [For $bf(F) = vec(2x+y, x+2y)$ which is conservative,
    with potential function $f(x,y) = x^2 + x y + y^2$, around the unit circle.],
  kind: table
)

=== Using FTC for work

The line integral is trivially zero:
we don't even have to compute the potential function,
because the FTC implies that we'll get $f(1,0) - f(1,0) = #boxed[$ 0 $]$.
In fact the potential function is $f(x,y) = x^2 + x y + y^2$
but we won't use this until the next example.

=== Green's theorem for work

If you missed that the vector field was conservative,
and you use Green's theorem,
you unsurprisingly get $0$ for the 2D scalar curl:
$ iint_(cal(R)) underbrace(1-1, "2D scalar curl") dif A = iint_(cal(R)) 0 dif A = #boxed[$ 0 $]. $
Conservative functions have vanishing curl.
So actually even if you don't notice the field is conservative to start,
when you try to apply Green's theorem you'll get a rather rude reminder when you realize
you're just integrating the $0$ function.

=== Bare-hands for work

For the work integral, you compute it as follows:
$ bf(F)(cos t, sin t) dot bf(r)'(t) &= vec(2cos(t)+sin(t), cos(t)+2sin(t)) dot vec(-sin(t), cos(t)) \
  &= (2 cos t + sin t) (- sin t) + (cos t + 2 sin t) (cos t) \
  &= - 2 cos t sin t - sin^2 t + cos^2 t + 2 cos t sin t \
  &= cos^2 t - sin^2 t = cos(2t). $
So the integral becomes:
$ int_0^(2 pi) cos (2 t) dif t = #boxed[$ 0 $] $
because it's an integral over two full periods of the cosine function, hence $0$.
(Alternatively, write $[(sin 2 t) / (2)]_(t=0)^(2 pi) = (sin 4 pi) / (2) - (sin 0) / (2) = 0 - 0 = 0$.)

=== Green's theorem for flux

For flux, we don't get a fundamental theorem of calculus anyway,
but the divergence is $2+2=4$ everywhere, which is a constant,
so the flux works out to $4op("Area")(cal(R))$, which is just $#boxed[$ 4 pi $]$.

=== Bare-hands for flux
For the flux integral, rotate the vector for the vector field
(that is, look at $-q dif x + p dif y$) to get the dot product
$ vec(-(cos(t)+2sin(t)), 2cos(t)+sin(t)) dot vec(-sin(t), cos(t))
  &= (2 cos t + sin t) cos t + (cos t + 2 sin t) sin t \
  &= 2 cos^2 t + sin t cos t + cos t sin t + 2 sin^2 t \
  &= 2 (cos^2 t + sin^2 t) + 2 sin t cos t \
  &= 2 (1) + sin 2 t = 2 + sin 2 t . $
Consequently,
$ int_(t=0)^(2 pi) (2 + sin 2 t) dif t  = 4 pi + int_(t=0)^(2 pi) sin 2 t dif t = #boxed[$ 4 pi $]. $
since $int_(t=0)^(2 pi) sin 2 t$ is an integral over two full periods of the sine function.

== Example with $bf(F) = vec(2x+y, x+2y)$ and $cal(C)$ a line segment

#sample[
  Let $bf(F) = vec(2x+y, x+2y)$
  and let $cal(C)$ be the path from $(1,4)$ to $(3,9)$.
  Evaluate $int bf(F) dot dif bf(r)$ and $int bf(F) dot bf(n) dif s$.
]

We use the same vector field, but this time we parametrize our line segment
$ bf(r)(t) = vec(1+2t, 4+5t) quad 0 <= t <= 1 $
so
$ bf(r)'(t) = vec(2,5) quad 0 <= t <= 2pi. $

This time, our table looks like this:

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Method],
      [Work $int_(cal(C)) bf(F) dot bf(r)$\ (see @sec-recipe-work)],
      [2D Flux $int_(cal(C)) bf(F) dot bf(n) dif s$ \ (see @sec-recipe-2d-flux)]),
    [$bf(F)$ is conservative \ $==>$ FTC],
      [$f(3,9)-f(1,4) = 117 - 21 = 96$], [_Not applicable_],
    [$cal(C)$ is a closed loop \ $==>$ Green],
      [_Cannot use here_],
      [_Cannot use here_],
    [Bare-hands definition \ Use parametrization],
      [$int_(t=0)^(1) vec(2(1+2t)+(4+5t), (1+2t)+2(4+5t)) dot vec(2,5) dif t$],
      [$int_(t=0)^(1) vec(-((1+2t)+2(4+5t)), 2(1+2t)+(4+5t)) dot vec(2,5) dif t$],
  ),
  caption: [For $bf(F) = vec(2x+y, x+2y)$ which is conservative,
    with potential function $f(x,y) = x^2 + x y + y^2$,
    but this time on the line segment from $(1,4)$ to $(3,9)$.],
  kind: table
)

As always, the bare-hands method is the most work,
but for the flux integral we don't really have a choice because no other method is possible.

=== Using FTC

This time, we will actually use the potential function
$ f(x,y) = x^2 + x y + y^2 $
(or really $f(x,y) = x^2 + x y + y^2 + C$ for any constant $C$).
So we can short-circuit the entire line integral by simply evaluating
$ f(3,9)-f(1,4) = 117 - 21 = #boxed[$ 96 $]. $

=== Bare-hands for work

For the work integral, first expand
$ bf(F) (1+2t,4+5t) = vec(2(1+2t)+(4+5t), (1+2t)+2(4+5t)) = vec(2 + 4 t + 4 + 5 t , 1 + 2 t + 8 + 10 t) = vec(6 + 9 t, 9 + 12 t). $
Hence the dot product is
$ bf(F) (1+2t,4+5t) dot bf(r)'(t) = vec(6 + 9 t, 9 + 12 t) dot vec(2, 5) = 2(6 + 9 t) + 5(9 + 12 t) = 57 + 78 t. $
Integrating this gives
$ int_(t=0)^1 (57 + 78 t) dif t = [57 t + 39 t^2]_0^1 = 57 (1) + 39 (1)^2 - 0 = 57 + 39 = #boxed[$ 96 $]. $

=== Bare-hands for flux

For the flux integral, rotate the vector for the vector field
(that is, look at $-q dif x + p dif y$) to get the dot product
$ vec(-(9 + 12 t), 6 + 9 t) dot vec(2, 5) = -2(9 + 12t) + 5(6+ 9t) = 12 + 21 t $
Integrating this gives
$ int_(t=0)^1 (12 + 21 t) dif t = [12 t + 21/2 t^2]_(t=0)^1 = #boxed[$ 45/2 $]. $

== Example with $bf(F) = vec(x^2+3y,5y)$ and $cal(C)$ the unit circle

#sample[
  Let $bf(F) = vec(x^2+3y, 5y)$
  and let $cal(C)$ be the unit circle oriented counterclockwise.
  Evaluate $int bf(F) dot dif bf(r)$ and $int bf(F) dot bf(n) dif s$.
]

Green's theorem works readily here because $cal(C)$ is closed.
You can also do parametrization, which is disgusting, but it works.

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Method],
      [Work $int_(cal(C)) bf(F) dot bf(r)$\ (see @sec-recipe-work)],
      [2D Flux $int_(cal(C)) bf(F) dot bf(n) dif s$ \ (see @sec-recipe-2d-flux)]),
    [$bf(F)$ is conservative \ $==>$ FTC],
      [_Cannot use here_], [_Not applicable_],
    [$cal(C)$ is a closed loop \ $==>$ Green],
      [$iint_(cal(R)) underbrace(0-3, "2D scalar curl") dif A = 0$],
      [Output $iint_(cal(R)) underbrace(2x+5, "Div" = nabla dot bf(F)) dif A = 5pi$],
    [Bare-hands definition \ Use parametrization],
      [$int_(t=0)^(2pi) vec(cos(t)^2+3sin(t), 5sin(t)) dot vec(-sin(t), cos(t)) dif t$],
      [$int_(t=0)^(2pi) vec(-5sin(t), cos(t)^2+3sin(t)) dot vec(-sin(t), cos(t)) dif t$],
  ),
  caption: [For $bf(F) = vec(x^2+3y, 5y)$ which is not conservative,
    integrated over the unit circle.],
  kind: table
)

=== Green's theorem for work

For the work version, we do
$ (partial q) / (partial x) &= (partial) / (partial x) (5 y) = 0 \
  (partial p) / (partial y) &= (partial) / (partial y) (x^2 + 3 y) = 3 . $
so the answer is $iint_(cal(R)) (0-3) dif A = #boxed[$ -3 pi $]$.

=== Bare-hands for work

We need to compute
$ int_(t=0)^(2pi) vec(cos(t)^2+3sin(t), 5sin(t)) dot vec(-sin(t), cos(t)) dif t. $

Expanding the dot product gives
$ int_(t=0)^(2 pi) (-cos^2 t sin t - 3 pi sin^2 t + 5 pi sin t cos t) dif t . $
Compute each integral separately:
1. $int_(t=0)^(2 pi) cos^2 t sin t dif t$:
  Let $u = cos t$, then $dif u = - sin t dif t$.
  $ integral cos^2 t sin t dif t = - integral u^2 dif u = - u^3 / 3 + C = - (cos^3 t) / (3) + C . $
  Evaluate from $0$ to $2 pi$:
  $ [- (cos^3 t) / (3)]_(t=0)^(2 pi) = - frac(cos^3 (2 pi), 3) + (cos^3 0) / (3) = - 1 / 3 + 1 / 3 = 0 . $
2. $int_(t=0)^(2 pi) sin^2 t dif t$:
  Use the identity $sin^2 t = (1 - cos 2 t) / (2)$:
  $ int_(t=0)^(2 pi) sin^2 t dif t = 1 / 2 int_(t=0)^(2 pi) (1 - cos 2 t) dif t = 1 / 2 [t - (sin 2 t) / (2)]_(t=0)^(2 pi) = 1 / 2 (2 pi - 0) = pi . $
3. $int_(t=0)^(2 pi) sin t cos t dif t$:
Use the identity $sin t cos t = (sin 2 t) / (2)$:
$ int_(t=0)^(2 pi) sin t cos t dif t = 1 / 2 int_(t=0)^(2 pi) sin 2 t dif t = 0 . $
(Since the integral of sine over its full period is zero.)
Combine the results to get
$ - 0 - 3 dot pi + 5 dot 0 = #boxed[$ -3 pi $]. $

=== Green's theorem for flux

For the flux version, it's instead
$ (partial p) / (partial x) &= (partial) / (partial x) (x^2 + 3 y) = 2 x \
  (partial q) / (partial y) &= (partial) / (partial y) (5 y) = 5 . $
so the flux is
$ oint_(cal(C)) bf(F) dot bf(n) dif s = iint_(cal(R)) (2 x + 5) dif A . $
By symmetry, we have
$ iint_(cal(R))  x dif A = 0 $
and we also have
$ iint_(cal(R)) 5 dif A &= 5 pi $
so we get the answer $0 + 5 pi = #boxed[$ 5 pi $]$.

#remark(title: [Polar coordinates is fine too for the flux one])[
  If you don't notice the symmetry trick, you can use polar coordinates too.
  Write $2 x + 5 = 2 r cos theta + 5$ and set up the flux integral as:
  $ oint_(cal(C)) bf(F) dot bf(n) dif s &= int_(theta=0)^(2 pi) int_(r=0)^1 (2 r cos theta + 5) r dif r dif theta \
    &= int_(theta=0)^(2 pi) int_(r=0)^1 (2 r^2 cos theta + 5 r) dif r dif theta \
    &= 2 int_(theta=0)^(2 pi) cos theta int_(r=0)^1 r^2 dif r dif theta
      + 5 int_(theta=0)^(2 pi) int_(r=0)^1 r dif r dif theta . $
  The inner integrals are $int_(r=0)^1 r^2 dif r = 1 / 3$ and $int_(r=0)^1 r dif r = 1 / 2$,
  so we get the same answer
  $ 2 dot 1 / 3 int_0^(2 pi) cos theta dif theta + 5 dot 1 / 2 int_0^(2 pi) dif theta
    = 2/3 dot 0 + 5 dot 1/2 dot 2 pi = 5 pi. $
]

=== Bare-hands for flux

We need to compute
$ int_(t=0)^(2pi) vec(-5sin(t), cos(t)^2+3sin(t)) dot vec(-sin(t), cos(t)) dif t. $

Expand the dot product:
 $ int_(t=0)^(2 pi) (cos^3 t + 3 sin t cos t + 5 sin^2 t) dif t . $
Compute each integral separately:
1. $int_(t=0)^(2 pi) cos^3 t dif t$:
  Use the identity $cos^3 t = (3 cos t + cos 3 t) / (4)$:
  $ int_(t=0)^(2 pi) cos^3 t dif t = 3 / 4 int_(t=0)^(2 pi) cos t dif t + 1 / 4 int_(t=0)^(2 pi) cos 3 t dif t = 0 + 0 = 0 . $
2. $int_(t=0)^(2 pi) sin t cos t dif t$:
  Use the identity $sin t cos t = (sin 2 t) / (2)$:
  $ int_(t=0)^(2 pi) sin t cos t dif t = 1 / 2 int_(t=0)^(2 pi) sin 2 t dif t = 0 . $
3. $int_(t=0)^(2 pi) sin^2 t dif t$:
  Use the identity $sin^2 t = (1 - cos 2 t) / (2)$:
  $ int_(t=0)^(2 pi) sin^2 t dif t = 1 / 2 int_(t=0)^(2 pi) (1 - cos 2 t) dif t = 1 / 2 [2 pi - 0] = pi . $
Combine the results to get
$ 0 + 3 dot 0 + 5 dot pi = #boxed[$ 5 pi $]. $

== Example with $bf(F) = vec(x^2+3y,5y)$ and $cal(C)$ a line segment

#sample[
  Let $bf(F) = vec(x^2+3y, 5y)$
  and let $cal(C)$ be the path from $(1,4)$ to $(3,9)$.
  Evaluate $int bf(F) dot dif bf(r)$ and $int bf(F) dot bf(n) dif s$.
]

Here in both cases we have to bite the bullet --- none of our shortcuts apply.
As before we use the parametrization
$ bf(r)(t) = vec(1+2t, 4+5t) quad 0 <= t <= 1 $
with
$ bf(r)'(t) = vec(2,5) quad 0 <= t <= 2pi. $

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Method],
      [Work $int_(cal(C)) bf(F) dot bf(r)$\ (see @sec-recipe-work)],
      [2D Flux $int_(cal(C)) bf(F) dot bf(n) dif s$ \ (see @sec-recipe-2d-flux)]),
    [$bf(F)$ is conservative \ $==>$ FTC],
      [_Cannot use here_], [_Not applicable_],
    [$cal(C)$ is a closed loop \ $==>$ Green],
      [_Cannot use here_],
      [_Cannot use here_],
    [Bare-hands definition \ Use parametrization],
      [$int_(t=0)^(1) vec((1+2t)^2+3(4+5t), 5(4+5t)) dot vec(2,5) dif t$],
      [$int_(t=0)^(1) vec(-5(4+5t), (1+2t)^2+3(4+5t)) dot vec(2,5) dif t$],
  ),
  caption: [For $bf(F) = vec(x^2+3y, 5y)$ which is not conservative,
    integrated over the unit circle.],
  kind: table
)

=== Bare-hands for work

For the work integral, substitute $1 + 2 t$ and $4 + 5 t$ into $bf(F)$:
$ bf(F) (1+2t, 4+5t) = vec((1 + 2 t)^2 + 3 (4 + 5 t) , thin 5 (4 + 5 t)) = vec(4t^2 + 19t + 13, 25t+20). $
Then the dot product is
Dot product:
$ vec(4t^2 + 19t + 13, 25t+20) dot vec(2,5) = 2 (4 t^2 + 19 t + 13) + 5 (25 t + 20) = 8 t^2 + 163 t + 126. $
Hence
$ int_(cal(C)) bf(F) dot dif bf(r) = int_(t=0)^1 (8t^2 + 163t + 126) dif t . $
Integrate term by term:
$ int_(t=0)^1 126 dif t &= 126, \
  int_(t=0)^1 163 t dif t &= [163 / 2 t^2]_(t=0)^1 = 163 / 2 (1)^2 - 163 / 2 (0)^2 = 163 / 2 , \
  int_(t=0)^1 8 t^2 dif t &= [8 / 3 t^3]_(t=0)^1 = 8 / 3 (1)^3 - 8 / 3 (0)^3 = 8 / 3 . $
Combine the results:
$ int_(cal(C)) bf(F) dot dif bf(r) = 126 + 163/2 + 8/3 = #boxed[$ 1261/6 $]. $

=== Bare-hands for flux

For the flux integral, instead do the dot product
$ vec(-(25t+20), 4t^2 + 19t + 13) dot vec(2,5) = -2 (25t+20) + 5(4t^2+19t+13) = 20t^2 + 45t + 25. $
Integrate term by term again:
$ int_(t=0)^1 25 dif t &= 25, \
  int_(t=0)^1 45 t dif t &= [45 / 2 t^2]_(t=0)^1 = 45 / 2 (1)^2 - 45 / 2 (0)^2 = 45 / 2 , \
  int_(t=0)^1 20 t^2 dif t &= [20 / 3 t^3]_(t=0)^1 = 20 / 3 (1)^3 - 20 / 3 (0)^3 = 20 / 3 . $
Combine the results:
$ int_(cal(C)) bf(F) dot bf(n) dif s = 25 + 45 / 2 + 20 / 3
  = 150 / 6 + 135 / 6 + 40 / 6 = #boxed[$ 325/6 $]. $
