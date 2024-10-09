#import "@local/evan:1.0.0":*
#import "@local/svg-emoji:0.1.0": setup-emoji // only if you want to use GH names for emojis
#show: setup-emoji

#show: evan.with(
  title: [Notes for 18.02 Recitation 11],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [9 October 2024],
)

#quote(attribution: [Randall Munroe in XKCD 1073: Weekend])[
    We all hate Mondays. We're all working for the weekend.
    But our chains exist only in our minds. \
    Calendars are just social consensus.
    Nature doesn't know the day of the week. \
    My friends --- we can make today Saturday. \
    We can make it Saturday _forever_.
]


This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

Hope you're excited for the long weekend! (I know I am.)

= Minimization and maximization

Now that you have learned what $nabla f$, this entire part of the class parallels 18.01,
when you set the derivative equal to zero and then inspected all the critical points.

The same caveats in 18.01 apply in 18.02 as well:
#warning[
  - Keep in mind that each of the implications
    $ "Global minimum" ==> "Local minimum" ==> "Critical point, i.e. " nabla f = bf(0) $
    is true only one way, not conversely.
    So a local minimum may not be a global minimum;
    and a point with gradient zero might not be a minimum, even locally.
    You should still find all the critical points,
    just be aware a lot of them may not actually be min's or max's.
  - There may not be _any_ global minimum or maximum at all.
    For example, the function $f(x) = x^2$ has no global maximum on $RR$
    (but has a global minimum at $x=0$).
]

#recipe[
  To find global minimum and maximums over a region $cal(R)$,
  try all of the following.

  1. Set the gradient equal to zero and solve for the *critical points*.
  2. Check "edge cases".
    It is beyond the scope of 18.02 to give a precise definition of "edge case",
    because this is not a proof-based class. Here's a list of things you should check:

    - Any points with undefined behavior (e.g. $nabla f$ is undefined).
    - Behavior at $oo$, if applicable (meaning that $cal(R)$ is not bounded)
    - Boundary of $cal(R)$, if applicable
]

#tip[
  The following 18.100 theorem might help you check your work:

  Suppose $cal(R)$ is some region in $RR^n$
  which is both _closed_ and _bounded_.#footnote[In 18.100,
    they use the word "compact" instead, which is better, but out of scope.]
  "Closed" means roughly that it's composed of $<=$ constraints rather than $<$ ones
  (e.g. closed interval), "bounded" means it fits inside a sphere with finite radius.
  Then if $f : cal(R) -> RR^n$ is defined everywhere continuously,
  you are *promised at least one global minimum and at least one global maximum exist*.

  Useful thing to know for something like Q1 below,
  (where $cal(R)$ is a closed square of length $2$);
  you know in advance the answer won't be "no global min" or "no global max".
]

= Updates on course logistics

- *Midterm 2* is probably up to Lagrange multipliers, covered this Friday.
- *Midterm 2 review session* is likely to be Monday, August 21, 3pm-5pm, run by just me.
  I'll email out once the date/time/room is finalized.
  - It will be a mock exam for one hour then solution presentation for an hour.
  - I will post the exam beforehand, so if you can only make
    4pm-5pm you can try the mock yourself and then come to solutions.
- My *LAMV course notes* are coming along! 🎉
  (This is the mega-file titled "Linear Algebra and Multivariable Calculus" on my page.)
  - Gradient (up to last recitation) pretty much all written up now.
  - If things go really well I may have all MT2 material written up by Wednesday, Oct 16.
    - However, my thesis defense is in a couple months, so no promises LOL.
  - Over time I may try to backfill MT1 material as well (for future years of 18.02).
  - In the future, I'll also update LAMV rather than fill in post-recitation notes.

= Recitation questions from official course

/ 1.: Consider the function $f (x , y) = x y (1 - x - y)$ defined on the
  region $- 1 lt.eq x lt.eq 1$, $- 1 lt.eq y lt.eq 1$.
  - Find the critical points of $f$ (that is the points where
    $arrow(nabla) f = upright(bold(0))$).
  - Find the global maximum and global minimum values for $f (x , y)$ on
    the region $R$.
/ 2.: Consider the surface $S$ consisting of points in $upright(bold(R))^3$ of
  the form $(x , y , 2 \/ sqrt(x y))$, with $x , y > 0$. Find the point on
  the surface whose distance from $(0 , 0 , 0)$ is minimized, by consider
  the function given by the square of the distance. Given that the surface
  is unbounded, why does the minimum exist?
/ 3.: Consider the two curves
  $ C_1 : y = 1 \/ x , 0.1 lt.eq x lt.eq 100 ; C_2 : y = - 2 - x , - 102 lt.eq x lt.eq 98 . $
  We want to find the minimal distance between $C_1$ and $C_2$. By
  parametrizing both curves in terms of $x$, argue that finding the
  minimal distance is equivalent to finding the minimal value of the
  function $ f (x_1 , x_2) = (x_1 - x_2)^2 + (1 / x_1 + 2 + x_2)^2 $ on
  the rectangle $R = [0.1 , 100] times [- 102 , 98]$.

  Find the global minimum of $f (x , y)$ and determine the minimal
  distance between the two curves.
