#import "@local/evan:1.0.0":*
#import "@local/svg-emoji:0.1.0": setup-emoji // only if you want to use GH names for emojis
#show: setup-emoji

#show: evan.with(
  title: [Notes for 18.02 Recitation 10],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [7 October 2024],
)

#quote(attribution: [])[]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

A couple of announcements:

- I'm working on writing a replacement set of lecture notes!
  You can find them posted on my usual website, filename `lamv.pdf`.
- Lichen Zhang will be here for a while as teaching mentee,
  meaning he'll observe some number of the recitations
  and then try to teach one of them (and get feedback from you all).
  Please be nice to Lichen!

= Review of Oct 1 recitation and Oct 2-3 lecture

I won't repeat myself from `r09.pdf`; I have about 10 extra copies of `r09.pdf` if you need one.

== Level curves replace $x y$-graphs from high school

You'll mostly want to work with *level-curve pictures*, in which case

- all the variables $x$, $y$, $z$ etc. are inputs
- the output $f(x,y)$ is *unnamed*; no variable name for it.
  (Sometimes just $f$ if really needed, like in the last question on PSet 4B,
  but usually it's anonymous.)

Contour plot is a synonym for level curve, if you run into that term.

== Type signatures for this section

(If you're new to the recitation, read the handout from recitation 1.)
Relevant types:

- $f : RR^n -> RR$ is a function that accepts _points_ and outputs _numbers_.
- $nabla f : RR^n -> RR^n$ is a function that accepts _points_ and outputs _vectors_.

Although points and vectors were used interchangeably before,
it might help to think of them as different types for this part of the course,
because you will draw and use them rather differently.
(For example, we don't ever add two points.)

- A _point_ represents a position in your input space $RR^n$.
  You should *draw a point as a dot* (rather than arrows).
  I'll try to use capital letters $P$, $Q$, ... for these.
- A _vector_ is usually a displacement of some sort in this part of the course;
  so you should always be *draw vectors as arrows*.
  I'll try to use bold lowercase letters $bf(u)$, $bf(v)$, ... for these.

== Gradient replaces derivative

See the table in `r09.pdf`. The two important things to know are:

- Linear approximation: $f(P + bf(u)) approx f(P) + nabla f dot bf(u)$
- $nabla f$ is a normal vector to the tangent of the level curve at $P$.

To concretely compute $nabla f$, take the partial derivatives of $f$ with respect
to each of the input variables.
