#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Notes for 18.02 Recitation 4],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [16 September 2024],
)

#quote(attribution: [Koro-sensei in Assassination Classroom])[
  Broadly speaking, there are two reasons a person feels the desire to teach something:
  Either he wants to pass on his successes or he wants to pass on his failures.
]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

= The pop quiz from R03, continued

In what follows, $T : RR^2 -> RR^2$ is linear.
In R03 I asked you two questions to motivate matrices:

1. Given $T( vec(3,4) ) = vec(pi, 9)$ and $T( vec(100, 100) ) = vec(0, 12)$,
  what are $T( vec(103,104) )$ and $T( vec(203, 204) )$?

2. Given $T( vec(1,0) ) = vec(1, 3)$ and $T( vec(0,1) ) = vec(2, 4)$
  what is $T( vec(13, 37) )$?

Now, if I wanted to make your life hard I could have given you this instead of Q1:

3. Given $T( vec(3,4) ) = vec(pi, 9)$ and $T( vec(100, 100) ) = vec(0, 12)$,
  what is $T( vec(13,37) )$?

This is a lot harder than Q1; however, the question is still solvable.
If I locked you in a room for an hour and told you to work on it,
I think many of you would eventually get the answer:
$ vec(13, 37) = 24 vec(3, 4) - 0.59 vec(100, 100)
  ==> T( vec(13,37) ) = 24 vec(pi, 9) - 0.59 vec(0, 12) = vec(24 pi, 208.92). $

So this shows you something interesting:
actually, $vec(1,0)$ and $vec(0,1)$ is only special insomuch as it makes arithmetic easy.
But if you know the values of
$T( vec(3,4) )$ and $T( vec(100, 100) )$, you can _still_ find all the values of $T$ you want.
So really $vec(1,0)$ and $vec(0,1)$ aren't _that_ special.

Hence we say $vec(3,4)$ and $vec(100,100)$ are a *basis* of $RR^2$.
Every $bf(v)$ like $vec(13, 37)$ can be written as $c_1 vec(3,4) + c_2 vec(100,100)$
for some $c_1$ and $c_2$, and hence you can solve Q3
(Poonen 4.6 calls this "changing coordinates").

However, let's consider more variations of the question Q3.

4. Given $T( vec(3,4) ) = vec(pi, 9)$, what is $T( vec(13,37) )$?

5. Given $T( vec(3,4) ) = vec(pi, 9)$, $T( vec(100, 100) ) = vec(0, 12)$,
  and $T( vec(103, 104) ) = vec(pi, 21)$
  what is $T( vec(13,37) )$?

6. Given $T( vec(3,4) ) = vec(pi, 9)$ and $T( vec(300, 400) ) = vec(100 pi, 900)$,
  what is $T( vec(13,37) )$?


The variants Q4, Q5, Q6 are all strange in some way and don't make good quiz questions.

- Q4 is obviously impossible; _not enough information_ to find an answer.
- Q5 is solvable, but has _redundant information_. You can delete any one hypothesis.
  // This might be confusing for students unless you're a truly sadistic teacher (like me).
- Q6 suffers from both defects.
  Even though there are two givens, they are redundant.

Now the punch line is that these concepts correspond to the new words you learned in class.
Each of the words "linearly independent" (abberviated lin. indp.)
and "spanning" is one of the _good_ properties a basis has.
Q3 has both ("basis" = "lin. indp." + "spanning"), and Q4-Q6 are each missing something.

- Q3 is a good quiz question because $vec(3,4)$ and $vec(100,100)$ are a *basis*.
- Q4 is impossible because $vec(3,4)$ is *NOT spanning* (though it is lin. indp.);
- Q5 is redundant because the vectors $vec(3,4)$, $vec(100,100)$, $vec(103,104)$
  are *NOT lin. indp.* (though spanning);
- Q6 is the worst one as the two vectors $vec(3,4)$ and $vec(300, 400)$
  are *NEITHER lin. indp. NOR spanning*.

= Dimension

For dimension, you can often trust your hunches, and they'll be right.
For example, you might have the feeling that any good quiz question for $T : RR^2 -> RR^2$
needs to end up having $2$ given equations. You'd be right.
More examples of correct hunches:

- In $RR^n$, at least $n+1$ vectors are never linearly independent.
- In $RR^n$, at most $n-1$ vectors are never spanning.
- Also, if you have exactly $n$ vectors in $RR^n$, and they're linearly independent, then they're a basis.
- Also, if you have exactly $n$ vectors in $RR^n$, and they're spanning, then they're a basis.
  - Most usefully, they're spanning if and only if the $n times n$ matrix
    whose columns are the vectors has *nonzero determinant*.
    (Reason: for $n=3$, not being spanning in $RR^3$ means the parallelepiped
    has volume zero --- the trick from PSet 1. Same idea for $n > 3$ with hypervolumes.)

The last bullet matters: the determinant is doing a _lot_ of work for you.
When $n = 2$ the determinant is unnecessary, because you can just use "slope":
it's obvious that $vec(1,2)$ and $vec(100,200)$ have a dependence.
But for $n >= 3$ *you can't eyeball it*:
e.g., $bf(v)_1 = vec(1,3,4)$, $bf(v)_2 = vec(10,1,11)$ and $bf(v)_3 = vec(-9,10,1)$
might look like unrelated small numbers,
but surprisingly it turns out that $ 109 bf(v)_1 - 37 bf(v)_2 - 29 bf(v)_3 =0. $
Without "slope", you cannot notice these dependences by sight for $n >= 3$, so use the determinant.

= Recitation questions

To be added...
