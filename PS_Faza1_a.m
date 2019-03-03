clc ;
clear all ;
close all ;

omegaP = 0.22 ;
omegaS = 0.45 ;

omega = [ 0 omegaP omegaS 1 ] ;
A = [ 1 1 0 0 ] ;

% FIR optime in sens CMMP
for M = 10 : 10 : 100
    h = firls( M, omega, A ) ;
    
    figure
    freqz( h )
    str = sprintf('M = %d - firls', M ) ;
    title( str )
    
    figure
    stem( h )
    title( str ) ;
end


% Observam ca numarul de varfuri(orientate in jos) creste direct proportional cu M
% Varfurile tind sa scada in adancime(la remez raman aproximativ egale)