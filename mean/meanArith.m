function mu = meanArith(yd)
% meanArith: Arithmetic mean function
%
% Inputs: - yd - N training outputs corresponding to the N training inputs
%           in an N * 1 vector 
%
% Output: - mu - the mean function in an N * 1 vector

av = sum(yd) / length(yd);
mu = av * ones(size(yd));

end
