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

#part[Linear Algebra I: Vectors]
#include "src/vectors.typ"
#pagebreak()

#part[Linear Algebra II: Matrices]
#include "src/matrix.typ"
#pagebreak()
#include "src/basis.typ"
#pagebreak()

#part[Parametric side-quest]
To be written later.
#pagebreak()

#part[Multivariable differentiation]
#include "src/grad.typ"

#pagebreak()
