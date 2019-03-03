clc ;
clear all ;
close all ;

M = 37 ; 

% 1 in banda de trecere, 5 in banda de stopare
w = [ 1 5 ] ;

omegaP = 0.22 ;
omegaS = 0.45 ;
omega = [ 0 omegaP omegaS 1 ] ;

A = [ 1 1 0 0 ] ;

% in sens CMMP
hf = firls( M, omega, A, w ) ;

% in sens norma infinit
hr = remez( M, omega, A, w ) ;

figure
freqz( hf ) ;
hold on 
freqz( hr ) ;
title( 'Graficele in frecventa a celor doua filtre + fct. de ponderare' ) ;

figure
stem( hf, 'm' ) ;
hold on 
stem( hr, 'y' ) ;
title( 'Graficele celor doua filtre + fct. de ponderare' ) ;
legend('FIR firls', 'FIR remez' ) ;

% in graficele filtrelor cu fct. de ponderare varfurile graficului scad
% treptat in adancime + avem mai multe varfuri decat in graficul filtrelor
% fara w
% ( in stem varful functiei fara ponderare este in jurul lui omega = 13 si
% varful functiei cu ponderare este in apropierea lui omega = 20 ) 
% eroarea din banda de stopare trebuie sa fie mai mica decat cea din banda
% de trecere

% CMMP 
[ Hf, omega ] = freqz( hf ) ;
a = find( omega / pi >= omegaS, 1, 'first' ) ;
f1 = abs( Hf( a + 1 : length( Hf ) ) ) ;
a = find( omega / pi >= omegaP, 1, 'first' ) ;
f2 = abs( Hf( 1 : a - 1 ) ) ;

stopareFIRLS = std( f1 ) 
trecereFIRLS = std( f2 ) 

% Infinit
[ Hr, omega ] = freqz( hr ) ;
a = find( omega / pi >= omegaS, 1, 'first' ) ;
f3 = abs( Hr( a + 1 : length( Hr ) ) ) ;
a = find( omega / pi >= omegaP, 1, 'first' ) ;
f4 = abs( Hr( 1 : a - 1 ) ) ;

stopareREMEZ = std( f3 ) 
trecereREMEZ = std( f4 ) 

