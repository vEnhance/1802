#import "@local/evan:1.0.0":*
#let poonen = link("https://math.mit.edu/~poonen/notes02.pdf")[Poonen's notes]
#show: evan.with(
  title: [Linear Algebra and Multivariable Calculus],
  subtitle: [Notes from MIT's 18.02 course in fall 2024],
  author: "Evan Chen",
  date: datetime.today(),
  report-style: true,
)

#rect(stroke: 2pt)[#image("lamv-cover-art.png", width: 100%)]

#pagebreak()

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
For comparison, Part Charlie corresponds approximately to §11 of #poonen.
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

#part[Part Golf: 2D integrals of scalar functions]
For comparison, Part Golf corresponds to §13.1-§13.5 of #poonen.
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

#part[Part Hotel: 3D integrals of scalar functions]
For comparison, Part Hotel corresponds to §13.6-13.9 and §17.1-§17.6 of #poonen.
#include "src/triple.typ"
#pagebreak()
#include "src/sph.typ"
#pagebreak()
#include "src/psurf.typ"
#pagebreak()
#include "src/scalint.typ"
#pagebreak()
#include "src/surfcross.typ"
#pagebreak()

#part[Part India: Line integrals of vector fields over a curve]
For comparison, Part India corresponds to §14, §15, §20, §21 of #poonen.
#include "src/vecfield.typ"
#pagebreak()
#include "src/gcd.typ"
#pagebreak()
#include "src/work.typ"
#pagebreak()
#include "src/ftcgreen.typ"
#pagebreak()
#include "src/2dflux.typ"
#pagebreak()
#include "src/lineex.typ"
#pagebreak()
#include "src/mt3.typ"
#pagebreak()

#part[Part Juliett: Flux integrals of vector fields over a surface]
For comparison, Part Juliett corresponds to §17.7, §18, §19, §21 of #poonen.
#include "src/flux.typ"
#pagebreak()
#include "src/divthm.typ"
#pagebreak()
#include "src/badstokes.typ"
#pagebreak()

#part[Part Kilo: Practice questions]
#include "src/practice.typ"
#pagebreak()

#part[Part Lima: Solutions]
#include "src/sol-alfa.typ"
#pagebreak()
#include "src/sol-bravo.typ"
#pagebreak()
#include "src/sol-charlie.typ"
#pagebreak()
#include "src/sol-delta.typ"
#pagebreak()
#include "src/sol-echo.typ"
#pagebreak()
#include "src/sol-foxtrot.typ"
#pagebreak()
#include "src/sol-golf.typ"
#pagebreak()
#include "src/sol-hotel.typ"
#pagebreak()
#include "src/sol-india.typ"
#pagebreak()
#include "src/sol-juliett.typ"
#pagebreak()
#include "src/sol-kilo.typ"
#pagebreak()

#part[Part Mike: Appendix]
#include "src/appendix.typ"
