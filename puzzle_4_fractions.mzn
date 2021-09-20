include "globals.mzn";

% 4 FRACTIONS

var 1..9: X1;
var 1..9: X2;
var 1..9: X3;
var 1..9: X4;
var 1..9: X5;
var 1..9: X6;
var 1..9: X7;
var 1..9: X8;
var 1..9: X9;
var 1..9: X10;
var 1..9: X11;
var 1..9: X12;
array[1..9] of var 1..9: Vars=[X1,X2,X3,X4,X5,X6,X7,X8,X9];


array[1..3] of var 1..9: Vars1=[X10,X11,X12];


var 1..81: D1;
var 1..81: D2;
var 1..81: D3;
var 1..81: D4;


% solve satisfy;
solve :: int_search(Vars ++ [D1,D2,D3] ++ Vars1 ++ [D4], first_fail, indomain_min, complete) satisfy;


constraint all_different(Vars);
constraint all_different(Vars1);
constraint   D1 = 10*X2+X3;
constraint   D2 = 10*X5+X6;
constraint   D3 = 10*X8+X9;
constraint   D4 = 10*X11+X12;
constraint   X1/D1 < 1;
constraint   X4/D2 < 1;
constraint   X7/D3 < 1;
constraint   X10/D4 < 1;

constraint   X1*D2*D3*D4 + X4*D1*D3*D4 + X7*D1*D2*D4 + X10*D1*D2*D3 = D1*D2*D3*D4;

output [
  "4 FRACTIONS \n" ++ 
  show(X1) ++ "/(" ++ show(X2) ++ show(X3) ++") + " ++
  show(X4) ++ "/(" ++ show(X5) ++ show(X6) ++") + " ++
  show(X7) ++ "/(" ++ show(X8) ++ show(X9) ++") + " ++
  show(X10) ++ "/(" ++ show(X11) ++ show(X12) ++") = 1 "

]
++
[ "\nSolution: X1=" ++  show(X1) ++ ", X2=" ++ show(X2) ++ ", X3=" ++ show(X3) ++ ", X4="++ show(X4) ++ ", X5=" ++ show(X5) ++ ", X6=" ++ show(X6) ++  ", X7=" ++ show(X7) 
    ++ ", X8=" ++ show(X8)  ++ ", X9=" ++ show(X9) ++  ", X10=" ++ show(X10) ++ ", X11=" ++ show(X11)  ++ ", X12=" ++ show(X12)];
