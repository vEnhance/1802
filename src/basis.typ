#import "@local/evan:1.0.0":*

= Linear combinations of vectors

== [TEXT] Basis of vectors

== [RECIPE] Describing spans of explicit vectors

== Systems of equations

== [RECIPE] Number of solutions to a square system of linear equations

== [EXER] Exercises

#exer[
  Take your birthday and write it in eight-digit $Y_1 Y_2 Y_3 Y_4$-$M_1 M_2$-$D_1 D_2$ format.
  Consider the two vectors
  $ bf(v)_1 = vec(M_1 M_2, D_1 D_2) " and " bf(v)_2 = vec(Y_1 Y_2, Y_3 Y_4). $
  For example, if your birthday was May 17, 1994
  you would take $bf(v)_1 = vec(5, 17)$ and $bf(v)_2 = vec(19, 94)$.

  - Determine the span of those two vectors in $RR^2$.
  - Find a current or former K-pop idol who gets a different answer from you
    when they use their birthday.
] <exer-basis-birthday>

#exer[
  In $RR^5$, consider the vector $bf(v) = angle.l 1,2,3,4,5 angle.r$.
  What's the maximum number of linearly independent vectors one can find
  which are all perpendicular to $bf(v)$?
]
