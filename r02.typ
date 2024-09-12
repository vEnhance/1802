#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Notes for 18.02 Recitation 2],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [9 September 2024],
)

#quote[
  You all have a little bit of "I want to save the world" in you,
  that's why you're here, in college.
  I want you to know that it's okay if you only save one person,
  and it's okay if that person is you.
]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

= Housekeeping

- Office hours is every Monday at 10am.
  - Today's office hours is in 2-361 temporarily, only for this week.
  - I'll update my website once I know what room I'm stuck in.
- If you want additional office hours with me,
  you can email me to schedule a separate appointment.
- Apparently I'm supposed to take attendance. Please fill out the attendance form on my site.

= Errata from last Wednesday

Last week in R1 I said that it probably didn't actually matter which way you labeled your axes.
*This is wrong!* You need to pick a labeling consistent with the *right-hand rule*.
I think it's easier to remember that you put your (right) index finger along the $+x$-direction,
middle finger along the $+y$-direction, and thumb along the $+z$-direction.

= The TL;DR cookbook

Up until now you were given a bunch of _definitions_ of the dot product,
cross product, and determinant.
Another way you can think about them is by _what they're used for_,
which may or may not be more useful for actually doing homework and exam questions.

- Dot product (type signature: takes two vectors as input and outputs a scalar)
  - Answers the question "*are two vectors perpendicular?*".
    (Check whether the dot product is zero.)
  - More generally, gives you the *angle between two vectors*.
    - Requires the extra step of dividing by the lengths of the vectors and take inverse cosine.
  - Also gives you the *scalar projection*.
    - Requires the extra step of dividing by the length of the vector you're projecting onto.
- $3 times 3$ determinant (type signature: takes $3 times 3$ matrix as input and outputs a scalar)
  - Gives you the *volume of a parallelepiped*.
    (take the determinant $arrow(D A)$, $arrow(D B)$, $arrow(D C)$).
  - In particular, you can check *coplanar* by seeing if the volume is zero.
- Cross product of $arrow(A B)$ and $arrow(A C)$
  (type signature: takes two $RR^3$ vectors and outputs an $RR^3$ vector)
  - The magnitude gives you _twice_ the (signed) *area* of the triangle $A B C$.
  - The direction gives you a vector *perpendicular to both*.

= Analogy for normal vectors and planes in $RR^3$ by changing to $RR^2$

If you are confused about normal vectors in the plane, it might help to first do the $RR^2$ case,
which is easier to draw and for which you might have better intuition from eighth or ninth
grade algebra.

Here's a question: what's the set of vectors in $RR^2$ perpendicular to $vec(1,2)$?
It's a line of slope $-1/2$ through the origin, namely
$ 0 = vec(x,y) dot vec(1, 2) <=> 0 = x + 2 y. $

#figure(
  image("figures/r02-x-plus-2y.png", width: 12cm),
  caption: [Plots of $x+2y=0$ and $x+2y=pi$.],
)

Okay, in that case what does the line
$ x + 2 y = pi $
look like? Well, it's a parallel line, the slope is still the same.

Equivalently, you could also imagine it as the set of points $vec(x,y)$ such that
$ vec(x,y) - vec(pi,0) " is perpendicular to " (1,2) $
or do the same thing for any point on the line, like
$ vec(x,y) - vec(0, pi slash 2) " is perpendicular to " (1,2) $
or even
$ vec(x,y) - vec(0.218 pi, 0.564 pi) " is perpendicular to " (1,2) $
But that's silly. Most of the time you don't care about base points.
All you care if you want the line have the specific slope $-1/2$,
and for that the LHS just needs to be $x + 2y$ (or even $100 x + 200 y$).
The RHS can be whatever you want.

In $RR^3$, the exact same thing is true for the expression $a x + b y + c z = d$.
The only difference is that the word "slope" is banned (or at least needs a new type;
it won't be a single number).
Nevertheless, even if we can't talk about slope, we can still talk about parallel planes,
and now the whole discussion carries over wholesale.

= Digression: Trivial vs non-trivial results

18.02 is not a proof-based class, so I will not talk about formal proofs during recitation.
(If you want proofs, come to office hours.)
So you will take a lot of theorems in this class as *black boxes*.

However, I want to at least distinguish between two things:

- *"Trivial theorems"*: an A-level student in 18.02 could reasonably justify this theorem to a friend
  using material from earlier in the course.
- *"Nontrivial theorems"*: an explanation of why the theorem holds
  requires at least one new idea, concept, or some substantial calculation.

You're not expected to know how to prove the trivial theorems either;
you are on P/NR, after all, enjoy it.
But I think it's helpful context if I at least tell you
which results are _supposed_ to be easy and which are _supposed_ to be hard.
(Though for exams, you just memorize all of them anyway.)

For example, in R1 last week,
I explained how a bunch of concepts had both a geometric picture and an algebraic definition.
The fact that the picture matches the definition was _trivial_ for all material in R1:
for example, the fact that $vec(a,b)$ has length $sqrt(a^2+b^2)$
is a direct consequence of the Pythagorean theorem.
I'm sorry for anyone that was bored.

However, in contrast, many of the results in your
Thursday/Friday lectures are _really_ nontrivial.

- The theorem saying the algebraic definition $x_1 x_2 + y_1 y_2 + z_1 z_2$ of the dot product
  coincides with the geometric definition $|bf(a)| |bf(b)| cos theta$ is nontrivial.
  In fact, when I was walking home after your first recitation last week,
  I was thinking to myself about what I needed to say for today,
  and I realized I didn't actually know how to prove this either!
  I was walking from Charles/MGH, which is a 15-minute walk,
  and it took the whole time to figure out a proof.

  I typed up the proof in #url("https://web.evanchen.cc/1802.html") if you want to see it.
  Poonen proves this using the law of cosines, but it's tricky.
  I think my proof is easier to come up with but longer and less clever.

- Pretty much everything with determinants is black magic.
  Even pure algebra like $det(A B) = det(A) det(B)$
  for two $2 times 2$ matrices $A$ and $B$ is painful: imagine expanding
  $ det(mat(a_1, b_1; c_1, d_1) mat(a_2, b_2; c_2, d_2))
  = det mat(a_1, b_1; c_1, d_1) det mat(a_2, b_2; c_2, d_2) . $
  It seems like a minor miracle: one would have to verify
  #eqn[
    $
      (a_1 a_2 + b_1 c_2) (c_1 b_2 + d_1 d_2) - (a_1 b_2 + b_1 d_2)(a_2 c_1 + c_2 d_1) \
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
  because the abstract definitions explain why all these miracles keep happening.
  Unfortunately, this is too abstract to do in just a few weeks of 18.02.

  But if you are curious and want to open Pandora's box, take 18.700 or 18.701!
  Or if you want to just jump into the deep end of the pool,
  I also wrote this up in chapters 9 and 12 of my advanced textbook
  _An Infinitely Large Napkin_ (#url("https://evanchen.cc/napkin.html")).
  You'll get to learn about something called the _wedge product_
  that will let you _derive_ the formula for the determinant and see where it comes from
  (in contrast to 18.02, where you are just given the mysterious formula
  and have to memorize it).

- The geometric picture of the cross product is nontrivial,
  but you can verify it by brute-force calculation.
  Specifically, given $bf(a)$ and $bf(b)$ in $RR^3$,
  you have a long formula for $bf(c) = bf(a) times bf(b)$.
  You can manually verify that $bf(c) dot bf(a) = bf(c) dot bf(b) = 0$
  and also that the signed volume of the parallelpiped formed by $bf(a)$, $bf(b)$,
  and $1/(|bf(c)|^2) bf(c)$ is $1$.
  However, this calculation is even more disgusting than the one in @det2,
  and unsatisfying because it doesn't show you where the formula comes from
  (only proves it's correct).

  (In truth, the cross product is secretly a worse form of the wedge product. Just saying. `;)`)

= Recitation questions from Prof Maulik

== Problem 1

Consider the vectors $upright(bold(a)) = angle.l 2 , 3 , 6 angle.r$ and
$upright(bold(b)) = angle.l 1 , 2 , 2 angle.r$.

- What is the scalar component of $upright(bold(a))$ in the direction of
  $upright(bold(b))$?

- What is the vector component of $upright(bold(a))$ in the direction of
  $upright(bold(b))$?

== Problem 2 (from Poonen notes 3.7-3.10): Introduction to planes

- What does the set of vectors perpendicular to
  $angle.l 1 , 2 , 3 angle.r$ look like?

- What is the equation of the plane with normal vector
  $angle.l 1 , 2 , 3 angle.r$ passing through the point $P$ with
  coordinates $(4 , 5 , 6)$?

- Are the vector $angle.l - 5 , 1 , 1 angle.r$ and the plane
  $x + 2 y + 3 z = 6$ parallel? Perpendicular? Both? Neither?

- What is the distance from the point $Q$ with coordinates $(2 , 3 , 5)$
  to the plane in the second part of this question? (Take the vector
  $arrow(P Q)$ and project onto the normal direction to the plane.)

== Problem 3

Consider the three points
$P : (1 , 2 , 4) ; Q : (0 , 1 , 3) ; R : (2 , 4 , 7)$.

- Calculate the cross-product $arrow(P Q) times arrow(P R)$.

- What is the equation of the plane containing the points $P , Q , R$?
  (See the second part of the last question.)

- What is the area of the triangle $P Q R$?

== Another problem I made up in the shower if the first three are too easy

- Suppose $A$, $B$, $C$, $D$ are points in $RR^3$.
  What is the geometric interpretation of the following expression#footnote[
    First make sure you know what type of object it is.
    For the final answer to the whole question, open the following Wikipedia page:
    #url("https://w.wiki/9bmU").
  ]?
  $ (arrow(D A) times arrow(D B)) dot arrow(D C) $
- Suppose $P = (p_1, ..., p_n)$ is a point in $RR^n$
  while $cal(H)$ is the hyperplane $a_1 x_1 + ... + a_n x_n = c$.
  Prove that the distance from $P$ to $cal(H)$ is given by the following formula:
  $ (|(a_1 p_1 + ... + a_n p_n) - c|) / sqrt(a_1^2+...+a_n^2). $
