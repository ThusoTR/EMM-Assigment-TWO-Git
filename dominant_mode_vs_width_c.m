function dominant_mode_vs_width_c()
  %a (width of guide 1) and c (width of guide 2) variables% 
  a = 22.86*10^-3;
  c_range = 5:1:22;
  
  n = 1;
  p = 1;
  q = 1;
  %Frequency of analysis%
  f_range = 10;
  
  %A1 and B1 variables%
  A1 = zeros(length(c_range), 1);
  B1 = zeros(length(c_range), 1);
  
  %Retrieve Rpn, Spn, Ep, Tqn, Uqn, and Hq sub-matrices%
  Rpn_Matrix_value = Rpn_Matrix(a, p, n);
    
  Ep_Matrix_value = Ep_Matrix(a, p);
  
  for i = 1:1:length(c_range)
    
    c = c_range(i)*10^-3;
    %Limits of integration on guide 2%
    x1 = (a - c)/2;
    a_upper = c + x1; 
    a_lower = x1;
      
    %theta and alpha%
    theta = 0;
    alpha = x1;
    
    Spn_Matrix_value = Spn_Matrix(a, c, p, n, theta, alpha);
    Tqn_Matrix_value = Tqn_Matrix(a, c, q, n, f_range, a_upper, a_lower);
    Uqn_Matrix_value = Uqn_Matrix(c, q, n, f_range, a_upper, a_lower, theta, alpha);
    
    Hq_Matrix_value = Hq_Matrix(a, c, q, n, f_range, a_upper, a_lower);
    
    %matrix of Rpn, Spn, Tqn, and Uqn sub-matrices%
    matrix_Rpn_Spn_Tqn_Uqn_values = [Rpn_Matrix_value, Spn_Matrix_value; Tqn_Matrix_value, Uqn_Matrix_value];
    
    %matrix of Ep and Hq sub-matrices%
    Ep_and_Hq_matrix_values = [Ep_Matrix_value; Hq_Matrix_value];
    
    A1_B1_result_values = inverse(matrix_Rpn_Spn_Tqn_Uqn_values)*Ep_and_Hq_matrix_values;
    
    if(isreal(A1_B1_result_values(1)))
      A1(i) = A1_B1_result_values(1);
    else 
      A1(i) = 1;
    endif
    
    B1(i) = A1_B1_result_values(2);
  endfor
  plot(c_range, 20*log10(A1));

##  plot(c_range, -20*log10(B1));
endfunction