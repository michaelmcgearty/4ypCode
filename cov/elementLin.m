function Kij = elementLin(x1, x2, c, sigma)
% elementLin: Calculates the value of an element in linear covariance matrix
%
% Inputs: - x1 - a 1 * D dimensional  vector
%         - x2 - a 1 * D dimensional vector
%         - c - a hyper parameter, vector length D
%         - sigma - a hyper parameter, scalar
%
% Output: - Kij - an element in the linear covariance matrix

% Ensure c is the correct size and orientation
cDim = size(c);
xDim = size(x1);
if cDim ~= xDim
    c = c';
    cDim = size(c);
    if cDim ~=xDim
        error('c must have the same dimensions as x')
    end
end

% Calculate the element in RQ covariance matrix
Kij = sigma^2 * ((x1 - c) * (x2 - c)');

end
