#import "@local/evan:1.0.0":*

= Double and triple integrals

#pagebreak()

= Change of variables

#pagebreak()

= Parametrized integrals


#sample[
  Compute the line integral of the vector field
  $bf(F) (x , y) = (2 x , 3 y)$ along the curve $C$, which is
  the upper half of the circle $x^2 + y^2 = 1$, oriented counterclockwise.
]

#soln[
  The line integral of a vector field $bf(F)$ along a curve $C$
  is given by: $ int_C bf(F) dot dif bf(r) $
  where $dif bf(r) = (d x , dif y)$. Parametrize the curve $C$ as
  $bf(r) (t) = (cos t , sin t)$, where $t in [0 , pi]$.

  1. First, compute $dif bf(r)$:
    $ dif bf(r) = (- sin t thin dif t , cos t thin dif t) $

  2. Evaluate $bf(F) (bf(r) (t))$:
    $ bf(F) (bf(r) (t)) = bf(F) (cos t , sin t) = (2 cos t , 3 sin t) $

  3. Now, compute the dot product
    $bf(F) (bf(r) (t)) dot dif bf(r)$:
    $ bf(F) (bf(r) (t)) dot dif bf(r) = (2 cos t) (- sin t) + (3 sin t) (cos t) = - 2 cos t sin t + 3 sin t cos t = cos t sin t $

  4. Finally, integrate with respect to $t$ from $0$ to $pi$:
    $ int_0^pi cos t sin t thin dif t $

    Using the identity $cos t sin t = 1 / 2 sin (2 t)$, we rewrite the integral:
    $ int_0^pi cos t sin t thin dif t &= 1 / 2 int_0^pi sin (2 t) thin dif t \
      &= 1 / 2 [- 1 / 2 cos (2 t)]_0^pi \
      &= 1 / 2 [- 1 / 2 cos (2 pi) + 1 / 2 cos (0)] \
      &= 1 / 2 [- 1 / 2 (1) + 1 / 2 (1)] = 0. $
]

#pagebreak()
