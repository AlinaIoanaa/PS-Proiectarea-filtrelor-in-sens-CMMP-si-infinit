clc ;
clear all ;
close all ;

omegaP = 0.22 ;
omegaS = 0.45 ;

M = 25 ;

omega = [ 0 omegaP omegaS 1 ] ;
A = [ 1 1 0 0 ] ;

% FIR optim in sens CMMP
hf = firls( M, omega, A ) ;

% FIR optim in sens norma infinit
hr = remez( M, omega, A ) ;

figure
freqz( hf ) ;
hold on 
freqz( hr ) ;
title( 'Graficele in frecventa a celor doua filtre cu M fixat' ) ;

figure
stem( hf, 'm' ) ;
hold on 
stem( hr, 'y' ) ;
title( 'Graficele celor doua filtre cu M fixat' ) ;
legend('FIR firls', 'FIR remez' ) ;

% pentru aflarea atenuarii minime avem nevoie de maximul spectrului benzii
% de stopare

% CMMP
[ Hf, omega1 ] = freqz( hf ) ;
a = find( omega1 / pi >= omegaS, 1, 'first' ) ;
f1 = abs( Hf( a : length( Hf ) ) ) ;
CMMP = 20 * log( max( f1 ) ) 

% Infinit
[ Hr, omega2 ] = freqz( hr ) ;
b = find( omega2 / pi >= omegaS, 1, 'first' ) ;
f2 = abs( Hr( b : length( Hr ) ) ) ;
Inf = 20 * log( max( f2 ) )