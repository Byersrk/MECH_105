function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method

%Check inputs
if nargin < 3
    error ('3 inputs required')
end
if nargin < 4 || isempty(es) || es <= 0
    es = 0.0001;
end
if nargin < 5 || isempty(maxit)
    maxit = 200; 
end
fxl = func(xl);
fxu = func(xu);
if func(xl)*func(xu) > 0
    error ('No Sign Change over boundry')
end
ea = 100;
iter = 0;
xr = xl;

while ea >= es && iter < maxit
    iter = 1 + iter;
    xold = xr;
    fxl = func(xl);
    fxu = func(xu);
    xr = xu - ((fxu)*(xl-xu))/(fxl-fxu);
    fx = func(xr);
    ea = abs((xr-xold)/xr)*100;
     if fx == 0
        root = xr;
        ea = 0;
    elseif fxl*fx > 0 %No sign change
        xl = xr;
    elseif fxl*fx < 0 %Sign Change
        xu = xr;
    end
end
root = xr;
fx = func(xr);
iter = iter;
ea = ea;
end
