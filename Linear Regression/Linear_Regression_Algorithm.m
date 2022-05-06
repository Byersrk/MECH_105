function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
% Ryan Byers
% Mech_105
% linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

% Check that x and y are equal in size
n = max(size(x));
ny = max(size(y));
if n ~= ny
    error('X and Y must be equal on size')
end

% Sort y array from smallest to biggest
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);

% Compute range of numbers to define outliers
Q1 = floor((n+1)/4);
Q3 = floor(((3*n)+3)/4);
IQR = sortedY(Q3)-sortedY(Q1);
minVal = sortedY(Q1) - 1.5*IQR;
maxVal = sortedY(Q3) + 1.5*IQR;

% Remove the outlying terms
keep = zeros(1,n); % array of zeros = in size to x
for i = 1:n
    if sortedY(i) >= minVal && sortedY(i) <= maxVal % if value is in the range
        keep(i) = 1;                                % then change value in keep array from 0 to 1
    end
end
% Create array of x any y w/o outliers
fX = sortedX(logical(keep)); 
fY = sortedY(logical(keep));
n = max(size(fX)); % create number of values w/o outliers

% Use normal equations to find equation of line of best fit
slope = ((n*sum(fX.*fY))-(sum(fX)*sum(fY))) / ((n*sum(fX.^2))-(sum(fX))^2);
intercept = (sum(fY)/n) - slope*(sum(fX)/n);

% Calculate both "sum of the squares" to find R^2
Sr = sum((fY - intercept - slope*fX).^2);
St = sum((fY-(sum(fY)/n)).^2);

Rsquared = (St-Sr)/St;
end
