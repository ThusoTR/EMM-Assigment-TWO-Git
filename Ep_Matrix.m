%Author: Tshishonga Thuso

%This functioin computes and returns the Ep matrix_type

%INPUTS%
%a = guide 1 width value (max limit of integration)%
%p = max p value%

%OUTPUS%
%Rp matrix_type%

function Ep = Ep_Matrix(a, p)
  %Ep matrix variable%
  Ep = (zeros(p, 1));  
  min_limit_of_integration  = 0;
  theta = 0;
  alpha = 0;
  
  for p_range = 1:p
 
    p_sin_input = (p_range*pi)/a;
    q_sin_input = pi/a;
    Ep(p_range) = evaluate_sub_matrix(a, min_limit_of_integration, p_sin_input, q_sin_input, theta, alpha);            
  endfor
 endfunction