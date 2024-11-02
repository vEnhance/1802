#import "@local/evan:1.0.0":*

= Flux <sec-flux>

#todo[This entire section is to be written]

== [TEXT] 2D flux, and Green's theorem in flux form

I will grudgingly define 2D flux first, since I just went over Green's theorem.
I say "grudgingly" because 2D flux is an awkward hacked special case of 3D flux,
forced to work in two dimensions.
But okay, gotta follow the script.

The idea of flux is that you have some closed curve $cal(C)$ in $RR^2$.
When we had a work integral, we went along the curve $cal(C)$ and added together the
dot product of the vector field with the tangent vectors on that vector field.

With 2D flux, we instead take the dot product of the vector field
with the _normal vector_ rather than the tangent vector.
This should be drawn as a _$90 degree$ clockwise rotation of $bf(r)'(t)$_.
For 2D flux only --- and nowhere else in this book --- we denote this as $bf(n)$,
because there's literally no other notation that I can think of that makes any sense
for something as awkward as "take $bf(r)'(t)$ and rotate it by $90 degree$ clockwise".

#figure(
  image("figures/flux-2d-dot.png", width: auto),
  caption: [The 2D flux is the dot product where the tangent is replaced by $bf(n)$.],
)
