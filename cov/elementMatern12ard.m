function Kij = elementMatern12ard(x1, x2, l, sigma)
% elementMatern12ard: Calculates the value of an element in Matern covariance 
%                     matrix with automatic relevance detemination (v = 1/2)
%
% Inputs: - x1 - a 1 * D dimensional  vector
%         - x2 - a 1 * D dimensional vector
%         - l - a hyper parameter, vector length D
%         - sigma - a hyper parameter, scalar
%
% Output: - Kij - an element in the Matern covariance matrix

% Calculate d/l
M = diag(l.^-2); 
dOverL = sqrt((x1 - x2) * M * (x1 - x2)');

% Calculate the elements of Kxx
Kij = sigma^2 * exp(-dOverL);

end