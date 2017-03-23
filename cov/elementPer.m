function Kij = elementPer(x1, x2, l, rho, sigma)
% elementPer: Calculates the value of an element in periodic covariance 
% matrix
%
% Inputs: - x1 - a 1 * D dimensional  vector
%         - x2 - a 1 * D dimensional vector
%         - l - a hyper parameter
%         - rho - a hyper parameter
%         - sigma - a hyper parameter
%
% Output: - Kij - an element in the periodic covariance matrix

% Calculate the Euclidian distance between x1 and x2
d = sqrt((x1 - x2) * (x1 - x2)');

% Calculate the element in the periodic covariance matrix
Kij = sigma^2 * exp(-2 * (sin(pi * d / rho) / l)^2);

end
