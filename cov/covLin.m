function Kxx = covLin(hypCov, x1, x2)
% covLin: Calculates the covariance matrix for a linear covariance function
%
% Inputs: - hypCov - the hyper paramters for the covariance function, c and
%           sigma, hypCov = ln([c, sigma]), c is an vector length D, sigma 
%           is a scalar
%         - x1 - n1, D-dimensional points in an n1 * D matrix
%         - x2 - n2, D-dimensional points in an n2 * D matrix
%
% Output: - Kxx - the linear covariance matrix with dimensions n1 * n2

% Organise the hyper parameters
dim = size(x1);
c = exp(hypCov(1:dim(2)));
sigma = exp(hypCov(end));

% Get dimensions
n1 = size(x1);
n2 = size(x2);

% Initialise covariance matrix
Kxx = zeros(n1(1), n2(1));

% Calculate the elements of Kxx
for i = 1:n1(1)
    for j = 1:n2(1)
        Kxx(i,j) = elementLin(x1(i,:), x2(j,:), c, sigma);
    end
end
end
