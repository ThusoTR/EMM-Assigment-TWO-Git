%Author: Thuso Tshishonga

%Evaluatye sub-matrix integral 

%INPUTS%
%a_upper = max integral limit%
%a_lower = min integral limit%
%p_sin_input =  p value%
%q_sin_input = q value%
%theta%
%alpha%

%OUTPUTS%
%Evaluated integral result%

function integral_result = evaluate_sub_matrix(a_upper, a_lower, p_sin_input, q_sin_input, theta, alpha)

  if p_sin_input != q_sin_input
    integral_result_max_limit = (sin((p_sin_input - q_sin_input)*a_upper + theta - alpha))/(2*(p_sin_input - q_sin_input)) - (sin((p_sin_input + q_sin_input)*a_upper + theta + alpha))/(2*(p_sin_input + q_sin_input));       
    integral_result_min_limit = (sin((p_sin_input - q_sin_input)*a_lower))/(2*(p_sin_input - q_sin_input)) - (sin((p_sin_input + q_sin_input)*a_lower))/(2*(p_sin_input + q_sin_input));   
  else
    integral_result_max_limit = (a_upper/2)*cos(theta - alpha) - (sin(2*p_sin_input*a_upper + theta + alpha))/(4*p_sin_input);
    integral_result_min_limit = (a_lower/2)*cos(theta - alpha)  - (sin(2*p_sin_input*a_lower + theta + alpha))/(4*p_sin_input);
  endif
  
  integral_result = integral_result_max_limit - integral_result_min_limit; 
endfunction

%Delete later%
##function integral_result = evaluate_sub_matrix(a ,p_sin_input, q_sin_input)
##
##  if p_sin_input != q_sin_input
##    integral_result = (sin((p_sin_input - q_sin_input)*a))/(2*(p_sin_input - q_sin_input)) - (sin((p_sin_input + q_sin_input)*a))/(2*(p_sin_input + q_sin_input));       
##  else
##    integral_result = (a/2) - (sin(2*p_sin_input*a))/(4*p_sin_input);
##  endif 
##endfunction