#import "@local/evan:1.0.0":*

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
This part corresponds approximately to §1, §2, §3.9 of Poonen's notes.
#include "src/vectors.typ"
#pagebreak()

#part[Part Bravo: Linear Algebra of Matrices]
This part corresponds approximately to §3, §4, §6 of Poonen's notes.
#include "src/matrix.typ"
#pagebreak()
#include "src/basis.typ"
#pagebreak()

#part[Part Charlie: Review of complex numbers]
This part (not including the review) corresponds approximately to §11 of Poonen's notes.
#include "src/complex.typ"
#pagebreak()
#include "src/mt1.typ"
#pagebreak()

#part[Part Delta: Parametric side-quest]
This part corresponds approximately to §5 and §7 of Poonen's notes.
#include "src/parametric.typ"
#pagebreak()

#part[Part Echo: Multivariable differentiation]
This part corresponds approximately to §8 and §12.1-§12.3 of Poonen's notes.
#include "src/grad.typ"
#pagebreak()

#part[Part Foxtrot: Optimization]
This part corresponds approximately to §9 and §12.4-§12.6 of Poonen's notes.
#include "src/minmax.typ"
#pagebreak()

#part[Part Golf: Multivariate integrals]
This corresponds to §13 and §17 of Poonen.
#include "src/integrals.typ"
#pagebreak()

#part[Solutions to the exercises and problems]
#include "src/sol-mt1.typ"
#pagebreak()

#part[Appendix]
#include "src/appendix.typ"
