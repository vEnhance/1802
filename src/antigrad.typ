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
  nabla f &= vec(y z, z x, x y). $

== [TEXT] Antiderivative method, if you're promised there is one

#recipe(title: [How to find an anti-gradient with three variables])[
  1. Let $f$ denote the gradient function.
  2. Integrate the given $(partial f) / (partial x)$ to get some equation of the
    form $f(x,y) = "expression"  + g(y)$ for some function $g(y)$.
  3. Put this into $(partial f) / (partial y)$ to find $g'(y)$.
  4. Integrate get $g(y) = "expression" + C$ for some constant $C$.
  5. Stitch everything together to output $f$.
]

With three variables, it's similar, but more work.

#recipe(title: [How to find an anti-gradient with three variables])[
  1. Let $f$ denote the gradient function.
  2. Integrate the given $(partial f) / (partial x)$ to get some equation of the
    form $f(x,y,z) = "expression"  + g(y,z)$ for some function $g(y,z)$.
  3. Put this into $(partial f) / (partial y)$ to find $(partial g(y,z))/(partial y)$.
  4. Integrate to get $g(y,z) = "expression" + h(z)$ for some function $h(z)$.
  5. Put this into $(partial f) / (partial z)$ to recover $h'(z)$.
  6. Integrate this to recover $h(z) = "expression" + C$ for some constant $C$.
  7. Stitch everything together to output $f$.
]

Let's do a two-variable example first.
#sample[
  We are given the gradient of a function $f (x , y)$:
  $ nabla f (x , y) = vec(cos y , - x sin y) $
  Recover $f$.
]
#soln[
  This means:
  $ (partial f) / (partial x) = cos y quad upright("and") quad (partial f) / (partial y) = - x sin y $

  First we integrate $(partial f) / (partial x)$ with respect to $x$:
  $ f (x , y) & = int (partial f) / (partial x) dif x &= int cos y dif x  = x cos y + g (y) $
  where $g(y)$ is some is an unknown function of $y$.

  Now differentiate $f (x , y)$ with respect to $y$:
  $ (partial f) / (partial y) & = (partial) / (partial y) (x cos y + g (y)) \
    & = - x sin y + g' (y) $

  We set $(partial f) / (partial y)$ equal to the given expression and solve for $g' (y)$:
  $ - x sin y + g' (y) & = - x sin y\ ==> g' (y) & = 0 $
  Hence $ g (y) = int 0 dif y = C $ where $C$ is a constant.
  We get the final expression for $f (x , y)$ as:
  $ f (x , y) = x cos y + C. #qedhere $
]


#sample[
  We are given the gradient of a function $f (x , y)$:
  $ nabla f (x , y) = vec(3x^2 + 4 x y + y^2, 2x^2 + 2 x y - 3y^2) $
  Recover $f$.
]
#soln[
  This means:
  $ (partial f) / (partial x) = 3 x^2 + 4 x y + y^2 quad upright("and") quad (partial f) / (partial y) = 2 x^2 + 2 x y - 3 y^2 $

  We first integrate $(partial f) / (partial x)$ with respect to $x$:
  $ f (x , y) & = integral (3 x^2 + 4 x y + y^2) dif x\
    & = integral 3 x^2 dif x + integral 4 x y dif x + integral y^2 dif x\
    & = x^3 + 2 x^2 y + x y^2 + g (y) $
  Here, $g (y)$ is an unknown function of $y$.

  Next, differentiate $f (x , y)$ with respect to $y$:
  $ (partial f) / (partial y) & = (partial) / (partial y) (x^3 + 2 x^2 y + x y^2 + g (y))\
    & = 0 + 2 x^2 + 2 x y + g' (y)\
    & = 2 x^2 + 2 x y + g' (y) $

  Now set $(partial f) / (partial y)$ equal to the given expression and solve for $g' (y)$:
  $ 2 x^2 + 2 x y + g' (y) & = 2 x^2 + 2 x y - 3 y^2\
    g' (y) & = - 3 y^2 $
  We integrate $g' (y)$ to find $g (y)$:
  $ g (y) = integral - 3 y^2 dif y = - y^3 + C $
  where $C$ is a constant of integration.

  Putting this together gives
  $ f (x , y) = x^3 + 2 x^2 y + x y^2 - y^3 + C. #qedhere $
]

Here's a three-variable version. It's admittedly a slog.
#sample[
  We are given the gradient of a function $f(x,y,z)$:
  $ nabla f(x,y,z) = vec(y^2-sin(x), x y + 2 y z, e^z+2y^2). $
  Recover $f$.
]
#soln[
  Again, integrate $(partial f) / (partial x)$ with respect to $x$:
  $ f (x , y , z) & = integral (y^2 - sin x) dif x\
    & = y^2 x + cos x + g (y , z) $
  Here, $g (y , z)$ is an unknown function of $y$ and $z$.

  Next, we differentiate $f (x , y , z)$ with respect to $y$:
  $ (partial f) / (partial y) & = (partial) / (partial y) (y^2 x + cos x + g (y , z))\
    & = 2 y x + (partial g) / (partial y) $
  If we set $(partial f) / (partial y)$ equal to the given
  expression and solve for $(partial g) / (partial y)$:
  $ 2 y x + (partial g) / (partial y) & = 2 y (x + 2 z)\
    2 y x + (partial g) / (partial y) & = 2 y x + 4 y z\
    (partial g) / (partial y) & = 4 y z $
  Now integrate $(partial g) / (partial y)$ with respect to $y$ to find $g (y , z)$:
  $ g (y , z) & = integral 4 y z dif y + h (z)\
    & = 2 y^2 z + h (z) $
  Here, $h (z)$ is an unknown function of $z$.

  Finally, 5: Substitute $g (y , z)$ back into $f (x , y , z)$:
  $ f (x , y , z) = y^2 x + cos x + 2 y^2 z + h (z) $
  We differentiate one more time:
  $ (partial f) / (partial z) & = (partial) / (partial z) (y^2 x + cos x + 2 y^2 z + h (z))\
    & = 0 + 0 + 2 y^2 + h' (z)\
    & = 2 y^2 + h' (z) $
  Set $(partial f) / (partial z)$ equal to the given expression and solve for $h' (z)$:
  $ 2 y^2 + h' (z) & = e^z + 2 y^2\
    h' (z) & = e^z $
  Integrate $h' (z)$ with respect to $z$ to find $h (z)$:
  $ h (z) & = integral e^z dif z + C\ & = e^z + C $
  Here, $C$ is a constant of integration.

  Okay, all done! Put all the work above together:
  and 9: Write the final expression for $f (x , y , z)$:
  $ f (x , y , z) = y^2 x + cos x + 2 y^2 z + e^z + C $
]

== [TEXT] Actually most of the time there might not be any function $f$

So far this might feel like 18.01 integration beefed up to many variables.
But something is actually different.
Up until now I've picked gradients for which there was an answer.

But most of the time that's not true:
*the thing that's different in 18.02 is that
it's easy to set questions for which this task is _really_ impossible*.
That's actually a major difference.

#digression(title: [Digression: There's a difference
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
We can imagine we follow through the same method as before.
We start by integrating $(partial f) / (partial x)$ with respect to $x$ to get
$ f(x,y) = int 2 y dif x = 2 x y + g(y) $
to start.
Then differentiating with respect to $y$ gives
$ (partial f) / (partial y) = partial / (partial y) (2 x y + g(y)) = 2 x + g'(y). $
So then we set this equal and get
$ 2 x = g'(y) + x $
and so we need to solve
$ g'(y) = x $
which... wait! There's no way a function $g$ can satisfy that for _every_ $x$.
What's going on?

It's tempting to write $g(y) = x y + C$, but that's a type error.
These new functions $g$ and $h$ can only depend on their arguments.
Indeed, look carefully at everything we wrote for $g$ and $h$ in the previous samples:
Whenever we wrote $g(y)$ or $g(y,z)$, we never allow it to depend on $x$.
And when we wrote $h(z)$, we didn't allow it to depend on $x$ or $y$ either.

In mathematics there's a concept of _proof by contradiction_:
if you start from an assumption,
and then do some logic and reasoning to reach an impossible conclusion,
then the starting assumption was wrong.
Here, the starting assumption that there was _some_ function $f$ such that $nabla f = vec(2y, x)$.
Starting from this assumption we found that there was a function $g : RR -> RR$
such that $g'(y) = x$ for every real number $x$, which is ridiculous.
So our assumption was wrong: there can't be such function $f$.
Not like 18.01 where "$f$ exists but is hard to write down";
the function $f$ literally cannot exist.

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
    $ f_x = 7 x^6 y^3 ==>
      (partial / (partial y)) f_x = 21 x^6 y^2. $
  - Do it the other order:
    $ f_y = 3 x^6 y^2 ==>
      (partial / (partial x)) f_y = 21 x^6 y^2. $
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
  Consider $vec(a(x,y), b(x,y))$, where $p$ and $q$ are continuously differentiable.
  Then there exists $f$ such that $ nabla f = vec(p(x,y), q(x,y)) $
  if and only if
  $ (partial p) / (partial y) = (partial q) / (partial x). $
]
You should think of this as $f_(x y) = f_(y x)$.
We'll see this again much later in Part Hotel, but in different language:
"the 2D scalar curl of $f$ is zero".

The 3D version tests all the possible pairs:
#memo(title: [Memorize: Criteria for 3D anti-gradient to exist])[
  Consider $vec(p(x,y,z), q(x,y,z), r(x,y,z))$, where $p$, $q$, $r$ are continuously differentiable.
  Then there exists $f$ such that $ nabla f = vec(p(x,y,z), q(x,y,z), r(x,y,z)) $
  if and only if all three of the following equations hold:
  $ (partial p) / (partial y) = (partial q) / (partial x), quad
    (partial p) / (partial z) = (partial r) / (partial x), quad
    (partial q) / (partial z) = (partial r) / (partial y). $
]
The above three equations should be remembered as
$f_(x y) = f_(y x)$, $f_(y z) = f_(z y)$, $f_(z y) = f_(x y)$.
We'll see this also in Part Hotel again hidden in a different name:
"the 3D scalar curl of $f$ is zero".
In that section, the given right-hand side will be called called a *vector field*
and the function $f$ will be called a *potential function* for it.
But ignore those names for now.

== [EXER] Exercises

#todo[make something up]
