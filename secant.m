function [res, fres, c, iter, maxiter] = secant(f,x0,x1,tol)
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

format long e

% input check 
    if nargin == 3
        tol = 1e-6;
        
    elseif nargin ~= 4
       error('newton: invalid input parameters');
    end

c = (x0*f(x1) - x1*f(x0))/(f(x1) - f(x0));


i = 1;
iter(i) = i;
fres(i) = f(c);
res(i) = c;

while abs(f(c)) > tol

    x0 = x1;
    x1 = c;
    c = (x0*f(x1) - x1*f(x0))/(f(x1) - f(x0));

  
    i = i + 1;
    fres(i) = f(c);
    res(i) = c;
    iter(i) = i;
end

maxiter = i;


