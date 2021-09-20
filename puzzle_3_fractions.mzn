include "globals.mzn";


% 3 FRACTIONS

var 1..9: A;
var 1..9: B;
var 1..9: C;
var 1..9: D;
var 1..9: E;
var 1..9: F;
var 1..9: G;
var 1..9: H;
var 1..9: I;
array[1..9] of var 1..9: Vars=[A,B,C,D,E,F,G,H,I];

var 1..81: D1;
var 1..81: D2;
var 1..81: D3;



% solve satisfy;
solve :: int_search(Vars ++ [D1,D2,D3], first_fail, indomain_min, complete) satisfy;


constraint all_different(Vars);
constraint   D1 = 10*B+C;
constraint   D2 = 10*E+F;
constraint   D3 = 10*H+I;
constraint   A/D1 < 1;
constraint   D/D2 < 1;
constraint   G/D3 < 1;
constraint   A*D2*D3 + D*D1*D3 + G*D1*D2 = D1*D2*D3;


output [
  "3 FRACTIONS \n" ++ 
  show(A) ++ "/(" ++ show(B) ++ show(C) ++") + " ++
  show(D) ++ "/(" ++ show(E) ++ show(F) ++") + " ++
  show(G) ++ "/(" ++ show(H) ++ show(I) ++") = 1 "

]
++
[ "\nSolution: A=" ++  show(A) ++ ", B=" ++ show(B) ++ ", C=" ++ show(C) ++ ", D="++ show(D) ++ ", E=" ++ show(E) ++ ", F=" ++ show(F) ++  ", G=" ++ show(G) ++ ", H=" ++ show(H)  ++ ", I=" ++ show(I) ];

 
