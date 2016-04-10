function [res,fres, c, iter, maxiter] = ModFalsPos(f, x0, x1, tol)
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

acount = 0;

bcount = 0;
i = 1;
iter(i) = i;
if f(x0)*f(x1)>0
    disp('Wrong choice of a and b')
else
    c = ((abs(f(x1))*x0)+ (abs(f(x0))*x1))/(abs(f(x0))+abs(f(x1)));
    err = abs(f(c));

fres(i) = f(c);
res(i) = c;
    while err > tol  
        if f(x0)*f(c)==0
            c;
            break
            
        elseif f(x0)*f(c)<0
            x1 = c;
            bcount = 0;
        elseif f(x0)*f(c) > 0
            x0 = c;
            acount = 0;
        end
        c = ((abs(f(x1))*x0)+ (abs(f(x0))*x1))/(abs(f(x0))+abs(f(x1)));
        err = abs(f(c));
        vpa(err);
        
      
     
        if acount > 2
            x0 = (x1+x0)/2;
            acount = 0;
        end
        
        if bcount  >= 2
            x1 = (x1+x0)/2;
            bcount = 0;
        end
       acount = acount +1;
       bcount = bcount+1;
       
       i = i + 1;
       fres(i) = f(c);
       res(i) = c;
       iter(i) = i;
    end
    
maxiter = i;
end
end