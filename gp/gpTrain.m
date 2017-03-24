function [thetaOpt, nLogLikMin] = gpTrain(xd, yd, type, opt)
% gp: Trains a GP
%
% Inputs - xd - the training inputs (N, D-dimensional vectors) in an 
%          N * D matrix
%        - yd - the training targets (N, 1-dimensional vectors) in an
%          N * 1 vector
%        - type - a structure containing information about the type of mean
%          and covariance functions to be used [Mean, Cov]
%        - opt - a vector containing settings used by the optimization
%          algorithm [initVal, UB, maxIter, funcTol]
% 
% Outputs: - thetaOpt - a vector containing the natural logs of the optimal
%            hyper parameter values
%          - nLogLikMin - the minimum value of the negative log likelihood

% Initialise the hyper parameters based on type.Mean and type.Cov
dimX = size(xd);
D = dimX(2);
thetaInit = hypInit(type, D, opt(1));
thetaLB = zeros(size(thetaInit));
thetaUB = opt(2) * ones(size(thetaInit)); 

% Opimise the hyper parameters by minimising the negative log likelihood
% using the simulated annealing algorithm
[thetaOpt, nLogLikMin, ~, ~] = optSimAn(type, xd, yd, ...
    thetaInit, thetaLB, thetaUB, opt(3), opt(4));
