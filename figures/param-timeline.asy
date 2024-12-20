size(12cm);
usepackage("amsmath");
usepackage("amssymb");

draw((-8,0)--(-2,0), purple, EndArrow, Margins);
dot("$t_{\text{start}}$", (-8,0), dir(90), brown);
dot("$t_{\text{stop}}$", (-2,0), dir(90), brown);
dot("$t$", (-6,0), dir(-90), lightblue);

label(minipage("\centering Timeline in $t$ \\ (an interval in $\mathbb{R}$)", 5cm), (-5,-4));
label(minipage("\centering Trajectory traced out \\ (curve in $\mathbb{R}^n$)", 5cm), (8,-4));

draw((-1,0)--(4,0), darkblue+1.5, EndArrow(6));
label("$\mathbf{r}$", (1.5,0), dir(90), darkblue);

draw((6,-1)..(7,2)..(8,3)..(10,-0.3), purple, EndArrow, Margins);
dot("$\mathbf{r}(t_{\text{start}})$", (6,-1), dir(-90), brown);
dot("$\mathbf{r}(t_{\text{stop}})$", (10,-0.3), dir(-90), brown);
dot("$\mathbf{r}(t)$", (7,2), dir(0), lightblue);
