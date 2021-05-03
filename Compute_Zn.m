%Author: Tshishonga Thuso

%This functioin computes and returns the intrinsic impedance of a rectangulare waveguide%

%INPUTS%
%a = guide 1 width value%
%p = max p value%

%OUTPUS%
%p by n Rpn matrix_type%

function Zn = Compute_Zn(frequency_GHZ, guide_width, n)
  
  k_0 = (2*pi*frequency_GHZ*10^9)*sqrt((4*pi*10^-7)*(8.854*10^-12))
  
  b_n = zeros(1, 1:n);
  Zn = zeros(1, 1:n);
  
  
  for i = 1:n
    b_n(i) = sqrt (k_0^2 - ((i*pi)/guide_width)^2);
  endfor
  
  for j = 1:n
    Zn(j) = (k_0*377)/b_n(j);
  endfor
  
  