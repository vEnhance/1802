#import "@local/evan:1.0.0":*

= Shortcuts for flux: divergence theorem and more <sec-divthm>

== [TEXT] The divergence theorem

== [TEXT] Physicists rejoice: divergence for gravity and electricity

== [TEXT] Another trick: writing as surface area if $bf(F) dot bf(n)$ is constant

Let $cal(S)$ be a surface parametrized by $bf(r) : cal(R) -> RR^3$,
and as always let $bf(n)$ be shorthand for
the unit vector in the direction of $((partial r)/(partial u) times (partial r)/(partial v))$.

Let's compare the flux and surface area in both longhand and shorthand.

- In longhand, we have
  $ op("SurfArea")(cal(S)) &= iint_(cal(R)) lr(|(partial r)/(partial u) times (partial r)/(partial v)|) dif u dif v \
    "Flux" &= iint_(cal(R)) bf(F) dot ((partial r)/(partial u) times (partial r)/(partial v)) dif u dif v
    = iint_(cal(R)) (bf(F) dot bf(n)) lr(|(partial r)/(partial u) times (partial r)/(partial v)|)  dif u dif v. $
  (Keep type safety in mind here: the absolute value is a number,
  and the $dot$ is dot product of vectors in $RR^3$.)
  What we've done for the flux is decompose the cross product
  $((partial r)/(partial u) times (partial r)/(partial v))$ into $bf(n)$ times its magnitude,
  which we can do (in general, _any_ vector $bf(w)$ equals $|bf(w)|$ multiplied by its direction unit vector).
  In this way you can make flux look a little more like surface area.
- In shorthand, it's even more obvious:
  $ "Flux" &= iint_(cal(S)) (bf(F) dot bf(n)) dif S quad " and " quad
    op("SurfArea")(cal(S)) &= iint_(cal(S)) dif S. $

However, this resemblance is mostly useless, _except_ in one really particular circumstance:
the case where it happens $bf(F) dot bf(n)$ is always equal to the same constant $c$
for every point on the surface.
If you are that lucky, then the resemblance can actually be put to use:
$ "Flux" = iint_(cal(R)) c dot lr(|(partial r)/(partial u) times (partial r)/(partial v)|) dif u dif v
  = c iint_(cal(R)) lr(|(partial r)/(partial u) times (partial r)/(partial v)|) dif u dif v
  = c dot op("SurfArea")(cal(S)). $
Then if you know the surface are of $cal(S)$, you don't have to do _any_ integration.
You just multiply the surface area by $c$.

Again, this particular trick is extremely specific.
It will only happen if $bf(F)$ and $cal(S)$
have been cherry-picked so that $bf(F) dot bf(n)$ is constant,
and if you write down a "random" vector field $bf(F)$
there is absolutely no chance this occurs by luck.
However, despite the brittleness of the technique,
this trick is still popular for some homework and exam questions because no calculation is needed.
Here are two examples of this with spheres.

#sample[
  Let $cal(S)$ denote the sphere $x^2+y^2+z^2=17^2=289$ of radius $17$.
  Let $bf(F) = vec(x,y,z)$.
  Compute the flux $ iint_(cal(S)) bf(F) dot dif bf(S). $
  (Orient $bf(S)$ outwards.)
]
#soln[
  The normal vector $bf(n)$ at any point $(x,y,z)$ on the surface of the sphere
  is a unit vector pointing in the direction of $angle.l x,y,z angle.r$.
  Conveniently, the force vector $bf(F)$ is a vector of magnitude $17$ in the same direction!
  That is, $ bf(F) dot bf(n) = (10bf(n)) dot (bf(n)) = 17. $
  Consequently,
  $ iint_(cal(S)) bf(F) dot dif bf(S) = 17 op("SurfArea")(cal(S)) = 17 dot (4 dot 289)pi = #boxed[$ 4 dot 17^3 pi $]. $
  (In general, we know a sphere of radius $R$ has surface area $4 R^2 pi$.)
]
#remark[
  The previous example could also have been done by the divergence theorem.
  For $bf(F) = vec(x,y,z)$ the divergence is given by
  $ nabla dot bf(F) = 1 + 1 + 1 = 3. $
  And the volume of the sphere is $4/3 pi dot 17^3$.
  So
  $ iint_(cal(S)) bf(F) dot dif bf(S)
    = iiint_(cal(T)) (nabla dot bf(F)) dif V
    = 3 dot (4/3 pi dot 17^3) = 4 pi dot 17^3. $
  Actually, put another way: if you know the volume of the sphere is $4/3 pi R^3$
  and the divergence theorem, then the surface area trick
  lets you derive the surface area formula of $4 pi R^2$.
]

#sample[
  Let $cal(S)$ denote the sphere $x^2+y^2+z^2=17^2=289$ of radius $17$.
  Let $bf(G)$ be the force of gravity exerted by a point mass $m$ at the origin.
  Compute the flux $ iint_(cal(S)) bf(G) dot dif bf(S). $
  (Orient $bf(S)$ outwards.)
]
#soln[
  This is just like the previous example except that the gravity exerted
  $bf(G)$ has magnitude $(G m) / 17^2$ and points in the _opposite_ direction as $bf(n)$.
  That is, $ bf(F) dot bf(n) = (-((G m) / (17^2)) bf(n)) dot (bf(n)) = -(G m) / 289. $
  Consequently,
  $ iint_(cal(S)) bf(F) dot dif bf(S) = -(G m) / 289 dot op("SurfArea")(cal(S))
    = (-G m)/(17^2) dot (4 dot 17^2 pi) = #boxed[$ -4 pi G m $]. $
  (In general, we know a sphere of radius $R$ has surface area $R^2 pi$.)
]
Note that the answer is independent of the radius! The $17$ cancels out.
#remark[
  The previous example _cannot_ be done by the divergence theorem.
  Indeed $nabla dot bf(G) = 0$ at every point where $bf(G)$ is defined,
  but $bf(G)$ is _not_ defined at the origin and this causes the result to fail.
]

== [RECAP] All the methods so far for flux

== [EXER] Exercises
