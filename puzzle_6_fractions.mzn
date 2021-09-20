include "globals.mzn";

% 6 FRACTIONS

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
var 1..9: X13;
var 1..9: X14;
var 1..9: X15;
var 1..9: X16;
var 1..9: X17;
var 1..9: X18;

array[1..9] of var 1..9: Vars=[X1,X2,X3,X4,X5,X6,X7,X8,X9];
array[1..9] of var 1..9: Vars1=[X10,X11,X12,X13,X14,X15, X16, X17, X18];


var 1..81: D1;
var 1..81: D2;
var 1..81: D3;
var 1..81: D4;
var 1..81: D5;
var 1..81: D6;


% solve satisfy;
solve :: int_search(Vars ++ [D1,D2,D3] ++  Vars1 ++ [D4,D5,D6], first_fail, indomain_min, complete) satisfy;

constraint all_different(Vars);
constraint all_different(Vars1);
constraint  D1 = 10*X2+X3;
constraint  D2 = 10*X5+X6;
constraint  D3 = 10*X8+X9;
constraint  D4 = 10*X11+X12;
constraint  D5 = 10*X14+X15;
constraint  D6 = 10*X17+X18;
constraint  X1/D1 < 1;
constraint  X4/D2 < 1;
constraint  X7/D3 < 1;
constraint  X10/D4 < 1;
constraint  X13/D5 < 1;
constraint  X16/D6 < 1;


constraint  X1*D2*D3*D4 + X4*D1*D3*D4 + X7*D1*D2*D4 + X10*D1*D2*D3 + (X13*D1*D2*D3*D4)/D5 + (X16*D1*D2*D3*D4)/D6 = D1*D2*D3*D4;

% TO PARAPANW EINAI TO IDIO ME  X1*D2*D3*D4*D5*D6 + X4*D1*D3*D4*D5*D6 + X7*D1*D2*D4*D5*D6 + X10*D1*D2*D3*D5*D6 + X13*D1*D2*D3*D4*D6 + X16*D1*D2*D3*D4*D5 = D1*D2*D3*D4*D5*D6;
% ALLA OLA TA MELH DIA TOU D5*D6, AUTO DIOTI TO D1*D2*D3*D4*D5*D6, PROKALOUSE SFALMA STHN MNHMH LOGW TOU MEGE8OUS TOU, OPOTE TO ANTIKATESTHSA ME ISODYNAMH PRAKSI

output [
  "6 FRACTIONS \n" ++ 
  show(X1) ++ "/(" ++ show(X2) ++ show(X3) ++") + " ++
  show(X4) ++ "/(" ++ show(X5) ++ show(X6) ++") + " ++
  show(X7) ++ "/(" ++ show(X8) ++ show(X9) ++") + " ++
  show(X10) ++ "/(" ++ show(X11) ++ show(X12) ++") + " ++
  show(X13) ++ "/(" ++ show(X14) ++ show(X15) ++") + " ++
  show(X16) ++ "/(" ++ show(X17) ++ show(X18) ++") = 1 "
]
++
[ "\nSolution: X1=" ++  show(X1) ++ ", X2=" ++ show(X2) ++ ", X3=" ++ show(X3) ++ ", X4="++ show(X4) ++ ", X5=" ++ show(X5) ++ ", X6=" ++ show(X6) ++  ", X7=" ++ show(X7) 
    ++ ", X8=" ++ show(X8)  ++ ", X9=" ++ show(X9) ++  ", X10=" ++ show(X10) ++ ", X11=" ++ show(X11)  ++ ", X12=" ++ show(X12) ++ ", X13=" ++ show(X13) ++ ", X14=" ++ show(X14) ++ ", X15=" ++ show(X15)
    ++ ", X16=" ++ show(X16) ++ ", X17=" ++ show(X17) ++ ", X18=" ++ show(X18) ];

