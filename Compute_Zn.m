%Author: Tshishonga Thuso%

%This functioin computes and returns the intrinsic impedance of a rectangulare waveguide%

%INPUTS%
%frequency_GHZ = frequecny in GHZ%
%guide_width = width value of waveguide in mm%
%n = number %

%OUTPUS%
%p by n Rpn matrix_type%

function Zn = Compute_Zn(frequency_GHZ, guide_width, n)
  %Wavenumber%
  wave_number_k_0 = (2*pi*frequency_GHZ*10^9)*sqrt((4*pi*10^-7)*(8.854*10^-12));
  
  %Propagation constant variable definition%
  prop_const_b_n = zeros(1, 1:n);
  
  %Impedance variable definition%
  Zn = zeros(1, 1:n);
  
  %Propagation constant at each n waveguide mode%
  for i = 1:n
    prop_const_b_n(i) = sqrt (wave_number_k_0^2 - ((i*pi)/guide_width)^2);
  endfor
  
  %Impedance at each n waveguide mode%
  for j = 1:n
    Zn(j) = (wave_number_k_0*377)/prop_const_b_n(j);
  endfor
endfunction