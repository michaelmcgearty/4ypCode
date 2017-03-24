function [hyp1, hyp2] = hypSort(type, hypCov, dim)
% hypSort: Used by covSum and covProd to divide the hyper parameters passed
%          to them between the additional covariance functions they call
%
% Inputs: - type - a struct containing information about the types of 
%           covariance functions being called 
%         - hypCov - a vector containing the natural logs of the hyper
%           parameters for both covaraince functions
%         - dim - the dimensions of the input x
%
% Outputs - hyp1 - a vector containing the natural logs of the hyper
%           parameters for the first covaraince function
%         - hyp1 - a vector containing the natural logs of the hyper
%           parameters for the second covaraince function

% Organise the hyper parameters
if strcmp(type(2).Cov, 'covLin')
    hyp1 = hypCov(1:(dim(2)+1));
    hyp2 = hypCov((dim(2)+2):end);
elseif strcmp(type(2).Cov, 'covMatern12')
    hyp1 = hypCov(1:2);
    hyp2 = hypCov(3:end);
elseif strcmp(type(2).Cov, 'covMatern12ard')
    hyp1 = hypCov(1:(dim(2)+1));
    hyp2 = hypCov((dim(2)+2):end);
elseif strcmp(type(2).Cov, 'covMatern32')
    hyp1 = hypCov(1:2);
    hyp2 = hypCov(3:end);
elseif strcmp(type(2).Cov, 'covMatern32ard')
    hyp1 = hypCov(1:(dim(2)+1));
    hyp2 = hypCov((dim(2)+2):end);
elseif strcmp(type(2).Cov, 'covMatern52')
    hyp1 = hypCov(1:2);
    hyp2 = hypCov(3:end);
elseif strcmp(type(2).Cov, 'covMatern52ard')
    hyp1 = hypCov(1:(dim(2)+1));
    hyp2 = hypCov((dim(2)+2):end);
elseif strcmp(type(2).Cov, 'covPer')
    hyp1 = hypCov(1:3);
    hyp2 = hypCov(4:end);
elseif strcmp(type(2).Cov, 'covRQ')
    hyp1 = hypCov(1:3);
    hyp2 = hypCov(3:end);
elseif strcmp(type(2).Cov, 'covRQard')
    hyp1 = hypCov(1:(dim(2)+2));
    hyp2 = hypCov((dim(2)+3):end);
elseif strcmp(type(2).Cov, 'covSE')
    hyp1 = hypCov(1:2);
    hyp2 = hypCov(3:end);
elseif strcmp(type(2).Cov, 'covSEard')
    hyp1 = hypCov(1:(dim(2)+1));
    hyp2 = hypCov((dim(2)+2):end);
else
    error('type(2).Cov must be a valid covariance function')
end
end
