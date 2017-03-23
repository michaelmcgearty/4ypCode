function Kxx = covMatern52ard(hypCov, x1, x2)
% covMatern52ard: Calculates the Matern covariance matrix with automatic
%                 relevance detection (v = 5/2)
%
% Inputs: - hypCov - the hyper paramters for the covariance function, l
%           and sigma, hypCov = [l, sigma], l is a vector of length D,
%           sigma is a scalar
%         - x1 - n1, D-dimensional points in an n1 * D matrix
%         - x2 - n2, D-dimensional points in an n2 * D matrix
%
% Output: - Kxx - the Matern covariance matrix with dimensions n1 * n2

% Organise the hyper parameters
dim = size(x1);
l = exp(hypCov(1:dim(2)));
sigma = exp(hypCov(end));

% Get dimensions
n1 = size(x1);
n2 = size(x2);

% Initialise covariance matrix
Kxx = zeros(n1(1), n2(1));

% Calculate the elements of Kxx
for i = 1:n1(1)
    for j = 1:n2(1)
        Kxx(i,j) = elementMatern52ard(x1(i,:), x2(j,:), l, sigma);
    end
end
end