function thetaInit = hypInit(type, D, initVal)

% Always a single hyper parameter from sigmaN
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
