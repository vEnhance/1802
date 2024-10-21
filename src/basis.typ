#import "@local/evan:1.0.0":*

= Linear combinations of vectors

#todo[this whole chapter needs to be properly written]

#exer[
  What is the span of $vec(420, 321)$ and $vec(666, 5)$ in $RR^2$?
] <random2>
#solution[
  Because the two vectors are not multiples of each other, they are linearly independent.
  (Alternatively, calculate $det(mat(420, 666; 321, 5)) = 420 dot 5 - 321 dot 666 = -211686 != 0$.)

  Hence they are a basis of $RR^2$ and the span is all of $RR^2$.
]

#exer[
  What is the span of $vec(3,42,18)$, $vec(1, 53, 17)$, $vec(71,91,13)$ in $RR^3$?
] <random3>
#solution[
  As we mentioned above (@big-coeff), you shouldn't eyeball three or more dimensions;
  if you get three vectors in $RR^3$ and want to know if they are linearly independent or not,
  you should always take the determinant.
  The audience picked some very large numbers for me so I got a chance to show
  off my amazing mental arithmetic skills, but the point is that
  $ det(mat(3,1,71; 42,53,91; 18,17,13)) = "ugly arithmetic" = -18522 != 0. $
  So the three vectors are linearly independent, and hence a basis of $RR^3$.
  So the span is all of $RR^3$.
]

== Dimension

For dimension, you can often trust your hunches, and they'll be right.
For example, you might have the feeling that any good quiz question for $T : RR^2 -> RR^2$
needs to end up having $2$ given equations. You'd be right.
More examples of correct hunches (this is the _buy two get one free_ in Poonen 4.7):

- In $RR^n$, at least $n+1$ vectors are never linearly independent.
- In $RR^n$, at most $n-1$ vectors are never spanning. (So a basis is always $n$ vectors exactly.)
- Also, if you have exactly $n$ vectors in $RR^n$, and they're linearly independent, then they're a basis.
- Also, if you have exactly $n$ vectors in $RR^n$, and they're spanning, then they're a basis.
  - Most usefully, they're spanning if and only if the $n times n$ matrix
    whose columns are the vectors has *nonzero determinant*.
    (Reason: for $n=3$, not being spanning in $RR^3$ means the parallelepiped
    has volume zero --- the trick from PSet 1. Same idea for $n > 3$ with hypervolumes.)

The last bullet matters: the determinant is doing a _lot_ of work for you.
When $n = 2$ the determinant is unnecessary, because you can just use "slope":
it's obvious that $vec(1,2)$ and $vec(100,200)$ have a dependence.
But for $n >= 3$ *you can't eyeball it*#footnote[Though
  if you have a set of _exactly two_ vectors,
  they're dependent if and only if they're multiples, even in $RR^n$.
  Which you _can_ eyeball;
  so if you're trying to tell whether a span of two vectors in $RR^3$ is a line or plane,
  that's easy.
  (Even more stupidly, a single vector is linearly dependent only when it's the zero vector.)]:
e.g., $bf(v)_1 = vec(1,3,4)$, $bf(v)_2 = vec(10,1,11)$ and $bf(v)_3 = vec(-9,10,1)$
might look like unrelated small numbers,
but surprisingly it turns out that
#eqn[
  $ 109 bf(v)_1 - 37 bf(v)_2 - 29 bf(v)_3 =0. $
  <big-coeff>
]
Without "slope", you cannot notice these dependences by sight for $n >= 3$, so use the determinant.


== [RECIPE] Describing spans of explicit vectors


#recipe(title: [Recipe for describing the span of vectors in $RR^2$])[
- *0-D case*: Are all the vectors the zero vector $vec(0,0)$? If so the span is just a single *point*.
- *1-D case*: Are all the vectors pointing the same direction (i.e. multiples of each other)?
  If so, and there is at least one nonzero vector,
  the span is a *line* in the common direction of the vectors.
- *2-D case*: Are there two (nonzero) vectors not pointing in the same direction
  (equivalently, are linearly independent)? If so, the span is *all of $RR^2$*.
]

- Example: the span of the vectors $vec(3,6)$, $vec(10,20)$, $vec(100,200)$, $vec(5000, 10000)$
  consists of the multiples of $vec(1,2)$.
- Example: The span of $vec(420, 321)$ and $vec(666, 5)$ is all of $RR^2$.
  This was @random2 earlier.

=== Flowchart for $RR^3$

#recipe(title: [Recipe for describing the span of vectors in $RR^3$])[
  - *0-D case:* Are all the vectors the zero vector $vec(0,0,0)$? If so the span is just a single *point*.
  - *1-D case*: Are all the vectors pointing the same direction (i.e. multiples of each other)?
    If so, and there is at least one nonzero vector,
    the span is a *line* in the common direction of the vectors.
  - *2-D case*: Is there more than one direction present,
    but you can't find three vectors which are linearly independent?
    If so, the span is a *plane*.
  - *3-D case*: Are there three vectors among them which are linearly independent from each other?
    If so, the span is *all of $RR^3$*.
]
- Example: the span of the vectors $vec(3,6,9)$, $vec(10,20,30)$ and $vec(100,200,300)$
  consists of the multiples of $vec(1,2,3)$.
- Example: Following @big-coeff, the span of the
  $vec(1,3,4)$, $vec(10,1,11)$ and $vec(-9,10,1)$ is a plane.
  This follows by process of elimination: we know $d = 0$ and $d = 1$ don't apply here
  (none of these vectors are zero or are multiples of each other)
  and we can rule out $d = 3$ because we can calculate the determinant
  $ det(mat(1,10,-9;3,1,10;4,11,1)) = 0 $
  to see that our three vectors are _not_ linearly independent.
  (Again, I want to emphasize that actually finding an explicit dependence ---
  that is, extracting @big-coeff --- is annoying.
  You should take the determinant instead,
  since you only care _whether or not_ there is a dependence,
  not what the coefficients actually are.)
- Example: The span of $vec(3,42,18)$, $vec(1, 53, 17)$, $vec(71,91,13)$ in $RR^3$.
  This was @random3 earlier.

== Systems of equations

== [RECIPE] Number of solutions to a square system of linear equations

== [EXER] Exercises

#exer[
  Take your birthday and write it in eight-digit $Y_1 Y_2 Y_3 Y_4$-$M_1 M_2$-$D_1 D_2$ format.
  Consider the two vectors
  $ bf(v)_1 = vec(M_1 M_2, D_1 D_2) " and " bf(v)_2 = vec(Y_1 Y_2, Y_3 Y_4). $
  For example, if your birthday was May 17, 1994
  you would take $bf(v)_1 = vec(5, 17)$ and $bf(v)_2 = vec(19, 94)$.

  - Determine the span of those two vectors in $RR^2$.
  - Find a current or former K-pop idol who gets a different answer from you
    when they use their birthday.
] <exer-basis-birthday>

#exer[
  In $RR^5$, consider the vector $bf(v) = angle.l 1,2,3,4,5 angle.r$.
  What's the maximum number of linearly independent vectors one can find
  which are all perpendicular to $bf(v)$?
]
