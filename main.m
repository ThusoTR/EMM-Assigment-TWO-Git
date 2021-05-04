%Author: Tshishonga Thuso

%This is the main function for analysing the H-Plane junction%

%INPUTS%
%a = Guide 1 width in mm%
%c = Guide 2 width in mm%
%f_GHZ = Frequency in GHZ%
%p = Max p value%
%n = Max n value

%OUTPUTS%

function main(a, c, n, p, q, f_GHZ)
  %Retrieve Rpn, Spn, Ep, Tqn, Uqn, and Hq sub-matrices%
  Rpn_Matrix = Rpn_Matrix(a, p, n)
  
  Spn_Matrix = Spn_Matrix(a, c, p, n)
  
  Ep_Matrix = Ep_Matrix(a, p)
  
  Tqn_Matrix = Tqn_Matrix(a, c, q, n, f_GHZ)
  
  Uqn_Matrix = Uqn_Matrix(c, q, n, f_GHZ)
  
  Hq_Matrix = Hq_Matrix(a, q, n, f_GHZ)
endfunction  