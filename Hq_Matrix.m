%Author: Tshishonga Thuso

%This functioin computes and returns the Hq matrix_type

%INPUTS%
%c = guide 2 width value%
%q = max q value%
%n = max n value%
%f_GHZ = frequency in GHZ%

%OUTPUS%
%Hq matrix_type%

function Hq = Hq_Matrix(a, q, n, f_GHZ)
  %Hq matrix variable%
  Hq = (zeros(1, q));  
  
  Z_a_1 = Compute_Zn(f_GHZ, a, n);
  
  for p_range = 1:q
 
    p_sin_input = (p_range*pi)/a;
    q_sin_input = pi/a;
    Hq(p_range) = evaluate_sub_matrix(a ,p_sin_input, q_sin_input);            
  endfor
  
  %Multiply each Hq value with a corresponding intrinsic impedance value%
  
  for i = 1:n
    Hq(i) = Hq(i)*(-1/Z_a_1(1));
  endfor
 endfunction