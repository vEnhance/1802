#import "@local/evan:1.0.0":*

= Preface

At MIT, the course 18.02 (multivariable calculus) is a general institute requirement (GIR);
every student must pass this class in order to graduate.
These are lecture notes based upon the fall 2024 instance of the course, taught by Davesh Maulik.

== Goals of this book

These notes have the following lofty goal:
#proposition[
  In theory, an incoming MIT student should be able to pass the 18.02 final exam
  by *only* reading these notes and problems, working through several practice final exams,
  and going to a weekly office-hours#footnote[
    You can substitute the office hours for a knowledgeable friend, or similar.
    The point is that you should have at least some access to live Q/A.
  ] to ask questions to a real human.
]
This is ambitious, and your mileage my vary.
Just to be clear, this text is unofficial material and there is no warranty or promise
that this goal will be fulfilled for you.
(Also, if you are actually an MIT student, bear in mind the content of the course
will vary by instructor.)
But with this goal in mind, here are some parts of the design philosophy of this book.

- *It's practical*. It sticks to the basics and
  emphasizes giving straight cookbook-like answers to common exam questions.
  - I better say something about memorizing recipes.
    In principle, if you have perfect memory, you could potentially get a passing score
    on the final exam by _only_ memorizing the recipes.

    I don't recommend this approach; even a vague conceptual understanding of where a recipe
    is at minimum quite helpful for remembering said recipe.
    But it may be useful to know in principle that the recipe is all you need
    (and conversely, that you should have the recipes down by heart).

- *It's concrete*. We only work in $RR^n$, and not a generic vector space.
  We don't use anywhere near the level of abstraction as, say, the Napkin#footnote[
    That's the one at #url("https://web.evanchen.cc/napkin.html"),
    which _does_ assume a proof-based background.
  ].
  We don't assume proof experience.
- *It writes things out*.
  A lot of lecture notes were meant to accompany a in-person lecture rather than replace it.
  These notes are different.
  They are meant to stand alone, and anything that would normally
  be said out loud is instead written out in text.
- *It has full solutions to its exercises*. I really believe in writing things out.
- *It tries to explain where formulas come from*.
  For example, these notes spell out how matrix multiplication corresponds
  to function composition, something that isn't clearly stated in many places.
  I believe that seeing this context makes it easier to internalize the material.
- *It marks more complicated explanations as "not for exam"*.
  That is, we draw a clear line between
  "this explanation is meant for your curiosity or to show where this formula comes from"
  versus "this is something you should know by heart to answer exam questions".
- *It's written by Evan Chen*. That's either really good or really bad, depending on your tastes.
  If you've ever seen me teach a class in person, you know what I mean.

== Prerequisites

As far as prerequisites go, a working knowledge of pre-calculus
and calculus as taught in United States high schools is assumed.

- *Algebra*:
  You should be able to work with elementary algebra, so that the following statements make sense
  $ x^2 - 7x + 12 = (x-3)(x-4) = 0 ==> x = 3 " or " x = 4. $
  You should also be able to solve two-variable systems of equations, such as
  $ cases(
    5 x - 2 y = 8,
    3 x + 10 y = 16
  ) ==> (x,y) = (2,1). $
- *Trigonometry*: You should be know how $sin$ and $cos$ work, in both degrees and radians.
  So you should know $sin(30 degree) = 1/2$, and $cos((7 pi) / 6) = -sqrt(3) / 2$.
- *Precalculus*: You should know some common formulas covered in precalculus for vectors and matrices:
  - You should be able to add and scale vectors, like
    $ vec(1,7) + 10 vec(3,5) = vec(1,7) + vec(30,50) = vec(31,57). $
    (It's really as easy as the equation above makes it look: do everything componentwise.)
  - You should know the rule for matrix multiplication, so that for example
    you could carry out the calculation
    $ mat(1,2,3;4,5,6) mat(7;8;9)
      = mat(1 dot 7 + 2 dot 8 + 3 dot 9; 4 dot 7 + 5 dot 8 + 6 dot 9)
      = mat(50; 122). $
    If you haven't seen this before, there are plenty of tutorials online; find any of them.

    You are _not_ expected to have any idea why the heck the rule is defined this way;
    we will explain what this rule means later.
    So we'll assume you have memorized this strange rule, but don't know what it means.
  - We'll assume you know the formula for the determinant of a $2 times 2$ and $3 times 3$ matrix; that is
    $ det mat(a,b;c,d) = a d - b c $
    and
    $ det mat(a_1, a_2, a_3; b_1, b_2, b_3; c_1, c_2, c_3)
    =
    a_1 det mat(b_2, b_3; c_2, c_3)
    - a_2 det mat(b_1, b_3; c_1, c_3)
    + a_3 det mat(b_1, b_2; c_1, c_2).
    $
    We won't assume you know where this formula comes from,
    and in fact we won't be able to explain that within these notes.

- *Calculus*: You should know single variable derivatives and integrals, for example:
  - You should be able to differentiate $x^7 + sin(x)$ to get $7x^6 + cos(x)$.
  - You should be able to integrate $integral_0^1 x^2 dif x$ to get $1/3$.

No proof-based background is expected.

== Topics covered

- The first two parts of the text is dedicated to *linear algebra* (vectors and matrices).
  This is intentional, because some working knowledge of linear algebra is important.
  In fact, if I was designing a serious course in multivariable calculus for math majors,
  it would come after an entire semester of properly-done linear algebra first.

- The third part covers the calculus of functions $RR -> RR^n$, which turns out to be easy
  because it's pretty much all 18.01 material.
  This part is therefore only a few pages long.

- The fourth part covers the differentiation of functions $RR^n -> RR$.
  This is the first serious multivariable calculus usage.

- The fifth part ...

#todo[...]

== Acknowledgments
