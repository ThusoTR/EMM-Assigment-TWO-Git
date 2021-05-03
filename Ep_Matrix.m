%Author: Tshishonga Thuso

%This functioin computes and returns the Ep matrix_type

%INPUTS%
%a = guide 1 width value%
%p = max p value%

%OUTPUS%
%p by n Rpn matrix_type%

function Ep = Ep_Matrix(a, p)
  Ep = (zeros(1, p));  %Rpn matrix variable%
  
  for p_range = 1:p
 
    p_sin_input = (p_range*pi)/a;
    q_sin_input = pi/a;
    Ep(p_range) = evaluate_sub_matrix(a ,p_sin_input, q_sin_input);            
  endfor