clc ;
close all ;
clear all ;

% FTS

M1 = 10 ;
M2 = 50 ;
M3 = 100 ;

omegaP = 0.30 ;
omegaS = 0.50 ;
omega = [ 0 omegaP omegaS 1 ] ;

A1 = [ 0 0 1 1 ] ;


[ h1, pr1 ] = firls_FTS_c( M1, omegaP, omegaS, M1 / 2 ) ;
[ h2, pr2 ] = firls_FTS_c( M2, omegaP, omegaS, M2 / 2 ) ;
[ h3, pr3 ] = firls_FTS_c( M3, omegaP, omegaS, M3 / 2 ) ;

figure
freqz( h1 ) ;
title( 'M = 14' ) ;
figure
freqz( h2 ) ;
title( 'M = 50' ) ;
figure
freqz( h3 ) ;
title( 'M = 100' ) ;

figure
stem( h1 ) ;
hold on
stem( h2 ) ;
hold on 
stem( h3 ) ;
hold off
title( 'Secvente pondere' ) ;
legend( 'M = 14', 'M = 50', 'M = 100' ) ;

pr1 
pr2 
pr3