#import "@local/evan:1.0.0":*

= Grad, curl, and div, individually

#pagebreak()

= Generalized Stokes' theorem

== [TEXT] The only two things you need to remember for this section

Remember the red arrows in @fig-int-chart-stokes?
If you followed my advice in @exer-poster,
you probably remember where the red arrows in the picture are now.
Now it'll pay off in spades, because
there's only two things you need to know about them for this section.

#memo(title: [Memorize: Two red arrows gives zero])[
  In @fig-int-chart-stokes,
  if you follow two red arrows consecutively, you get zero.
]

#memo(title: [Memorize: Generalized Stokes' Theorem, for 18.02])[
  In @fig-int-chart-stokes, take any of the six red arrows
  #text(rgb("ff0000"))[$ X -> op("del")(X). $]
  Let $cal(R)$ be a compact region.
  Then the integral of $X$ over the *boundary* of $cal(R)$
  equals the integral of $op("del")(X)$ over $cal(R)$:
  $ int_(op("boundary")(cal(R))) X = int_(cal(R)) op("del")(X). $
]

Because the chart in @fig-int-chart-stokes is so big,
the first item will give $3$ different theorems,
while the second item will give $6$ different theorems (one for each red arrow).
But you don't need to memorize all $3+6=9$ results.
All you have to do is remember the two items above.
Then all $9$ results will fall out.
