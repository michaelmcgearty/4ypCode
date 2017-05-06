function nBIC = nBIC(nLogLikMin,thetaOpt,type,yd)
% calculates the nagative bayesian information criterion

% calculate number of model parameters
if strcmp(type(1).Cov,'covProd')
    M = numel(thetaOpt)-1;
else
    M = numel(thetaOpt);
end

nBIC = nLogLikMin + 0.5*M*log(length(yd));

