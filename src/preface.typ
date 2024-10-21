#import "@local/evan:1.0.0":*

= Preface

At MIT, the course 18.02 (multivariable calculus) is a general institute requirement (GIR);
every student must pass this class in order to graduate.
These are lecture notes based upon the fall 2024 instance of the course, taught by Davesh Maulik.

== [TEXT] Goals of this book

These notes have the following lofty goal:
#goal[
  In theory, an incoming MIT student with a single-variable calculus background
  should be able to pass the 18.02 final exam
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
    (but not a perfect score) on the final exam by _only_ memorizing the recipes.

    I don't recommend this approach; even a vague conceptual understanding of where a recipe
    is at minimum quite helpful for remembering said recipe.
    But it may be useful to know in principle that the recipe is all you need,
    and conversely, that you should have the recipes down by heart.

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
  I'd rather have a small number of exercises with properly documented solutions
  than an enormous pile of mass-produced questions with no corresponding solutions.

  #todo[Okay this is not true yet lol I'm working on it. There will be solutions one day.
  Especially since ChatGPT can do all the exercises anyway kappa.]

- *It tries to explain where formulas come from*.
  For example, these notes spell out how matrix multiplication corresponds
  to function composition (in @matrix-mult), something that isn't clearly stated in many places.
  I believe that seeing this context makes it easier to internalize the material.
- *It marks more complicated explanations as "not for exam"*.
  I hope the digressions are interesting to you (or I wouldn't have written them).
  But I want to draw a clear boundary between
  "this explanation is meant for your curiosity or to show where this formula comes from"
  versus "this is something you should know by heart to answer exam questions".

  There are two kinds of ways we mark things as not for exam:

  - Anything in a gray digression box is not for exam.
    #digression[
      Here's an example of a digression box.
    ]

  - Anything in an entire section marked *[SIDENOTE]* is not for exam.

- *It's written by Evan Chen*. That's either really good or really bad, depending on your tastes.
  If you've ever seen me teach a class in person, you know what I mean.

== [TEXT] Prerequisites

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
    Poonen's notes (mentioned later) do cover this for example;
    see section 1-2 of #url("https://math.mit.edu/~poonen/notes02.pdf").

    You are _not_ expected to have any idea why the heck the rule is defined this way;
    an explanation for where this rule comes from is in @matrix-mult.
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

    For example, you should be able to verify the correctness of the following equation:
    $ det mat(0, 1, 5; 2, 0, 13; 1, 4, 1) = 51. $

    We won't assume you know where this formula comes from,
    and in fact we won't be able to explain that within these notes.
    But if you're curious, you should read Chapter 12 of the Napkin.

- *Calculus*: You should know single variable derivatives and integrals, for example:
  - You should be able to differentiate $x^7 + sin(x)$ to get $7x^6 + cos(x)$.
  - You should be able to integrate $integral_0^1 x^2 dif x$ to get $1/3$.

  This is covered in the course 18.01 at MIT,
  and also in the AP calculus courses in the United States.

#tip[
  If you're not at MIT, you should replace the words "18.01" and "18.02" with
  the course names corresponding to "single-variable calculus"
  and "multi-variable calculus" at your home institution.
]

No proof-based background is expected.

== [TEXT] Topics covered

Here is a brief overview of what happens in these parts

/ Alfa and Bravo: This part is dedicated to *linear algebra* (vectors and matrices).
  This is intentional, because some working knowledge of linear algebra is important.
  In fact, if I was designing a serious course in multivariable calculus for math majors,
  it would come after an entire semester of properly-done linear algebra first.

/ Charlie: This short part is review of the *complex numbers* $CC$.
  I actually don't know why this is part of 18.02, to be honest,
  but since it happened I included a short section on it.

/ Delta: Covers the calculus of functions $bf(r) : RR -> RR^n$,
  which is usually thought of as a *parametric* function $bf(r)(t)$
  (a time-indexed trajectory through the vector space $RR^n$).
  This section turns out to be easy because it's pretty much all 18.01 material.
  This part is therefore also only a few pages long.

/ Echo and Foxtrot: Cover the *differentiation of multivariable functions* $f : RR^n -> RR$,
  and the optimization such functions.
  The star of these two parts in the gradient $nabla f$,
  which gets airtime in virtually every kind of question you'll see.
  This is the first serious multivariable calculus usage.

/ Golf and Hotel: TBD.

- #todo[finish writing this]

(The words Alfa, Bravo, Charlie, etc.~are from the
#link("https://w.wiki/4ur")[NATO phonetic alphabet]
which the author of this book has memorized from overexposure to
#link("https://web.evanchen.cc/puzzlehunt.html")[puzzle hunts].)

== [TEXT] The structure of this book

You will quickly notice that all the subsections are labeled with different headings.
Here's an explanation of what they mean.

/ TEXT: Good old prose.
  An explanation like you might hear in a lecture.
/ RECIPE: Contains only the final recipe, as you need it on the exam.
  As I mentioned before, I don't like the idea of just memorizing recipes,
  but in theory you might still be able to pass the exams by doing only this.
/ SIDENOTE: An optional extended discussion.
  You can skip these unless you're interested in them.
/ RECAP: A summary of what happened in this chapter.
/ EXER: Problems to work on.
  Starred exercises are harder than questions that will appear in the actual MIT course.

You'll also see some colored boxes that mark where certain chunks begin and end.
These should be self-explanatory.

== [TEXT] Other references

The best resource I have for 18.02 in text is definitely Bjorn Poonen's fall 2021 notes,
available at
#align(center)[
  #url("https://math.mit.edu/~poonen/notes02.pdf").
]
Poonen is a really great writer of mathematical exposition in general,
and I highly recommend these notes as a result.
In fact, I will even tell you, for each section,
what the corresponding sections of Poonen are if you decide something I write
doesn't make sense and you want to reference the corresponding text.
(That said, this text is meant to stand alone.)

There are lots of other resources on multivariable calculus out there too.
For example,
#link("https://ocw.mit.edu/courses/18-02-multivariable-calculus-spring-2006/pages/readings/supp_notes/")[MIT OpenCourseWare]
has some supplementary notes and problems still used by the math department.
And so on.

== [SIDENOTE] If you're thinking of becoming a math major

If you're thinking of becoming a math major, there's some advice in @appendix-math-major.

== [SIDENOTE] Acknowledgments

- Thank you to the staff and other recitation leaders who made this course possible;
  particularly Davesh Maulik for leading the instance of the course this year full-heartedly
  and Karol Bacik for making so much happen behind the scenes.
  Thanks also to Sefanya Hope for coordinating many other logistics,
  and particularly for helping me book classrooms on short notice on multiple occasions.
- Thank you to all the students in my recitation section
  (and those officially enrolled in other sections, but who came to my section anyway!)
  who regularly attended my class every Monday and Wednesday at 9am.
  That's some real early-morning dedication.
  There's a saying that the enthusiasm of an instructor can be contagious,
  but I definitely think the enthusiasm of students can be as well.
  - In particular, I got a lot of words of thanks and encouragements
    from my students this year, which I am indeed grateful for.
    I certainly wouldn't have had the motivation to type these notes without these kind words.
- I thank Calvin Wang, Ritwin Narra and Royce Yao for multiple corrections.
  (Your name could be here too --- find me some typos.
  If you know how to open a GitHub pull request,
  the relevant repository is #url("https://github.com/vEnhance/1802").)
- Thanks to OpenAI for gifting me a Plus subscription to ChatGPT,
  which helped a lot with generating sample questions and solutions throughout the document.

#todo[more to come]
