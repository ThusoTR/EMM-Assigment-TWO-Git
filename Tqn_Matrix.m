%Author: Tshishonga Thuso

%This functioin computes and returns the Tqn matrix%

%INPUTS% 
%a = guide 1 width value%
%c = guide 2 width value%
%q = max q value%
%n = max n value%
%f_GHZ = frequency in GHZ%

%OUTPUS%
%q by n Tqn matrix_type%

function Tqn = Tqn_Matrix(a, c, q, n, f_GHZ)
  %Tqn matrix definition%
  Tqn = zeros(n);
  %retrieve intrinsic impedance for each gudie 1 mode%
  Z_a_n = Compute_Zn(f_GHZ, a, n);
  
  for p_range = 1:1:q
    for n_range = 1:1:n
      p_sin_input = (p_range*pi)/a;
      
      q_sin_input = (n_range*pi)/c;
      
      Tqn(p_range, n_range) = evaluate_sub_matrix(c ,p_sin_input, q_sin_input);          
    endfor
  endfor
  
  for i = 1:n
    for j = 1:n
      if(isreal(Z_a_n(i)))
      Tqn(i, j) = Tqn(i, j)*(-1/Z_a_n(i));
      else
      Tqn(i, j) = 0;
      endif
    endfor
  endfor
endfunction