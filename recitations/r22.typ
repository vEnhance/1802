#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Notes for 18.02 Recitation 22],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [4 December 2024],
)


#quote(attribution: [StayC in Teddy Bear])[
  우린 다 이번 생은 처음이잖아 (we're all living life for the first time)
]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

= The last week of 18.02

- Divergence theorem is on the final exam, but the crummy version of Stokes' theorem
  (covered Friday, December 6, I think) is likely to _not_ be on the final.
  So I think we've covered all the material that will be on the exam.
- The last lecture on Tuesday December 10 is still topic TBD, bun not proper course material.
- *Course evaluations* are available at #url("https://registrar.mit.edu/subjectevaluation")
  and will be open until *Monday, December 16 at 9AM*.
  Please take a moment to complete course evaluations when you can 🙏
- The last recitation will be Wednesday December 11.
  I may talk a bit about life after 18.02 (TBD).

= Divergence theorem

Remember back when we had Green's theorem,
we could transform 2D scalar flux (which was a _line integral_)
into an area integral:
$ underbrace(oint_(cal(C)) (bf(F) dot bf(n) dif s), = oint_(cal(C)) (-q dif x + p dif y))
  = underbrace(iint_(cal(R)) nabla dot bf(F) dif A,
    = iint_(cal(R)) ((partial p) / (partial x) + (partial q) / (partial y)) dif A). $
This was nice because parametrization was annoying and straight-up area integrals are simpler.
In general, if you still have the poster, the green pictures are easier to deal with.

The divergence theorem will let you do the same thing,
transforming a flux surface integral
(which is the horrendous _surface integral_
that has been haunting you for the last couple weeks)
into a volume integral.
Which is an even bigger profit --- no parametrization, no cross product table, etc.

(I've snuck in a new symbol $oiint_(cal(S))$, but the extra circle is analogous to before:
it's an optional reminder you can put in order to remind someone the surface is _closed_.
Just like how $oint_(cal(C))$ was a reminder that $cal(C)$ was a closed loop.
Also, note there's a fine-print requirement that $cal(T)$ should be compact,
i.e. it should not extend infinitely in any direction.)

#memo(title: [Memorize: Divergence theorem])[
  Suppose a closed surface $cal(S)$ encloses a solid $cal(T)$.
  Then
  $ underbrace(oiint_(cal(S)) bf(F) dot bf(n) dif S,
    = iint_(cal(R)) bf(F)(bf(r)(u,v)) dot
    ((partial bf(r))/(partial u) times (partial bf(r))/(partial v)) dif u dif v)
    = underbrace(iiint_(cal(T)) nabla dot bf(F) dif V,
    = iiint_(cal(T)) ((partial p) / (partial x) + (partial q) / (partial y) + (partial r) / (partial z)) dif V). $
]

#remark(title: [Remark: "Closed surface" = "holds water"])[
  If you're unclear what "closed surface" means,
  a picture to keep in your head might be "holds water", i.e.,
  you could imagine filling the interior of $cal(S)$ with a water
  (that's the volume $cal(T)$) and it shouldn't leak out.
  So the following are _not_ closed surfaces:

  - Curved part of hemisphere (e.g., bowl with no lid)
  - Curved part of cylinder (e.g., straw)

  But the following are closed surfaces:

  - Cylinder including the two caps (e.g., water bottle)
  - Sphere
  - The six faces of a rectangular prism

]

And that's pretty much it!

= Recitation questions

In this recitation, we will review the divergence theorem for outward
flux of a vector field $upright(bold(V))$ through a closed surface $S$.

/ 1.: Verify the divergence theorem holds in the following examples (i.e.
  compute the flux directly and compare it to the triple integral of the
  divergence).

  - $upright(bold(V)) = - x upright(bold(i)) - y upright(bold(j)) + 3 z upright(bold(k))$;
    $D$ is the region bounded by the unit sphere and $x , y , z gt.eq 0$,
    and $S$ is its boundary.

  - $upright(bold(V)) = y^2 z^3 upright(bold(i)) + 2 y z upright(bold(j)) + 4 z^2 upright(bold(k))$;
    $D$ is the solid between $z = x^2 + y^2$ and the plane $z = 9$.

/ 2.: Use the divergence theorem to calculate the outward flux in the following examples:

  - $upright(bold(V)) = chevron.l 2 x^3 + y^3 , y^3 + z^3 , 3 y^2 z chevron.r$; $S$ is the
    surface of the solid bounded by $z = 1 - x^2 - y^2$ and the
    $x y$-plane.

  - $upright(bold(V)) = chevron.l log (1 + e^y) , log (1 + e^z) , log (1 + e^x) chevron.r$;
    $S$ is the surface of the cube with vertices
    $(plus.minus 1 , plus.minus 1 , plus.minus 1)$.

/ 3a.: Show that the outward flux of the vector field
    $x upright(bold(i)) + y upright(bold(j)) + z upright(bold(k))$ through
    a closed surface $S$ is three times the volume contained in that
    surface.

/ 3b.: Let $upright(bold(n))$ be the unit normal vector, pointing outwards,
    for a closed surface $S$. Show that it is impossible for the vector
    $x upright(bold(i)) + y upright(bold(j)) + z upright(bold(k))$ to be
    orthogonal to $upright(bold(n))$ at every point on the surface.
