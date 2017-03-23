function thetaInit = hypInit(type, D, initVal)

% Always a single hyper parameter from sigmaN
count = 1;

% Additional hyper parameters from the mean function
% Extract string from structure
typeMean = type.Mean;
if strcmp(typeMean,'meanConst')
    count = count + 1;
end
% Additional hyper parameters from the covariance function
% Extract string from structure
typeCov1 = type(1).Cov;
if strcmp(typeCov1, 'covProd') || strcmp(typeCov1, 'covSum')
    typeCov2 = type(2).Cov;
    hypNum1 = hypNumber(typeCov2, D);
    typeCov3 = type(3).Cov;
    hypNum2 = hypNumber(typeCov3, D);
    count = count + hypNum1 + hypNum2;
else
    hypNum = hypNumber(typeCov1, D);
    count = count + hypNum;
end

thetaInit = initVal * ones(count, 1);

end
