% Script for testing the library

xd = linspace(0.1,8,80)';
fd = 5*xd - 10*xd.^2 + 2*xd.^-1 - 20*xd.^-3 + 0.3 * sin(10*xd);
yd = fd + wgn(80,1,0.1);
x_ = linspace(8.1,10,20)';



