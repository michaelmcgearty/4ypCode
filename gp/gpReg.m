function [f_, f_Var] = gpReg(type, theta, xd, yd, x_)
% gpPred: Makes predictions at test points using GP regression
%  
% Inputs: - type - a struct containing informaton about which mean and
%           covariance functions should be called
%         - theta - a vector containing the natural log of the hyper
%           parameters 
%         - xd - N, D-dimensional training inputs in an N * D matrix
%         - yd - N training outputs corresponding to the N training inputs
%           in an N * 1 vector
%         - x_ - n, D-dimensional test inputs in an n * D Matrix
%
% Outputs: - f_ - the GP mean at each of the test inputs in an n * 1 vector
%          - f_Var - the GP variance at each of the test points in an 
%            n * 1 vector

% Assign hyper parameters from theta
[sigmaN, hypMean, hypCov] = hypAssign(theta); 

% Compute the mean function for the training data
xdMu = Const(hypMean, yd);
% Compute the mean function at the test points
dimx_ = size(x_);
x_Mu = xdMu(1) * ones(dimx_(1),1);
% Compute the covariance functions necessary later
K__ = covWrap(type, hypCov, x_, x_);
% Kd_ = covWrap(typeCov, hypCov, xd, x_);
K_d = covWrap(type, hypCov, x_, xd);
Kd_ = K_d';
Kdd = covWrap(type, hypCov, xd, xd);
% Generate the noise matrix
noise = exp(2*sigmaN) * eye(size(Kdd));
% Ensure matrix is well conditioned
K = Kdd + noise;
K = jitter(K);
% Calculate the inverse of Kdd + noise using Cholskey decomposition
invKddPlusNoise = cholInv(K);

% Calculate the GP mean at the test points
f_ = x_Mu + K_d * invKddPlusNoise * (yd - xdMu);

% Calculate the GP covariance at the test points
f_Var = diag(K__ - K_d * invKddPlusNoise * Kd_);

end
