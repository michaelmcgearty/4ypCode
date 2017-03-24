% Wrapper function used to select the correct covariance function
function K = covWrap(type, hypCov, x1, x2)
% covWrap: A wrapper function used to call the required covariance
%          functions as specified by type
% Inputs: - type - a structure or string specifying the type of covariance
%           functon to be called
%         - hypCov - a vector containing the hyper parameters for the
%           covariance functon(s)
%         - x1 - an n1 * D matrix containing the input vector on which
%           to evaluate the covarience function
%         - x2 - an n2 * D matrix containing the input vector on which
%           to evaluate the covarience function
%
% Output: - K - the covariance matrix

% If single covariance function used, type will be a struct
if isstruct(type)
    % Rational quadratic covariance
    if strcmp(type(1).Cov, 'covRQ')
        covRQ = str2func(type(1).Cov);
        K = covRQ(hypCov, x1, x2);
    % RQ covariance with ARD
    elseif strcmp(type(1).Cov, 'covRQard')
        covRQard = str2func(type(1).Cov);
        K = covRQard(hypCov, x1, x2);
    % Squared exponential covariance
    elseif strcmp(type(1).Cov, 'covSE')
        covSE = str2func(type(1).Cov);
        K = covSE(hypCov, x1, x2);
    % SE covariance with ARD
    elseif strcmp(type(1).Cov, 'covSEard')
        covSEard = str2func(type(1).Cov);
        K = covSEard(hypCov, x1, x2);
    % Linear covariance
    elseif strcmp(type(1).Cov, 'covLin')
        covLin = str2func(type(1).Cov);
        K = covLin(hypCov, x1, x2);
    % Matern covariance (v = 1/2)
    elseif strcmp(type(1).Cov, 'covMatern12')
        covMatern12 = str2func(type(1).Cov);
        K = covMatern12(hypCov, x1, x2);
    % Matern covariance with ARD (v = 1/2)
    elseif strcmp(type(1).Cov, 'covMatern12ard')
        covMatern12ard = str2func(type(1).Cov);
        K = covMatern12ard(hypCov, x1, x2);
    % Matern covariance (v = 3/2)
    elseif strcmp(type(1).Cov, 'covMatern32')
        covMatern32 = str2func(type(1).Cov);
        K = covMatern32(hypCov, x1, x2);
    % Matern covariance with ARD (v = 3/2)
    elseif strcmp(type(1).Cov, 'covMatern32ard')
        covMatern32ard = str2func(type(1).Cov);
        K = covMatern32ard(hypCov, x1, x2);
    % Matern covariance (v = 5/2)
    elseif strcmp(type(1).Cov, 'covMatern52')
        covMatern52 = str2func(type(1).Cov);
        K = covMatern52(hypCov, x1, x2);
    % Matern covariance with ARD (v = 5/2)
    elseif strcmp(type(1).Cov, 'covMatern52ard')
        covMatern52ard = str2func(type(1).Cov);
        K = covMatern52ard(hypCov, x1, x2);
    % Periodic covariance
    elseif strcmp(type(1).Cov, 'covPer')
        covPer = str2func(type(1).Cov);
        K = covPer(hypCov, x1, x2);
    % Sum of covariance functions 
    elseif strcmp(type(1).Cov, 'covSum')
        covSum = str2func(type(1).Cov);
        K = covSum(type, hypCov, x1, x2);
    % Product of covariance functions
    elseif strcmp(type(1).Cov, 'covProd')
        covProd = str2func(type(1).Cov);
        K = covProd(type, hypCov, x1, x2);
    else
        error('type(1).Cov must be a valid covariance')
    end
% If covSum or covProd is used then type will be a string on the second pass    
elseif ischar(type)
    % Rational quadratic covariance
    if strcmp(type,'covRQ')
        covRQ = str2func(type);
        K = covRQ(hypCov, x1, x2);
    % Rational quadratic covariance with ARD
    elseif strcmp(type,'covRQard')
        covRQard = str2func(type);
        K = covRQard(hypCov, x1, x2);
    % Squared exponential covariance
    elseif strcmp(type,'covSE')
        covSE = str2func(type);
        K = covSE(hypCov, x1, x2);
    % Squared exponential covariance with ARD
    elseif strcmp(type,'covSEard')
        covSEard = str2func(type);
        K = covSEard(hypCov, x1, x2);
    % Linear covariance
    elseif strcmp(type,'covLin')
        covLin = str2func(type);
        K = covLin(hypCov, x1, x2);
    % Matern covariance (v = 1/2)
    elseif strcmp(type,'covMatern12')
        covMatern12 = str2func(type);
        K = covMatern12(hypCov, x1, x2);
    % Matern covariance with ARD(v = 1/2)
    elseif strcmp(type,'covMatern12ard')
        covMatern12ard = str2func(type);
        K = covMatern12ard(hypCov, x1, x2);
    % Matern covariance (v = 3/2)
    elseif strcmp(type,'covMatern32')
        covMatern32 = str2func(type);
        K = covMatern32(hypCov, x1, x2);
    % Matern covariance with ARD (v = 3/2)
    elseif strcmp(type,'covMatern32ard')
        covMatern32ard = str2func(type);
        K = covMatern32ard(hypCov, x1, x2);
    % Matern covariance (v = 5/2)
    elseif strcmp(type,'covMatern52')
        covMatern52 = str2func(type);
        K = covMatern52(hypCov, x1, x2);
    % Matern covariance with ARD (v = 5/2)
    elseif strcmp(type,'covMatern52ard')
        covMatern52ard = str2func(type);
        K = covMatern52ard(hypCov, x1, x2);
    % Periodic covariance
    elseif strcmp(type,'covPer')
        covPer = str2func(type);
        K = covPer(hypCov, x1, x2);
    else
        error('type must be a valid covariance')
    end
else
    error('type must be a structure or character array')
end

end
