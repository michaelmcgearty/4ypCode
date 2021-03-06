function Kxx = RQ(hypCov, x1, x2)
% RQ: Calculates the rational quadratic covariance matrix
%
% Inputs: - hypCov - the hyper paramters for the covariance function, alpha
%           and l, hypCov = ln([alpha, l, sigma])
%         - x1 - n1, D-dimensional points in an n1 * D matrix
%         - x2 - n2, D-dimensional points in an n2 * D matrix
%
% Output: - Kxx - the RQ covariance matrix with dimensions n1 * n2

% Organise the hyper parameters
alpha = exp(hypCov(1));
l = exp(hypCov(2));
sigma = exp(hypCov(3));

% Get dimensions
n1 = size(x1);
n2 = size(x2);

% Initialise covariance matrix
Kxx = zeros(n1(1), n2(1));

% Calculate the elements of Kxx
for i = 1:n1(1)
    for j = 1:n2(1)
        Kxx(i,j) = elementRQ(x1(i,:), x2(j,:), alpha, l, sigma);
    end
end
end
