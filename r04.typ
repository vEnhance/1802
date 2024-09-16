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
But if you know the outputs of
$T( vec(3,4) )$ and $T( vec(100, 100) )$, you can _still_ find all the outputs of $T$ you want.
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

= Recitation questions from Prof Maulik

Today will discuss matrices and linear transformations.#footnote[
  Evan says: I actually think this is the easiest recitation set we've had so far,
  you can do everything by just being good at parroting directions.
  No conceptual understanding is needed to answer these questions.]

/ 1.: Consider the vectors $vec(1, - 1, 1) , vec(2, 1, 1) , vec(1, 5, - 1)$.
  Are the vectors linearly independent?
  What is the span of these vectors?
  Does this set of vectors form a basis?
/ 2.: Consider the vectors $bf(a) = vec(-2,1)$ and $bf(b) = vec(1,1)$.
   Verify that these vectors form a basis of $RR^2$.
  What are the coordinates of $3bf(e)_1-2bf(e)_2$ in this basis?
/ 3.: How many solutions do the following systems of equations have?
/ 3a.: $x + 2 y = 0 ; 2 x + 4 y = 0 .$
/ 3b.: $mat(3, - 1, 0; 1, 2, - 3; - 4, 0, 1) vec(x, y, z) = vec(1, 2, - 1)$
/ 4.: Do the vectors $angle.l 1 , 0 , - 1 angle.r , angle.l 2 , 0 , 0 angle.r , angle.l 0 , 1 , 1 angle.r$ form a basis?

= Post-recitation notes

Here's another addendum based on what I discussed during the recitation section.

== "Most" matrices are invertible

Your general intuition in linear algebra should be that if you pick numbers out of a hat
to populate the entries of a matrix, then the matrix is probably invertible,
any associated equation has only one solution, etc.

To demonstrate this in recitation, I asked the audience to generate the numbers
in the following two examples however they liked:

#exercise[
  What is the span of $vec(420, 321)$ and $vec(666, 5)$ in $RR^2$?
] <random2>
#soln[
  Because the two vectors are not multiples of each other, they are linearly independent.
  (Alternatively, calculate $det(mat(420, 666; 321, 5)) = 420 dot 5 - 321 dot 666 = -211686 != 0$.)

  Hence they are a basis of $RR^2$ and the span is all of $RR^2$.
]

#exercise[
  What is the span of $vec(3,42,18)$, $vec(1, 53, 17)$, $vec(71,91,13)$ in $RR^3$?
] <random3>
#soln[
  As we mentioned above (@big-coeff), you shouldn't eyeball three or more dimensions;
  if you get three vectors in $RR^3$ and want to know if they are linearly independent or not,
  you should always take the determinant.
  The audience picked some very large numbers for me so I got a chance to show
  off my amazing mental arithmetic skills, but the point is that
  $ det(mat(3,1,71; 42,53,91; 18,17,13)) = "ugly arithmetic" = -18522 != 0. $
  So the three vectors are linearly independent, and hence a basis of $RR^3$.
  So the span is all of $RR^3$.
]


Of course, during the homework and exams,
the instructor may cherry-pick numbers in order to test you on the determinant zero case.
So this is a heuristic about real life, not something to follow on the problem set.

== Determining the span

Here is a flowchart (okay actually a bulleted list but you get the idea)
summarizing the process of computing the span of a given set of vectors.
This flowchart does _not_ assume the number of vectors is the same as the dimension.

Remember, in $RR^n$, the span is always a $d$-dimensional subspace, for some $0 <= d <= n$.
I've accordingly labeled the bullets below with the dimensions, in increasing order.

For $n = 2$ and $n = 3$ the process is a pretty straightforward flowchart.
Once $n >= 4$, however, things are more annoying.
The reason $n = 3$ happens to be simple enough to be formatted as a flowchart
is that for general $n$, the cases $d = 0$, $d = 1$, $d = n$ are the easiest.
And when $n = 3$, that only leaves $d = 2$ which you can get by process of elimination.
But when $n >= 4$, it's harder to tell the difference between $d = 2$ to $d = n-1$.

Consequently, I do not think 18.02 will ask you for $n >= 4$ and $d > 1$.
(In fact, you haven't even been told how to take a $4 times 4$ determinant.)

=== Flowchart for $RR^2$

- *0-D case*: Are all the vectors the zero vector $vec(0,0)$? If so the span is just a single *point*.
- *1-D case*: Are all the vectors pointing the same direction (i.e. multiples of each other)?
  If so, and there is at least one nonzero vector,
  the span is a *line* in the common direction of the vectors.
  - Example: the span of the vectors $vec(3,6)$, $vec(10,20)$, $vec(100,200)$, $vec(5000, 10000)$
    consists of the multiples of $vec(1,2)$.
- *2-D case*: Are there two (nonzero) vectors not pointing in the same direction
  (equivalently, are linearly independent)? If so, the span is *all of $RR^2$*.
  - Example: The span of $vec(420, 321)$ and $vec(666, 5)$ is all of $RR^2$.
    This was @random2 earlier.

=== Flowchart for $RR^3$

- *0-D case:* Are all the vectors the zero vector $vec(0,0,0)$? If so the span is just a single *point*.
- *1-D case*: Are all the vectors pointing the same direction (i.e. multiples of each other)?
  If so, and there is at least one nonzero vector,
  the span is a *line* in the common direction of the vectors.
  - Example: the span of the vectors $vec(3,6,9)$, $vec(10,20,30)$ and $vec(100,200,300)$
    consists of the multiples of $vec(1,2,3)$.
- *2-D case*: Is there more than one direction present,
  but you can't find three vectors which are linearly independent?
  If so, the span is a *plane*.
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

- *3-D case*: Are there three vectors among them which are linearly independent from each other?
  If so, the span is *all of $RR^3$*.
  - Example: The span of $vec(3,42,18)$, $vec(1, 53, 17)$, $vec(71,91,13)$ in $RR^3$.
    This was @random3 earlier.
