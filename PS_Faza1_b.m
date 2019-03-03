clc ;
clear all ;
close all ;

omegaP = 0.22 ;
omegaS = 0.45 ;


omega = [ 0 omegaP omegaS 1 ] ;
A = [ 1 1 0 0 ] ;


% FIR optime in sens norma infinit

for M = 10 : 10 : 100
    h = remez( M, omega, A ) ;
    
    figure
    freqz( h )
    str = sprintf('M = %d - remez', M ) ;
	title( str )
end

figure

for M = 10 : 10 : 100
    h = remez( M, omega, A ) ;

    stem( h )
    hold on
end

hold off
title( 'Remez' ) ;

for M = 10 : 10 : 100
    h = firpm( M, omega, A ) ;
    
    figure
    freqz( h )
    str = sprintf('M = %d - firpm', M ) ;
	title( str )
    
end

figure 

for M = 10 : 10 : 100
    h = firpm( M, omega, A ) ;

    stem( h )
    hold on
end

hold off
title( 'Firpm' ) ; 

% Observam ca numarul de oscilatii creste direct proportional cu M

