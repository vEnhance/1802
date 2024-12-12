#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [18.02 Mock Half-Final],
  author: "Evan Chen",
  date: [13 October 2024],
  maketitle: false,
)


#block[
#show heading: set align(center)
#set heading(numbering: none)

= 18.02 Mock Half-Final

- Since 3-hour exams constitute cruel and unusual punishment,
  this is only 90 minutes long. There will be eight questions.
  We cover all post-midterm 3 topics and a random subset of earlier topics.

- Like the real exam, I suggest not referring to any notes/calculators/etc.

- Solutions are posted in Section 45 of my LAMV book at #url("https://web.evanchen.cc/1802.html").
]

#pagebreak()

#block[
#show heading: set align(center)
#set heading(numbering: none)

= 18.02 Mock Half-Final Questions

/ 1.:
  There is a unique real number $a$ for which the matrix
  $M = mat(1,1;a,6)$ has an eigenvalue of $2$.
  Compute $a$, and compute the other eigenvalue of $M$.

/ 2.:
  Give an example of a complex number $z$ whose
  real and imaginary part are both negative such that $z^3 = - 1000 i$.
  Write your answer in rectangular form.

/ 3.:
  The four points $(b,0,0)$, $(0,b,0)$, $(0,0,b)$, and $(2,3,6)$ lie on a plane $cal(P)$.
  Compute $b$, and compute the distance from the origin to $cal(P)$.

/ 4.:
  Give an example of a saddle point of the function $f(x,y) = cos(x) + sin(y)$.

/ 5.:
  Compute the maximum and minimum value of $x^2+2y^2+4x$ over the region $x^2+y^2 <= 9$.

/ 6.:
  Compute $int_(0)^1 int_(x)^1 int_(y)^1 e^(z^3) dif z dif y dif x$.
  (Recommended approach: change the order of integration.)

/ 7.:
  Compute the real number $c$ for which
  $bf(F)(x,y,z) = angle.l 7 cos(x), thin cos(y) cos(2z), thin c sin(y) sin(2z) angle.r$
  is conservative.
  For that $c$, compute the maximum possible value of a line integral
  $int_(cal(C)) bf(F) dot dif bf(r)$ across all possible choices of some curve $cal(C)$ in $RR^3$.

/ 8.:
  Let $bf(F)(x,y,z) = angle.l x + e^y + z^3, thin e^x + y + z^3, thin z angle.r$.
  Let $cal(S)$ be the surface defined by $x^2+y^2=100$ and $1 <= z <= 2$,
  with normal vector oriented outwards (thus $cal(S)$ is the curved part of a cylinder).
  Compute the divergence of $bf(F)$.
  Then compute the flux of $bf(F)$ through $cal(S)$.
  (Recommended approach: add two "lids" to $cal(S)$, calculate flux through the lids by hand,
  then use the divergence theorem.)

Solutions are posted in Chapter N of #url("https://web.evanchen.cc/textbooks/lamv.pdf").
]


#pagebreak()

= Solutions draft
