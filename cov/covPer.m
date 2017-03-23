function Kxx = covPer(hypCov, x1, x2)
% covPer: Calculates the covariance matrix for a periodic covariance
% function
%
% Inputs: - hypCov - the hyper paramters for the covariance function, l,
%           rho and sigma, hypCov = [l, rho, sigma]
%         - x1 - n1, D-dimensional points in an n1 * D matrix
%         - x2 - n2, D-dimensional points in an n2 * D matrix
%
% Output: - Kxx - the periodic covariance matrix with dimensions n1 * n2

% Organise the hyper parameters
l = exp(hypCov(1));
rho = exp(hypCov(2));
sigma = exp(hypCov(3));

% Get dimensions
n1 = size(x1);
n2 = size(x2);

% Check x1 and x2 are sets of n 1-D vectors - use of this covariance
% function only makes sense for 1-D inputs
if n1(2) ~= 1 || n2(2) ~= 1
    error('Use of this covariance function only makes sense for 1-D inputs')
end

% Initialise covariance matrix
Kxx = zeros(n1(1), n2(1));

% Calculate the elements of Kxx
for i = 1:n1(1)
    for j = 1:n2(1)
        Kxx(i,j) = elementPer(x1(i,:), x2(j,:), l, rho, sigma);
    end
end
end