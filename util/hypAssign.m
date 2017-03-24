function [sigmaN, hypMean, hypCov] = hypAssign(type, theta)
% hypAssign: Breaks theta up into sigmaN, hypMean and hypCov based on the
%            types of mean and covariance functions being used
% 
% Inputs: - type - a struct containing information about the types of mean
%           and covariance function being used
%         - theta - a vector containing all of the hyper parameter values
%
% Outputs - sigmaN - the variance of the measurement noise
%         - hypMean - the natural log of the hyper parameter for the mean 
%           function
%         - hypCov - a vector containing the natural logs of the hyper
%           parameters for the covariance functions


sigmaN = exp(theta(1));
if strcmp(type(1).Mean, 'meanConst')
    hypMean = theta(2);
    hypCov = theta(3:end);
else
    hypMean = 0;
    hypCov = theta(2:end);
end

end
