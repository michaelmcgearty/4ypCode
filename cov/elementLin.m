function Kij = elementLin(x1, x2, c, sigma)
% elementLin: Calculates the value of an element in linear covariance matrix
%
% Inputs: - x1 - a 1 * D dimensional  vector
%         - x2 - a 1 * D dimensional vector
%         - c - a hyper parameter, vector length D
%         - sigma - a hyper parameter, scalar
%
% Output: - Kij - an element in the linear covariance matrix

% Ensure c is correctly oriented
cDim = size(c);
if cDim(1) > cDim(2)
    c = c';
end

% Calculate the element in RQ covariance matrix
Kij = sigma^2 * (x1 - c) * (x2 - c)';

end
