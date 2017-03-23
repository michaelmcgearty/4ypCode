function Kij = elementSE(x1, x2, l, sigma)
% elementSE: Calculates the value of an element in SE covariance matrix
%
% Inputs: - x1 - a 1 * D dimensional  vector
%         - x2 - a 1 * D dimensional vector
%         - l - a hyper parameter
%         - sigma - a hyper parameter
%
% Output: - Kij - an element in the SE covariance matrix

% Calculate square of Euclidian distance between x1 and x2
d2 = (x1 - x2) * (x1 - x2)';

% Calculate the element in RQ covariance matrix
Kij = sigma^2 * exp(-d2 / (2 * l^2));

end
