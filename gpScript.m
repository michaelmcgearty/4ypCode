%% Clear Matlab before running

% Close all figures and clear all variables from the workspace
clear all; close all;

%% Specification of task from user

% Specify the type of mean and covariance functions being used
type = struct('Mean',{'meanZero'},'Cov',{'covSEard'});

%Specify the variable of interest and the input variables
varOut = 'varaible of interest goes here';
varIn = struct('Name',{'input variable name(s) go here'});

% Specify the initial value and upper bounds on the hyper parameters 
initVal = 1;
UB = 10;

% Specify the maximum number of iterations and function tolerance for
% optimisation
maxIter = 500;
funcTol = 1e-1;

%% Load data and initialise variables

% Load the data from csv
[xd, yd, x_] = loadData(varOut, varIn);

% Initialise the hyper parameters based on type.Mean and type.Cov
thetaInit = hypInit(type, D, initVal);
thetaLB = zeros(size(thethaInit));
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

% Automatically save xd, yd, x_, f_, f_Var, type, thetaOpt and the graphs
