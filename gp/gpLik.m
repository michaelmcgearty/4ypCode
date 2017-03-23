function nLogLik = gpLik(type, theta, xd, yd)
% gpLik: Computes the negative log likelihood of the GP
%
% Inputs: - typeMean - string specifying the type of mean function to be
%           used
%         - typeCov - string specifying the type of covariance function or 
%           functions to be used
%         - hypMean - the hyper parameters for the mean function
%         - hypCov - the hyperparameters for the covariance function
%         - xd - N, D-dimensional training inputs in an N * D matrix
%         - yd - N training outputs corresponding to the N training inputs
%           in an N * 1 vector
%         - sigmaN - parameter specifying the additive noise
%
% Output: - nLogLik - the the negative log likelihood of the GP

% Assign hyper parameters from theta
if type.Mean == 'meanConst'
    hypMean = theta(1);
    sigmaN = exp(theta(2));
    hypCov = theta(3:end);
else
    hypMean = [];
    sigmaN = exp(theta(1));
    hypCov = theta(2:end);
end

% Mean for training data
xdMu = meanWrap(type, hypMean, yd);
% Covariance matrix for training data
Kdd = covWrap(type, hypCov, xd, xd);
% Generate the noise matrix
noise = sigmaN^2 * eye(size(Kdd));
% Calculate the inverse of Kdd + noise using Cholskey decomposition
invKddPlusNoise = cholInv(Kdd + noise);
% The natural logaritm of the determinant of Kdd plus the noise matrix
logDetKddPlusNoise = cholLogDet(Kdd + noise);
% Number of dimensions in training data
N = numel(yd);

% Compute the negative log likelihood for the training data 
nLogLik = 0.5 * (yd - xdMu)' * invKddPlusNoise * (yd - xdMu) + 0.5 * ...
    0.5 * logDetKddPlusNoise + 0.5 * N * log(2 * pi);

end
