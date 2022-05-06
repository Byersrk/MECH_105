function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix

if det(A)==0                    %Cannot perform LU decoposition if determinate of matrix is 0
    error('Invalid Matrix'); 
end
[n, n1] = size(A); 
P = eye(n); %creates pivot matrix
L = P
U = A;
for j = 1:n
    [pivot m] = max(abs(U(j:n, j))); %gives row # with greatest first value
    m = m+j-1;
    if m ~= j
        U([m,j],:) =  U([j,m], :);   % changes rows m and j in U
        P([m,j],:) =  P([j,m], :);   % changes rows m and j in P
        if j >= 2;    
            L([m,j],1:j-1) =  L([j,m], 1:j-1);   % changes rows m and j in columns 1:j-1 of L
        end;
    end
    for i = j+1:n
        L(i, j) = U(i, j) / U(j, j);
        U(i, :) =  U(i, :) - L(i, j)*U(j, :);
    end
end
