%Author: Tshishonga Thuso

%This functioin computes and returns the Uqn matrix%

%INPUTS% 
%c = guide 2 width value%
%q = max q value%
%n = max n value%
%f_GHZ = frequency in GHZ%

%OUTPUS%
%q by n Uqn matrix_type%

function Uqn = Uqn_Matrix(c, q, n, f_GHZ)
  %Uqn matrix definition%
  Uqn = zeros(n);
  %retrieve intrinsic impedance for each gudie 1 mode%
  Z_c_n = Compute_Zn(f_GHZ, c, n)
  
  for p_range = 1:1:q
    for n_range = 1:1:n
      p_sin_input = (p_range*pi)/c;
      
      q_sin_input = (n_range*pi)/c;
      
      Uqn(p_range, n_range) = evaluate_sub_matrix(c ,p_sin_input, q_sin_input);          
    endfor
  endfor
  
  %Multiply each Uqn value with a corresponding intrinsic impedance value%
  
  for i = 1:n
    for j = 1:n
      #if(isreal(Z_c_n(i)))
        Uqn(i, j) = Uqn(i, j)*(-1/Z_c_n(i));
##      else
##        Uqn(i, j) = 0;
##      endif
    endfor
  endfor
endfunction