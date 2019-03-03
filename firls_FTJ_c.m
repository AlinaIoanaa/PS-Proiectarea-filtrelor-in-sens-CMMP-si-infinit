%
%	File FIRLS_FTJ_C.M
%
%	Function: FIRLS_FTJ_C (former OPT2C_TJ function)
%
%	Synopsis: h = firls_FTJ_c(M,wp,ws,K) ; 
%
%	Designs a low-pass FIR filter of length M+1, namely h, by solving  
%	the optimization problem based on Euclidean norm. The optimization 
%	method is of Least Squares type, just like in case of MATLAB 
%	function FIRLS. By difference from FIRLS, here, the ideal filter 
%	can have a complex valued frequency response in the passing band.
%	Moreover, the problem is solved by considering continuous variation 
%	of frequency. (The resulted integrals were derived in closed form. 
%	See the theory on this matter.)
%
%	Inputs: M  = the filter order (positive integer); 
%	        wp = the relative pass band upper limit (a number between 0 and 1); 
%	        ws = the relative stop band lower limit (a number between 0 and 1, 
%                    at least equal to wp); 
%	        K  = the group delay of ideal filter (non negative integer, 
%	             null by default). 
%
%	Missing, empty or inconsistent inputs return empty or wrong output. 
%
%	Uses:	 WAR_ERR 
%
%	Authors: Bogdan DUMITRESCU & Dan STEFANOIU
%	Created: March    15, 2010 
%	Revised: November 22, 2018
%	         December 10, 2018
%

function h = firls_FTJ_c(M,wp,ws,K)

%
% BEGIN
%
% Constants & Messages 
% ~~~~~~~~~~~~~~~~~~~~
	FN = '<FIRLS_FTJ_C>: ' ;
	E1 = [FN 'Missing, empty or inconsistent input data => empty output. Exit.'] ; 
%
% Faults preventing
% ~~~~~~~~~~~~~~~~~
	h = [] ; 
	if (nargin < 3)
	   war_err(E1) ;
	   return ; ; 
	end ; 
	M = round(abs(M(1))) ; 
	if ~M
	   war_err(E1) ;
	   return ; ; 
	end ; 
	wp = abs(wp(1)) ; 
	if ~wp || wp>=1
	   war_err(E1) ;
	   return ; ; 
	end ; 
	ws = abs(ws(1)) ; 
	if ~ws || ws>=1
	   war_err(E1) ;
	   return ; ; 
	end ; 
	if wp>ws
	   FN = wp ; 
	   wp = ws ; 
	   ws = FN ; 
	end ; 
	if (nargin < 4)
	   K = 0 ;
	end ; 
	K = round(abs(K(1))) ; 
%
% Filter design
% ~~~~~~~~~~~~~
	M = (0:M)';		% This is the filter support.
	R = wp*sinc(M*wp) - ws*sinc(M*ws) + eye(size(M));
	R = toeplitz(R);	% This is the matrix to invert.
	r = wp*sinc((K-M)*wp);	% This is the free vector.
	h = R\r;
%
% END
%
