#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Digressions for 18.02 Recitation 2],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: datetime.today(),
)

This handout (and all my other personal notes) are posted at #url("https://web.evanchen.cc/1802.html").

= Housekeeping

- Office hours is every Monday at 10am.
  - Today's office hours is in 2-361 temporarily, because MIT registrar still hasn't given me a room.
  - I'll update my website once I know what room I'm stuck in.
- If you want additional office hours with me,
  you can send me an email to schedule a separate appointment.
- Apparently I'm supposed to take attendance.
  - There's now an attendance form on my website, fill out please and thanks.

= Errata from last Wednesday

Last week in R1 I said that it probably didn't actually matter which way you labeled your axes.
*This is wrong!* You need to pick a labeling consistent with the *right-hand rule*.
I think it's easier to remember that you put your index finger along the $+x$-direction,
middle finger along the $+y$-direction, and thumb along the $+z$ direction.

= Trivial vs non-trivial results

18.02 is not a proof-based class, so I will not talk about formal proofs during recitation.
(If you want proofs, come to office hours).
Moreover, you will take a lot of theorems in this class as *black boxes*.

However, I want to at least distinguish between two things:

- *"Trivial theorems"*: an A+ student in 18.02 could reasonably justify this theorem to a friend
  why this theorem is true using material from earlier in the course.
- *"Nontrivial theorems"*: an explanation of why the theorem holds
  requires at least one new idea, concept, or some substantial calculation.

You're not expected to know how to prove the trivial theorems either; you are on P/NR, after all.
But I think it's helpful context if I at least tell you
which results are _supposed_ to be easy and which are _supposed_ to be hard.
(Though for exams, you just memorize all of them anyway.)

For example, in R1 last week,
I explained how a bunch of concepts had both a geometric picture and an algebraic definition.
The fact that the picture matches the definition was _trivial_ for all material in R1:
for example, the fact that $vec(a,b)$ has length $sqrt(a^2+b^2)$
is a direct consequence of the Pythagorean theorem.
I'm sorry for anyone that was bored.

However, in contrast, many of the results in your Thursday/Friday lectures are nontrivial.

- The theorem saying the algebraic definition $x_1 x_2 + y_1 y_2 + z_1 z_2$ of the dot product
  coincides with the geometric definition $|bf(a)| |bf(b)| cos theta$ is nontrivial.

  In fact, when I was walking home after your first recitation last week,
  I was thinking to myself about what I needed to say for today,
  and I realized I didn't actually know how to prove this either!
  I was walking from Charles/MGH to my home, which is a 15-minute walk,
  and it took the entire walk for me to figure out how to prove it.

  I typed up the proof in #url("https://web.evanchen.cc/1802.html") if you want to see it.
  Poonen proves this using the law of cosines, but it's tricky, and it uses the law of cosines.
  I think my proof is easier to come up with but longer and less clever.

- Pretty much everything with determinants is black magic.
  Even pure algebra like $det(A B) = det(A) det(B)$
  for two $2 times 2$ matrices $A$ and $B$ is painful: imagine expanding
  $ det(mat(a_1, b_1; c_1, d_1) mat(a_2, b_2; c_2, d_2))
  = det mat(a_1, b_1; c_1, d_1) det mat(a_2, b_2; c_2, d_2) . $
  It seems like a minor miracle: one would have to verify
  #eqn[
    $
      (a_1 a_2 + b_1 c_2) (c_1 b_2 + d_1 d_2) - (a_1 b_2 + b_1 d_2)(a_2 c_1 + c_2 d_1)
      = (a_1 d_1 - b_1 c_1)(a_2 d_2 - b_2 c_2)
    $
    <det2>
  ]
  which you can do, but it's not fun.
  And that's just $2 times 2$ matrices. The $3 times 3$ one is even worse,
  and the $n times n$ situation is a lost cause.

  I actually have really strong opinions on how linear algebra should be taught;
  I strongly prefer certain abstract "intrinsic" definitions that
  don't rely on coordinates and formulas like the 18.02 definitions do,
  because such definitions explain why all these miracles keep happening.
  Unfortunately, this is too abstract to do in just a few weeks of 18.02.

  But if you are curious and want to open Pandora's box, take 18.700 or 18.701!
  Or if you want to just jump into the deep end of the pool,
  I also wrote this up in chapters 9 and 12 of my advanced textbook
  _An Infinitely Large Napkin_ (#url("https://evanchen.cc/napkin.html")).
  You'll get to learn about something called the _exterior power_
  that will let you _derive_ the formula for the determinant and see where it comes from
  (in contrast to 18.02, where you are just given the mysterious formula
  and have to memorize it).

- The geometric picture of the cross product is nontrivial,
  but you can prove it by brute-force calculation.
  Specifically, given $bf(a)$ and $bf(b)$ in $RR^3$,
  you have a long formula for $bf(c) = bf(a) times bf(b)$.
  You can manually calculate the dot products $bf(c) dot bf(a) = bf(c) dot bf(b) = 0$
  and also that the signed volume of the parallelpiped formed by $bf(a)$, $bf(b)$,
  and $1/(|bf(c)|^2) bf(c)$ is $1$.
  However, this calculation is even more disgusting than the one in @det2.
