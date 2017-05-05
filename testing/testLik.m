% test gpLik
close all; clear variables;

% Load and organise data
X = csvread('sotonmetData.csv');
time = X(:,1)/60; % Converts units of time from minutes to hours
airTemp = X(:,3);
tideH = X(:,4);

% Specify variable of interest
varInt = 'airTemp';
% varInt = 'tideH'
if strcmp(varInt,'airTemp')
    y = airTemp;
elseif strcmp(varInt,'tideH')
    y = tideH;
else
    error('varInt must be airTemp or tideH')
end

[xd, yd] = clean(time, y);

nLogLik = zeros(6,1);

type = struct('Mean',{'meanConst'},'Cov',{'covSE'});
load('thetaOptCovSEAirTemp')
nLogLik(1) = gpLik(type, thetaOpt, xd, yd);


type = struct('Mean',{'meanConst'},'Cov',{'covRQ'});
load('thetaOptCovRQAirTemp')
nLogLik(2) = gpLik(type, thetaOpt, xd, yd);


type = struct('Mean',{'meanConst'},'Cov',{'covMatern12'});
load('thetaOptCovMatern12AirTemp')
nLogLik(3) = gpLik(type, thetaOpt, xd, yd);


type = struct('Mean',{'meanConst'},'Cov',{'covMatern32'});
load('thetaOptCovMatern32AirTemp')
nLogLik(4) = gpLik(type, thetaOpt, xd, yd);


type = struct('Mean',{'meanConst'},'Cov',{'covMatern52'});
load('thetaOptCovMatern52AirTemp')
nLogLik(5) = gpLik(type, thetaOpt, xd, yd);


type = struct('Mean',{'meanConst'},'Cov',{'covPer'});
load('thetaOptCovPerAirTemp')
nLogLik(6) = gpLik(type, thetaOpt, xd, yd);


%{
% check gpLik
sigmaN = exp(theta(1));
meanConst = exp((theta(2));
l = exp(theta(3));
sigma = exp(theta(4));

xdMu = meanConst * ones(size(yd));
N = numel(yd);

KddCheck = zeros(N,N);
for i = 1:N
    for j = 1:N
        d2 = (xd(i,:)-xd(j,:))*(xd(i,:)-xd(j,:))';
        Kdd(i,j) = (sigma^2)*exp(-d2/(2*(l^2)));    
    end
end
noise = (sigmaN^2)*eye(size(Kdd));
KddPlusNoise = Kdd+noise;
invKddPlusNoise = inv(KddPlusNoise);
logDetKddPlusNoise = log(det(KddPlusNoise));

nLogLikCheck = 0.5 * (yd - xdMu)' * invKddPlusNoise * (yd - xdMu) +...
    0.5*logDetKddPlusNoise + 0.5*N*log(2*pi);

%}