#import "@local/evan:1.0.0":*
#let poonen = link("https://math.mit.edu/~poonen/notes02.pdf")[Poonen's notes]

#show: evan.with(
  title: [Linear Algebra and Multivariable Calculus],
  subtitle: [Notes from MIT's 18.02 course in fall 2024],
  author: "Evan Chen",
  date: datetime.today(),
)

#toc

#pagebreak()

#include "src/preface.typ"
#pagebreak()
#include "src/tsafe.typ"
#pagebreak()

#part[Part Alfa: Linear Algebra of Vectors]
For comparison, Part Alfa corresponds approximately to §1, §2, §3.9 of #poonen.
#include "src/vectors.typ"
#pagebreak()
#include "src/dot.typ"
#pagebreak()
#include "src/planes.typ"
#pagebreak()
#include "src/cross.typ"
#pagebreak()

#part[Part Bravo: Linear Algebra of Matrices]
For comparison, Part Bravo corresponds approximately to §3, §4, §6 of #poonen.
#include "src/matrix.typ"
#pagebreak()
#include "src/basis.typ"
#pagebreak()
#include "src/eigen.typ"
#pagebreak()

#part[Part Charlie: Review of complex numbers]
For comparison, Part Charlie (not including the review) corresponds approximately to §11 of #poonen.
#include "src/complex.typ"
#pagebreak()
#include "src/mt1.typ"
#pagebreak()

#part[Part Delta: Parametric side-quest]
For comparison, Part Delta corresponds approximately to §5 and §7 of #poonen.
#include "src/param.typ"
#pagebreak()

#part[Part Echo: Multivariable differentiation]
For comparison, Part Echo corresponds approximately to §8 and §12.1-§12.3 of #poonen.
#include "src/level.typ"
#pagebreak()
#include "src/partial.typ"
#pagebreak()
#include "src/grad.typ"
#pagebreak()
#include "src/antigrad.typ"
#pagebreak()

#part[Part Foxtrot: Optimization]
For comparison, Part Foxtrot corresponds approximately to §9 and §12.4-§12.6 of #poonen.
#include "src/minmax.typ"
#pagebreak()
#include "src/regions.typ"
#pagebreak()
#include "src/opt.typ"
#pagebreak()
#include "src/mt2.typ"
#pagebreak()

#part[Part Golf: Multivariate integrals]
For comparison, Part Golf corresponds to §13 and §17 of #poonen.
#include "src/ipep.typ"
#pagebreak()
#include "src/double.typ"
#pagebreak()
#include "src/chvar.typ"
#pagebreak()
#include "src/polar.typ"
#pagebreak()
#include "src/shorthand.typ"
#pagebreak()
#include "src/triple.typ"
#pagebreak()
#include "src/scalint.typ"
#pagebreak()

#part[Part Hotel: Grad, curl, and div]
For comparison, Part Hotel corresponds to §14, §15, §18, §19, §20, §21 of #poonen.
#include "src/vecfield.typ"
#pagebreak()
#include "src/gcd.typ"
#pagebreak()
#include "src/work.typ"
#pagebreak()
#include "src/2dflux.typ"
#pagebreak()
#include "src/flux.typ"
#pagebreak()
#include "src/mt3.typ"
#pagebreak()

#part[Part India: Practice questions]
#include "src/practice.typ"
#pagebreak()

#part[Part Juliett: Solutions]
#include "src/sol-alpha.typ"
#pagebreak()
#include "src/sol-bravo.typ"
#pagebreak()
#include "src/sol-charlie.typ"
#pagebreak()
#include "src/sol-mt1.typ"
#pagebreak()
#include "src/sol-delta.typ"
#pagebreak()
#include "src/sol-echo.typ"
#pagebreak()
#include "src/sol-foxtrot.typ"
#pagebreak()
#include "src/sol-mt2.typ"
#pagebreak()
#include "src/sol-golf.typ"
#pagebreak()
#include "src/sol-hotel.typ"
#pagebreak()
#include "src/sol-mt3.typ"
#pagebreak()
#include "src/sol-india.typ"
#pagebreak()

#part[Part Kilo: Appendix]
#include "src/appendix.typ"
