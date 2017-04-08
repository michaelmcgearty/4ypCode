function [thetaOpt,nLogLikMin,exitFlag,output] = optSimAn(type,xd,yd,thetaInit,thetaLB,thetaUB,maxIter,funcTol)
% optSimAn: Minimses the negative log likelihood with respect to the hyper
%           parameters using the simulated anealing algorithm
%
% Inputs: - type - a structure specifying the type of mean and covariance
%           functions being used
%         - xd -the trainig data inputs in an N * D matrix
%         - yd - the training targets in an N * 1 vector
%         - thetaInit - the initial hyper parameter values
%         - thetaLB - a lower bound on the possible hyper parameter values
%         - thetaUB - an upper bound on the possible hyper parameter values
%         - maxIter - the maximum number of iterations permitted before the 
%           algorithm terminates
%         - funcTol - termination tolerance on function value
%
% Outputs: - thetaOpt - the optimum values for the hyper parameters
%          - nLogLikMin - the minimum value of the negative log likelihood
%          - exitFlag - reason simulannealbnd stopped, returned as an integer
%          - output - information about the optimization process, returned 
%            as a structure

% Create an anonymous function to pass as the loss function wrt theta
lossFunc = @(theta)gpLik(type, theta, xd, yd);

% Specify additional settings
% Without plotting
options = optimoptions(@simulannealbnd,'FunctionTolerance',funcTol,...
    'MaxIterations',maxIter);
% With plotting
%options = optimoptions(@simulannealbnd,'FunctionTolerance',funcTol,...
 %   'MaxIterations',maxIter,'PlotFcn',...
  %  {@saplotbestx,@saplotbestf,@saplotx,@saplotf});

%Calculate the optimal hyper parameter values
[thetaOpt, nLogLikMin, exitFlag, output] = simulannealbnd(lossFunc,...
    thetaInit,thetaLB,thetaUB,options);

end
