% Close all figures and clear all variables from the workspace
clear variables; close all;

%==========================================================================
% Test function
%{
%Test
xd = linspace(0.1,20,80)';
yd = 10*sin(2*xd) + 50 * (ones(size(xd)) - exp(-0.1*xd));
x_ = linspace(20.1,30,30)';
%}
%{
xd = [0:0.05:5,10.05:0.05:12];
xd = xd';
yd = 1.3*ones(size(xd))+0.8*cos(8*xd)+1.1*sin(4*xd)+0.7*sin(2*xd)-...
    0.7*sin(xd)+cos(0.5*xd)+0.5*sin(0.25*xd)-4*exp(-0.3*xd) + normrnd(0,0.1,length(xd),1);
x_ = 5.05:0.1:10;
x_ = x_';
%}
xd =[linspace(-10,-0.1,20)';[0;0.8;1.4;2.1;5.1;5.4;6]];
yd = 1.4 * ones(size(xd)) + sin(2*xd);
x_ = [linspace(0.05,0.75,6)';linspace(0.85,1.35,6)';linspace(1.45,2.05,6)';linspace(2.15,5.05,20)';5.15;5.2;5.28;linspace(5.45,5.96,6)'];
%==========================================================================
% Load data
varInt = 'airTemp';
[xd, yd, x_, ~, ~, ~, ~, ~, ~, ~, ~, ~] = loadData(varInt);

%==========================================================================
% Crop the data for testing
xd = xd(1:100);
yd = yd(1:100);
x_ = x_(1:50);

%==========================================================================
% Specification of task from user

% Specify the type of mean and covariance functions being used
type = struct('Mean',{'meanConst'},'Cov',{'covSum','covSE','covPer'});

% Specify optimisation settings opt = [initVal, LB, UB, maxIter, funcTol]
opt = [1, -4, 6, 4000, 0.0001];

%==========================================================================
% Train the GP

[thetaOpt, ~] = gpTrain(xd, yd, type, opt);

%==========================================================================
% Regression

[f_, f_Var] = gpReg(type, thetaOpt, xd, yd, x_);

%==========================================================================
% Plotting and saving

% Generate a plot of data
plotWrtTime(xd, yd, thetaOpt, x_, f_, f_Var)

% Automatically save xd, yd, x_, f_, f_Var, type, thetaOpt and the graphs


