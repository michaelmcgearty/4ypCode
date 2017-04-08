% test cholInv
clear variables;
M = [1,2,3;1.05,1.997,3.1;0.97,2,3.02];
M = M*M';

invM = inv(M);
invMChol = cholInv(M);