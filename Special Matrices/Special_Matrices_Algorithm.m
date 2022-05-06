function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
A = zeros(n,m);

if nargin ~= 2
    error('2 Inputs')
end

for r = 1:n
    for c=1:m
        if r == 1         %If row is 1
            A(r,c)=c;     %Then point value = c vaule
        elseif c == 1     %The same is done for coloums
            A(r,c)=r;
        else %Add the value above and the value to the left
            A(r,c)=A(r,c-1)+A(r-1,c);
        end
    end
end
end
