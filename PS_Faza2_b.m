clc ;
close all ;
clear all ;

M1 = 14 ;
M2 = 30 ;
M3 = 45 ;
M4 = 50 ;
M5 = 75 ;
M6 = 90 ;
M7 = 100 ;

omegaP = 0.30 ;
omegaS = 0.50 ;
omega = [ 0 omegaP omegaS 1 ] ;

A1 = [ 0 0 1 1 ] ;


[ h1, pr1 ] = firls_FTJ_nou( M1, omegaP, omegaS, M1 / 2 ) ;
[ h2, pr2 ] = firls_FTJ_nou( M2, omegaP, omegaS, M2 / 2 ) ;
[ h3, pr3 ] = firls_FTJ_nou( M3, omegaP, omegaS, M3 / 2 ) ;
[ h4, pr4 ] = firls_FTJ_nou( M4, omegaP, omegaS, M4 / 2 ) ;
[ h5, pr5 ] = firls_FTJ_nou( M5, omegaP, omegaS, M5 / 2 ) ;
[ h6, pr6 ] = firls_FTJ_nou( M6, omegaP, omegaS, M6 / 2 ) ;
[ h7, pr7 ] = firls_FTJ_nou( M7, omegaP, omegaS, M7 / 2 ) ;

figure
freqz( h1 ) ;
title( 'M = 14' ) ;
text( 0.0457, 0.1, sprintf( 'pr = %f', pr1 ) ) ;
figure
freqz( h2 ) ;
title( 'M = 30' ) ;
text( 0.0002, 0.1, sprintf( 'pr = %f', pr2 ) ) ;
figure
freqz( h3 ) ;
title( 'M = 45' ) ;
text( 0.00007, 0.1, sprintf( 'pr = %f', pr3 ) ) ;
figure
freqz( h4 ) ;
title( 'M = 50' ) ;
text( 0, 0.1, sprintf( 'pr = %f', pr4 ) ) ;
figure
freqz( h5 ) ;
title( 'M = 75' ) ;
text( 139.3821, 0.1, sprintf( 'pr = %f', pr5 ) ) ;
figure
freqz( h6 ) ;
title( 'M = 90' ) ;
text( 3.2013, 0.1, sprintf( 'pr = %f', pr6 ) ) ;
figure
freqz( h7 ) ;
title( 'M = 100' ) ;
text( 4.2387, 0.1, sprintf( 'pr = %f', pr7 ) ) ;

figure
stem( h1 ) ;
hold on
stem( h2 ) ;
hold on 
stem( h3 ) ;
hold on
stem( h4 ) ;
hold on
stem( h5 ) ;
hold on
stem( h6 ) ;
hold on
stem( h7 ) ;
hold off
title( 'Secvente pondere' ) ;
legend( 'M = 14', 'M = 30', 'M = 45', 'M = 50', 'M = 75', 'M = 90', 'M = 100' ) ;

pr1 
pr2 
pr3
pr4
pr5
pr6
pr7

% observam ca valorile performantei relative scad invers proportional cu
% valorile lui M 
% incepand cu M = 50 diferenta dintre perfomante nu mai sunt considerabile,
% variind intre 2 si 1( spre deosebire de 10 <= M < 50, unde valorile pr se
% incadreaza intre 7 si 2 )