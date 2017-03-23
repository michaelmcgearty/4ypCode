%% Clear Matlab before running
% Close all figures and clear all variables from the workspace
clear all; close all;

%% Specification of task from user

% Specify the type of mean and covariance functions being used
type = struct('Mean',{'meanConst'},'Cov',{'covSum','covPer','covSEard'});

%Specify the variable of interest and the input variables
%varOut = 'varaible of interest goes here';
%varIn = struct('Name',{'input variable name(s) go here'});

% Specify the initial value and upper bounds on the hyper parameters 
initVal = 1;
UB = 10;

% Specify the maximum number of iterations and function tolerance for
% optimisation
maxIter = 2000;
funcTol = 1e-1;

%% Load data and initialise variables

% Load the data from csv
%[xd, yd, x_] = loadData(varOut, varIn);

%Test
xd = linspace(0.1,8,20)';
dimX = size(xd);
D = dimX(2);
yd = 10*sin(xd)+ones(size(xd));
x_ = linspace(8.1,20,30)';


% Initialise the hyper parameters based on type.Mean and type.Cov
thetaInit = hypInit(type, D, initVal);
thetaLB = zeros(size(thetaInit));
thetaUB = UB * ones(size(thetaInit)); 

%% Optimisation

% Opimise the hyper parameters by minimising the negative log likelihood
% using the simulated annealing algorithm
[thetaOpt, nLogLikMin, exitFlag, output] = optSimAn(type, xd, yd, ...
    thetaInit, thetaLB, thetaUB, maxIter, funcTol);

%% Regression

% Make predictions using the GP
[f_, f_Var] = gpReg(type, thetaOpt, xd, yd, x_);

%% Plotting and saving

% Generate a plot of data
plotWrtTime(xd, yd, thetaOpt, x_, f_, f_Var)

% Automatically save xd, yd, x_, f_, f_Var, type, thetaOpt and the graphs
