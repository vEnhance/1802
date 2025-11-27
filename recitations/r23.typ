#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Notes for 18.02 Recitation 23],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [9 December 2024],
)


#quote(attribution: [Edsger W. Dijkstra, EWD 1036])[
  My point today is that, if we wish to count lines of code,
  we should not regard them as "lines produced" but as "lines spent".
]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

- Course evaluations are available at #url("https://registrar.mit.edu/subjectevaluation")
  and will be open until Monday, December 16 at 9AM.
- Tue/Wed will be review for final; Wed is the last day of class.
  Practice problems out now.

= Curl

This is the final red arrow in the poster #url("https://web.evanchen.cc/textbooks/poster-stokes.pdf").

#definition(title: [Definition of curl])[
  Suppose $bf(F)(x,y,z) = chevron.l p,q,r chevron.r$
  is a 3D vector field.
  Then the *curl* of $bf(F)$ is the vector field defined by
  $ op("curl") bf(F) := nabla times bf(F)
    := vec(
      (partial r)/(partial y) - (partial q)/(partial z),
      (partial p)/(partial z) - (partial r)/(partial x),
      (partial q)/(partial x) - (partial p)/(partial y) ). $
]
Type signature: The curl takes in only a 3D vector field.
The curl at each point is a 3D vector (i.e. the curl of a 3D vector field is itself a 3D vector field).

#tip(title: [Tip: How to memorize curl])[
  In practice, everyone remembers this formula using the following mnemonic:
  $ nabla times bf(F) = detmat(ee_1, ee_2, ee_3;
    (partial)/(partial x), (partial)/(partial y), (partial)/(partial z);
    p, q, r). $
  (This equation does not pass type-safety, because it's a "matrix" whose entries
  are some combination of functions, vectors, and partial derivative operators,
  so it absolutely does not make sense.)
  This is why $nabla times bf(F)$ is the notation chosen;
  you could almost imagine
  $nabla = lr(chevron.l (partial)/(partial x), (partial)/(partial y), (partial)/(partial z) chevron.r)$
  in which case the determinant above is the old mnemonic for the cross product.
]

= Line integrals in 3D are pretty much the same as 2D

- Definition of the line integral is unchanged from 2D; it is still $int_(t="start time")^("stop time") bf(F) dot bf(r)'(t) dif t$.
- A vector field on all of $RR^3$ is _conservative_
  (i.e. $bf(F) = nabla f$ for some potential function $f$)
  if and only if $nabla times bf(F) = bf(0)$.
  - This time there are three equations, one for each component:
    $ (partial r) / (partial y) = (partial q) / (partial z), quad
      (partial p) / (partial z) = (partial r) / (partial x), quad
      (partial q) / (partial x) = (partial p) / (partial y). $
    The above three equations should be remembered as
    $f_(x y) = f_(y x)$, $f_(y z) = f_(z y)$, $f_(z y) = f_(x y)$.
  - In contrast, for the 2D case, there was only one equation
    $(partial p) / (partial y) = (partial q) / (partial x)$.
    The contrast is because 2D scalar curl was a number but curl is a vector in $RR^3$.
- Assuming the vector field is conservative,
  the anti-gradient procedure for potential function is the same as before.
  See Chapter 16 of my LAMV notes.
- Once you have a potential function, FTC still works fine.

= Crummy Stokes' theorem (not on final)

#definition(title: [Definition of compatible orientations])[
  Suppose $cal(C)$ is a closed loop in $RR^3$ which is the boundary of an oriented surface $cal(S)$.
  The orientation of $cal(C)$ and $cal(S)$ are _compatible_ if,
  when walking along $cal(C)$ in the chosen direction, with $cal(S)$ to the left,
  the normal vector $bf(n)$ is pointing up.
]

#thm(numbering: none)[Crummy Stokes' theorem][
  Let $cal(C)$ be a closed loop in $RR^3$ parametrized by $bf(r)_1(t)$.
  Suppose $cal(S)$ is the boundary of an oriented surface $cal(S)$ parametrized by $bf(r)_2(u,v)$.
  Assume the orientation of $cal(C)$ and $cal(S)$ are compatible.
  Then
  $ underbrace(oint_(cal(C)) bf(F) dot dif bf(r)_1, = int_(t="start")^("stop") bf(F) dot bf(r)'_1(t) dif t)
    = underbrace(iint_(cal(S)) (nabla times bf(F)) dot bf(n) dif S.,
    = iint_(u,v) (op("curl") bf(F)) dot
      ((partial bf(r)_2) / (partial u) times (partial bf(r)_2) / (partial v)) dif u dif v) $
]

Reasons to not be excited about the non-generalized Stokes' theorem (hence the name "crummy"):

- Both sides require parametrization, so it's not as slick as FTC, Green, or divergence theorem,
  which were powerful because they let you skip the parametrization step.
- Surface integrals are more painful than line integrals,
  but there's no "anti-curl" procedure analogous to anti-gradient,
  so it doesn't help with surface integrals of a "random" vector field.

= Recitation questions from official course

/ 1.: Find the curl of the vector field $chevron.l x^2 y \, y z \, x y z^2 chevron.r$.
/ 2.: For what values of $a$ and $b$ is the vector field
  $upright(bold(F)) = y z^2 upright(bold(i)) + (x z^2 + a y z) upright(bold(j)) + (b x y z + y^2) upright(bold(k))$
  a conservative field?
  For these values, find a corresponding potential
  function $f (x , y , z)$ for the vector field.
  Calculate the line
  integral $integral_C upright(bold(F)) dot.op d upright(bold(r))$ where
  $C$ is the parametrized curve $(e^(t^2 - t) - 1 , t^4 , sin (pi t))$
  with $0 lt.eq t lt.eq 1$.
/ 3.: Recall the statement of Stokes' theorem.
  Verify the statement of Stokes' theorem where $S$ is the upper hemisphere of the sphere of radius one
  centered at the origin and $C$ is its boundary, for the vector field
  $upright(bold(F)) = chevron.l x , y , z chevron.r$.
