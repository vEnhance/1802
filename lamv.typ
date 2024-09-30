#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Linear Algebra and Multivariable Calculus],
  subtitle: [Notes from an 18.02 course],
  author: "Evan Chen",
  date: datetime.today(),
)

#toc

#pagebreak()

= Preface

At MIT, the course 18.02 (multivariable calculus) is a general institute requirement (GIR),
meaning that every student must pass this class in order to graduate.
In fall 2024, I was a staff member for 18.02,
and quickly decided that to teach my section well, I would need to write up my own notes.
These notes were later edited to become this textbook.

== Goals of this book

The goal if this book is the following
#proposition[
  An MIT student should be able to pass the 18.02 final exam
  by *only* reading these notes and problems, working through several practice final exams,
  and going to a weekly office-hours#footnote[
    You can substitute the office hours for a knowledgeable friend, or similar.
    The point is that you should have at least some access to live Q/A.
  ] to ask questions to a real human.
]

With this goal in mind, here are some parts of the design philosophy of this book.

- *It's practical*. It sticks to the basics and
  emphasizes giving straight cookbook-like answers to common exam questions.
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

As far as prerequisites go, a working knowledge of high-school math (elementary algebra,
trigonometry, and single-variable calculus) is assumed.
But no proof-based background is expected.


== Acknowledgments
