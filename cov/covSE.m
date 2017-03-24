function Kxx = covSE(hypCov, x1, x2)
% covSE: Calculates the squared exponential covariance matrix
%
% Inputs: - hypCov - the hyper paramters for the covariance function, l and
%           sigma, hypCov = ln([l, sigma])
%         - x1 - n1, D-dimensional points in an n1 * D matrix
%         - x2 - n2, D-dimensional points in an n2 * D matrix
%
% Output: - Kxx - the SE covariance matrix with dimensions n1 * n2

% Organise the hyper parameters
l = exp(hypCov(1));
sigma = exp(hypCov(2));

% Get dimensions
n1 = size(x1);
n2 = size(x2);

% Initialise covariance matrix
Kxx = zeros(n1(1), n2(1));

% Calculate the elements of Kxx
for i = 1:n1(1)
    for j = 1:n2(1)
        Kxx(i,j) = elementSE(x1(i,:), x2(j,:), l, sigma);
    end
end
end
