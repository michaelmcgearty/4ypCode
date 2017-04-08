% test gpLik
clear variables;

%{
type = struct('Mean',{'meanConst'},'Cov',{'covSE'});
theta = [-1,2,1,1];
xd = [0,0;0,1;1,0;1,1];
yd = [7;8.5;7.5;9.5];
%}
xd = 0:0.05:5;
xd = xd';
yd = 1.3*ones(size(xd))+0.8*cos(8*xd)+1.1*sin(4*xd)+0.7*sin(2*xd)-...
    0.7*sin(xd)+cos(0.5*xd)+0.5*sin(0.25*xd)-4*exp(-0.3*xd) + normrnd(0,0.1,length(xd),1);
type = struct('Mean',{'meanZero'},'Cov',{'covSE'});
theta = [-3, -1.25,1]
nLogLik = gpLik(type, theta, xd, yd);

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