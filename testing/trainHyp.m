close all; clear variables;

% Load and organise data
X = csvread('sotonmetData.csv');
time = X(:,1)/60; % Converts units of time from minutes to hours
airTemp = X(:,3);
airTempTrue = X(:,8);
tideH = X(:,4);
tideHTrue = X(:,9);

% Specify variable of interest
%varInt = 'airTemp';
varInt = 'tideH';
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
[xd, yd] = clean(xdUnclean, ydUnclean);

% Specify the GP structure and optimisation options
type = struct('Mean',{'meanConst'},'Cov',{'covSE'});
opt = [1, -4, 6, 10000, 0.00001];
theta = NaN;

% Optimise the hyper parameters
[thetaOpt, ~] = gpTrain(xd, yd, type, opt, theta);

save('thetaOptCovSETideH','thetaOpt')

% Specify the GP structure and optimisation options
type = struct('Mean',{'meanConst'},'Cov',{'covRQ'});
opt = [1, -4, 6, 10000, 0.00001];
theta = NaN;

% Optimise the hyper parameters
[thetaOpt, ~] = gpTrain(xd, yd, type, opt, theta);

save('thetaOptCovRQTideH','thetaOpt')

% Specify the GP structure and optimisation options
type = struct('Mean',{'meanConst'},'Cov',{'covMatern12'});
opt = [1, -4, 6, 10000, 0.00001];
theta = NaN;

% Optimise the hyper parameters
[thetaOpt, ~] = gpTrain(xd, yd, type, opt, theta);

save('thetaOptCovMatern12TideH','thetaOpt')

% Specify the GP structure and optimisation options
type = struct('Mean',{'meanConst'},'Cov',{'covMatern32'});
opt = [1, -4, 6, 10000, 0.00001];
theta = NaN;

% Optimise the hyper parameters
[thetaOpt, ~] = gpTrain(xd, yd, type, opt, theta);

save('thetaOptCovMatern32TideH','thetaOpt')

% Specify the GP structure and optimisation options
type = struct('Mean',{'meanConst'},'Cov',{'covMatern52'});
opt = [1, -4, 6, 10000, 0.00001];
theta = NaN;

% Optimise the hyper parameters
[thetaOpt, ~] = gpTrain(xd, yd, type, opt, theta);

save('thetaOptCovMatern52TideH','thetaOpt')

% Specify the GP structure and optimisation options
type = struct('Mean',{'meanConst'},'Cov',{'covPer'});
opt = [1, -4, 6, 10000, 0.00001];
theta = NaN;

% Optimise the hyper parameters
[thetaOpt, ~] = gpTrain(xd, yd, type, opt, theta);

save('thetaOptCovPerTideH','thetaOpt')