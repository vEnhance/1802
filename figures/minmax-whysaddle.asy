size(11cm);

void draw_plus(pair P, int dE, int dW, int dN, int dS, string rarity) {
  real eps = 0.35;
  dot(P);
  if (dE != 0) {
    pen p = (dE > 0) ? blue : red;
    string s = (dE > 0) ? "$+$" : "$-$";
    draw(P--(P+(eps,0)), p, EndArrow, Margins);
    label(s, P+(eps,0), dir(90), p);
  }
  if (dW != 0) {
    pen p = (dW > 0) ? blue : red;
    string s = (dW > 0) ? "$+$" : "$-$";
    draw(P--(P-(eps,0)), p, EndArrow, Margins);
    label(s, P-(eps,0), dir(90), p);
  }
  if (dN != 0) {
    pen p = (dN > 0) ? blue : red;
    string s = (dN > 0) ? "$+$" : "$-$";
    draw(P--(P+(0,eps)), p, EndArrow, Margins);
    label(s, P+(0,eps), 0.2*dir(90), p);
  }
  if (dS != 0) {
    pen p = (dS > 0) ? blue : red;
    string s = (dS > 0) ? "$+$" : "$-$";
    draw(P--(P-(0,eps)), p, EndArrow, Margins);
    label(s, P-(0,eps), 0.2*dir(-90), p);
  }
  label(rarity, P+(eps,0), 2*dir(-90), purple+fontsize(9pt));
}

// 18.01 half
label("\textbf{18.01}", (0.5, 0.9), dir(180));
draw_plus((1,0.9), 1, 1, 0, 0, "$50\%$");
draw_plus((2,0.9), -1, -1, 0, 0, "$50\%$");
label("\textit{N/A}", (3, 0.9));
label("\textit{N/A}", (4, 0.9));
draw_plus((5,1.0), -1, 1, 0, 0, "");
draw_plus((5,0.8), 1, -1, 0, 0, "");

// 18.02 half
label("\textbf{18.02}", (0.5, 0), dir(180));
draw_plus((1,0), 1, 1, 1, 1, "$25\%$");
draw_plus((2,0), -1, -1, -1, -1, "$25\%$");
draw_plus((3,0), 1, 1, -1, -1, "$25\%$");
draw_plus((4,0), -1, -1, 1, 1, "$25\%$");
label(minipage("\textit{Weird \\ saddles}", 1.2cm), (5, 0));

label("\underline{Loc min}", (1, 1.2), dir(90));
label("\underline{Loc max}", (2, 1.2), dir(90));
label("\underline{Saddle}", (3, 1.2), dir(90));
label("\underline{Saddle}", (4, 1.2), dir(90));
label("\underline{$\approx 0\%$}", (5, 1.2), dir(90));
