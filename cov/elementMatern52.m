function Kij = elementMatern52(x1, x2, l, sigma)
% elementMatern52: Calculates the value of an element in Matern covariance 
%                  matrix (v = 5/2)
%
% Inputs: - x1 - a 1 * D dimensional  vector
%         - x2 - a 1 * D dimensional vector
%         - l - a hyper parameter
%         - sigma - a hyper parameter
%
% Output: - Kij - an element in the Matern covariance matrix

% Calculate Euclidian distance between x1 and x2 and its square
d2 = (x1 - x2) * (x1 - x2)';
d = sqrt(d2);

% Calculate the elements of Kxx
Kij = sigma^2 * (1 + ((sqrt(5)*d) / l) + ((5 * d2) / (3 * l^2))) * ...
        exp(-(sqrt(5)*d) / l); 

end