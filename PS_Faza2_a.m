clc ;
close all ;
clear all ;

M = 20 ;

omegaP = 0.30 ;
omegaS = 0.50 ;
omega = [ 0 omegaP omegaS 1 ] ;

A1 = [ 0 0 1 1 ] ;

K1 = 5 ;
K2 = 6 ;
K3 = 10 ;
K4 = 12 ;
K5 = 15 ;

h1 = firls_FTJ_c( M, omegaP, omegaS, K1 ) ;
h2 = firls_FTJ_c( M, omegaP, omegaS, K2 ) ;
h3 = firls_FTJ_c( M, omegaP, omegaS, K3 ) ;
h4 = firls_FTJ_c( M, omegaP, omegaS, K4 ) ;
h5 = firls_FTJ_c( M, omegaP, omegaS, K5 ) ;

figure
freqz( h1 ) ;
title( 'K = 5' ) ;
figure
freqz( h2 ) ;
title( 'K = 6' ) ;
figure
freqz( h3 ) ;
title( 'K = 10( M / 2 - faza liniara )' ) ;
figure
freqz( h4 ) ;
title( 'K = 12' ) ;
figure
freqz( h5 ) ;
title( 'K = 15' ) ;

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
hold off
title( 'Secvente pondere' ) ;
legend( 'K = 5', 'K = 6', 'K = 10', 'K = 12', 'K = 15' ) ;

figure
grpdelay( h1 ) ; 
hold on
grpdelay( h2 ) ;
hold on
grpdelay( h3 ) ;
hold on
grpdelay( h4 ) ;
hold on
grpdelay( h5 ) ;
hold off
title( 'Deviatia de la liniaritate' ) ;
legend( 'K = 5', 'K = 6', 'K = 10', 'K = 12', 'K = 15' ) ;