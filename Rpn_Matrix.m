%Author: Tshishonga Thuso

%This functioin computes and returns the Rpn matrix_type

%INPUTS%
%a = Guide 1 width value%
%p = Max p value%
%n = Max n value%

%OUTPUS%
%p by n Rpn matrix_type%

function Rpn = Rpn_Matrix(a, p, n)
  Rpn = (zeros(n));  %Rpn matrix variable%
  
  for p_range = 1:1:p
    for n_range = 1:1:n
      p_sin_input = (p_range*pi)/a;
      
      q_sin_input = (n_range*pi)/a;
      
      Rpn(p_range, n_range) = -evaluate_sub_matrix(a ,p_sin_input, q_sin_input);          
    endfor
    
  endfor
endfunction