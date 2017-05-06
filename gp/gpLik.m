function nLogLik = gpLik(type, theta, xd, yd)
% gpLik: Computes the negative log likelihood of the GP
%
% Inputs: - type - structure specifying the type of mean and covariance 
%           functions to be used
%         - theta - the hyper parameters
%         - xd - N, D-dimensional training inputs in an N * D matrix
%         - yd - N training outputs corresponding to the N training inputs
%           in an N * 1 vector
%
% Output: - nLogLik - the the negative log likelihood of the GP

% Assign hyper parameters from theta
[sigmaN, hypMean, hypCov] = hypAssign(theta);

% Mean for training data
xdMu = Const(hypMean, yd);
% Covariance matrix for training data
Kdd = covWrap(type, hypCov, xd, xd);
% Generate the noise matrix
noise = exp(2*sigmaN) * eye(size(Kdd));
% Add Kdd to the noise covariance
K = Kdd + noise;
K = jitter(K);
% Calculate the inverse of Kdd + noise using Cholskey decomposition
invKddPlusNoise = cholInv(K);
% The natural logaritm of the determinant of Kdd plus the noise matrix
logDetKddPlusNoise = cholLogDet(K);
% Number of data ponts in training set
N = numel(yd);
% Compute the negative log likelihood for the training data 
nLogLik = 0.5 * (yd - xdMu)' * invKddPlusNoise * (yd - xdMu) +...
    0.5 * logDetKddPlusNoise + 0.5 * N * log(2 * pi);

end
