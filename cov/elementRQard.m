function Kij = elementRQard(x1, x2, alpha, l, sigma)
% elementRQard: Calculates the value of an element in RQ covariance matrix
%               with automatic relevance determination
%
% Inputs: - x1 - a 1 * D dimensional  vector
%         - x2 - a 1 * D dimensional vector
%         - alpha - a hyper parameter, scalar
%         - l - a hyper parameter, vectorof length D
%         - sigma - a hyper parameter, scalar
%
% Output: - Kij - an element in the RQ covariance matrix

% Calculate the element in RQ covariance matrix
M = diag(l.^-2);
Kij = sigma^2 * (1 + (((x1-x2) * M * (x1-x2)') / (2 * alpha)))^(-alpha);

end
