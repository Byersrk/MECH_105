# Simpsons 1/3 Rule

The Simpsons 1/3 Rule function is used to integrate experimental data using Simpson’s 1/3 rule. The function checks if there are an odd number of intervals, if there are, the trapezoidal rule is used for the last interval. The function checks for errors in the inputs check that the inputs are the same length, and checks that the x input is equally spaced. The function will also Warn the user (not an error, just a warning) if the trapezoidal rule has to be used on the last interval.

Inputs
* x = the vector of equally spaced independent variable
* y = the vector of function values with respect to x

Outputs:
*  I = the numerical integral calculated
