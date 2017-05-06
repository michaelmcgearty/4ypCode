function [typeOpt,thetaOpt] = modelSelect(xd,yd,opt,theta)
% Automatically trains the model

% initialise structure containing all base cov types
cov = struct('base',{'Matern12','Matern32','Matern52','Per','RQ','SE'});

% iterate over base structures
for i = 1:numel(cov)
    % select new base structure
    type = struct('Cov',{cov(i).base});
    % optimise gp for that func structure
    [thetaOptNew, nLogLikMin] = gpTrain(xd, yd, type, opt, theta);
    % calculate BIC for that function structure
    nBICNew = nBIC(nLogLikMin,thetaOptNew,type,yd);
    % if this is the first itteration, make this the current preference
    if i == 1
        % save nBIC, thetaOpt and index for later comparison/recall
        nBIC = nBICNew;
        thetaOpt = thetaOptNew;
        bestBase = cov(i).base;
        % indicate that the current best is the result of a base cov
        combFlag = 0;
    elseif nBICNew <= nBIC
        nBIC = nBICNew;
        thetaOpt = thetaOptNew;
        bestBase = cov(i).base;
    end
end

% iterate over all bases for covSum
for i = 1:numel(cov)
    % assign new cov
    type = struct('Cov',{'covSum',bestBase,cov(i).base});
    % train the gp model
    [thetaOptNew, nLogLikMin] = gpTrain(xd, yd, type, opt, theta);
    % calculate the BIC
    nBICNew = nBIC(nLogLikMin,thetaOptNew,type,yd);
    % if the model is an improvement on the previous best the replace the
    % previous best
    if nBICNew <= nBIC
        nBIC = nBICNew;
        thetaOpt = thetaOptNew;
        bestBase2 = cov(i).base;
        % indicate the new best model is from a sum
        combFlag = 1;
    end  
end
% iterate over all bases for covProd
for i = 1:numel(cov)
    % assign new cov
    type = struct('Cov',{'covProd',bestBase,cov(i).base});
    % train the gp model
    [thetaOptNew, nLogLikMin] = gpTrain(xd, yd, type, opt, theta);
    % calculate the BIC
    nBICNew = nBIC(nLogLikMin,thetaOptNew,type,yd);
    % if the model is an improvement on the previous best the replace the
    % previous best
    if nBICNew <= nBIC
        nBIC = nBICNew;
        thetaOpt = thetaOptNew;
        bestBase2 = cov(i).base;
        % indicate the new best model is from a sum
        combFlag = 2;
    end  
end

if combFlag == 0
    typeOpt = struct('Cov',{bestBase});
elseif combFlag == 1
    typeOpt = struct('Cov',{'covSum',bestBase,bestBase2});
elseif combFlag == 2
    typeOpt = struct('Cov',{'covProd',bestBase,bestBase2});
else
    error('invalid combFlag, no optimum structure returned')
end

end