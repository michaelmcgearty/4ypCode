%Test
xd = linspace(0.1,20,10)';
yd = 10*sin(2*xd) + 50 * (ones(size(xd)) - exp(-0.1*xd))+... 
    randn(size(xd)) * sqrt(0.5);
x_ = linspace(0.2,19.9,31)';

% Specify the type of mean and covariance functions being used
type = struct('Mean',{'meanConst'},'Cov',{'covSum','covSE','covPer'});

thetaOpt = [log(0.5),log(35),log(5/3.4),log(2),log(2),log(3),log(3)];
% Regression
[f_, f_Var] = gpReg(type, thetaOpt, xd, yd, x_);

% Generate a plot of data
plotWrtTime(xd, yd, thetaOpt, x_, f_, f_Var)