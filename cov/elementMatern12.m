function Kij = elementMatern12(x1, x2, l, sigma)
% elementMatern12: Calculates the value of an element in Matern covariance 
%                  matrix (v = 1/2)
%
% Inputs: - x1 - a 1 * D dimensional  vector
%         - x2 - a 1 * D dimensional vector
%         - l - a hyper parameter
%         - sigma - a hyper parameter
%
% Output: - Kij - an element in the Matern covariance matrix

% Calculate Euclidian distance between x1 and x2 
d = sqrt((x1 - x2) * (x1 - x2)');

% Calculate the elements of Kxx
Kij = sigma^2 * exp(-d / l);

end
