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
This is ambitious, and your mileage may vary.
Just to be clear, this text is unofficial material and there is no warranty or promise.
(Also, if you are actually an MIT student, bear in mind the content of the course
will vary by instructor.)
But with this goal in mind, here are some parts of the design philosophy of this book.

- *It's practical*. It sticks to the basics and
  emphasizes giving straight cookbook-like answers to common exam questions.
  - I better say something about memorizing recipes.
    In principle, if you have perfect memory, you could potentially get a passing score
    (but not a perfect score) on the final exam by _only_ memorizing the recipes.

    I don't recommend this approach; even a vague conceptual understanding of a recipe
    is at minimum quite helpful for remembering said recipe.
    But it may be useful to know in principle that the recipe is all you need,
    and conversely, that you should have the recipes down by heart.

- *It's concrete*. We only work in $RR^n$, and not a generic vector space.
  We don't use anywhere near the level of abstraction as, say, the Napkin#footnote[
    That's the one at #url("https://web.evanchen.cc/napkin.html"),
    which _does_ assume a proof-based background.
  ].
  We don't assume proof experience.
- *It writes things out and has diagrams*.
  Many lecture notes were meant to go with a in-person lecture rather than replace it.
  These notes should stand alone.
  - Any sentence that would normally be said out loud is written as text.
  - Any figure that would normally be drawn on the blackboard is actually typeset into the book.
- *It has full solutions to most of its exercises*.
  I really believe in writing things out.
  I'd rather have a small number of exercises with properly documented solutions
  than an enormous pile of mass-produced questions with no corresponding solutions.

- *It tries to explain where formulas come from*.
  For example, these notes spell out how matrix multiplication corresponds
  to function composition (in @sec-matrix-mult), something that isn't clearly stated in many places.
  I believe that seeing this context makes it easier to internalize the material.
- *It marks more complicated explanations as "not for exam"*.
  I hope the digressions are interesting to you (or I wouldn't have written them).
  But I want to draw a clear boundary between
  "this explanation is meant for your curiosity or to show where this formula comes from"
  compared to "this is something you should know by heart to answer exam questions".

  There are two kinds of ways we mark things as not for exam:

  - Anything in a gray digression box is not for exam.
    #digression[
      Here's an example of a digression box.
    ]

  - Anything in an entire section marked *[SIDENOTE]* is not for exam.

- *It's written by Evan Chen*. That's either really good or really bad, depending on your tastes.
  If you've ever seen me teach a class in person, you know what I mean.

== [TEXT] Prerequisites

As far as prerequisites go, this text assumes a working knowledge of pre-calculus
and calculus as taught in United States high schools.

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

  You should know a few trig identities; the most important is the double angle formula
  $ sin(2theta) &= 2 sin theta cos theta \
    cos(2theta) &= cos^2 theta - sin^2 theta = 2 cos^2 theta - 1 = 1 - 2 sin^2 theta. $

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
    an explanation for where this rule comes from is in @sec-matrix-mult.
    So we'll assume you have seen this strange rule before, but don't know what it means.

  - We'll assume you know the formula for the determinant of a $2 times 2$ and $3 times 3$ matrix; that is
    $ detmat(a,b;c,d) = det mat(a,b;c,d) = a d - b c $
    and
    $ detmat(a_1, a_2, a_3; b_1, b_2, b_3; c_1, c_2, c_3)
      = det mat(a_1, a_2, a_3; b_1, b_2, b_3; c_1, c_2, c_3)
      = a_1 detmat(b_2, b_3; c_2, c_3)
      - a_2 detmat(b_1, b_3; c_1, c_3)
      + a_3 detmat(b_1, b_2; c_1, c_2). $
    (The bars are a shorthand for the $det$ symbol; they're not absolute value bars.)

    For example, you should be able to verify the correctness of the following equation:
    $ detmat(0, 1, 5; 2, 0, 13; 1, 4, 1) = 51. $

    We won't assume you know where this formula comes from,
    and in fact we won't be able to explain that within these notes.
    But if you're curious, you should read Chapter 12 of the Napkin.

- *Calculus*: You should know single variable derivatives and integrals, for example:
  - You should be able to differentiate $x^7 + sin(x)$ to get $7x^6 + cos(x)$.
  - You should be able to integrate $integral_0^1 x^2 dif x$ to get $1/3$.

  This is covered in the course 18.01 at MIT,
  and also in the AP calculus courses in the United States.

  One note: *by $log(x)$ we mean the _natural_ log with base $e$*.#footnote[I considered
    using the notation $ln(x)$ to avoid confusion.
    However, $ln(x)$ is never used by mathematicians past introductory calculus;
    see #url("https://math.stackexchange.com/q/293783/229197").
    I figured I should just get you used to $log(x)$ being base $e$ now.
    There's a real chance that if you take an 18.02 exam at MIT,
    the professor straight-up forgets to remind the students that $log(x)$ is base $e$,
    because they haven't used $ln(x)$ in a quarter century.
  ]
  We will never use a base-2 or base-10 logarithm in these notes.

#tip[
  If you're not at MIT, you should replace the words "18.01" and "18.02" with
  the course names corresponding to "single-variable calculus"
  and "multi-variable calculus" at your home institution.
]

This book assumes no proof-based background.

== [TEXT] Topics covered

Here is a brief overview of what happens in these parts.

/ Alfa and Bravo: This part covers *linear algebra* (vectors and matrices).
  This is intentional, because some working knowledge of linear algebra is important.
  In fact, if I was designing a serious course in multivariable calculus for math majors,
  it would come after an entire semester of properly-done linear algebra first.

/ Charlie: This short part is review of the *complex numbers* $CC$.
  I actually don't know why this is part of 18.02, to be honest,
  but since it happened I included a short chapter on it.

/ Delta: Covers the calculus of functions $bf(r) : RR -> RR^n$,
  which is usually thought of as a *parametric* function $bf(r)(t)$
  (a time-indexed trajectory through the vector space $RR^n$).
  This part turns out to be easy because it's pretty much all 18.01 material.
  This part is therefore also only a few pages long.

/ Echo and Foxtrot: Cover the *differentiation of multivariable functions* $f : RR^n -> RR$,
  and the optimization such functions.
  The star of these two parts in the gradient $nabla f$,
  which gets airtime in virtually every kind of question you'll see.
  This is the first serious multivariable calculus usage.

/ Golf: This part covers *double integrals of functions* $f : RR^2 -> RR$,
  the first of the parts on integration.
  We define the double integral and cover techniques for computing them.

/ Hotel: This part covers *integrals of scalar functions in space* $f : RR^3 -> RR$.
  It introduces the triple integral (which isn't any different from double integral)
  as well as a side detour on arc length and surface area.

/ India: This part covers *line integrals of vector fields* $bf(F) : RR^n -> RR^n$ over a *curve*;
  that is, work and 2D flux.
  The famous grad, div, and curl are first mentioned here,
  together with the generalized Stokes' theorem that ties them all together.
  This is the iconic part of multivariable calculus
  (kind of like how France is associated with the Eiffel tower, say).

/ Juliett: This part covers *surface integrals of vector fields* $bf(F) : RR^3 -> RR^3$
  over a *surface*; that is, the flux integral.
  More versions of Stokes' theorem are given.

/ Kilo: Exercises covering all the earlier parts.

/ Lima: Solutions to exercises from the text.

/ Mike: Appendix of odds and ends such as excessively long digressions.

(The words Alfa, Bravo, Charlie, etc.~are from the
#link("https://w.wiki/4ur")[NATO phonetic alphabet]
which the author of this book has memorized from overexposure to
#link("https://web.evanchen.cc/puzzlehunt.html")[puzzle hunts].)

== [TEXT] The structure of this book

You will quickly notice that all the sections are labeled with different headings.
Here's an explanation of what they mean.

/ TEXT: Good old prose.
  An explanation like you might hear in a lecture.
/ RECIPE: Has only the final recipe, as you need it on the exam.
  As I mentioned before, I don't like the idea of just memorizing recipes,
  but in theory you might still be able to pass the exams by doing only this.
/ SIDENOTE: An optional extended discussion.
  You can skip these unless you're interested in them.
/ RECAP: A summary of what happened in the chapter.
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
In fact, I will even tell you, for each part,
what the corresponding sections of Poonen are if you decide something I write
doesn't make sense and you want to reference the corresponding text.
(That said, this text should stand alone.)

There are many other resources on multivariable calculus out there too.
For example,
#link("https://ocw.mit.edu/courses/18-02-multivariable-calculus-spring-2006/pages/readings/supp_notes/")[MIT OpenCourseWare]
has some supplementary notes and problems still used by the math department.
And so on.
You can also find countless final exams from previous years of 18.02 on OCW.

I think the term "treatment" for the way a course is taught is apt,
because it reflects a reality about education:
like medicine, there is no one treatment that works for everyone.
In theory, there might be some people who only read this book and that's all they need.
In practice, many of you would benefit from asking friends to explain things differently
for the sections of the book that don't work from you,
or consulting another text when things here don't suit you.
You should not feel under any obligation to treat this book as the one true bible of 18.02.
This book is meant to be an aid, not a cage.

== [SIDENOTE] If you're thinking of becoming a math major

If you're thinking of becoming a math major, there's some advice in @appendix-math-major.

== [SIDENOTE] My exercises are harder, so take your time

When setting exercises, I tried to come up with questions
that require a bit of thought and understanding, for learning purposes.
I'm intentionally trying to stretch you slightly with my exercises while the timer is off ---
I want to give you a little bit of an opportunity to take your time and think.
I think you'll internalize the material better this way and it'll pay off.

But when you actually take an 18.02 midterm in real life,
you have no time to think#footnote[
  If you're in India, the JEE exam is even more about speed and tricks
  than having any real understanding, and I apologize that you have to suffer through it.
]--- you have to answer each question in 5-10 minutes.
So on the flip side, you will probably be pleasantly surprised when you find that
50%-80% of real midterm questions can be solved by turning _off_
your brain and following recipes to the letter.
It has to be this way because of the short time limit and the amount of material.

All this is to say to *not be discouraged if you find the exercises in this book harder*.
It's by design.
The real exam will have many cookie-cutter no-thought questions
in return for the short time limit.

(Like most textbooks, the starred exercises are more challenging.)

== [SIDENOTE] Acknowledgments

- Thank you to the staff and other recitation leaders who made this course possible;
  particularly Davesh Maulik for leading the instance of the course this year full-heartedly
  and Karol Bacik for making so much happen behind the scenes.
  Thanks also to Sefanya Hope for coordinating many other logistics,
  and particularly for helping me book classrooms on short notice on many occasions.

  I also thank Ting-Wei Chao for his permission to use @exer-lm-abs,
  @exer-parabola-1, @exer-parabola-2, @exer-parabola-3 from his recitation section.

- Thank you to all the students in my recitation session
  (and those officially enrolled in other sessions, but who came to my session anyway!)
  who regularly attended my class every Monday and Wednesday at 9am.
  That's some real early-morning dedication.
  There's a saying that the enthusiasm of an instructor can be contagious,
  but I definitely think the enthusiasm of students can be as well.
  - In particular, I got many words of thanks and encouragements
    from my students this year, which I am grateful for.
    I certainly wouldn't have had the motivation to type these notes without these kind words.

- I thank
  Aaryan Vaishya,
  Alan Cheng,
  Alexander Wang,
  Calvin Wang,
  Daniel Kim,
  Emma Jakubicka,
  John Zhou,
  Nick Zhang,
  Rémi Geron,
  Ritwin Narra,
  Rohan Garg,
  Romano Emmanuelle,
  Royce Yao
  Ryan Pang, and
  Siddhanta Mishra
  for many corrections.
  (Your name could be here too --- find me some typos!
  If you know how to open a GitHub pull request,
  the relevant repository is #url("https://github.com/vEnhance/1802").)

- Thank you to Catherine Xu for the cover art.
  You can download a full-resolution copy at
  #url("https://web.evanchen.cc/textbooks/lamv-cover-art.png")
  or find it in the GitHub repository.

- Thanks to OpenAI for gifting me a Plus subscription to ChatGPT.#footnote[okay
    if I'm being totally honest this might have been an accident on OpenAI's part]
  Writing this text gave me an excuse to get a chance to use ChatGPT 4o and ChatGPT o1-preview,
  to see what kind of things it did well (and what I could still do faster by hand).

  - By far the most common use case was *step-by-step solutions to routine exercises*.
    All the solutions went through much editing from me
    (in part to make the notation consistent throughout the whole text),
    to the point where maybe only a third of the output from each solution actually survives editing.
    Even then, because it's faster to edit or rewrite text#footnote[Vim on top. Fight me.]
    than write from scratch, it still saved time.

    I think when humans write solutions they err on the size of laziness
    in skipping steps that are really routine or obvious to them, because typing is slow.
    ChatGPT doesn't; in fact, it's actually _too_ verbose,
    and I almost always had to trim down the solution.
    But it much easier to trim down an overly verbose solution
    than to flesh out one that's too terse.

    It's also nice to not have to worry much about arithmetic errors anymore.
    If I had written the solutions by hand,
    I would certainly drop plenty of factors of $2$ or flip signs.
    ChatGPT actually made fewer errors than me,
    and when it did it was usually easy for me to spot because it wrote everything out.
    It turns out that proofreading someone else's work is much, much easier than
    proofreading your own.

  - It was also fairly good at _generating_ new routine exercises
    that are solved by just applying the formula.
    It wasn't perfect; some of the exercises it would generate were obviously broken.
    But again, with some editing, it was still faster than trying to make
    up uninspired exercises one after another en masse.#footnote[Which I admit
      I have too much pride to do either, as a math olympiad kid whose success story
      was built on solving many non-routine problems growing up,
      rather than mass-generated ones.]

  - It's pretty good at "explain things in many words" in a conversational way.
    For example, the aquatic descriptions of what curl or divergence or work mean
    were largely generated by ChatGPT.

  I still controlled the overall narrative and the high-level organization,
  as well as the selection and crafting of the non-boring exercises.
  I'm pretty opinionated about the way I structure my material,
  and that's one of the fun parts of writing anyway.
  And outside of solution/calculations, I wrote most of the actual prose myself.
  I've developed a bit of a snarky persona when teaching that you can see
  in my writing style (see, e.g., @fig-cross-meme), and I didn't want to relinquish that.

- This book was not written in LaTeX!
  It's written in the recently released version of Typst 0.13,
  which is open source at #url("https://github.com/typst/typst").
  I used NeoVim as an editor, doing everything locally rather than by web app.

  It was really nice being able to write math without having to constantly use the
  backslash key or the curly brace, and the compiler was much faster,
  so I was overall quite impressed with my Typst experience.
  Typst is quite new and you should check them out if you'd like to give them a try!

  - ChatGPT is not good at producing Typst output yet,
    so I had ChatGPT output everything in LaTeX and would then convert using `pandoc`.
    This conversion had some undesirable irregularities,
    so I ended up writing a few Python scripts to handle those irregularities
    and just fixed the remaining issues by hand.

  - You can see the source code for this textbook at
    #url("https://github.com/vEnhance/1802").
    Note that it relies on an external file called `evan.typ`
    which you can find in my
    #link("https://github.com/vEnhance/dotfiles/tree/main/typst/packages/local/evan/1.0.0")[dotfiles repository].
    Thanks to the couple packages that were already used in `evan.typ`:
    - The v2 version of #url("https://github.com/sahasatvik/typst-theorems").
    - The v1 version of #url("https://github.com/jomaway/typst-gentle-clues").

- Most of the figures in this text are manually drawn
  in #link("https://asymptote.sourceforge.io")[Asymptote].
  (I think a lot of mathematicians use TikZ, but I'm more used to Asymptote now.)
