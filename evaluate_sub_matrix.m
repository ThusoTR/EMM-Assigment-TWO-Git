%Author: Thuso Tshishonga

%Evaluatye sub-matrix integral 

%INPUTS%
%a = max integral limit%
%p_sin_input =  p value%
%q_sin_input = q value%

%OUTPUTS%
%Evaluated integral result%

function integral_result = evaluate_sub_matrix(a ,p_sin_input, q_sin_input)

  if p_sin_input != q_sin_input
    integral_result = (sin((p_sin_input - q_sin_input)*a))/(2*(p_sin_input - q_sin_input)) - (sin((p_sin_input + q_sin_input)*a))/(2*(p_sin_input + q_sin_input));       
  else
    integral_result = (a/2) - (sin(2*p_sin_input*a))/(4*p_sin_input);
  endif 
endfunction