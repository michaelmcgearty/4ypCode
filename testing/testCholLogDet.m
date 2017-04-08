% test cholLogDet

clear variables;
M = [1,2,3;1.05,1.997,3.1;0.97,2,3.02];
M = M*M';

logDetM = log(det(M));
logDetMChol = cholLogDet(M);