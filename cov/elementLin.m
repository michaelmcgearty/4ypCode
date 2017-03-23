function Kij = elementLin(x1, x2, c, sigma)
% elementLin: Calculates the value of an element in linear covariance matrix
%
% Inputs: - x1 - a 1 * D dimensional  vector
%         - x2 - a 1 * D dimensional vector
%         - c - a hyper parameter
%         - sigma - a hyper parameter
%
% Output: - Kij - an element in the linear covariance matrix

cVec = c * ones(size(x1));

% Calculate the element in RQ covariance matrix
Kij = sigma^2 * (x1 - cVec) * (x2 - cVec)';

end
