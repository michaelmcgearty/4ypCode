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

% Initialise the predictions vector
yPred = zeroes(length(y),1);
PPred = zeroes(length(y),1);

% Generate priors
[yPrior, PPrior] = kalPrior(y, time);

% Define measurement model
H = 1; % Measurements are direct, noisy measurements of the state
R = 0.0203; % Measurement noise variance taken as the optimal value of sigmaN 
% using the Matern12 covariance kernel, the best performing of the single
% function covariances

% Define model
F = 0;% tbd plant model
G = 0;% tbd transform of plant error noise
Q = 0;% covariance of Gaussian zero mean plant error noise

% First Prediction
yPred(1) = yPrior;
PPred(1) = PPrior;

% Define Kalman gain, innovation and innovation covariance
v = y(1) - H * yPred(1); %Innovation



% Update
yUp = yPred(1) + W * v;
PUp = PPred - W * S * W';

% Prediction
yPred = F * yUp + B * u;
PPred = F * PPred * F' + G * Q * G';


