#import "@local/evan:1.0.0":*
#let poonen = link("https://math.mit.edu/~poonen/notes02.pdf")[Poonen's notes]

#show: evan.with(
  title: [Linear Algebra and Multivariable Calculus],
  subtitle: [Notes from 18.02 Fall 2024],
  author: "Evan Chen",
  date: datetime.today(),
)

#toc

#pagebreak()

#include "src/preface.typ"
#pagebreak()
#include "src/type-safety.typ"
#pagebreak()

#part[Part Alfa: Linear Algebra of Vectors]
For comparison, Part Alfa corresponds approximately to §1, §2, §3.9 of #poonen.
#include "src/vectors.typ"
#pagebreak()
#include "src/dotprod.typ"
#pagebreak()
#include "src/crossprod.typ"
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
#include "src/parametric.typ"
#pagebreak()

#part[Part Echo: Multivariable differentiation]
For comparison, Part Echo corresponds approximately to §8 and §12.1-§12.3 of #poonen.
#include "src/level.typ"
#pagebreak()
#include "src/partial.typ"
#pagebreak()
#include "src/grad.typ"
#pagebreak()

#part[Part Foxtrot: Optimization]
For comparison, Part Foxtrot corresponds approximately to §9 and §12.4-§12.6 of #poonen.
#include "src/minmax.typ"
#pagebreak()
#include "src/opt.typ"
#pagebreak()
#include "src/mt2.typ"
#pagebreak()

#part[Part Golf: Multivariate integrals]
For comparison, Part Golf corresponds to §13 and §17 of #poonen.
#include "src/ipep.typ"
#pagebreak()
#include "src/ints.typ"
#pagebreak()
#include "src/chvar.typ"
#pagebreak()
#include "src/polar.typ"
#pagebreak()
#include "src/shorthand.typ"
#pagebreak()
#include "src/triple.typ"
#pagebreak()
#include "src/paraint.typ"
#pagebreak()

#part[Part Hotel: Grad, Curl, and Div]
For comparison, Part Hotel corresponds to §14, §15, §18, §19, §20, §21 of #poonen.
#include "src/vecfield.typ"
#pagebreak()
#include "src/gcd.typ"
#pagebreak()
#include "src/work.typ"
#pagebreak()
#include "src/flux.typ"
#pagebreak()

#part[Solutions to normal exercises]
#include "src/sol-bravo.typ"
#pagebreak()
#include "src/sol-charlie.typ"
#pagebreak()
#include "src/sol-foxtrot.typ"
#pagebreak()
#include "src/sol-golf.typ"
#pagebreak()

#part[Solutions to mock midterm problems]
#include "src/sol-mt1.typ"
#pagebreak()
#include "src/sol-mt2.typ"
#pagebreak()

#part[Appendix]
#include "src/appendix.typ"
