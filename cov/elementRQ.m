function Kij = elementRQ(x1, x2, alpha, l, sigma)
% elementRQ: Calculates the value of an element in RQ covariance matrix
%
% Inputs: - x1 - a 1 * D dimensional  vector
%         - x2 - a 1 * D dimensional vector
%         - alpha - a hyper parameter
%         - l - a hyper parameter
%         - sigma - a hyper parameter
%
% Output: - Kij - an element in the RQ covariance matrix

% Calculate square of Euclidian distance between x1 and x2
d2 = (x1 - x2) * (x1 - x2)';

% Calculate the element in RQ covariance matrix
Kij = sigma^2 * (1 + (d2 / (2 * alpha * l^2)))^(-alpha);

end