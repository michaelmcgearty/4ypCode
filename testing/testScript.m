% Close all figures and clear all variables from the workspace
clear all; close all;

%==========================================================================
% Test function

%Test
xd = linspace(0.1,20,200)';
yd = 10*sin(xd) + 5 * (ones(size(xd)) - exp(-xd));
x_ = linspace(20.1,30,30)';


%==========================================================================
% Specification of task from user

% Specify the type of mean and covariance functions being used
type = struct('Mean',{'meanZero'},'Cov',{'covSum','covPer','covSEard'});

% Specify optimisation settings opt = [initVal, UB, maxIter, funcTol]
opt = [1, 10, 200, 0.1];

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


