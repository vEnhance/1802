#import "@local/evan:1.0.0":*
#import "@local/svg-emoji:0.1.0": setup-emoji // only if you want to use GH names for emojis
#show: setup-emoji

#show: evan.with(
  title: [Notes for 18.02 Recitation 12],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [16 October 2024],
)

#quote(attribution: [Alex Irpan in the author notes for the Mystery Hunt puzzle \
  #link("https://puzzles.mit.edu/2023/puzzlefactory.place/puzzles/5d-barred-diagramless-with-multiverse-time-travel")[5D Barred Diagramless with Multiverse Time Travel]])[
  At some points, I was not convinced this puzzle should even exist,
  but editors and testsolvers encouraged me to finish it, saying it was
  "exactly the bullshit I expect to see in Mystery Hunt".
  (The lucky postprodder for the puzzle would also like to voice his support.)
  Hope you had fun! Really, it could have been much worse.
]


This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

= Announcements and the like

Welcome back from the long weekend!

- *Midterm 2* is probably up to Lagrange multipliers but not including tomorrow's class.
- *Midterm 2 review session* is scheduled 3pm-5pm in 4-370.
  - It will be a mock exam 3pm-4pm then solution presentation by me for 4pm-5pm.
  - I will post the exam beforehand, so if you can only make
    4pm-5pm you can try the mock yourself and then come to solutions. Solutions posted later too.
- *LAMV* is updated in preparation for Midterm 2, corresponds to Parts Delta, Echo, Foxtrot.
  (This is the mega-file titled "Linear Algebra and Multivariable Calculus" on my page.)
  - Part Delta has all the parametric stuff, it's about halfway written.
  - Part Echo has all the partial derivative and gradient material and is essentially done.
  - Part Foxtrot has all the critical point and Lagrange multipliers stuff and is essentially done.

= Highlights from LAMV

Again, see the full book at #url("https://web.evanchen.cc/upload/1802/lamv.pdf") for full exposition ---
(much more than I can fit on one printed page!
But here is a quick cheat sheet.

For every region, you care about what LAMV calls *boundary*, *limit case*, and *dimension*.

#recipe(title: [Recipe: The rule of thumb for regions])[
  - The dimension is probably $n$ minus the number of $=$ constraints.
  - The limit cases are obtained by turning $<$ and $>$ into limits,
    and considering when any of the variables can go to $pm oo$.
  - The boundary is obtained when any $<=$ and $>=$ becomes $=$.
]

#figure(
  table(
    columns: 4,
    align: left,
    table.header([Constraint], [Boundary], [Limit case], [Dimension]),
    [$<=$ or $>=$], [Change to $=$ to get boundary], [No effect], [No effect],
    [$<$ or $>$], [No effect], [Approach for limit case], [No effect],
    [$=$], [No effect], [No effect], [Reduces dim by one],
  ),
  kind: table,
  caption: [Rules of thumb.]
)

For 18.02, we say region $cal(R)$ is compact if there are no limit cases.
That is, all the constraints are $=$, $<=$, or $>=$ (no $<$ or $>$)
and none of the variables can go to $pm oo$.

#tip(title: [Tip: Compact optimization theorem])[
  If $cal(R)$ is a compact region,
  and $f$ is a function to optimize on the region which is continuously defined everywhere,
  then there must be at least one global minimum, and at least one global maximum.
  (Works in both no-LM and LM case.)
]

#recipe(title: [Recipe for optimization without Lagrange Multipliers])[
  Suppose you want to find the optimal values of $f : RR^n -> RR$ over a region $cal(R)$,
  and $cal(R)$ has dimension $n$.

  1. Evaluate $f$ on all the *critical points* of $f$ in the region $cal(R)$.
  2. Evaluate $f$ on all the *boundary points* of $f$ in the region $cal(R)$.
  3. Evaluate $f$ on all the *limit cases* of $f$ in the region $cal(R)$.
  4. Output the points in the previous steps that give the best values,
    or assert the optimal value doesn't exist (if points in step 3 do better than steps 1-2).
]

#recipe(title: [Recipe for Lagrange multipliers])[
  Suppose you want to find the optimal values of $f : RR^n -> RR$ over a region $cal(R)$,
  and $cal(R)$ has dimension $n-1$ due to a single constraint $g = c$ for some $g : RR^n -> RR$.

  1. Evaluate $f$ on all the *LM-critical points* of $f$ that lie on the region $cal(R)$.
  2. Evaluate $f$ on all the *boundary points* of $f$ of the region $cal(R)$.
  3. Evaluate $f$ on all the *limit cases* of $f$ of the region $cal(R)$.
  4. Output the points in the previous steps that give the best values,
    or assert the optimal value doesn't exist (if points in step 3 do better than steps 1-2).
]

If there are any points at which $nabla f$, $nabla g$ are undefined,
you should check those as well. (Rare.)

= Recitation questions from official course

(Exercise before you start: which of these questions does
compact optimization theorem apply?)

/ 1.: Consider the function $f (x, y) = x^3 − 3 x y + y^3$.
  Find the critical points of the function and use the second derivative test to classify them.
/ 2.: Find the maximum and minimum values of $x^3 + y^3$ on the region given by
  $x^2 + 2y^2 <= 36$.
/ 3.: Find the maximum and minimum of $x^2 + x + 3y^2 + 2z^2$ on the unit sphere $x^2 + y^2 + z^2 = 1$.
