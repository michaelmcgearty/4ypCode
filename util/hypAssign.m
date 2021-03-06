function [sigmaN, hypMean, hypCov] = hypAssign(theta)
% hypAssign: Breaks theta up into sigmaN, hypMean and hypCov based on the
%            types of mean and covariance functions being used
% 
% Inputs: - type - a struct containing information about the types of mean
%           and covariance function being used
%         - theta - a vector containing all of the hyper parameter values
%
% Outputs - sigmaN - the natural log of the standard deviation of the 
%           measurement noise
%         - hypMean - the natural log of the hyper parameter for the mean 
%           function
%         - hypCov - a vector containing the natural logs of the hyper
%           parameters for the covariance functions

sigmaN = theta(1);
hypMean = theta(2);
hypCov = theta(3:end);

end
