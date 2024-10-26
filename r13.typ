#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Notes for 18.02 Recitation 13],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [23 October 2024],
)

#quote(attribution: [Lemony Snicket, in A Series of Unfortunate Events])[The world is quiet here.]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").
(This was originally titled Recitation 14, but the numbering changed.)

= Reading

You should read section 21 of LAMV for the full details, which don't fit on the page.
The following are just excerpts for quick reference.

= Recipes

#recipe(title: [Recipe for integrating over a rectangle])[
  To integrate something of the form $int (int dif y) dif x$:
  1. Evaluate the inner integral as in 18.01, treating $x$ as constant.
  2. You should get something only depending on $x$. Integrate it as in 18.01.
]
#recipe(title: [Recipe for converting to $x y$-integration])[
  1. Draw a picture of the region as best you can.
  2. Write the region as a list of inequalities.#footnote[I don't
    think other sources always write the inequalities the way I do.
    But I think this will help you a lot with making sure bounds go the right way.]
  3. Pick _one_ of $x$ and $y$, and use your picture to describe all the values it could take.
  4. Solve for the _other_ variable in all the inequalities.
]

= Pictures for the example from Poonen's notes
#sample[
  Show both ways of setting up an integral of a function $f(x,y)$
  over the region bounded by $y-x=2$ and $y=x^2$.
]

Here the region would be described as $y >= x^2$ and $y-x <= 2$.

#align(center)[
  #image("figures/ints-pararegion.png", width: 50%)
]

#align(center)[
  #table(
    columns: 2,
    align: left,
    stroke: none,
    [#image("figures/ints-para-vert.png", width: 90%)],
    [#image("figures/ints-para-horiz.png", width: 90%)],
  ),
]

= Recitation questions from official course

/ 1.: Calculate the double integral of the function $f (x , y) = 6 x^2 + 2 y$
  over the rectangle $R = [0 , 2] times [- 1 , 1]$. Use both vertical and
  horizontal slicings and check you get the same answer.

/ 2.: Let $R$ be the first-quadrant region bounded by the two curves
  $y = sqrt(x)$ and $y = x^3$. Compute in two different ways the double
  integral $ iint_R x y^2 dif A . $

/ 3.: Let $R$ be the (bounded) region between the parabola $y^2 = x$ and the
  line through $(2 , 0)$ having slope $1$. Find the points where the
  curves intersect and describe the region $R$ in terms of horizontal
  slices and vertical slices. Express the double integral
  $ iint_R f (x , y) dif A$ as an iterated integral in both
  ways, using both horizontal and vertical slicings.
  In the second case, you will have to write the integral in two pieces.
