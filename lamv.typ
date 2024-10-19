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
For comparison, this part corresponds approximately to §1, §2, §3.9 of #poonen.
#include "src/vectors.typ"
#pagebreak()
#include "src/dotprod.typ"
#pagebreak()
#include "src/crossprod.typ"
#pagebreak()

#part[Part Bravo: Linear Algebra of Matrices]
For comparison, this part corresponds approximately to §3, §4, §6 of #poonen.
#include "src/matrix.typ"
#pagebreak()
#include "src/basis.typ"
#pagebreak()

#part[Part Charlie: Review of complex numbers]
For comparison, this part (not including the review) corresponds approximately to §11 of #poonen.
#include "src/complex.typ"
#pagebreak()
#include "src/mt1.typ"
#pagebreak()

#part[Part Delta: Parametric side-quest]
For comparison, this part corresponds approximately to §5 and §7 of #poonen.
#include "src/parametric.typ"
#pagebreak()

#part[Part Echo: Multivariable differentiation]
For comparison, this part corresponds approximately to §8 and §12.1-§12.3 of #poonen.
#include "src/grad.typ"
#pagebreak()

#part[Part Foxtrot: Optimization]
For comparison, this part corresponds approximately to §9 and §12.4-§12.6 of #poonen.
#include "src/minmax.typ"
#pagebreak()
#include "src/opt.typ"
#pagebreak()
#include "src/mt2.typ"
#pagebreak()

#part[Part Golf: Multivariate integrals]
For comparison, this corresponds to §13 and §17 of #poonen.
#include "src/ipep.typ"
#pagebreak()
#include "src/integrals.typ"
#pagebreak()

#part[Part Hotel: Grad, Curl, and Div]
For comparison, this corresponds to §14, §15, §18, §19, §20, §21 of #poonen.
#include "src/vecfield.typ"
#pagebreak()
#include "src/gradcurldiv.typ"
#pagebreak()

#part[Solutions to midterm problems]
#include "src/sol-mt1.typ"
#pagebreak()
#include "src/sol-mt2.typ"
#pagebreak()

#part[Solutions to normal exercises]
#include "src/sol-bravo.typ"
#pagebreak()
#include "src/sol-charlie.typ"
#pagebreak()
#include "src/sol-foxtrot.typ"
#pagebreak()

#part[Appendix]
#include "src/appendix.typ"
