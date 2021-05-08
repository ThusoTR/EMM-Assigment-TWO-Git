%Author: Tshishonga Thuso

%This functioin computes and returns the Hq matrix_type

%INPUTS%
%c = guide 2 width value%
%q = max q value%
%n = max n value%
%f_GHZ = frequency in GHZ%
%a_upper = max integral limit%
%a_lower = min integral limit%

%OUTPUS%
%Hq matrix_type%

function Hq = Hq_Matrix(a, c, q, n, f_GHZ, a_upper, a_lower)
  %Hq matrix variable%
  Hq = (zeros(q, 1));  
  
  Z_a_1 = Compute_Zn(f_GHZ, a, 1);
  
  %theta and alpha%
  theta = 0;
  alpha = 0;
  
  for p_range = 1:q
 
    p_sin_input = (p_range*pi)/a;
    q_sin_input = pi/a;
    Hq(p_range) = evaluate_sub_matrix(a_upper, a_lower, p_sin_input, q_sin_input, theta, alpha);            
  endfor
  
  %Multiply each Hq value with a corresponding intrinsic impedance value%
  
  for i = 1:n
##    if(isreal(Z_a_1(i)))
      Hq(i) = Hq(i)*(-1/Z_a_1(1));
##    else
##      Hq(i) = 0;
##    endif
  endfor
 endfunction