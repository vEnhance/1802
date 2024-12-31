#import "@local/evan:1.0.0":*

= Practice midterm for 2D topics in Parts Golf, Hotel, India <ch-mt3>

This is a practice midterm that was given on November 13, 2024,
covering topics in Part Golf, Hotel, and India,
but only the 2D topics in these parts.
Solutions are in @ch-sol-mt3.

#exer[
  Another butterfly is fluttering in the $x y$ plane
  with position $bf(r)(t) = angle.l sin(t), sin(t) angle.r$.
  Let $cal(C)$ denote its trajectory between $0 <= t <= 2pi$.
  Compute $int_(cal(C)) (x dif x)$ and $int_(cal(C)) (y dif x)$.
] <exer-mt3-butterfly>

#exer[
  Let $cal(C)$ denote the unit circle $x^2+y^2=1$ oriented counterclockwise,
  and consider the vector field $bf(F)(x,y) = angle.l x+2y, 4x+8y angle.r$.
  Compute $int_(cal(C)) bf(F) dot dif bf(r)$ and $int_(cal(C)) bf(F) dot bf(n) dif s$.
] <exer-mt3-green>

#exer[
  Compute all real numbers $k$ for which the following region has area $pi$:
  $ (k x + y)^2 + (x + k y)^2 <= 1/4. $
] <exer-mt3-chvar>

#exer[
  Compute the center of mass of the region where $y >= 0$ and $3x^2 <= y^2 <= 9 - x^2$,
  assuming constant density.
] <exer-mt3-polar>

#exer[
  Let $cal(C)$ denote any path from $(0,0)$ to $(pi,pi)$.
  Determine the unique function $h(x)$ for which
  $bf(F)(x,y) = angle.l x y + cos(x), h(x) + cos(y) angle.r$ is conservative,
  and moreover $int_(cal(C)) bf(F) dot dif bf(r) = 0$.
] <exer-mt3-consv>

#exer[
  Assume $log$ is base $e approx 2.718$. Use any method you want
  to compute $ int_(x=0)^((e-1)^2) log(sqrt(x)+1) dif x. $
  Recommended approach: view the integral as the area under a curve,
  then switch from vertical to horizontal slicing.
] <exer-mt3-log>
