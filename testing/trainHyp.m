close all; clear variables;

% Load and organise data
X = csvread('sotonmetData.csv');
time = X(:,1)/60; % Converts units of time from minutes to hours
airTemp = X(:,3);
airTempTrue = X(:,8);
tideH = X(:,4);
tideHTrue = X(:,9);

% Specify variable of interest
varInt = 'airTemp';
% varInt = 'tideH'
if strcmp(varInt,'airTemp')
    y = airTemp;
    truth = airTempTrue;
elseif strcmp(varInt,'tideH')
    y = tideH;
    truth = tideHTrue;
else
    error('varInt must be airTemp or tideH')
end

% Specify the number of training points
trainingPoints = 1256;

% Initialise xd and yd for cleaning
xdUnclean = time(1:trainingPoints);
ydUnclean = y(1:trainingPoints);

% Clean training data
missingDataSize = numel(find(ydUnclean==0));
yd = zeros((length(ydUnclean)-missingDataSize),1);
xd = zeros((length(xdUnclean)-missingDataSize),1);
indClean = 1;
for i = 1:trainingPoints
    if ydUnclean(i) ~= 0
        yd(indClean) = ydUnclean(i);
        xd(indClean) = xdUnclean(i);
        indClean = indClean + 1;
    end
end

% Specify the GP structure and optimisation options
type = struct('Mean',{'meanConst'},'Cov',{'covSE'});
opt = [1, -4, 6, 10000, 0.00001];
theta = NaN;

% Optimise the hyper parameters
[thetaOpt, ~] = gpTrain(xd, yd, type, opt, theta);

save('thetaOptCovSEAirTemp','thetaOpt')