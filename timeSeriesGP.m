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

% Specify the number of training points used to initially optimise the hyper
% parameters, the number of test points to predict into the future and the
% number of predictions per hour to plot
trainingPoints = 101;
testPoints = 1155;
predPerHour = 4*60;

% Initialise xd, yd and x_, ready for the first prediction
xdUnclean = time(1:trainingPoints);
ydUnclean = y(1:trainingPoints);
x_Temp = linspace(time(trainingPoints),time(trainingPoints+1),...
    (((time(trainingPoints+1)-time(trainingPoints))*predPerHour)+1));
x_ = x_Temp(2:end)';

% Clean training data
[xd, yd] = clean(xdUnclean, ydUnclean);

% Initialise f_, f_Var and timePred (the vector containing all values of x_
% used throughout the entire simulation)
numberPred = int16(1)*predPerHour*(time(trainingPoints+testPoints)-time(trainingPoints));
f_ = zeros(numberPred,1); 
f_Var = zeros(numberPred,1); 
timePred = zeros(numberPred,1); 
timePred(1:length(x_)) = x_;
f_Record = zeros(testPoints,1);


% Specify the GP structure and optimisation options
type = struct('Mean',{'meanConst'},'Cov',{'covSE'});
opt = [1, -4, 6, 4000, 0.03];
%theta = NaN;
load('thetaOptCovSEAirTemp');

% Simulate the data as a time series
%[thetaOpt, ~] = gpTrain(xd, yd, type, opt, theta);
ind = 0;
%thetaHistory = zeros(testPoints,length(thetaOpt)); 
%thetaHistory(1,:) = thetaOpt;

for i = 1:testPoints
    [f_New, f_VarNew] = gpReg(type, thetaOpt, xd, yd, x_);
    f_Record(i) = f_New(end);
    f_((ind+1):(ind+length(f_New))) = f_New;
    f_Var((ind+1):(ind+length(f_New))) = f_VarNew;
    ind = ind + length(f_New);
    % Add the new measurements to the training data and retrain the GP
    if y(trainingPoints+i) ~= 0
        xd = [xd;time(trainingPoints+i)];
        yd = [yd;y(trainingPoints+i)];
        %[thetaOpt, ~] = gpTrain(xd, yd, type, opt, thetaOpt);
    end
    % Generate the next set of prediction points and store them in timePred
    if i ~= testPoints
        predictionsPerInterval = ((time(trainingPoints+1+i) - ...
            time(trainingPoints+i)) * predPerHour) + int16(1);
        x_Temp = linspace(time(trainingPoints+i),time(trainingPoints+1+i),...
            predictionsPerInterval);
        x_ = x_Temp(2:end)';
        timePred((ind+1):(ind+length(x_))) = x_;
        %thetaHistory((i+1),:) = thetaOpt;
    end
end

% Calculate the RMSE
%RMSE = sqrt(sum((f_-truth(3:end))'*(f_-truth(3:end)))/length(f_)); 
%RMSE =
%sqrt(sum((f_Special-truth((trainingPoints+1):end)'*(f_Special-truth((trainingPoints+1):end))/length(f_Special));

plotGP(xd,yd,thetaOpt,timePred,f_,f_Var,varInt)

save('f_Record','predictionsCovSE')