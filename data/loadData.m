function [X,XMC,XMC1,XMC2,XMC3,XMC4] = loadData
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
airPresClean = XMC(:,2);
airTempClean = XMC(:,3);
tideHClean = XMC(:,4);
windDirClean = XMC(:,5);
windGSClean = XMC(:,6);
windSClean = XMC(:,7);
time = XTruth(:,1);
airPres = XMeasured(:,2);
airTemp = XMeasured(:,3);
tideH = XMeasured(:,4);
windDir = XMeasured(:,5);
windGS = XMeasured(:,6);
windS = XMeasured(:,7);
airTempTrue = XTruth(:,2);
tideHTrue = XTruth(:,3);
% Load the random indices used to split the data for 4-fold testing
load('4FoldInd')
% Split the random indices into 4 blocks, for 4 experiments
indBlock1 = kFoldRandInd(1:229);
indBlock2 = kFoldRandInd(230:458);
indBlock3 = kFoldRandInd(459:687);
indBlock4 = kFoldRandInd(688:916);
% Split the training data into 4 sets
XMC1 = XMC(indBlock1,:);
XMC2 = XMC(indBlock2,:);
XMC3 = XMC(indBlock3,:);
XMC4 = XMC(indBlock4,:);
% Sort the training data sets
[XMC1(:,1), XMC1ind] = sort(XMC1(:,1));
XMC1(:,2:end) = XMC1(XMC1ind,2:end);
[XMC2(:,1), XMC2ind] = sort(XMC2(:,1));
XMC2(:,2:end) = XMC2(XMC2ind,2:end);
[XMC3(:,1), XMC3ind] = sort(XMC3(:,1));
XMC3(:,2:end) = XMC3(XMC3ind,2:end);
[XMC4(:,1), XMC4ind] = sort(XMC4(:,1));
XMC4(:,2:end) = XMC4(XMC4ind,2:end);



