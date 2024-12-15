#import "@local/evan:1.0.0":*

= Anti-gradients <ch-antigrad>

This chapter is actually usually not taught until much later in 18.02, in Part India.
However, I'm going to stick it in here,
while your brain hasn't been infested with integrals yet, since it's a standalone question.
However, if you prefer to follow 18.02 more strictly,
you could skip this chapter for now and come back a month or two later
once you actually need to know how to do it.

The goal of this chapter is to do $nabla$ backwards:
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
  nabla f &= vec(y z, z x, x y). $

== [TEXT] Antiderivative method, if you're promised there is one <sec-antideriv>

#recipe(title: [How to find an anti-gradient with two variables])[
  1. Let $f$ denote the gradient function.
  2. Integrate the given $(partial f) / (partial x)$ with respect to $x$ to get some equation of the
    form $f(x,y) = "expression"  + C_1(y)$ for some function $C_1(y)$.
  3. Integrate the given $(partial f) / (partial y)$ with respect to $y$ to get some equation of the
    form $f(x,y) = "expression"  + C_2(y)$ for some function $C_2(x)$.
  4. Stitch them together and output a function $f$.
]

With three variables, it's similar, but more work.

#recipe(title: [How to find an anti-gradient with three variables])[
  1. Let $f$ denote the gradient function.
  2. Integrate the given $(partial f) / (partial x)$ with respect to $x$ to get some equation of the
    form $f(x,y,z) = "expression"  + C_1(y,z)$ for some function $C_1(y,z)$.
  3. Integrate the given $(partial f) / (partial y)$ with respect to $y$ to get some equation of the
    form $f(x,y,z) = "expression"  + C_2(x,z)$ for some function $C_2(x,z)$.
  4. Integrate the given $(partial f) / (partial z)$ with respect to $z$ to get some equation of the
    form $f(x,y,z) = "expression"  + C_3(x,y)$ for some function $C_3(x,y)$.
  5. Stitch everything together to output $f$.
]

Let's do a two-variable example first.
#sample[
  We are given the gradient of a function $f (x , y)$:
  $ nabla f (x , y) = vec(x + cos y , - x sin y) $
  Recover $f$.
]
#soln[
  This means:
  $ (partial f) / (partial x) = x + cos y quad upright("and") quad (partial f) / (partial y) = - x sin y. $

  Integrate $(partial f) / (partial x)$ and $(partial f) / (partial y)$ with respect to $x$ and $y$:
  $ f (x , y) & = int (partial f) / (partial x) dif x = int cos y dif x  = x^2/2 + x cos y + C_1 (y). \
    f (x , y) & = int (partial f) / (partial y) dif y = int - x sin y dif y  = x cos y + C_2(x). $
  Putting these together to get the final expression for $f (x , y)$ as:
  $ f (x , y) = #boxed($ x^2/2 + x cos y + C $) $
  for any constant $C$.
]


#sample[
  We are given the gradient of a function $f (x , y)$:
  $ nabla f (x , y) = vec(3x^2 + 4 x y + y^2, 2x^2 + 2 x y - 3y^2) $
  Recover $f$.
]
#soln[
  This means:
  $ (partial f) / (partial x) = 3 x^2 + 4 x y + y^2 quad upright("and") quad (partial f) / (partial y) = 2 x^2 + 2 x y - 3 y^2. $


  Integrate $(partial f) / (partial x)$ and $(partial f) / (partial y)$ with respect to $x$ and $y$:
  $ f (x , y) & = int (partial f) / (partial x) dif x = int (3 x^2 + 4 x y + y^2) dif x  = x^3 + 2 x^2 y + x y^2 + C_1(y) \
    f (x , y) & = int (partial f) / (partial y) dif y = int (2 x^2 + 2 x y - 3 y^2) dif y = 2 x^2 + x y^2 - y^3 + C_2(x). $
  Putting this together gives
  $ f (x , y) = #boxed($ x^3 + 2 x^2 y + x y^2 - y^3 + C $). #qedhere $
]

Here's a three-variable version. It's admittedly a slog.
#sample[
  We are given the gradient of a function $f(x,y,z)$:
  $ nabla f(x,y,z) = vec(y^2-sin(x), 2 x y + 4 y z, e^z+2y^2). $
  Recover $f$.
]
#soln[
  Again, integrate with respect to all three components:
  $ f (x , y , z) & = integral (y^2 - sin x) dif x = y^2 x + cos x + C_1 (y , z) \
    f (x , y , z) & = integral (2 x y + 4 y z) dif y = x y^2 + 2 z y^2 + C_2(x, z) \
    f (x , y , z) & = integral (e^z + 2 y^2) dif y = e^z + 2 y^2 z + C_3(x, y). $
  Here again $C_1(y,z)$ is some function depending only on $y$ and $z$;
  similarly for $C_2$ and $C_3$.
  Now stitch everything together:
  $ f (x , y , z) = #boxed($ y^2 x + cos x + 2 y^2 z + e^z + C $). #qedhere $
]

== [TEXT] Actually most of the time no potential function $f$ exists

So far this might feel like 18.01 integration beefed up to many variables.
But something is actually different.
Up until now I've picked gradients for which there was an answer.

But most of the time that's not true:
*the thing that's different in 18.02 is that
for a randomly written question this task is _really_ impossible*.
That's actually a major difference.

#digression(title: [Digression: There's a huge difference
  between "not easy to write the answer" and "no such function exists"])[
  Weren't there impossible integrals in 18.01?
  Well, it depends on what you mean by "impossible".
  For example, a question you won't see in 18.01 is
  $ int cos(x^2) dif x $
  which can be translated to "find a function $f$ such that $f'(x) = cos(x^2)$".
  The reason you're not asked this in 18.01 is because,
  while such a function $f$ _does exist_, it can't be expressed
  in a way that makes sense to 18.01 students.

  But I mean, you could always cheat and write
  $ f(t) = int_0^t cos(x^2) dif x. $
  The right-hand side really evaluates to some number for every $t$,
  e.g. if you do numerical analysis $f(1) approx 0.904524$, $f(2) approx 0.461461$, etc.
  So there really is some function $f$ whose derivative is $cos(x^2)$.
  It just doesn't have any good way to write it down.
  That means, if you tried to solve the question in 18.01 methods,
  you just eventually run out of methods and ideas to try.

  In the 18.02 version, we're about to see that even simple analogous questions
  might have answer "no such function exists".
  So when you try to solve an impossible anti-gradient question,
  something really different will happen:
  rather than running out of methods and ideas,
  you can follow the usual method and then _reach a contradiction_.
]

#question[
  Determine whether or not there exists a differentiable function $f(x,y)$ such that
  $ nabla f = vec(2 y, x). $
]
#soln[
  We can imagine we follow through the same method as before.
  Integration gives
  $ f(x,y) &= int 2 y dif x = 2 x y + C_1(y) \
    f(x,y) &= int x dif y = x y + C_2(x). $
  For these to be equal we need $2 x y + C_1(y) = x y + C_2(x)$,
  so $x y + C_1(y) = C_2(x)$, which is impossible!
  What's going on?

  (It's tempting to write $C_1(y) = C$ and $C_2(x) = x y + C$, but that's a type error.
  These new functions $C_1$ and $C_2$ can only depend on their arguments.
  Indeed, look carefully at everything we wrote for $C_i$ previously:
  for example, whenever we wrote $C_1(y)$ or $C_1(y,z)$, we never allow it to depend on $x$.)

  In mathematics there's a concept of _proof by contradiction_:
  if you start from an assumption,
  and then do some logic and reasoning to reach an impossible conclusion,
  then the starting assumption was wrong.
  Here, the starting assumption that there was _some_ function $f$ such that $nabla f = vec(2y, x)$.
  Starting from this assumption we found that there were functions
  $C_1(y)$ and $C_2(x)$ such that $C_2(x) - C_1(y) = x y$ holds for all real numbers $x$ and $y$.
  So our assumption was wrong: there can't be such function $f$.
  Not like 18.01 where "$f$ exists but is hard to write down";
  the function $f$ literally cannot exist.
]

== [TEXT] Shortcut for weeding out impossible questions

Okay, so I bet you're all wondering now, "how can I tell if the question is impossible?".

Well, one strategy would just be to *run the recipe I showed you and see if it works out*.

- If you find a function $f$ that works, great.
- If you run into a contradiction, well, now you know it's impossible.

But that's a lot of work. We'd like a shortcut, and there is one.

The idea is that for functions (for which the partial derivatives are continuous),
the _partial derivatives_ commute.
What that means, if say $f(x,y)$ is a two-variable function, the following is true:
#memo(title: [Memorize: partial derivatives commute])[
  If $f_x$ and $f_y$ are both continuous then
  $ f_(x y) = f_(y x). $
]
If you like $partial$ notation better, this could also be written as
$ (partial)/(partial y) (partial f) / (partial x)
  = (partial)/(partial x) (partial f) / (partial y). $
In other words, if you try to differentiate with respect to $x$, then with respect to $y$,
you get the same thing as $y$ first then $x$.
Sometimes people write this as
$ (partial^2 f)/(partial x partial y) = (partial^2 f) / (partial y partial x). $

This result is at least a bit surprising,
and I actually don't expect you to believe me without seeing some examples.
So let's see some examples:
#example(title: [Example showing that the order of differentiation doesn't matter])[
  Let $f(x,y) = x^7 y^3$.
  - If we differentiate with respect to $x$ then to $y$ we get
    $f_x = 7 x^6 y^3 ==>
      (partial / (partial y)) f_x = 21 x^6 y^2$.
  - Do it the other order:
    $f_y = 3 x^6 y^2 ==>
      (partial / (partial x)) f_y = 21 x^6 y^2$.
  - Either way we get the same result
    $ f_(x y) = f_(y x) = 21 x^6 y^2. $
]
#example(title: [Another example showing that the order of differentiation doesn't matter])[
  Let $f(x,y) = cos(x+y) y^3$.
  - First, differentiate $f$ with respect to $x$:
    $ f_x = - sin (x + y) y^8
    ==>
      (partial) / (partial y) f_x & = (partial) / (partial y) (- sin (x + y) y^8)\
      & = - cos (x + y) y^8 - 8 y^7 sin (x + y) $
  - Do it the other order:
    First, differentiate $f$ with respect to $y$:
    $ f_y = (- sin (x + y) y^8 + 8 y^7 cos (x + y))
      ==> (partial) / (partial x) f_y &= (partial) / (partial x) (- sin (x + y) y^8 + 8 y^7 cos (x + y))\
       & = - cos (x + y) y^8 - 8 y^7 sin (x + y) $
  - Either way, we get the same result:
    $ f_(x y) = f_(y x) = - cos (x + y) y^8 - 8 y^7 sin (x + y) $
]

Okay, so how about the example we gave earlier?
#question[
  Determine whether or not there exists a differentiable function $f(x,y)$ such that
  $ nabla f = vec(2 y, x). $
]

Well, if there was such an $f$, and we got a mismatch, then
$ f_(x y) = partial / (partial y) f_x = partial / (partial y) (2 y) = 2 \
  f_(y x) = partial / (partial x) f_y = partial / (partial x) x = 1. $
So via proof by contradiction, no such $f$ could exist.

== [RECIPE] Ruling out the existence of an anti-gradient <sec-when-antigrad>

As it turns out, this test I described is good enough for 18.02 ---
it will catch all impossible questions.
Specifically, the following theorem is true.

#memo(title: [Memorize: Criteria for 2D anti-gradient to exist])[
  Consider two functions $vec(p(x,y), q(x,y))$ defined on all of $RR^2$,
  where $p$ and $q$ are continuously differentiable.
  Then there exists $f$ such that $ nabla f = vec(p(x,y), q(x,y)) $
  if and only if
  $ (partial p) / (partial y) = (partial q) / (partial x). $
]
You should think of this as $f_(x y) = f_(y x)$.
We'll see this again much later in Part India, but in different language:
"the 2D scalar curl of $f$ is zero".

The 3D version tests all the possible pairs:
#memo(title: [Memorize: Criteria for 3D anti-gradient to exist])[
  Consider three functions $vec(p(x,y,z), q(x,y,z), r(x,y,z))$ defined on all of $RR^3$,
  where $p$, $q$, $r$ are continuously differentiable.
  Then there exists $f$ such that $ nabla f = vec(p(x,y,z), q(x,y,z), r(x,y,z)) $
  if and only if all three of the following equations hold:
  $ (partial p) / (partial y) = (partial q) / (partial x), quad
    (partial p) / (partial z) = (partial r) / (partial x), quad
    (partial q) / (partial z) = (partial r) / (partial y). $
]
The above three equations should be remembered as
$f_(x y) = f_(y x)$, $f_(y z) = f_(z y)$, $f_(z y) = f_(x y)$.
We'll see this also in Part India again hidden in a different name:
"the 3D scalar curl of $f$ is zero".
In that part, the given right-hand side will be called called a *vector field*
and the function $f$ will be called a *potential function* for it.
But ignore those names for now.

== [EXER] Exercises
