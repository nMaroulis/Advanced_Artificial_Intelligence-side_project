include "globals.mzn";


% 2 FRACTIONS 

var 1..9: A;
var 1..9: B;
var 1..9: C;
var 1..9: D;
var 1..9: E;
var 1..9: F;
array[1..6] of var 1..9: Vars=[A,B,C,D,E,F];

var 1..81: D1;
var 1..81: D2;


% solve satisfy;
solve :: int_search(Vars ++ [D1,D2], first_fail, indomain_min, complete) satisfy;

constraint all_different(Vars);
constraint D1 = 10*B+C;
constraint D2 = 10*E+F;
constraint A/ D1 < 1;
constraint D/D2 < 1;
constraint A*D2 + D*D1 = D1*D2;

% constraint A*D2 >= D*D1;

output [
  "2 FRACTIONS \n" ++ 
  show(A) ++ "/(" ++ show(B) ++ show(C) ++") + " ++
  show(D) ++ "/(" ++ show(E) ++ show(F) ++") = 1 "

]
++
[ "\nSolution: A=" ++  show(A) ++ ", B=" ++ show(B) ++ ", C=" ++ show(C) ++ ", D="++ show(D) ++ ", E=" ++ show(E) ++ ", F=" ++ show(F)];

 
