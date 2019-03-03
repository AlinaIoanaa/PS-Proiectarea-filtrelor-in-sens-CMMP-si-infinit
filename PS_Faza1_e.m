clc ;
close all ;
clear all ;

M = 15 ;

omegaP = 0.30 ;
omegaS = 0.50 ;
omega1 = [ 0 omegaP omegaS 1 ] ;

%----------------------------- Partea I ----------------------------------%

% FTS
A1 = [ 0 0 1 1 ] ;

% in sens CMMP
hfs = firls( M, omega1, A1 ) ;

% in sens norma infinit
hrs = remez( M, omega1, A1 ) ;

figure
freqz( hfs ) ;
hold on 
freqz( hrs ) ;
title( 'FTS - Metoda I' ) ;

figure
stem( hfs, 'm' ) ;
hold on 
stem( hrs, 'y' ) ;
title( 'FTS - Metoda I' ) ;
legend('FIR firls', 'FIR remez' ) ;

% FTB
omega2 = [ 0 0.25 0.30 0.40 0.50 1 ] ;
A2 = [ 0 0 1 1 0 0 ] ;

% in sens CMMP
hfb = firls( M, omega2, A2 ) ;

% in sens norma infinit
hrb = remez( M, omega2, A2 ) ;

figure
freqz( hfb ) ;
hold on 
freqz( hrb ) ;
title( 'FTB - Metoda I' ) ;

figure
stem( hfb, 'm' ) ;
hold on 
stem( hrb, 'y' ) ;
title( 'FTB - Metoda I' ) ;
legend('FIR firls', 'FIR remez' ) ;

%---------------------------- Partea II ----------------------------------%

A3 = [ 1 1 0 0 ] ;

% in sens CMMP
hf = firls( M, omega1, A3 ) ;

% in sens norma infinit
hr = remez( M, omega1, A3 ) ;

figure
Hsr = 1 - abs( freqz( hr ) ) ;

plot( Hsr ) ;
hold on

Hsf = 1 - abs( freqz( hf ) ) ;
plot( Hsf ) ;
title( 'FTS - Metoda II' ) ;
hold off
legend( 'remez', 'firls' ) ;

%stem
figure
stem( Hsr ) ;
hold on
stem( Hsf ) ;
title( 'FTS - Metoda II' ) ;
legend( 'remez', 'firls' ) ;

% FTB
[ Hbr, omegaa ] = freqz( hr ) ;
[ Hbf, omegab ] = freqz( hf ) ;

omega = [ 0 0.25 0.40 1 ] ;

hrnou = remez( M, omega, A3 ) ;
hfnou = firls( M, omega, A3 ) ;

[ Hbrnou, omegac ] = freqz( hrnou ) ;
[ Hbfnou, omegad ] = freqz( hfnou ) ;

Hbandafirls = abs( Hbf ) - abs( Hbfnou ) ;
Hbandaremez = abs( Hbr ) - abs( Hbrnou ) ;


figure
plot( Hbandafirls ) ;
hold on
plot( Hbandaremez ) ;
hold off
title( 'FTB - Metoda II' ) ;
legend( 'firls', 'remez' ) ;

figure
stem( Hbandafirls ) ;
hold on
stem( Hbandaremez ) ;
hold off
title( 'FTB - Metoda II' ) ;
legend( 'firls', 'remez' ) ;