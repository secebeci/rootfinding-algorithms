clear all
close all
clc

format long e

% our function handle
f=@(x)(x^3 +2*x^2 + 10*x -20);

n = input(' which case will you use: ', 's');

switch n
    case 'a'
% initlized parameters for methods 
        low = 0 ;
        up = 2;
        abs_err = 10^(-6);
        p = 1;
        
    case 'b'
        low = 0 ;
        up = 2;
        abs_err = 10^(-8);
        p = 2;
    
    case 'c'
        low = 0 ;
        up = 2;
        abs_err = 10^(-10);
        p = 3;
      
    case 'd'
        low = 0 ;
        up = 10;
        abs_err = 10^(-6);
        p = 4;
        
    case 'e'
        low = 0 ;
        up = 10;
        abs_err = 10^(-8);
        p = 5;
        
    case 'f'
        low = 0 ;
        up = 10;
        abs_err = 10^(-10);
        p = 6;
        
end
        
        
% a-) Bisection Method
[rtmat_bis,funrtmat_bis, root_bis, itr_bis, mxiter_bis] = Bisect( f, low, up, abs_err);

tBis1= table(rtmat_bis', funrtmat_bis', itr_bis');
tBis1.Properties.VariableNames = { 'x' 'function_of_x' 'iteration_number' };


% b-) False Position Method
[rtmat_fals, funrtmat_fals, root_fals, itr_fals, mxiter_fals] = FalsPos( f, low, up, abs_err);

tFals1= table(rtmat_fals', funrtmat_fals', itr_fals');
tFals1.Properties.VariableNames = { 'x' 'function_of_x' 'iteration_number' };


% c-) Modified False Position Method
[rtmat_modfals, funrtmat_modfals, root_modfals, itr_modfals, mxiter_modfals] = ModFalsPos( f, low, up, abs_err);

tModFals1= table(rtmat_modfals', funrtmat_modfals', itr_modfals');
tModFals1.Properties.VariableNames = { 'x' 'function_of_x' 'iteration_number' };


% d-) Secant method
[rtmat_sec, funrtmat_sec, root_sec, itr_sec, mxiter_sec] = secant( f, low, up, abs_err); 

tSec1= table(rtmat_sec', funrtmat_sec', itr_sec');
tSec1.Properties.VariableNames = { 'x' 'function_of_x' 'iteration_number' };


% e-) Newton method
[rtmat_newt, funrtmat_newt, root_newt, itr_newt, mxiter_newt] = newton( f, low, up, abs_err);

tNewt1= table(rtmat_newt', funrtmat_newt', itr_newt');
tNewt1.Properties.VariableNames = { 'x' 'function_of_x' 'iteration_number' };


save 'table.mat' tSec1 tFals1 tModFals1 tSec1 tNewt1 

filename = 'ssssss_proj1.xlsx';
writetable( tBis1, filename, 'Sheet', p, 'Range', 'D1' );

writetable( tFals1, filename, 'Sheet', p, 'Range', 'J1' );

writetable( tModFals1, filename, 'Sheet', p, 'Range', 'P1' );

writetable( tSec1, filename, 'Sheet', p, 'Range', 'V1' );

writetable( tNewt1, filename, 'Sheet', p, 'Range', 'AB1' );