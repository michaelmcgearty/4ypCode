function thetaInit = hypInit(type, D, initVal)
% thetaInit: Initialises a vector of the correct length containing the 
%            natural logs of the hyper parameters for the GP model based on
%            the type of mean and covariance being used
% 
% Inputs: - type - a struct containing information on the type of mean and
%           covariance functions to be used
%         - D - the number of dimensions in the input space
%         - initVal - the initial value of the elements in theta, at which
%           optimization starts
%
% Output - thetaInit - a vector containing the natural logs of the hyper 
%          parameters

% Initialise the number of hyper parameters, always at least one hyper
% parameter from sigmaN
count = 1;

% Additional hyper parameters from the mean function
if strcmp(type(1).Mean,'meanConst')
    count = count + 1;
end

% Additional hyper parameters from the covariance function
if strcmp(type(1).Cov, 'covProd') || strcmp(type(1).Cov, 'covSum')
    hypNum1 = hypNumber(type(2).Cov, D);
    hypNum2 = hypNumber(type(3).Cov, D);
    count = count + hypNum1 + hypNum2;
else
    hypNum = hypNumber(type(1).Cov, D);
    count = count + hypNum;
end

thetaInit = initVal * ones(count, 1);

end
