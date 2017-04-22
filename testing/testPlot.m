close all; clear variables;

xdVector = linspace(0,20,21);
xd = xdVector';
yd = sin(xd)+ 0.1 * normrnd(0,0.1,length(xd),1);
theta = -2;
x_Vector = linspace(1,21,113);
x_ = x_Vector';
f_ = sin(x_);
f_Var =  0.2 * ones(size(x_));
varInt = 'airTemp';


plotGP(xd, yd, theta, x_, f_, f_Var, varInt)