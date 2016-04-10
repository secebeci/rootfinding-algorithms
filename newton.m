function [ res, fres, c, iter, maxiter ] = newton( f, x0, x1, tol )
%
%
% Input:
%   f - input funtion
%   x0 - lower initial value
%   x1 - higher initial value
%   tol - tolerance (maximum error)
%   
%
% Output:
%   res - matrix of root coming from each interation
%   fres - function ouput of root found in each iteration
%   c - function of result output
%   iter - iteration matrix containing iteration number
%   maxiter - total number of iteration
% Author:	Serhat Emre CEBECI
% Version:	1.0
% Date:     6/04/2015
%
% PS: This function uses MATLABFUNCTION which is function of Symbolic Math Toolbox 
% to convert sym funtion equation to mathematical equation
% 

i =1; 
iter(i) = i;
format long e
syms x
df = matlabFunction(diff(f(x)));

fx0 = f(x0);                   
fx1 = f(x1);                   
if abs(fx1) < abs(fx0),         %% c is the current best approx to a root.
  c = x1;  fc = fx1;
else
  c = x0;  fc = fx0;
end;




if abs(fc) <= tol             %% check to see if initial guess satisfies
  return;                       %% convergence criterion.                      
end


% input check 
    if nargin == 3
        tol = 1e-6;
        
    elseif nargin ~= 4
       error('newton: invalid input parameters');
    end

    
    
    x(1) = x0 - (f(x0)/df(x0));
    fres(i) = double(f(x(1)));
    res(i) = double(x(1));
    
    ex(1) = abs(x(1)-x0);
    k = 2;
    while (ex(k-1) >= tol) 
        x(k) = x(k-1) - (f(x(k-1))/df(x(k-1)));
        ex(k) = abs(x(k)-x(k-1));
        
        i = i + 1;
        fres(i) = double(f(x(k)));
        res(i) = double(x(k));
        iter(i) = i;
        k = k+1;
    end
    
c = double(x(k-1));
maxiter = i;
end