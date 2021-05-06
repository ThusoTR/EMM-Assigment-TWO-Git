%Author: Tshishonga Thuso

%This function computes the A1 and B1 coefficients (1 mode) and plots s11 and s21%

function A1_and_B1()
  %a (width of guide 1) and c (width of guide 2) variables% 
  a = 22.86*10^-3;
  b = 10.16*10^-3;
  c = 18*10^-3;
  
  n = 1;
  p = 1;
  q = 1;
  
  %Frequency range (GHz)%
  f_range = 8:0.1:12;
  
  %A1 and B1 variables%
  A1 = zeros(41, 1);
  B1 = zeros(41, 1);
  
  %Retrieve Rpn, Spn, Ep, Tqn, Uqn, and Hq sub-matrices%
  Rpn_Matrix = Rpn_Matrix(a, p, n);
    
  Spn_Matrix = Spn_Matrix(a, c, p, n);
    
  Ep_Matrix = Ep_Matrix(a, p);
  
  for i = 1:1:41
    f_range
    Tqn_Matrix = Tqn_Matrix(a, c, q, n, 8);
    
##    Uqn_Matrix = Uqn_Matrix(c, q, n, f_range(i));
##    
##    Hq_Matrix = Hq_Matrix(a, c, q, n, f_range(i));
##    
##    %matrix of Rpn, Spn, Tqn, and Uqn sub-matrices%
##    matrix_Rpn_Spn_Tqn_Uqn = [Rpn_Matrix, Spn_Matrix; Tqn_Matrix, Uqn_Matrix];
##    
##    %matrix of Ep and Hq sub-matrices%
##    Ep_and_Hq_matrix = [Ep_Matrix; Hq_Matrix];
##    
##    A1_B1_result = inverse(matrix_Rpn_Spn_Tqn_Uqn)*Ep_and_Hq_matrix;
##    
##    A1(i) = A1_B1_result(1);
##    B1(i) = A1_B1_result(2);
  endfor
endfunction