#import "@local/evan:1.0.0":*
#let poonen = link("https://math.mit.edu/~poonen/notes02.pdf")[Poonen's notes]
#let epigraph(quote_src, quote_text) = {
  set text(size: 10pt)
  pad(left: 35%)[
    #emph(quote_text)
    #line(length: 100%)
    #align(right)[--- #quote_src]
  ]
}

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
#epigraph[_Infinite Jest_, David Foster Wallace][
  It's a very American illness,
  the idea of giving yourself away entirely to the idea
  of working in order to achieve some sort of brass ring
  that usually involves people feeling some way about you.
]
For comparison, Part Alfa corresponds roughly to §1, §2, §3.9 of #poonen.
#include "src/vectors.typ"
#pagebreak()
#include "src/dot.typ"
#pagebreak()
#include "src/planes.typ"
#pagebreak()
#include "src/cross.typ"
#pagebreak()

#part[Part Bravo: Linear Algebra of Matrices]
#epigraph[Lydia's opening line in
  #link("https://anserena.com/other/writing/")[_Holding on to Her Words_], by Serena An][
  Translation is a bridge. It can bridge two languages, time periods, cultures.
  The pages of a book and your mind.  Even the space between two people.
  Translation involves reflecting on yourself and your relationships with others.
  That’s at the heart of why I study Chinese literature.
  But it took me many years to realize that.
]
For comparison, Part Bravo corresponds roughly to §3, §4, §6 of #poonen.
#include "src/matrix.typ"
#pagebreak()
#include "src/basis.typ"
#pagebreak()
#include "src/eigen.typ"
#pagebreak()

#part[Part Charlie: Review of complex numbers]
#epigraph[#link("https://w.wiki/Tpof")[Stephen's Sausage Roll]][
  Learned people cast great shadows.
]
For comparison, Part Charlie corresponds roughly to §11 of #poonen.
#include "src/complex.typ"
#pagebreak()
#include "src/mt1.typ"
#pagebreak()

#part[Part Delta: Parametric side-quest]
#epigraph[#link("https://www.ams.org/notices/201005/rtx100500608p.pdf")[What is mathematics for?], Underwood Dudley][
  However, when I am before a bar of judgment, heavenly or otherwise, and asked to
  justify my life, I will draw myself up proudly and say,
  "I was one of the stewards of mathematics, and it came to no harm in my care".
  I will not say, "I helped people get jobs".
]
For comparison, Part Delta corresponds roughly to §5 and §7 of #poonen.
#include "src/param.typ"
#pagebreak()

#part[Part Echo: Multivariable differentiation]
For comparison, Part Echo corresponds roughly to §8 and §12.1-§12.3 of #poonen.
#include "src/level.typ"
#pagebreak()
#include "src/partial.typ"
#pagebreak()
#include "src/grad.typ"
#pagebreak()
#include "src/antigrad.typ"
#pagebreak()

#part[Part Foxtrot: Optimization]
For comparison, Part Foxtrot corresponds roughly to §9 and §12.4-§12.6 of #poonen.
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
#epigraph[#link("https://mitadmissions.org/discover/life-culture/hacks-tomfoolery-pranks/")[MIT hacker code of ethics]][
  Brute force is the last resort of the incompetent.
]
#include "src/practice.typ"
#pagebreak()

#part[Part Lima: Solutions]
#epigraph[Lester Gardner][
  The beaver is noted for his engineering, mechanical skills, and industry.
  His habits are nocturnal. He does his best work in the dark.
]
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
