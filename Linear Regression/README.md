# Linear Regression

The Linear Regression function creates a linear regression line of given data.

Inputs:
* x: x-values for our data set
* y: y-values for our data set

Outputs:
* fX: x-values with outliers removed
* fY: y-values with outliers removed
* slope: slope from the linear regression y=mx+b
* intercept: intercept from the linear regression y=mx+b
* Rsquared: R^2, a.k.a. coefficient of determination

Steps of the code:
* Check that x and y are equal in size.
* Sorts table values, from smallest to largest.
* Computes IQR.
* Removes outliers based on IQR.
* Uses normal equations to find a line of best fit
* Calculate R-squared value.
