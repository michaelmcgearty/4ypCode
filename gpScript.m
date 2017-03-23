% Close all figures and clear all variables from the workspace
clear all; close all;

% Load the data from csv
run(loadData)

% Organise data, i denotes the collumn containing the output variable
% dimX = size(X);
% N = dimX(1);
% D = dimX(2) - 1;
% yd = X(:,i);
% xd = [X(:,1:(i-1)),X(:,(i+1):D+1)]; 
% OR 
% xd = X(:,j);

% Specification of task from user
% Specify the type of mean and covariance functions being used
type = struct('Mean',{'type of mean func goes here'},'Cov',{'type(s) of covariance func go here'});
% Specify the initial value and upper bounds on the hyper parameters
initVal = 1; %!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Arbitrarily assigned 
UB = 10; %!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Arbitrarily assigned

% Initialise the hyper parameters based on type.Mean and type.Cov
thetaInit = hypInit(type, D, initVal);
thetaLB = zeros(size(thethaInit));
thetaUB = UB * ones(size(thetaInit)); 

% Opimise the hyper parameters by minimising the negative log likelihood
% using the simulated annealing algorithm

% Create an anonymous function to pass as the loss function wrt theta
lossFunc = @(theta)gpLik(type, theta, xd, yd);
% Specify additional settings
options = optimoptions(@simulannealbnd,'FunctionTolerance',1e-1,...
    'MaxIterations',500);
% options = optimoptions(@simulannealbnd,'FunctionTolerance',1e-1,...
%     'MaxIterations',500,'PlotFcn',{@saplotbestx,@saplotbestf,@saplotx,...
%     @saplotf}); 
%Calculate the optimal hyper parameter values
[thetaOpt, nLogLikMin] = simulannealbnd(lossFunc,thetaInit,thetaLB,thetaUB,options);

% Make predictions using the GP
[f_, f_Var] = gpReg(type, thetaOpt, xd, yd, x_);

% Generate a plot of data

% Automatically save xd, yd, x_, f_, f_Var, type, thetaOpt and the graphs
