function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

[m, X] = size(x);
[m, Y] = size(y);
if X ~= Y
    error ('Inputs Must be equal size')
end

x_min = min(x);
x_max = max(x);
xn = max(size(x));
if xn <2
    error('Two data points required')
end
if range(x(2:xn)-x(1:xn-1)) ~= 0
    error ('Input x must be equally spaced')
end

even = 2:2:xn-1;
odd = 3:2:xn-1;
sum_even = sum(y(even));
sum_odd = sum(y(odd));
if xn == 2
    I = ((y(xn)+y(xn-1))/2)*(x_max-x_min);
    warning('Trapizoidal rule used')
elseif xn == 3
    I = ((x(xn)-x(1))/6) * (y(1)+(4*y(2))+y(3));
elseif xn > 3
    if mod(xn-1,2) == 1  %odd use simpson 1/3 first then trap.
        I = ((x(xn)-x(1)) * (y(1)+(4*sum_even)+(2*sum_odd)+y(xn-1))/(3*(xn-1))) + (((y(xn)+y(xn-1))/2)*(x(xn)-x(xn-1)));
        warning('Trapizoidal rule used between last data points')
    else
        I = (x(xn)-x(1)) * ((y(1)+(4*sum_even)+(2*sum_odd)+y(xn))/(3*(xn)));
    end

    
end
end
