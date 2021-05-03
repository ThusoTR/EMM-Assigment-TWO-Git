%Author: Tshishonga Thuso

%This functioin computes and returns the Spn matrix_type

%INPUTS%
%a = guide 1 width value%
%c = guide 2 width value%
%p = max p value%
%n = max n value%

%OUTPUS%
%p by n Spn matrix_type%

function Spn = Spn_Matrix(a, c, p, n)
  Spn = (zeros(n));  %Rpn matrix variable%
  
  for p_range = 1:1:p
    for n_range = 1:1:n
      p_sin_input = (p_range*pi)/a;
      
      q_sin_input = (n_range*pi)/c;
      
      Spn(p_range, n_range) = evaluate_sub_matrix(c ,p_sin_input, q_sin_input);          
    endfor
  endfor