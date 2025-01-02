#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Notes for 18.02 Recitation 15],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [28 October 2024],
)


#quote(attribution: [Jose Unpingco, in `doc/vim/quotes.txt`])[Vim is the greatest editor since the stone chisel.]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

= Example from LAMV 23

Suppose you want to integrate over the region in the top half of the figure below.
Then we can define a transition map $bf(T)$ so that $u = y/x$ ranges from $1/4$ to $4$
while $v = x y$ ranges from $16/25$ to $16/9$, giving the bottom half of the figure.
#figure(
  image("figures/chvar-trans.svg", width: 70%),
  caption: [We use a $(u,v)$ rectangle as a transition map to
  do cartography on the region $cal(R)$.],
) <fig-chvar-trans>

#memo(title: [Memorize: Change of variables])[
  Suppose you need to integrate $iint_(cal(R)) f(x,y) dif x dif y$
  and you have a transition map $bf(T)(u,v) : cal(S) -> cal(R)$.
  Then the transition map lets you change the integral as follows:
  $ iint_(cal(R)) f(x,y) dif x dif y = iint_(cal(S)) f(u,v) lr(|det J_(bf(T))|) dif u dif v $
  Alternatively, if it's easier to compute $J_(bf(T)^(-1))$, the following formula also works:
  $ iint_(cal(R)) f(x,y) dif x dif y = iint_(cal(S)) f(u,v)/lr(|det J_(bf(T)^(-1))|) dif u dif v $
]
Here $|det J_(bf(T))|$ is called the *area scaling factor*:
it's the absolute value of the determinant of the Jacobian matrix.
It's indeed true that $ det J_(bf(T)^(-1)) = 1 / det(J_(bf(T))) $
which means that if your transition map has a nicer inverse than the original,
you might prefer to use that instead.

= Recitation questions from official course

Today's guest instructor is Lichen.

/ 1.: Define the parallelogram coordinates $(u , v)$ by $x = u + v$ and
  $y = u - v$.
  + Sketch what the unit square with coordinates
    $(0 , 0) ; (1 , 0) ; (0 , 1) ; (1 , 1)$ in $(u , v)$ coordinates looks
    like on the $x y$-plane.
  + Evaluate $dif x dif y$ in terms of $dif u dif v$.
  + Define the region $P$ as the parallelogram with vertices at $(0 , 0)$,
    $(1 , 1)$, $(1 , - 1)$, and $(2 , 0)$ in $x y$-coordinates. Evaluate
    the double integrals
    $ I_1 = integral.double_P dif A quad I_2 = integral.double_P (x^2 - y^2) dif A $
    by performing the change of variables to parallelogram coordinates.
/ 2.: Evaluate the following integral using the given change of coordinates:
  $ integral.double_R x^2 y^4 dif A $ where $R$ is the region in the first quadrant bounded by
  $x y = 4$; $x y = 8$; $y = x$; and $y = 4 x$ using the transformation
  $x = 2 sqrt(u \/ v)$ and $y = 2 sqrt(u v)$.
/ 3.: Find the area of the region of points $(x , y)$ in the plane satisfying
  the inequalities $1 <= x y <= 3$, $2 <= x y^2 <= 10$, and
  $x >= 0$ using an appropriate change of variables.
