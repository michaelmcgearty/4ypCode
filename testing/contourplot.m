% contour plot of n log lik Vs hyper params
clear variables; close all;
% test data
xd = 0:0.05:5;
xd = xd';
yd = 1.3*ones(size(xd))+0.8*cos(8*xd)+1.1*sin(4*xd)+0.7*sin(2*xd)-...
    0.7*sin(xd)+cos(0.5*xd)+0.5*sin(0.25*xd)-4*exp(-0.3*xd) + normrnd(0,0.1,length(xd),1);

%plot(xd,yd)

% specify hyper parameters
type = struct('Mean',{'meanZero'},'Cov',{'covSE'});
hypMean = 0;

% the values which log(sigmaN) and log(l) clycle through
logHypVal = -5:0.25:5;
sigma = 0;


% Mean for training data
xdMu = meanWrap(type, hypMean, yd);
% assign memory for nLogLik
nLogLikGrid = zeros(length(logHypVal), length(logHypVal));
% Number of data ponts in training set
        N = numel(yd);

for i = 1:length(logHypVal)
    for j = 1:length(logHypVal)
        hypCov = [logHypVal(j),sigma];
        % Covariance matrix for training data
        Kdd = covWrap(type, hypCov, xd, xd);
        % Generate the noise matrix
        noise = exp(2*logHypVal(i)) * eye(size(Kdd));
        % Calculate the inverse of Kdd + noise using Cholskey decomposition
        invKddPlusNoise = cholInv(Kdd + noise);
        % The natural logaritm of the determinant of Kdd plus the noise matrix
        logDetKddPlusNoise = cholLogDet(Kdd + noise);
        % Compute the negative log likelihood for the training data
        nLogLikGrid(i,j) = 0.5 * (yd - xdMu)' * invKddPlusNoise * (yd - xdMu) +...
            0.5 * logDetKddPlusNoise + 0.5 * N * log(2 * pi);
    end
end

%hypVal = exp(logHypVal);
%[X,Y] = meshgrid(hypVal);

[X,Y] = meshgrid(logHypVal);
contour3(X,Y,nLogLikGrid,20000)
zlim([0 800])
%}
xlabel('l')
ylabel('sigmaN')