function [f_, f_Var] = gpReg(type, theta, xd, yd, x_)
% gpPred: Makes predictions at test points using GP regression
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
%         - x_ - n, D-dimensional test inputs in an n * D Matrix
%         - sigmaN - parameter specifying the additive noise
%
% Outputs: - f_ - the GP mean at each of the test points in an n * 1 vector
%          - f_Var - the GP variance at each of the test points in an 
%            n * 1 vector

% Assign hyper parameters from theta
if type.Mean == 'meanConst'
    hypMean = theta(1);
    sigmaN = exp(theta(2));
    hypCov = theta(3:end);
else
    hypMean = 0;
    sigmaN = exp(theta(1));
    hypCov = theta(2:end);
end


% Compute the mean function for the training data
xdMu = meanWrap(type.Mean, hypMean, yd);
% Compute the mean function at the test points
dimx_ = size(x_);
x_Mu = xdMu(1) * ones(dimx_(1),1);
% Compute the covariance functions necessary later
K__ = covWrap(type(1).Cov, hypCov, x_, x_);
% Kd_ = covWrap(typeCov, hypCov, xd, x_);
K_d = covWrap(type(1).Cov, hypCov, x_, xd);
Kd_ = K_d';
Kdd = covWrap(type(1).Cov, hypCov, xd, xd);
% Generate the noise matrix
noise = sigmaN^2 * eye(size(Kdd));
% Calculate the inverse of Kdd + noise using Cholskey decomposition
invKddPlusNoise = cholInv(Kdd + noise);

% Calculate the GP mean at the test points
f_ = x_Mu + K_d * invKddPlusNoise * (yd - xdMu);

% Calculate the GP covariance at the test points
f_Var = diag(K__ - K_d * invKddPlusNoise * Kd_);

end







