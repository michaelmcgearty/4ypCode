function Kxx = covSum(type, hypCov, x1, x2)
% covSum: Calculates the covariance matrix for the sum of two
% covariance functions
%
% Inputs: - type - a structure containing the types of covariance functions
%           being combined
%         - hypCov - the hyper paramters for the covariance functions
%         - x1 - n1, D-dimensional points in an n1 * D matrix
%         - x2 - n2, D-dimensional points in an n2 * D matrix
%
% Output: - Kxx - the linear covariance matrix with dimensions n1 * n2

% Organise the hyper parameters
dim = size(x1);
[hyp1, hyp2] = hypSort(type, hypCov, dim);

% Construct the covariance matrix
K1 = covWrap(type(2).Cov, hyp1, x1, x2);
K2 = covWrap(type(3).Cov, hyp2, x1, x2);
Kxx = K1 + K2;

end
