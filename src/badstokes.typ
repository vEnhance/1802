#import "@local/evan:1.0.0":*

= Classical Stokes' Theorem <ch-badstokes>

_This topic was excluded from the final exam for 18.02 in Fall 2024,
so this chapter is just a brief summary for interest._

All the red arrows in @poster-stokes are special cases of
what _mathematicians_ refer to as generalized Stokes' theorem.
Despite this, we confusingly call the final red arrow "Stokes' theorem" as well.
I'll use the phrase "classical" to indicate this came first historically.

== [TEXT] The classical Stokes' theorem

Here's the statement of the result:

#definition(title: [Definition of compatible orientations])[
  Suppose $cal(C)$ is a closed loop in $RR^3$ which is the boundary of an oriented surface $cal(S)$.
  The orientation of $cal(C)$ and $cal(S)$ are _compatible_ if,
  when walking along $cal(C)$ in the chosen direction, with $cal(S)$ to the left,
  the normal vector $bf(n)$ is pointing up.
]

#memo(title: [Classical Stokes' theorem])[
  Let $cal(C)$ be a closed loop in $RR^3$ parametrized by $bf(r)_1(t)$.
  Suppose $cal(S)$ is the boundary of an oriented surface $cal(S)$ parametrized by $bf(r)_2(u,v)$.
  Assume the orientation of $cal(C)$ and $cal(S)$ are compatible.
  Then
  $ underbrace(oint_(cal(C)) bf(F) dot dif bf(r)_1, = int_(t="start")^("stop") bf(F) dot bf(r)'_1(t) dif t)
    = underbrace(iint_(cal(S)) (nabla times bf(F)) dot bf(n) dif S.,
    = iint_(u,v) (op("curl") bf(F)) dot
      ((partial bf(r)_2) / (partial u) times (partial bf(r)_2) / (partial v)) dif u dif v) $
]

For a picture of why this theorem is true,
one should just refer to @fig-2dflux-explain again (from @sec-2dflux-explain),
which we used when explaining Green's theorem for flux.
The classical Stokes theorem is the same picture,
except that one should imagine the grid is superimposed onto the surface $cal(S)$
(rather than laying flat in 2D).
The same explanation should then carry over verbatim.

== [TEXT] Reasons to not be excited about classical Stokes' theorem

Unlike the other big-name theorems we've seen (FTC, Green, and divergence theorem),
the classical Stokes' theorem does not make for good exam questions, for a few reasons:

- Both sides require parametrization, so it's not as slick as FTC, Green, or divergence theorem,
  which were powerful because they let you skip the parametrization step.
- Surface integrals are more painful than line integrals,
  but there's no "anti-curl" procedure analogous to anti-gradient,
  so it doesn't help with surface integrals of a "random" vector field.

In other words, it doesn't provide a nice shortcut like the other theorems do.

#digression[
  A really clever student might imagine that maybe there's a situation
  where you have a line integral over a closed loop $cal(C)$,
  you use classical Stokes theorem to change it to a surface integral,
  and then you use the divergence theorem to convert it to a volume integral,
  so maybe classical Stokes' theorem is good for something after all?
  But that kite won't fly: this could only work if $cal(S)$ is a closed surface,
  but if $cal(S)$ is a closed surface it's impossible for it to have a (nonempty) boundary $cal(C)$.
  Hence this situation will never apply.

  Similarly, imagine you have a surface integral of a vector field $bf(F)$.
  Maybe you can try to find an anti-curl for it (i.e. a vector field $bf(F)'$
  such that $nabla times bf(F)' = bf(F)$),
  and then if $bf(F)'$ is conservative hope you can use FTC?
  But that kite won't fly either:
  the curl of a conservative vector field is always $bf(0)$,
  so this would only work if $bf(F)$ was the zero vector field to begin with,
  and in that case you certainly don't need any help integrating it.
]

== [EXER] Exercises

#exerstar[
  Prove that both forms of Green's theorem follow from classical Stokes' theorem.

  That is, suppose $bf(F) = vec(p,q)$ is a vector field in $RR^2$
  and $cal(C)$ is a closed loop enclosing a region $cal(R)$ counterclockwise.
  Find a way to use classical Stokes' theorem to prove both forms of Green's theorem:
  $ oint_(cal(C)) bf(F) dot dif bf(r) &= iint_(cal(R)) ((dif q) / (dif x) - (dif p) / (dif y)) dif A \
    oint_(cal(C)) bf(F) dot bf(n) dif s &= iint_(cal(R)) ((dif p) / (dif x) + (dif q) / (dif y)) dif A. $
]
