#import "@local/evan:1.0.0":*

= Anti-gradients <sec-antigrad>

This section is actually usually not taught until much later in 18.02, in Part Hotel.
However, I'm going to stick it in here,
while your brain hasn't been infested with integrals yet, since it's a standalone question.
However, if you prefer to follow 18.02 more strictly,
you could skip this chapter for now and come back a month or two later
once you actually need to know how to do it.

The goal of this section is to do $nabla$ backwards:
#goal[
  If you know $nabla f$, can you go back and find $f$?
]

== [TEXT] There's still $+C$ everywhere

I'll note right away that you still have the $+C$ from 18.01.
To elaborate, you might remember in 18.01
that for $int x^2 dif x = x^3/3 + C$ for any constant $C$,
and we usually just ignore the $+C$ because it does nothing.

For 18.02 we'll do the same thing.
For example, if $f_1(x,y) = x^2+y^2$ and $f_2(x,y) = x^2+y^2+17$, then they have the same gradient:
$ nabla f_1 = nabla f_2 = vec(2x, 2y). $
However, we just agree to not care about the constant;
if asked to find a potential function, and $f$ is any acceptable answer, then so is $f + 100$.
But there are will be no other answers besides $f+C$ for various $C$.

== [TEXT] Guessing works pretty well

Sometimes you might be able to just guess $f$, and if so, good for you.
See if you can guess the answers to the following ones:

$ nabla f &= vec(x,y) \
  nabla f &= vec(y e^(x y), x e^(x y)) \
  nabla f &= vec(x^3 , y^3, z^3). $

== [TEXT] Actually most of the time there might not be any function $f$

The thing that's different in 18.02 is that
it's easy to set questions for which this task is impossible.
#todo[...]

== [TEXT] Antiderivative method, if you're promised there is one


/* I think this is too complicated to work in 18.02

=== [RECIPE] Plan 2: Trace a path

The simplest recipe goes as follows:
Consider any other point $(a,b,c)$ in $RR^3$.
The strategy is to consider the straight-line path $bf(r) : [0,1] -> RR^n$
defined by $ bf(r)(t) = (a t, b t, c t). $
This is a path from $(0,0,0)$ to $(a,b,c)$ that takes unit time, for which
$ bf(r)'(t) = vec(a,b,c). $
Then
$ f(a,b,c) - f(0,0,0) &= int_(t=0)^1 bf(F)(bf(r)(t)) bf(r)'(t) dif t \
  &= int_(t=0)^1 bf(F)(a t, b t, c t) dot vec(a, b, c) dif t. $
The number $f(0,0,0)$ is a constant, and we can shift away by it:
i.e. we'll go ahead and output the $f$ for which $f(0,0,0) = 0$.
... And that's it! It gives us a way to find $f(a,b,c)$ for any numbers $a$, $b$, $c$.

We can rewrite this as the following simple recipe.
Remember in the integral, the thing being integrated is over $t$:
so you should treat $a$, $b$, $c$ as fixed numbers.

#recipe(title: [One recipe for recovering the potential function given just $bf(F)$])[
  Suppose $bf(F) : RR^3 -> RR^3$ is a vector field already known to be conservative,
  and you wish to give an example of a function $f$ such that $nabla f = bf(F)$.

  1. Output $ f(a,b,c) = int_(t=0)^1 bf(F)(a t, b t, c t) dot vec(a, b, c) dif t. $
    You may also output $f+C$ for any constant $C$.
  2. If it bothers you that the variable names are $a$, $b$, $c$ in your final answer,
    change them back to $x$, $y$, $z$ at the end.
]

The reason for the letter change at the end is because
you'll find $x$, $y$, $z$ are probably used already as variable names in the question.
It'll make your life a bit easier to use a different letter.

#remark(title: [Remark: There are many other recipes, feel free to invent your own!])[
  I write "one recipe" because there are lots of other approaches too,
  even with different paths.

  For example, I picked a straight line from $(0,0,0)$ to $(a,b,c)$ earlier,
  but you don't have to:
  you could also go for example in a straight line from $(0,0,0)$ to $(a,0,0)$,
  then to $(a,b,0)$ then to $(a,b,c)$.
  The advantage of this is you can use a different amount of time going from one point
  to another, so you don't necessarily need time $1$.

  Or if there's a point other than $(0,0,0)$ that is easier to work with like $(1,1,1)$,
  you could start there instead and adjust your path $bf(r)$ accordingly.
  Or you could even make the path a circular arc, if it makes more sense for the problem.

  This is a case where it's more important to remember _how_ the recipe is invented
  rather than memorize this recipe exactly as written, because it's so easy to adapt.
]


*/
