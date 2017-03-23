function mu = meanArith(yd)
% meanArith: Arithmetic mean function
%
% Inputs: - yd - N training outputs corresponding to the N training inputs
%           in an N * 1 vector 
%
% Output: - mu - the mean function in an N * 1 vector

dim = size(yd);
av = sum(yd) / dim(1);
mu = av * ones(dim);

end
