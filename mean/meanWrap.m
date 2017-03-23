function mu = meanWrap(type, hypMean, yd)
% meanWrap: A wrapper function for calling required mean function
%
% Inputs: - typeMean - string specifying the type of mean function to be
%           used
%         - hypMean - the mean functions only hyper parameter (the constant)
%         - yd - N training outputs corresponding to the N training inputs
%           in an N * 1 vector 
%
% Output: - mu - the mean function in an N * 1 vector

% Extract string from structure
typeMean = type.Mean;

% Zero mean
if strcmp(typeMean, 'meanZeros')
    meanZeros = str2func(typeMean);
    mu = meanZeros(yd); 
% Constant mean
elseif strcmp(typeMean, 'meanConst')
    meanConst = str2func(typeMean);
    mu = meanConst(hypMean, yd);
% Arithmetic mean
elseif strcmp(typeMean, 'meanArith')
    meanArith = str2func(typeMean);
    mu = meanArith(yd);
% Report errors
else
    error('type.Mean must be a string equal to either "meanZeros", "meanConst" or "meanArith')
end

end
