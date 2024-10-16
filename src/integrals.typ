#import "@local/evan:1.0.0":*

= Double and triple integrals

#pagebreak()

= Change of variables

#pagebreak()

= Parametrized integrals


#sample[
  Compute the line integral of the vector field
  $bf(F) (x , y) = vec(2 x , 3 y)$ along the curve $C$
  which is the upper half of the circle $x^2 + y^2 = 1$, oriented counterclockwise.
]

#soln[
  The line integral of a vector field $bf(F)$ along a curve $C$
  is given by: $ int_C bf(F)(bf(r)(t)) dot bf(r)'(t) dif t $
  Parametrize the curve $C$ as $bf(r) (t) = (cos t , sin t)$, where $t in [0 , pi]$.

  First we compute $bf(r)'(t)$ which is $ bf(r)'(t) dif t = (- sin t, cos t) $.
  Meanwhile, the values of $bf(F)$ along the curve rae
  $ bf(F) (bf(r) (t)) = bf(F) (cos t , sin t) = (2 cos t , 3 sin t) $

  Hence, the dot product being integrated is
  $ bf(F) (bf(r) (t)) dot bf(r)'(t)
    &= (2 cos t) (- sin t) + (3 sin t) (cos t) \
    &= - 2 cos t sin t + 3 sin t cos t = cos t sin t $

  Integrate with respect to $t$ from $0$ to $pi$:
  $ int_0^pi cos t sin t dif t $

  Using the identity $cos t sin t = 1 / 2 sin (2 t)$, we rewrite the integral:
  $ int_0^pi cos t sin t dif t &= 1 / 2 int_0^pi sin (2 t) dif t \
    &= 1 / 2 [- 1 / 2 cos (2 t)]_0^pi \
    &= 1 / 2 [- 1 / 2 cos (2 pi) + 1 / 2 cos (0)] \
      &= 1 / 2 [- 1 / 2 (1) + 1 / 2 (1)] = 0. #qedhere $
]

#pagebreak()
