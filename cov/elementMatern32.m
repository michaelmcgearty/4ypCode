function Kij = elementMatern32(x1, x2, l, sigma)
% elementMatern32: Calculates the value of an element in Matern covariance 
%                  matrix (v = 3/2)
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
Kij = sigma^2 * (1 + ((sqrt(3)*d) / l)) * exp(-(sqrt(3)*d) / l);

end
