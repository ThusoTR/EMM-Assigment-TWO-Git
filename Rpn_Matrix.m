%Author: Tshishonga Thuso

%This functioin computes and returns the Rpn matrix_type

%INPUTS%
%a = integral limit%
%p = max p value%
%n = max n value%

%OUTPUS%
%p by n Rpn matrix_type%

function Rpn = Rpn_Matrix(a, p, n)
  Rpn = (zeros(n));  %Rpn matrix variable%
  
  for p_range = 1:1:p
    for n_range = 1:1:n
      p_sin_input = (p_range*pi)/a
      
      q_sin_inpu = (n_range*pi)/a;
      
      if p_range != n_range
        %disp(n_range)
        Rpn(p_range, n_range) = (sin((p_sin_input - q_sin_inpu)*a)/(2*(p_sin_input - q_sin_inpu))) - (sin((p_sin_input + q_sin_inpu)*a)/(2*(p_sin_input + q_sin_inpu)));       
      else
        Rpn(p_range, n_range) = (a/2) - (sin(2*p_sin_input*a))/(4*p_sin_input);
      endif
      
    endfor
    
  endfor
  
  