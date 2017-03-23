function Kij = elementSEard(x1, x2, l, sigma)
% elementSEard: Calculates the value of an element in SE covariance matrix
%               with automatic relevance detection 
%
% Inputs: - x1 - a 1 * D dimensional  vector
%         - x2 - a 1 * D dimensional vector
%         - l - a hyper parameter, vector of length D
%         - sigma - a hyper parameter, scalar
%
% Output: - Kij - an element in the SE covariance matrix

% Calculate the element in RQ covariance matrix
M = diag(l.^-2);
Kij = sigma^2 * exp(-0.5 * (x1-x2) * M * (x1-x2)');

end
