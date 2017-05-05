function [yPrior, PPrior] = kalPrior(yUnclean, xUnclean)
% Generates the prior mean and variance for the Kalman filter

% Clean training data
[~, y] = clean(xUnclean, yUnclean);

% Calculate mean of the prior distribution
% The mean of the prior is assigned as the mean of all data points
yPrior = sum(y) / length(y);

% Calculate the variance of the prior
% The variance of the prior is defined so that the range of the data fits
% within 3 standard deviations of the mean
sigmaBandWidth = 2 * 3;
PPrior = ((max(y) - min(y))/sigmaBandWidth)^2;

end
