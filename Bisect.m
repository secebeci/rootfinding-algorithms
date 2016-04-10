function [res,fres, c, iter, maxiter] = Bisect( f, x0, x1, tol)
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

i=1;
iter(i) = i;
if f(x0)*f(x1)>0
    disp('Wrong choice of a and b')
else
    c = (x0 + x1)/2;
    err = abs(f(c));

fres(i) = f(c);
res(i) = c;
    while err > tol  % the error limit
        if f(x0)*f(c)==0
            c;
            break
            
        elseif f(x0)*f(c)<0
            x1 = c;
          
            
        elseif f(x0)*f(c) > 0
            x0 = c;
          
        end 
        
        c = (x0 + x1)/2;
        err = abs(f(c));
        i = i + 1;
        fres(i) = f(c);
        res(i) = c;
        iter(i) = i ;
    end
    maxiter = i;
end
end