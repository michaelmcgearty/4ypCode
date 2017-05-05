close all; clear variables;
% Load and organise data
X = csvread('sotonmetData.csv');
% Converts units of time from minutes to hours
X(:,1) = X(:,1)/60; 
% Parse time and the true variable values into a matrix
XTruth = [X(:,1),X(:,8),X(:,9)];
% Parse time and the measured variables into a matrix
XMeasured = [X(:,1),X(:,2),X(:,3),X(:,4),X(:,5),X(:,6),X(:,7)];
% Clean the measured variables
[XMC,indClean] = cleanAll(XMeasured);
% Seperate the data into individual variables
timeClean = XMC(:,1);
airPres = XMC(:,2);
airTemp = XMC(:,3);
tideH = XMC(:,4);
windDir = XMC(:,5);
windGS = XMC(:,6);
windS = XMC(:,7);
time = XTruth(:,1);
airTempTrue = XTruth(:,2);
tideHTrue = XTruth(:,3);




