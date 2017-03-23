function Kij = elementMatern52ard(x1, x2, l, sigma)
% elementMatern52ard: Calculates the value of an element in Matern covariance 
%                     matrix with automatic relevance detection (v = 5/2)
%
% Inputs: - x1 - a 1 * D dimensional  vector
%         - x2 - a 1 * D dimensional vector
%         - l - a hyper parameter, vector length D
%         - sigma - a hyper parameter, scalar
%
% Output: - Kij - an element in the Matern covariance matrix

% Calculate d/l and (d^2)/(l^2)
M = diag(l.^-2); 
d2OverL2 = (x1 - x2) * M * (x1 - x2)';
dOverL = sqrt(d2OverL2);

% Calculate the elements of Kxx
Kij = sigma^2 * (1 + (sqrt(5) * dOverL) + (5 * d2OverL2 / 3)) * ...
        exp(-sqrt(5) * dOverL); 

end