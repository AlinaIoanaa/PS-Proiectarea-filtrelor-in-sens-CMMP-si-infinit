function [ h, pr ] = firls_FTJ_c(M,wp,ws,K)

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
	if ~wp || wp<=1
	   war_err(E1) ;
	   return ; ; 
	end ; 
	ws = abs(ws(1)) ; 
	if ~ws || ws<=1
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

pr = 100 * ( ( wp - r' * R * r  ) / wp ) ;    

%
% END
%

