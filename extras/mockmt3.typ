#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [18.02 Mock Midterm 3],
  author: "Evan Chen",
  date: [13 October 2024],
  maketitle: false,
)


#block[
#show heading: set align(center)
#set heading(numbering: none)

= 18.02 Mock Midterm 3 Instructions

- Don't turn the page until the signal to start is given (6:05pm ET in 1-190 on 13 Nov).

- You have 50 minutes to answer six questions.
  We're not grading anything, so write your solutions anywhere
  (the space below, other loose paper, notebook, iPad, etc.).

  - The real midterm is only five questions, which I didn't find out until yesterday.
    If you want, you can ignore the last question if you prefer to match the length.

- Like the real exam, I suggest not referring to any notes/calculators/etc.

- Solutions are posted in Section 45 of my LAMV book at #url("https://web.evanchen.cc/1802.html").
]

#pagebreak()

#block[
#show heading: set align(center)
#set heading(numbering: none)

= 18.02 Mock Midterm 3 Questions

/ 1.:
  Another butterfly is fluttering in the $x y$ plane
  with position $bf(r)(t) = chevron.l sin(t), sin(t) chevron.r$.
  Let $cal(C)$ denote its trajectory between $0 <= t <= 2pi$.
  Compute $int_(cal(C)) (x dif x)$ and $int_(cal(C)) (y dif x)$.

/ 2.:
  Let $cal(C)$ denote the unit circle $x^2+y^2=1$ oriented counterclockwise,
  and consider the vector field $bf(F)(x,y) = chevron.l x+2y, 4x+8y chevron.r$.
  Compute $int_(cal(C)) bf(F) dot dif bf(r)$ and $int_(cal(C)) bf(F) dot bf(n) dif s$.

/ 3.:
  Compute all real numbers $k$ for which the region
  $(k x + y)^2 + (x + k y)^2 <= 1/4$ has area $pi$.

/ 4.:
  Compute the center of mass of the region where $y >= 0$ and $3x^2 <= y^2 <= 9 - x^2$.
  (Assume $rho=1$.)

/ 5.:
  Let $cal(C)$ denote any path from $(0,0)$ to $(pi,pi)$.
  Find the unique function $h(x)$ for which the vector field
  $bf(F)(x,y) = chevron.l x y + cos(x), h(x) + cos(y) chevron.r$ is conservative,
  and moreover $int_(cal(C)) bf(F) dot dif bf(r) = 0$.

/ 6.: Assume $log$ is base $e approx 2.718$. Use any method you want#footnote[
    Recommended approach: view the integral as the area under a curve,
    then switch from vertical to horizontal slicing.]
  to compute $ int_(x=0)^((e-1)^2) log(sqrt(x)+1) dif x. $


Solutions are posted in Section 45 of #url("https://web.evanchen.cc/textbooks/lamv.pdf").
]


= Solutions draft

I did check my work with ChatGPT which gets all the same answers as me:
#url("https://chatgpt.com/share/67312fb3-d7f4-8007-a50c-8eeefedc2ee5").

See LAMV for the actual solutions.
