#import "@local/evan:1.0.0":*
#import "@local/svg-emoji:0.1.0": setup-emoji // only if you want to use GH names for emojis
#show: setup-emoji

#show: evan.with(
  title: [18.02 Mock Midterm 2],
  author: "Evan Chen",
  date: [10 October 2024],
  maketitle: false,
)

#show heading: set align(center)
#set heading(numbering: none)

= 18.02 Mock Midterm 2 Instructions

- Don't turn the page until the signal to start is given (3:05 PM in 4-370 on October 21, 2024).

- You have 50 minutes to answer five questions.
  We're not grading anything, so write your solutions anywhere
  (the space below, other loose paper, notebook, iPad, etc.).

- Like the real exam, I suggest not referring to any notes/calculators/etc.

- Solutions are posted in Section 28 of my LAMV book at #url("https://web.evanchen.cc/1802.html").

#pagebreak()

= 18.02 Mock Midterm 2 Questions

/ Question 1.: A butterfly is fluttering in the $x y$ plane with position given by
  $bf(r)(t) = angle.l cos(t), cos(t) angle.r$, starting from
  time $t = 0$ at $bf(r)(0) = angle.l 1,1 angle.r$.
  - Compute the speed of the butterfly at $t = pi/3$.
  - Compute the arc length of the butterfly's trajectory from $t = 0$ to $t = 2 pi$.
  - Sketch the butterfly's trajectory from $t = 0$ to $t = 2pi$ in the $x y$ plane.

/ Question 2.: Let $k > 0$ be a fixed real number and let $f(x,y) = x^3 + k y^2$.
  Assume that the level curve of $f$ for the value $21$ passes through the point $P = (1,2)$.
  Compute the equation of the tangent line to this level curve at the point $P$.

/ Question 3.: Let $f(x,y) = x^(5y)$ for $x,y > 0$.
  Use linear approximation to estimate $f(1.001, 3.001)$ starting from the point $(1,1)$.

/ Question 4.:
  Consider the function $f : RR^2 -> RR$ defined by
  $ f(x,y) = cos(pi x) + y^4/4 - y^3/3 - y^2. $
  - Compute all the critical points and classify them using the second derivative test.
  - Find the global minimums and global maximums of $f$, if they exist.

/ Question 5.:
  Compute the minimum and maximum possible value of $x + 2 y + 2 z$
  over real numbers $x$, $y$, $z$ satisfying $x^2 + y^2 + z^2 <= 100$.
